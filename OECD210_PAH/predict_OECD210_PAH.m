function [prdData, info] = predict_OECD2010_PAH(par, data, auxData)
  
  % unpack par, data, auxData
  vars_pull(par); vars_pull(data); vars_pull(auxData);  
  
  if c_0 < 0 || c_T < 0 || k_e < 0
    prdData = []; info = 0; return
  else
    info = 1; % we use the default, filter = 1, to allow user-defined filters
  end
    
  U_0 = (del_M * Lw_0)^3/ v; % initial reserve at max value
  nc = size(cL,1); % number of concentrations
  
  % initialize state vector; catenate to avoid loops
  X_0 = [Lw_0 * del_M * ones(nc,1); %  L: cm, initial structural length, 
         U_0 * ones(nc,1); %  U: cm^2, scaled reserve U = M_E/ {J_EAm}
         zeros(nc,1)];     %  c: mug/l, scaled internal concentration
  
  [~, LUc] = ode23(@dLUc, [0; time.cL], X_0, [], cL(:,1), nc, c_0, c_T, k_e, g, k_M, v); % integrate changes in state
  prdData.cL = LUc(end,1:nc)'/ del_M; % cm, head+body length
end

function dX = dLUc(t, X, C, nc, c_0, c_T, k_e, g, k_M, v)
  %  t: exposure time (not used)
  %  X: (3 * nc,1) vector with state variables (see below)
  
  
  % unpack state vector
  L = X(1:nc);              % cm, structural length
  U = X(nc + (1:nc));       % d.cm^2, scaled reserve U = M_E/ {J_EAm}
  c = X(2 * nc + (1:nc));   % percent, scaled internal concentration

  s = min(1,max(0,(c - c_0)/ c_T));  % -, stress factor; we here apply the factor (1 - s) to {J_EAm}

  % although U = M_E/{J_EAm}, we scale with {J_EAm} of the blanc
  % this also applies to SC = J_EC/{J_EAm}

  E = U * v ./ L .^ 3; % -, scaled reserve density e = m_E/m_Em (dim-less)
  % again we scale with respect to m_Em = {J_EAm}/ (v [M_V]) of the blanc

  % since g = v [M_V]/(\kap {J_EAm} y_VE) we have
  g_s = g ./ (1 - s); % -, stressed value for energy investment ratio

  L_ms = v ./ (k_M * g_s); % cm, maximum length in stressed situation
  eg = E .* g_s ./ (E + g_s); % -, in DEB notation: e g/ (e + g)
  SC = L .^ 2 .* eg .* (1 + L ./ (g_s .* L_ms)); % cm^2, SC = J_EC/ {J_EAm}

  r_Bs = k_M * g_s/ 3 ./ (E + g_s); % 1/d, von Bert growth rate
  dL = r_Bs .* (E .* L_ms - L); % cm/d, change in length
  dU = (1 - s) .* L.^2 - SC; % cm^2, change in time-surface U = M_E/{J_EAm}
  dc = (k_e * L_ms .* (C - c) - 3 * dL .* c) ./ L; % percent/d, change in scaled int. conc

  dX = [dL; dU; dc]; % catenate derivatives in output
end
