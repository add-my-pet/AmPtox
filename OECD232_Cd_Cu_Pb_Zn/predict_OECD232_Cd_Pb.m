function [prdData, info] = predict_OECD232_Cd_Pb(par, data, auxData)
  
  % unpack par, data, auxData
  vars_pull(par); vars_pull(data); vars_pull(auxData);  
  
  if c_0Cd < 0 || c_0Pb < 0 || b_Cd < 0 || b_Pb < 0 || k_eCd < 0 || k_ePb < 0 || d_xy < 0 || h < 0
    prdData = []; info = 0; return
  else
    info = 1; % we use the default, filter = 1, to allow user-defined filters
  end
  
  treat2 = treat.N_Cd_Pb_t{2};
  c_Cd = treat2{1}; c_Pb = treat2{2}; t = treat2{3}; t_max = 10 * t(end);
  n_Cd = length(c_Cd); n_Pb = length(c_Pb); n_t = length(t);

  S = zeros(n_Cd, n_Pb, n_t); % -, survival probabilities
  for j = 1:n_Pb
    c_Pbj = c_Pb(j);
    for i = 1:n_Cd
      c_Cdi = c_Cd(i); 
      if 1 >= c_Cdi/ c_0Cd + c_Pbj/ c_0Pb
	    S(i,j,:) = exp(- h * t);
      else
        if find_effect_time(t_max, c_Cdi, c_Pbj, c_0Cd, c_0Pb, k_eCd, k_ePb) > 0
          t_0 = t_max;
        else
          t_0 = fzero(@find_effect_time, [0 t_max], [], c_Cdi, c_Pbj, c_0Cd, c_0Pb, k_eCd, k_ePb);
        end
	    c_0Cdi = (1 - exp(-t_0 * k_eCd)) * c_Cdi;
	    c_0Pbj = (1 - exp(-t_0 * k_ePb)) * c_Pbj;	
	    t_0 = ones(n_t,1) * t_0;
	    t_Cd = max(0,(exp(-k_eCd * t_0) - exp(-k_eCd * t)))/ k_eCd;
	    t_Pb = max(0,(exp(-k_ePb * t_0) - exp(-k_ePb * t)))/ k_ePb;
	    t_CdPb = max(0,(exp(-(k_eCd + k_ePb) * t_0) - exp(-(k_eCd + k_ePb) * t)))/ (k_eCd + k_ePb);
	    g_Cd = - c_Cdi * t_Cd + (c_Cdi - c_0Cdi) * max(0,t - t_0);
	    g_Pb = - c_Pbj * t_Pb + (c_Pbj - c_0Pbj) * max(0,t - t_0);
	    g_CdPb = c_Cdi * c_Pbj * t_CdPb + (c_Cdi - c_0Cdi) * (c_Pbj - c_0Pbj) * max(0,t - t_0) ...
	      - (c_Pbj - c_0Pbj) * c_Cdi * t_Cd - (c_Cdi - c_0Cdi) * c_Pbj * t_Pb ;
        a = h * t + max(0, b_Cd * g_Cd + b_Pb * g_Pb + d_xy * g_CdPb);
        S(i,j,:) = exp(-a);
      end
    end
  end  
    
  prdData.N_Cd_Pb_t = S * init.N_Cd_Pb_t;
end

function f = find_effect_time (t, c_xi, c_yj, c_0x, c_0y, k_ex, k_ey)
  
  x = (1 - exp(- t * k_ex)) * c_xi/ c_0x;
  y = (1 - exp(- t * k_ey)) * c_yj/ c_0y;
  f = 1 - x - y;
     
end