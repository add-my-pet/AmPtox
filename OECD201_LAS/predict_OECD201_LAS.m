function [prdData, info] = predict_OECD201_LAS(par, data, auxData)
  
  % unpack par, data, auxData
  vars_pull(par); vars_pull(data); vars_pull(auxData);  
  
  if c_0 < 0 || b < 0 || c_T < 0 || k_NB < 0 || k_BN < 0 || k_0 < 0
    prdData = []; info = 0; return
  else
    info = 1; % we use the default, filter = 1, to allow user-defined filters
  end
    
  c = treat.tOD{2}(:); nc = length(c); 
    
  m_0 = k_N/ k_E; % initial reserve density
  c1 = ones(nc,1);
  F = exp(-max(0,(c-c_0)/ c_T)); % initial survival prob
  Y0 = [B_0*c1; N_0*c1; m_0*c1; X_0*F; X_0*(1-F); 0*c1]'; % initialize state vector; catenate to avoid loops
  
  [~, Y] = ode45(@dalgatox, tOD(:,1), Y0, [], K, y_EV, k_N, k_E, k_0, k_NB, k_BN, c_0, c_T, b, c, nc); % integrate
  X = Y(:,3*nc+(1:nc)); Xd = Y(:,4*nc+(1:nc)); X0 = Y(:,5*nc+(1:nc));

  % pack to output
  prdData.tOD = w*X + wd*Xd + w0*X0; % optical density
end

function dY = dalgatox(~, Y, K, y_EV, k_N, k_E, k_0, k_NB, k_BN, c_0, c_T, b, c, nc)
  % unpack state vector
  B  = Y(1:nc);        % mM, background nutrient concentration
  N  = Y(nc+(1:nc));   % mM, nutrient concentration
  m  = Y(2*nc+(1:nc)); % mol/mol reserve density
  X  = Y(3*nc+(1:nc)); % living biomass
  Xd = Y(4*nc+(1:nc)); % dead biomass
  X0 = Y(5*nc+(1:nc)); % decomposed biomass

  jN = k_N * N ./ (K + N); % mM/h, nutrient uptake rate
  yEVc = y_EV*(1 + max(0, (c-c_0)/c_T)); % mol/mol, yield of reserve on structure
  r = k_E * m ./ (m + yEVc); % 1/h, spec growth rate
  h = max(0, (c-c_0)*b); % 1/h, hazard rate under stress

  dB = k_NB * N - k_BN * B; 
  dN = ((k_E - r) .* m - r .* yEVc - jN) .* X - k_NB * N + k_BN * B;
  dm = jN - k_E * m;
  dX = (r - h) .* X;
  dXd = h.*X - k_0*Xd;
  dX0 = k_0*Xd;

  dY = [dB; dN; dm; dX; dXd; dX0];

end
  