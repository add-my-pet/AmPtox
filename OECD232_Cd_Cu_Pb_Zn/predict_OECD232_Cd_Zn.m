function [prdData, info] = predict_OECD232_Cd_Zn(par, data, auxData)
  
  % unpack par, data, auxData
  vars_pull(par); vars_pull(data); vars_pull(auxData);  
  
  if c_0Cd < 0 || c_0Zn < 0 || b_Cd < 0 || b_Zn < 0 || k_eCd < 0 || k_eZn < 0 || d_xy < 0 || h < 0
    prdData = []; info = 0; return
  else
    info = 1; % we use the default, filter = 1, to allow user-defined filters
  end
  
  treat2 = treat.N_Cd_Zn_t{2};
  c_Cd = treat2{1}; c_Zn = treat2{2}; t = treat2{3}; t_max = 10 * t(end);
  n_Cd = length(c_Cd); n_Zn = length(c_Zn); n_t = length(t);

  S = zeros(n_Cd, n_Zn, n_t); % -, survival probabilities
  for j = 1:n_Zn
    c_Znj = c_Zn(j);
    for i = 1:n_Cd
      c_Cdi = c_Cd(i); 
      if 1 >= c_Cdi/ c_0Cd + c_Znj/ c_0Zn
	    S(i,j,:) = exp(- h * t);
      else
        if find_effect_time(t_max, c_Cdi, c_Znj, c_0Cd, c_0Zn, k_eCd, k_eZn) > 0
          t_0 = t_max;
        else
          t_0 = fzero(@find_effect_time, [0 t_max], [], c_Cdi, c_Znj, c_0Cd, c_0Zn, k_eCd, k_eZn);
        end
	    c_0Cdi = (1 - exp(-t_0 * k_eCd)) * c_Cdi;
	    c_0Znj = (1 - exp(-t_0 * k_eZn)) * c_Znj;	
	    t_0 = ones(n_t,1) * t_0;
	    t_Cd = max(0,(exp(-k_eCd * t_0) - exp(-k_eCd * t)))/ k_eCd;
	    t_Zn = max(0,(exp(-k_eZn * t_0) - exp(-k_eZn * t)))/ k_eZn;
	    t_CdZn = max(0,(exp(-(k_eCd + k_eZn) * t_0) - exp(-(k_eCd + k_eZn) * t)))/ (k_eCd + k_eZn);
	    g_Cd = - c_Cdi * t_Cd + (c_Cdi - c_0Cdi) * max(0,t - t_0);
	    g_Zn = - c_Znj * t_Zn + (c_Znj - c_0Znj) * max(0,t - t_0);
	    g_CdZn = c_Cdi * c_Znj * t_CdZn + (c_Cdi - c_0Cdi) * (c_Znj - c_0Znj) * max(0,t - t_0) ...
	      - (c_Znj - c_0Znj) * c_Cdi * t_Cd - (c_Cdi - c_0Cdi) * c_Znj * t_Zn ;
        a = h * t + max(0, b_Cd * g_Cd + b_Zn * g_Zn + d_xy * g_CdZn);
        S(i,j,:) = exp(-a);
      end
    end
  end  
    
  prdData.N_Cd_Zn_t = S * init.N_Cd_Zn_t;
end

function f = find_effect_time (t, c_xi, c_yj, c_0x, c_0y, k_ex, k_ey)
  
  x = (1 - exp(- t * k_ex)) * c_xi/ c_0x;
  y = (1 - exp(- t * k_ey)) * c_yj/ c_0y;
  f = 1 - x - y;
     
end