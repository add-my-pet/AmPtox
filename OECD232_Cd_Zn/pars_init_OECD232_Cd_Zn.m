function [par, metaPar, txtPar] = pars_init_OECD232_Cd_Zn(~)
% input is not used, however it must remain for compatibility with the AmP estimation procedure 
 
metaPar.model = 'nat'; 

%% parameters 
% stress
par.c_0Cd = 0.89367; free.c_0Cd = 1; units.c_0Cd = 'mg/g'; label.c_0Cd = ' No-Effect-Concentration (external) for Cd';
par.c_0Zn = 4.2808; free.c_0Zn = 1; units.c_0Zn = 'mg/g'; label.c_0Zn = ' No-Effect-Concentration (external) for Zn';
par.b_Cd = 0.039865; free.b_Cd = 1; units.b_Cd = 'g/d.mg'; label.b_Cd = 'killing rate for Cd';
par.b_Zn = 0.87112; free.b_Zn = 1; units.b_Zn = 'g/d.mg'; label.b_Zn = 'killing rate for Zn';
par.k_eCd = 67.4498; free.k_eCd = 1; units.k_eCd = '1/d'; label.k_eCd = 'elimination rate for Cd';
par.k_eZn = 903.7917; free.k_eZn = 1; units.k_eZn = '1/d'; label.k_eZn = 'elimination rate for Zn';
par.d_xy = 2.0392e-10; free.d_xy = 1; units.d_xy = '1/d.(mg/g)^2'; label.d_xy = 'interaction rate for x-y mix';
% other
par.h = 0.012434; free.h = 1; units.h = '1/d'; label.h = 'hazard rate in the blank';

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
