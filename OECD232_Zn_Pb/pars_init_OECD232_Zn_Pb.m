function [par, metaPar, txtPar] = pars_init_OECD232_Zn_Pb(~)
% input is not used, however it must remain for compatibility with the AmP estimation procedure 
 
metaPar.model = 'nat'; 

%% parameters 
% stress
par.c_0Zn = 3.4817; free.c_0Zn = 1; units.c_0Zn = 'mg/g'; label.c_0Zn = 'No-Effect-Concentration (external) for Zn';
par.c_0Pb = 0.00021853; free.c_0Pb = 1; units.c_0Pb = 'mg/g'; label.c_0Pb = 'No-Effect-Concentration (external) for Pb';
par.b_Zn = 0.59204; free.b_Zn = 1; units.b_Zn = 'g/d.mg'; label.b_Zn = 'killing rate for Zn';
par.b_Pb = 0.065767; free.b_Pb = 1; units.b_Pb = 'g/d.mg'; label.b_Pb = 'killing rate for Pb';
par.k_eZn = 3231.403; free.k_eZn = 1; units.k_eZn = '1/d'; label.k_eZn = 'elimination rate for Zn';
par.k_ePb = 0.01416; free.k_ePb = 1; units.k_ePb = '1/d'; label.k_ePb = 'elimination rate for compound Pb';
par.d_xy = 7.8929e-06; free.d_xy = 1; units.d_xy = '1/d.(mg/g)^2'; label.d_xy = 'interaction rate for Zn-Pb mix';
% other
par.h = 0.018277; free.h = 1; units.h = '1/d'; label.h = 'hazard rate in the blank';

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
