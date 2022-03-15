function [prdData, info] = predict_OECD232_Zn_Pb(par, data, auxData)
  
  % unpack par, data, auxData
  vars_pull(par); vars_pull(data); vars_pull(auxData);  
  
  if c_0Zn < 0 || c_0Cu < 0 || b_Zn < 0 || b_Cu < 0 || k_eZn < 0 || k_eCu < 0 || d_xy < 0 || h < 0
    prdData = []; info = 0; return
  else
    info = 1; % we use the default, filter = 1, to allow user-defined filters
  end
  
  treat2 = treat.N_Zn_Cu_t{2};
  c_Zn = treat2{1}; c_Cu = treat2{2}; t = treat2{3}; t_max = 10 * t(end);
  n_Zn = length(c_Zn); n_Cu = length(c_Cu); n_t = length(t);

  S = zeros(n_Zn, n_Cu, n_t); % -, survival probabilities
  for j = 1:n_Cu
    c_Cuj = c_Cu(j);
    for i = 1:n_Zn
      c_Zni = c_Zn(i); 
      if 1 >= c_Zni/ c_0Zn + c_Cuj/ c_0Cu
	    S(i,j,:) = exp(- h * t);
      else
        if find_effect_time(t_max, c_Zni, c_Cuj, c_0Zn, c_0Cu, k_eZn, k_eCu) > 0
          t_0 = t_max;
        else
          t_0 = fzero(@find_effect_time, [0 t_max], [], c_Zni, c_Cuj, c_0Zn, c_0Cu, k_eZn, k_eCu);
        end
	    c_0Zni = (1 - exp(-t_0 * k_eZn)) * c_Zni;
	    c_0Cuj = (1 - exp(-t_0 * k_eCu)) * c_Cuj;	
	    t_0 = ones(n_t,1) * t_0;
	    t_Zn = max(0,(exp(-k_eZn * t_0) - exp(-k_eZn * t)))/ k_eZn;
	    t_Cu = max(0,(exp(-k_eCu * t_0) - exp(-k_eCu * t)))/ k_eCu;
	    t_ZnCu = max(0,(exp(-(k_eZn + k_eCu) * t_0) - exp(-(k_eZn + k_eCu) * t)))/ (k_eZn + k_eCu);
	    g_Zn = - c_Zni * t_Zn + (c_Zni - c_0Zni) * max(0,t - t_0);
	    g_Cu = - c_Cuj * t_Cu + (c_Cuj - c_0Cuj) * max(0,t - t_0);
	    g_ZnCu = c_Zni * c_Cuj * t_ZnCu + (c_Zni - c_0Zni) * (c_Cuj - c_0Cuj) * max(0,t - t_0) ...
	      - (c_Cuj - c_0Cuj) * c_Zni * t_Zn - (c_Zni - c_0Zni) * c_Cuj * t_Cu ;
        a = h * t + max(0, b_Zn * g_Zn + b_Cu * g_Cu + d_xy * g_ZnCu);
        S(i,j,:) = exp(-a);
      end
    end
  end  
    
  prdData.N_Zn_Cu_t = S * init.N_Zn_Cu_t;
end

function f = find_effect_time (t, c_xi, c_yj, c_0x, c_0y, k_ex, k_ey)
  
  x = (1 - exp(- t * k_ex)) * c_xi/ c_0x;
  y = (1 - exp(- t * k_ey)) * c_yj/ c_0y;
  f = 1 - x - y;
     
end