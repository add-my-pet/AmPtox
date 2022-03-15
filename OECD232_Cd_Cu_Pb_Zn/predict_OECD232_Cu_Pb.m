function [prdData, info] = predict_OECD232_Cu_Pb(par, data, auxData)
  
  % unpack par, data, auxData
  vars_pull(par); vars_pull(data); vars_pull(auxData);  
  
  if c_0Cu < 0 || c_0Pb < 0 || b_Cu < 0 || b_Pb < 0 || k_eCu < 0 || k_ePb < 0 || d_xy < 0 || h < 0
    prdData = []; info = 0; return
  else
    info = 1; % we use the default, filter = 1, to allow user-defined filters
  end
  
  treat2 = treat.N_Cu_Pb_t{2};
  c_Cu = treat2{1}; c_Pb = treat2{2}; t = treat2{3}; t_max = 10 * t(end);
  n_Cu = length(c_Cu); n_Pb = length(c_Pb); n_t = length(t);

  S = zeros(n_Cu, n_Pb, n_t); % -, survival probabilities
  for j = 1:n_Pb
    c_Pbj = c_Pb(j);
    for i = 1:n_Cu
      c_Cui = c_Cu(i); 
      if 1 >= c_Cui/ c_0Cu + c_Pbj/ c_0Pb
	    S(i,j,:) = exp(- h * t);
      else
        if find_effect_time(t_max, c_Cui, c_Pbj, c_0Cu, c_0Pb, k_eCu, k_ePb) > 0
          t_0 = t_max;
        else
          t_0 = fzero(@find_effect_time, [0 t_max], [], c_Cui, c_Pbj, c_0Cu, c_0Pb, k_eCu, k_ePb);
        end
	    c_0Cui = (1 - exp(-t_0 * k_eCu)) * c_Cui;
	    c_0Pbj = (1 - exp(-t_0 * k_ePb)) * c_Pbj;	
	    t_0 = ones(n_t,1) * t_0;
	    t_Cu = max(0,(exp(-k_eCu * t_0) - exp(-k_eCu * t)))/ k_eCu;
	    t_Pb = max(0,(exp(-k_ePb * t_0) - exp(-k_ePb * t)))/ k_ePb;
	    t_CuPb = max(0,(exp(-(k_eCu + k_ePb) * t_0) - exp(-(k_eCu + k_ePb) * t)))/ (k_eCu + k_ePb);
	    g_Cu = - c_Cui * t_Cu + (c_Cui - c_0Cui) * max(0,t - t_0);
	    g_Pb = - c_Pbj * t_Pb + (c_Pbj - c_0Pbj) * max(0,t - t_0);
	    g_CuPb = c_Cui * c_Pbj * t_CuPb + (c_Cui - c_0Cui) * (c_Pbj - c_0Pbj) * max(0,t - t_0) ...
	      - (c_Pbj - c_0Pbj) * c_Cui * t_Cu - (c_Cui - c_0Cui) * c_Pbj * t_Pb ;
        a = h * t + max(0, b_Cu * g_Cu + b_Pb * g_Pb + d_xy * g_CuPb);
        S(i,j,:) = exp(-a);
      end
    end
  end  
    
  prdData.N_Cu_Pb_t = S * init.N_Cu_Pb_t;
end

function f = find_effect_time (t, c_xi, c_yj, c_0x, c_0y, k_ex, k_ey)
  
  x = (1 - exp(- t * k_ex)) * c_xi/ c_0x;
  y = (1 - exp(- t * k_ey)) * c_yj/ c_0y;
  f = 1 - x - y;
     
end