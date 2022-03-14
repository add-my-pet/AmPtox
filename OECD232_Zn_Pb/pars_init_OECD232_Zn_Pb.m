function [par, metaPar, txtPar] = pars_init_OECD232_Zn_Pb(~)
% input is not used, however it must remain for compatibility with the AmP estimation procedure 
 
metaPar.model = 'nat'; 

%% parameters 
% stress
par.c_0x = 3.1504; free.c_0x = 1; units.c_0x = 'mg/g'; label.c_0x = ' No-Effect-Concentration (external) for compound x';
par.c_0y = 1.3286e-05; free.c_0y = 1; units.c_0y = 'mg/g'; label.c_0y = ' No-Effect-Concentration (external) for compound y';
par.b_x = 0.66985; free.b_x = 1; units.b_x = 'g/d.mg'; label.b_x = 'killing rate for compound x';
par.b_y = 0.16836; free.b_y = 1; units.b_y = 'g/d.mg'; label.b_y = 'killing rate for compound y';
par.k_ex = 110722.5037; free.k_ex = 1; units.k_ex = '1/d'; label.k_ex = 'elimination rate for compound x';
par.k_ey = 0.0043398; free.k_ey = 1; units.k_ey = '1/d'; label.k_ey = 'elimination rate for compound y';
par.d_xy = 3.9754e-30; free.d_xy = 1; units.d_xy = '1/d.(mg/g)^2'; label.d_xy = 'interaction rate for compounds x and y';
% other
par.h = 0.0087; free.h = 0; units.h = '1/d'; label.h = 'hazard rate in the blank';

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
