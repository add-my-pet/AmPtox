function [prdData, info] = predict_OECD202_dichromate(par, data, auxData)
  
  % unpack par, data, auxData
  vars_pull(par); vars_pull(data); vars_pull(auxData);  
  
  if c_0 < 0 || b < 0 || k_e < 0
    prdData = []; info = 0; return
  else
    info = 1; % we use the default, filter = 1, to allow user-defined filters
  end
    
  C = treat.tN{2}(:); nc = length(C); N_0 = initial.tN;
  
  % initialize state vector; catenate to avoid loops
  X0 = [N_0 * ones(nc,1); % #, number of surviving individuals
        L_0 * ones(nc,1); % cm, structural length 
        zeros(nc,1)];     % mg/l, scaled internal concentration 
  % "scaled" here means internal concentration in the units of external ones

  % get trajectories
  [~, X] = ode23(@dNLc, tN(:,1), X0, [], C, nc, c_0, b, k_e, h_0, k_M, g, L_m); % integrate changes in state
  EN = X(:,1:nc); % select number of survivors
  
  % pack to output
  prdData.tN = EN;
end

function dX = dNLc(~, X, C, nc, c_0, b, k_e, h_0, k_M, g, L_m)
  % unpack state vector
  N = X(1:nc);        % nuber of surviving individuals 
  L = X(nc+(1:nc));   % structural length
  c = X(2*nc+(1:nc)); % scaled internal concentration
  
  dN = - N .* (h_0 + b * max(0,(c - c_0))); % #/d, change in # of surviving individuals
  r_B = k_M/ 3/ (1 + 1/g); % 1/d, von Bert growth rate
  dL = r_B .* (L_m - L);   % cm/d, change in length
  dc = (k_e * L_m .* (C - c) - 3 * dL .* c) ./ L; % mug/d.l, change in scaled int. conc

  dX = [dN; dL; dc]; % catenate derivatives in output
end
  