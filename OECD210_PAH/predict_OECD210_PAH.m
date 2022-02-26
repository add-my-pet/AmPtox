function [prdData, info] = predict_OECD210_PAH(par, data, auxData)
  
  % unpack par, data, auxData
  vars_pull(par); vars_pull(data); vars_pull(auxData);  
  
  if c_0 < 0 || c_T < 0 || k_e < 0
    prdData = []; info = 0; return
  else
    info = 1; % we use the default, filter = 1, to allow user-defined filters
  end
    
  TC = tempcorr(C2K(temp.cL), C2K(20), T_A); % -, temperature correction factor (used for v)
  
  nc = size(cL,1); % number of concentrations
  pars_tj = [g k 0 v_Hb v_Hj v_Hp]; % compose parameter vector
  [~, ~, ~, l_j, ~, l_b, l_i] = get_tj(pars_tj, f);
  L_i = L_m * l_i; % cm, ultimate structural length
  s_M = l_j/ l_b; % -, acceleration factor
  
  % initialize state vector; catenate to avoid loops
  X_0 = [Lw_0 * del_M * ones(nc,1); %  L: cm, initial structural length, 
         f * ones(nc,1); %  e: -, scaled reserve density
         zeros(nc,1)]; % c: percent, scaled internal concentration
  
  [~, LUc] = ode23(@dLec, [0; time.cL], X_0, [], cL(:,1), nc, c_0, c_T, k_e, g, L_i, TC*s_M*v, f); % integrate changes in state
  prdData.cL = LUc(end,1:nc)'/ del_M; % cm, total length
end

function dX = dLec(~, X, C, nc, c_0, c_T, k_e, g, L_i, v, f)
  % unpack state vector
  L = X(1:nc);             % cm, structural length
  e = X(nc + (1:nc));      % -, scaled reserve [E]/[E_m]
  c = X(2 * nc + (1:nc));  % percent, scaled internal concentration

  s = min(1,max(0,(c - c_0)/ c_T));  % -, stress factor
  f_s = (1 - s) * f; % -, scaled function response under stress
  r = v * (e ./ L - 1 ./ L_i) ./ (e + g); % 1/d, specific growth rate
  
  dL = L .* r/ 3; % cm/d, change in structural length
  de = (f_s - e) * v ./ L; % 1/d, change in scaled reserve density
  dc = (k_e * L_i .* (C - c) - 3 * dL .* c) ./ L; % percent/d, change in scaled int. conc

  dX = [dL; de; dc]; % catenate derivatives in output
end
