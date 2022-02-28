function [prdData, info] = predict_OECD222_Cu(par, data, auxData)
  
  % unpack par, data, auxData
  vars_pull(par); vars_pull(data); vars_pull(auxData);  
  
  if c_0 < 0 || c_T < 0 || k_e < 0
    prdData = []; info = 0; return
  else
    info = 1; % we use the default, filter = 1, to allow user-defined filters
  end
      
  C = treat.tWw{2}(:); nc = length(C); L_0 = (Ww0/ (1+ome))^(1/3);
  
  % initialize state vector; catenate to avoid loops
  X0 = [L_0 * ones(nc,1); % L: body weight (cm)
        f * ones(nc,1); % e: scaled reserve density (-)
        zeros(nc,1)];    % c: scaled internal concentration (mg/kg)
  % "scaled" here means internal concentration in the units of external ones

  % get trajectories
  [t, X] = ode23(@dLec, [0;tWw(:,1)], X0, [], C, nc, c_0, c_T, k_e, g, L_m, v, f); % integrate changes in state
  X(1,:) = []; L = X(:, 1:nc); e = X(:,nc+(1:nc)); % remove first line, select length and scaled reserve
  
  % pack to output
  prdData.tWw = L.^3 .* (1+ e*ome); % g, wet weight
  
end

function dX = dLec(~, X, C, nc, c_0, c_T, k_e, g, L_m, v, f)
  % unpack state vector
  L = X(1:nc);           % cm, structural length
  e = X(nc + (1:nc));    % -, scaled reserve [E]/[E_m]
  c = X(2*nc + (1:nc));  % mg/kg, scaled internal concentration

  s = min(1,max(0,(c - c_0)/ c_T));  % -, stress factor
  f_s = (1 - s) * f; % -, scaled function response under stress
  r = v * (e ./ L - 1 ./ L_m) ./ (e + g); % 1/d, specific growth rate
  
  dL = L .* r/ 3; % cm/d, change in structural length
  de = (f_s - e) * v ./ L; % 1/d, change in scaled reserve density
  dc = (k_e * L_m .* (C - c) - 3 * dL .* c) ./ L; % percent/d, change in scaled int. conc

  dX = [dL; de; dc]; % catenate derivatives in output
end

  