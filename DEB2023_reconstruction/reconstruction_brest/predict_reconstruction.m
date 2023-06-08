function [prdData, info] = predict_reconstruction(par, data, auxData)
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
% notice that the knot-abscissa for the scaled functional response
% trajectory is passed as a global here
% the knot-abscissa are in a 1-n vector and is defined in the run file
global tf 

% prepare input matrix to the ODE called tyf - this is a 2-n matrix with
% the first colum the knot-abscissa and the second column the knot
% coordinates. The knot coordinates are free parameters and are passed into
% the predict via the 'par' structure which is defined in the pars_init
% file
yf = zeros(length(tf),1); % create empty vector with knot-coordinates for the f values
for i = 1:length(tf)
filterChecks = ( eval(['f_',num2str(tf(i)),' < 0'])  || eval(['f_',num2str(tf(i)),' > 1']));   
  if filterChecks 
      info = 0;
      prdData = {};
      return;
  end
eval(['yf(i) = f_',num2str(tf(i)),';'])
end
tyf = [tf yf];

% not that the above written piece of code includes so-called 'customized
% filters' such that f cannot be more or less than 1

% individuals are between 1 and three years old, so we can run simulations
% using post-metamorphic values

% compute the acceleration factor (assuming f= 1):
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  pars_maturity = [kap kap_R g k_J k_M L_T v E_Hb E_Hp]; 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  s_M = l_j/l_b; % -, acceleration factor
 
 T = [temp.tL(:,1) C2K(temp.tL(:,2))] ; % K, temperature 
% set initial conditions:

L0 = Lw0.tL * del_M; % cm, structural length
f0 = eval(['f_',num2str(tf(1)),';']); % -, initial scaled function response is used to compute initial condition of the individual
E0 = f0 * E_m * L0^3; % J, initial amount of energy in reserves
% [UH0, a, info] = maturity(L0, f0, pars_maturity); % cm d, scaled maturity level
% EH0 = UH0 * p_Am; % J, initial maturity level
EH0 = 0; % this is of course wrong but since we only look at growth then we don't need to follow maturity explicitly and we save time by not needed to compute the initial maturity based on initial values of L, E and a -
LEH0  = [L0; E0; EH0;0]; % 4-1 vector [J, cm, J, J] with initial conditions

time = data.tL(:,1);

[~, LEH] =  ode23s(@dget_LEH, time, LEH0,[],tyf, T, par, cPar, s_M); 

L   = LEH(:,1);   % cm, structural length
ELw = L/del_M;   % L, physical length

prdData.tL = ELw;  
  
  
  function dLEH = dget_LEH(t, LEH, tyf, tT, p, c, s_M)
  
  L = LEH(1);     % cm, structural length
  E = LEH(2);     % J, reserve E
  E_H = LEH(3);   % J, maturity E_H
  %E_R = LEH(4);    % #/d, cum reproductive output

  
   temp = interp1(tT(:,1),tT(:,2),t,'pchip');
   TC = tempcorr(temp, p.T_ref, p.T_A);
  
   f = interp1(tyf(:,1),tyf(:,2),t,'pchip');
   
  %  Shape correction function applies to surface-area specific
  %  assimilation and energy conductance:
  % all parameters with time in dimension need to be temp corrected
  p.v    = s_M * p.v * TC; % cm/d, conductance
  c.p_Am = s_M * c.p_Am * TC;
  p.p_M  = p.p_M * TC;
  p.k_J  = p.k_J * TC;
  
  % Growth rate and mobilization rate:
  pA  = f * c.p_Am * L^2 ; % J/cm^2/d, maximum surface area-specific assimilation rate
  L2  = L * L; L3 = L2 * L; L4 = L3 * L;
  pC  = E/L3 * (p.E_G * p.v/ L  + p.p_M)/ (p.kap * E/ L3 + p.E_G);   % [p_C], J/cm^3 (2.12, Kooijman 2010)
    if p.kap * pC < p.p_M  
    r = (E * p.v/ L4  - p.p_M/ p.kap)/ (E/ L3 + p.E_G * c.kap_G/ p.kap); % 1/d, specific growth rate
    else
    r = (E * p.v/ L4 - p.p_M/ p.kap)/ (E/ L3 + p.E_G/ p.kap); % 1/d, specific growth rate
    end
  
  % generate dH/da, dE/da, dL/da:  
  dE_H =  ((1 - p.kap) * pC * L3 - p.k_J * E_H)  * (E_H < p.E_Hp);
  dE_R =  p.kap_R * ((1 - p.kap) * pC * L3 - p.k_J * p.E_Hp) * (E_H >= p.E_Hp);
%   dN   =  p.kap_R * dE_R/ E0; % #/d, cum reproductive output
  dE   =  pA - pC * L3;
  dL   =  L * r/ 3;
  
  % Pack output 
  dLEH = [dL; dE; dE_H; dE_R]; 
  
  
  