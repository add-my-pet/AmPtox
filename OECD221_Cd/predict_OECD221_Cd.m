function [prdData, info] = predict_OECD221_Cd(par, data, auxData)
  
  % unpack par, data, auxData
  vars_pull(par); vars_pull(data); vars_pull(auxData);  
  
  if c_0 < 0 || c_T < 0 || k_e < 0
    prdData = []; info = 0; return
  else
    info = 1; % we use the default, filter = 1, to allow user-defined filters
  end
    
  H0 = maturity(L0, f, [kap; kap_R; g; k_J; k_M; 0; v; U_Hb; U_Hp]); % initial scaled maturity
  U0 = L0^3/ v; % initial reserve at max value
  
  C = treat.tN{2}(:); nc = length(C);
  
  % initialize state vector; catenate to avoid loops
  X0 = [zeros(nc,1);     % N: cumulative number of offspring (#)
        H0 * ones(nc,1); % H: scaled maturity H = M_H/ {J_EAm} (d.cm^2)
        L0 * ones(nc,1); % L: body length (cm)
        U0 * ones(nc,1); % U: scaled reserve U = M_E/ {J_EAm} (d.cm^2)
        zeros(nc,1)];    % c: scaled internal concentration (mug/l)
  % "scaled" here means internal concentration in the units of external ones

  par_U0 = [U_Hb/ (1 - kap); g; k_J; k_M; v]; % compose parameter vector
  U_0 = initial_scaled_reserve(1,par_U0); % d.cm^2

  % get trajectories
  [t, X] = ode23(@dharep, [0;tN(:,1)], X0, [], C, nc, c_0, c_T, k_e, kap, kap_R, g, k_J, k_M, v, U_Hp, U_0, f); % integrate changes in state
  X(1,:) = []; EN = X(:, 1:nc); % remove first line, select offspring only
  
  C = treat.tNN{2}(:); nc = length(C);
  
  % initialize state vector; catenate to avoid loops
  X0 = [zeros(nc,1);     % N: cumulative number of offspring (#)
        H0 * ones(nc,1); % H: scaled maturity H = M_H/ {J_EAm} (d.cm^2)
        L0 * ones(nc,1); % L: body length (cm)
        U0 * ones(nc,1); % U: scaled reserve U = M_E/ {J_EAm} (d.cm^2)
        zeros(nc,1)];    % c: scaled internal concentration (mug/l)

  % get trajectories
  [t, X] = ode23(@dharep, [0;tNN(:,1)], X0, [], C, nc, c_0, c_T, k_e, kap, kap_R, g, k_J, k_M, v, U_Hp, U_0, f); % integrate changes in state
  X(1,:) = []; ENN = X(:, 1:nc); % remove first line, select offspring only

  % pack to output
  prdData.tN = EN;
  prdData.tNN = ENN;
  
end

function dX = dharep(t, X, C, nc, c_0, c_T, k_e, kap, kapR, g, kJ, kM, v, Hp, U0, f)
  % unpack state vector
  N = X(1:nc);        % cumulative number of offspring (not used)
  H = X(nc+(1:nc));   % scaled maturity H = M_H/ {J_EAm}
  L = X(2*nc+(1:nc)); % structural length
  U = X(3*nc+(1:nc)); % scaled reserve U = M_E/ {J_EAm}
  c = X(4*nc+(1:nc)); % scaled internal concentration
  
  s = max(0,(c - c_0)/ c_T);    % -, stress factor

  E = U .* v ./ L .^ 3;       % -, scaled reserve density e = m_E/m_Em (dim-less)
  % again we scale with respect to m_Em = {J_EAm}/ (v [M_V]) of the blanc

  Lm = v/ (kM * g);           % cm, maximum length
  eg = E .* g ./ (E + g);     % -, in DEB notation: e g/ (e + g)
  SC = L .^ 2 .* eg .* (1 + L / (g * Lm)); % cm^2, SC = J_EC/{J_EAm}

  rB = kM * g ./ (3 * (E + g)); % 1/d, von Bert growth rate
  dL = rB .* (E * Lm - L);   % cm/d, change in length
  dU = f * L .^ 2 - SC;      % cm^2/ change in time-surface U = M_E/{J_EAm}
  dc = (k_e * Lm .* (C - c) - 3 * dL .* c) ./ L; % mug/d.l, change in scaled int. conc

  R = exp(-s) .* ((1 - kap) * SC - kJ * Hp) * kapR/ U0; % 1/d, reprod rate in #/d
  R = (H > Hp) .* max(0,R); % 1/d, make sure that R is non-negative
  dH = (1 - kap) * SC - kJ * H; % cm^2, change in scaled maturity H = M_H/ {J_EAm}
  dX = [R; dH; dL; dU; dc]; % catenate derivatives in output
end
  