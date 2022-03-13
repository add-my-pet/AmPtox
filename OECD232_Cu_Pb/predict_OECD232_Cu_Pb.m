function [prdData, info] = predict_OECD232_Cu_Pb(par, data, auxData)
  
  % unpack par, data, auxData
  vars_pull(par); vars_pull(data); vars_pull(auxData);  
  %k_ey = k_ex; % overwrite
  
  if c_0x < 0 || c_0y < 0 || b_x < 0 || b_y < 0 || k_ex < 0 || k_ey < 0 || d_xy < 0 || h < 0
    prdData = []; info = 0; return
  else
    info = 1; % we use the default, filter = 1, to allow user-defined filters
  end
  
  treat2 = treat.N_Cu_Pb_t{2};
  c_x = treat2{1}; c_y = treat2{2}; t = treat2{3};
  n_x = length(c_x); n_y = length(c_y); n_t = length(t);

  S = zeros(n_x, n_y, n_t); % -, survival probabilities
  for j = 1:n_y
    c_yj = c_y(j);
    for i = 1:n_x
      c_xi = c_x(i); 
      if 1 >= c_xi/ c_0x + c_yj/ c_0y
	    S(i,j,:) = exp(- h * t);
      else
        k_e = (k_ex + k_ey)/ 2; C = c_xi/c_0x + c_yj/c_0y; t_0 = -log(1-1/C)/ k_e; % initial guess
%        [t_0, ft, info] = fsolve('find_effect_time', t_0, [], c_xi, c_yj, c_0x, c_0y, k_ex, k_ey);
        [t_0, ft, info] = fzero(@find_effect_time, t_0, [], c_xi, c_yj, c_0x, c_0y, k_ex, k_ey);
% 	    if ~info==1 || 1e-8<abs(ft)
% 	      [t_0, ft, info] = fzero(@find_effect_time, 1, [], c_xi, c_yj, c_0x, c_0y, k_ex, k_ey);
% 	      if ~info==1 || 1e-8<abs(ft)
% 	        fprintf('no convergence for effect-time\n');
%           end
%         end
	    c_0xi = (1 - exp(-t_0 * k_ex)) * c_xi;
	    c_0yj = (1 - exp(-t_0 * k_ey)) * c_yj;	
	    t_0 = ones(n_t,1) * t_0;
	    t_x = max(0,(exp(-k_ex * t_0) - exp(-k_ex * t)))/ k_ex;
	    t_y = max(0,(exp(-k_ey * t_0) - exp(-k_ey * t)))/ k_ey;
	    t_xy = max(0,(exp(-(k_ex + k_ey) * t_0) - exp(-(k_ex + k_ey) * t)))/ (k_ex + k_ey);
	    g_x = - c_xi * t_x + (c_xi - c_0xi) * max(0,t - t_0);
	    g_y = - c_yj * t_y + (c_yj - c_0yj) * max(0,t - t_0);
	    g_xy = c_xi * c_yj * t_xy + (c_xi - c_0xi) * (c_yj - c_0yj) * max(0,t - t_0) ...
	      - (c_yj - c_0yj) * c_xi * t_x - (c_xi - c_0xi) * c_yj * t_y ;
        a = h * t + max(0, b_x * g_x + b_y * g_y + d_xy * g_xy);
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