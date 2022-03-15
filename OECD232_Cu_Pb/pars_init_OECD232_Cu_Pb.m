function [par, metaPar, txtPar] = pars_init_OECD232_Cu_Pb(~)
% input is not used, however it must remain for compatibility with the AmP estimation procedure 
 
metaPar.model = 'nat'; 

%% parameters 
% stress
par.c_0Cu = 2.9995; free.c_0Cu = 1; units.c_0Cu = 'mg/g'; label.c_0Cu = ' No-Effect-Concentration (external) for Cu';
par.c_0Pb = 0.002019; free.c_0Pb = 1; units.c_0Pb = 'mg/g'; label.c_0Pb = ' No-Effect-Concentration (external) for Pb';
par.b_Cu = 0.29319; free.b_Cu = 1; units.b_Cu = 'g/d.mg'; label.b_Cu = 'killing rate for Cu';
par.b_Pb = 0.006601; free.b_Pb = 1; units.b_Pb = 'g/d.mg'; label.b_Pb = 'killing rate for Pb';
par.k_eCu = 6459.8064; free.k_eCu = 1; units.k_eCu = '1/d'; label.k_eCu = 'elimination rate for Cu';
par.k_ePb = 0.29885; free.k_ePb = 1; units.k_ePb = '1/d'; label.k_ePb = 'elimination rate for Pb';
par.d_xy = 0.018896; free.d_xy = 1; units.d_xy = '1/d.(mg/g)^2'; label.d_xy = 'interaction rate for Cu-Pb mix';
% other
par.h = 0.0048786; free.h = 1; units.h = '1/d'; label.h = 'hazard rate in the blank';

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
