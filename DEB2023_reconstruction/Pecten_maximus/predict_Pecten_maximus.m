function [prdData, info] = predict_Pecten_maximus(par, data, auxData)
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
 filterChecks = ...% f contrained to not be larger than 1 or negeative
               f_tL1>1 || f_tL1 < 0 || ...; % 
               f_tL2>1 || f_tL2 < 0 || ...; %  
               f_tL3>1 || f_tL3 < 0 ;  
%            f_tL >1  || f_tL<0 || ... 
if filterChecks  
    info = 0;
    prdData = {};
    return;
end  
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tj = tempcorr(temp.tj, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
%   TC_tL = tempcorr(temp.tL, T_ref, T_A);

  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, shell height at birth at f
  Wd_b = L_b^3 * d_V * (1 + f * w); % g, dry weight at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, shell height at metam at f
  Wd_j = L_j^3 * d_V * (1 + f * w); % g, dry weight at metam
  tT_j = (t_j - t_b)/ k_M/ TC_tj;   % d, time since birth at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, shell height at puberty at f
  Wd_p = L_p^3 * d_V * (1 + f * w); % g, dry weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate shell height at f
  Wd_i = L_i^3 * d_V * (1 + f * w); % g, ultimate dry weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wdb = Wd_b;
  prdData.Wdj = Wd_j;
  prdData.Wdp = Wd_p;
  prdData.Wdi = Wd_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
   % time-length (celtic sea)
   s_M = L_j/ L_b; % -, acceleration factor at f
time = tL1(:,1); 
T = temp.tL1; %  K, temperature
L0 = Lw0.tL1 * del_M; % cm, structural length
f0 = f_tL1; % -, initial scaled function response is used to compute initial condition of the individual
E0 = f0 * E_m * L0^3; % J, initial amount of energy in reserves
% [UH0, a, info] = maturity(L0, f0, pars_maturity); % cm d, scaled maturity level
% EH0 = UH0 * p_Am; % J, initial maturity level
EH0 = 0; %  since we only look at growth then we don't need to follow maturity explicitly and we save time by not needed to compute the initial maturity based on initial values of L, E and a -
LEH0  = [L0; E0; EH0;0]; % 4-1 vector [J, cm, J, J] with initial conditions

[~, LEH] =  ode45(@dget_LEH, time, LEH0,[],f_tL1, T, par, cPar, s_M); 
 L   = LEH(:,1);   % cm, structural length
ELw1 = L/del_M;   % L, physical length


% time-length, bay of brest, France

time = tL2(:,1); 
tT = temp.tL2; %  K, temperature
L0 = Lw0.tL2 * del_M; % cm, structural length
f0 = f_tL2; % -, initial scaled function response is used to compute initial condition of the individual
E0 = f0 * E_m * L0^3; % J, initial amount of energy in reserves
% [UH0, a, info] = maturity(L0, f0, pars_maturity); % cm d, scaled maturity level
% EH0 = UH0 * p_Am; % J, initial maturity level
EH0 = 0; %  since we only look at growth then we don't need to follow maturity explicitly and we save time by not needed to compute the initial maturity based on initial values of L, E and a -
LEH0  = [L0; E0; EH0;0]; % 4-1 vector [J, cm, J, J] with initial conditions

[~, LEH] =  ode45(@dget_LEH, time, LEH0,[],f_tL2, tT, par, cPar, s_M); 
 L   = LEH(:,1);   % cm, structural length
ELw2 = L/del_M;   % L, physical length

% time-length, traena, Norway

time = tL3(:,1); 
tT = temp.tL3; %  K, temperature
L0 = Lw0.tL3 * del_M; % cm, structural length
f0 = f_tL3; % -, initial scaled function response is used to compute initial condition of the individual
E0 = f0 * E_m * L0^3; % J, initial amount of energy in reserves
% [UH0, a, info] = maturity(L0, f0, pars_maturity); % cm d, scaled maturity level
% EH0 = UH0 * p_Am; % J, initial maturity level
EH0 = 0; %  since we only look at growth then we don't need to follow maturity explicitly and we save time by not needed to compute the initial maturity based on initial values of L, E and a -
LEH0  = [L0; E0; EH0;0]; % 4-1 vector [J, cm, J, J] with initial conditions

[~, LEH] =  ode45(@dget_LEH, time, LEH0,[],f_tL3, tT, par, cPar, s_M); 
 L   = LEH(:,1);   % cm, structural length
ELw3 = L/del_M;   % L, physical length

 
  
%   % time-length 
%   t = tL(:,1); % d, time since birth
%   f = f_tL; % -, mean scaled func response for tL
%   [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
%   L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m; % cm, struct. length at birth
%   kT_M = k_M * TC_tL; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; % 1/d, rates
%   tT_j = (t_j - t_b)/ kT_M; % d, time end of acceleration
%   L_bj = L_b * exp(t(t < tT_j,1) * rT_j/ 3);
%   L_jm = L_i - (L_i - L_j) * exp( - rT_B * (t(t >= tT_j) - tT_j)); % cm, expected length at time
%   ELw = [L_bj; L_jm]/ del_M;                                       % g, wet weight
  
  % pack to output
%   prdData.tL = ELw;
  prdData.tL1 = ELw1; 
  prdData.tL2 = ELw2;  
  prdData.tL3 = ELw3;  

  
  
function dLEH = dget_LEH(t, LEH, f, tT, p, c, s_M)
  
  L = LEH(1);     % cm, structural length
  E = LEH(2);     % J, reserve E
  E_H = LEH(3);   % J, maturity E_H
  %E_R = LEH(4);    % #/d, cum reproductive output

  
%    temp = interp1(tT(:,1),tT(:,2),t,'pchip');
%    temp = C2K(16);
   if length(tT) > 1
   tT = interp1(tT(:,1),tT(:,2),t,'linear');  % interpolate the right temperature
%    tT = spline1(t, tT);
%    [y, dy, index] = spline1(x, knots, Dy1, Dyk)
   end 
   
   TC = tempcorr(tT, p.T_ref, p.T_A); % -, temperature correction factor
  
%    f = interp1(tyf(:,1),tyf(:,2),t,'pchip');
   
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
  
  
  
  