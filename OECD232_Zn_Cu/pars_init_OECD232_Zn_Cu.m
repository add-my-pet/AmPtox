function [par, metaPar, txtPar] = pars_init_OECD232_Zn_Cu(~)
% input is not used, however it must remain for compatibility with the AmP estimation procedure 
 
metaPar.model = 'nat'; 

%% parameters 
% stress
par.c_0Zn = 3.5773; free.c_0Zn = 1; units.c_0Zn = 'mg/g'; label.c_0Zn = ' No-Effect-Concentration (external) for Zn';
par.c_0Cu = 2.5824; free.c_0Cu = 1; units.c_0Cu = 'mg/g'; label.c_0Cu = ' No-Effect-Concentration (external) for Cu';
par.b_Zn = 2.1301; free.b_Zn = 1; units.b_Zn = 'g/d.mg'; label.b_Zn = 'killing rate for Zn';
par.b_Cu = 0.12607; free.b_Cu = 1; units.b_Cu = 'g/d.mg'; label.b_Cu = 'killing rate for Cu';
par.k_eZn = 1303.2093; free.k_eZn = 1; units.k_eZn = '1/d'; label.k_eZn = 'elimination rate for Cu';
par.k_eCu = 39.8669; free.k_eCu = 1; units.k_eCu = '1/d'; label.k_eCu = 'elimination rate for Cu';
par.d_xy = 3.4902e-05; free.d_xy = 1; units.d_xy = '1/d.(mg/g)^2'; label.d_xy = 'interaction rate for x-y mix';
% other
par.h = 0.0076507; free.h = 1; units.h = '1/d'; label.h = 'hazard rate in the blank';

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
