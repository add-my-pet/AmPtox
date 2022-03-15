function [par, metaPar, txtPar] = pars_init_group(metaData)
% input is not used, however it must remain for compatibility with the AmP estimation procedure 
 
metaPar.model = {'nat','nat','nat','nat','nat','nat'} ;
metaPar.cov_rules = ''; % see function parGrp2Pets
metaPar.weights.d_xy = 0;


%% parameters 
% stress
par.c_0Cd = 1.1161; free.c_0Cd = 1; units.c_0Cd = 'mg/g'; label.c_0Cd = 'No-Effect-Concentration (external) for Cd';
par.c_0Cu = 3.0634; free.c_0Cu = 1; units.c_0Cu = 'mg/g'; label.c_0Cu = 'No-Effect-Concentration (external) for Cu';
par.c_0Pb = 0.00026949; free.c_0Pb = 1; units.c_0Pb = 'mg/g'; label.c_0Pb = 'No-Effect-Concentration (external) for Pb';
par.c_0Zn = 4.0618; free.c_0Zn = 1; units.c_0Zn = 'mg/g'; label.c_0Zn = 'No-Effect-Concentration (external) for Zn';
par.b_Cd = 0.046109; free.b_Cd = 1; units.b_Cd = 'g/d.mg'; label.b_Cd = 'killing rate for Cd';
par.b_Cu = 0.23421; free.b_Cu = 1; units.b_Cu = 'g/d.mg'; label.b_Cu = 'killing rate for Cu';
par.b_Pb = 0.10543; free.b_Pb = 1; units.b_Pb = 'g/d.mg'; label.b_Pb = 'killing rate for Pb';
par.b_Zn = 0.49717; free.b_Zn = 1; units.b_Zn = 'g/d.mg'; label.b_Zn = 'killing rate for Zn';
par.k_eCd = 52.7341; free.k_eCd = 1; units.k_eCd = '1/d'; label.k_eCd = 'elimination rate for Cd';
par.k_eCu = 404.1813; free.k_eCu = 1; units.k_eCu = '1/d'; label.k_eCu = 'elimination rate for Cu';
par.k_ePb = 0.0043568; free.k_ePb = 1; units.k_ePb = '1/d'; label.k_ePb = 'elimination rate for Pb';
par.k_eZn = 503.9993; free.k_eZn = 1; units.k_eZn = '1/d'; label.k_eZn = 'elimination rate for Zn';
par.d_xy = [0  0  0  0  0  0]; free.d_xy = [0 0 0 0 0 0]; units.d_xy = '1/d.(mg/g)^2'; label.d_xy = 'interaction rate for x-y mix';
% other
par.h = 0.012846; free.h = 1; units.h = '1/d'; label.h = 'hazard rate in the blank';

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
