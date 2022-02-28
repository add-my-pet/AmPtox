function [prdData, info] = predict_OECD221_Cd(par, data, auxData)
  
  % unpack par, data, auxData
  vars_pull(par); vars_pull(data); vars_pull(auxData);  
  
  if c_0 < 0 || b < 0 || k_e < 0
    prdData = []; info = 0; return
  else
    info = 1; % we use the default, filter = 1, to allow user-defined filters
  end
    
  c = treat.tN{2}(:); t = tN(:,1);
  t_0 = -log(max(1e-8,1-c_0./max(1e-8,c')))/k_e; % no-effect-time
  c1 = ones(1,max(size(c))); % row-matrix of ones
  t1 = ones(max(size(t)),1); % column-matrix of ones
  f = (b/k_e)*max(0,t1*exp(-k_e*t_0) - exp(-k_e*t)*c1).*(t1*c') - ...
      b*(t1*(max(0,c-c_0)')).*max(0,t*c1 - t1*t_0);
  f = min(1,exp(f)).* (exp(-h*t)*c1);
  
  prdData.tN = f * init;
