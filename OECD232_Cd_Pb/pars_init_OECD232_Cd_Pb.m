function [par, metaPar, txtPar] = pars_init_OECD232_Cd_Pb(~)
% input is not used, however it must remain for compatibility with the AmP estimation procedure 
 
metaPar.model = 'nat'; 

%% parameters 
% stress
par.c_0Cd = 1.2775; free.c_0Cd = 1; units.c_0Cd = 'mg/g'; label.c_0Cd = ' No-Effect-Concentration (external) for Cd';
par.c_0Pb = 0.00033323; free.c_0Pb = 1; units.c_0Pb = 'mg/g'; label.c_0Pb = ' No-Effect-Concentration (external) for Pb';
par.b_Cd = 0.074694; free.b_Cd = 1; units.b_Cd = 'g/d.mg'; label.b_Cd = 'killing rate for Cd';
par.b_Pb = 0.0187; free.b_Pb = 1; units.b_Pb = 'g/d.mg'; label.b_Pb = 'killing rate for Pb';
par.k_eCd = 132.7191; free.k_eCd = 1; units.k_eCd = '1/d'; label.k_eCd = 'elimination rate for Cd';
par.k_ePb = 0.0048112; free.k_ePb = 1; units.k_ePb = '1/d'; label.k_ePb = 'elimination rate for Pb';
par.d_xy = 1.987e-07; free.d_xy = 1; units.d_xy = '1/d.(mg/g)^2'; label.d_xy = 'interaction rate for x-y mix';
% other
par.h = 0.01277; free.h = 0; units.h = '1/d'; label.h = 'hazard rate in the blank';

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
