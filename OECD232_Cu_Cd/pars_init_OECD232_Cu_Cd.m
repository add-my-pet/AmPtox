function [par, metaPar, txtPar] = pars_init_OECD232_Cu_Cd(~)
% input is not used, however it must remain for compatibility with the AmP estimation procedure 
 
metaPar.model = 'nat'; 

%% parameters 
% stress
par.c_0Cu = 3.1107; free.c_0Cu = 1; units.c_0Cu = 'mg/g'; label.c_0Cu = ' No-Effect-Concentration (external) for Cu';
par.c_0Cd = 0.078497; free.c_0Cd = 1; units.c_0Cd = 'mg/g'; label.c_0Cd = ' No-Effect-Concentration (external) for Cd';
par.b_Cu = 0.16161; free.b_Cu = 1; units.b_Cu = 'g/d.mg'; label.b_Cu = 'killing rate for Cu';
par.b_Cd = 0.022398; free.b_Cd = 1; units.b_Cd = 'g/d.mg'; label.b_Cd = 'killing rate for Cd';
par.k_eCu = 215396739.5609; free.k_eCu = 1; units.k_eCu = '1/d'; label.k_eCu = 'elimination rate for Cu';
par.k_eCd = 1908906.8805; free.k_eCd = 1; units.k_eCd = '1/d'; label.k_eCd = 'elimination rate for Cd';
par.d_xy = 0.15154; free.d_xy = 1; units.d_xy = '1/d.(mg/g)^2'; label.d_xy = 'interaction rate for Cu-Cd mix';
% other
par.h = 0.0080586; free.h = 1; units.h = '1/d'; label.h = 'hazard rate in the blank';

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
