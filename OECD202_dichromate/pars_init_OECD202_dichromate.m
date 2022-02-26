function [par, metaPar, txtPar] = pars_init_OECD202_dichromate(~)
% input is not used, however it must remain for compatibility with the AmP estimation procedure 
 
metaPar.model = 'nat'; 

%% parameters 
% stress
par.c_0 = 0.272; free.c_0 = 1; units.c_0 = 'mg/l'; label.c_0 = ' No-Effect-Concentration';
par.b = 0.278; free.b = 1; units.b = 'l/d.mg'; label.b = 'killing rate';
par.k_e = 0.214; free.k_e = 1; units.k_e = '1/d'; label.k_e = 'elimination rate at L = L_m';
% DEB
par.g  = 4.944; free.g = 0; units.g = '-'; label.g = 'energy investment ratio';
par.k_M = 0.2727; free.k_M = 0; units.k_M = '1/d'; label.k_M = 'somatic maint rate coeff';
par.L_m  = 0.1516; free.L_m = 0; units.L_m = 'cm'; label.L_m = 'maximum strutural length';
% other
par.L_0 = 0.026; free.L_0 = 0; units.L_0 = 'cm'; label.L_0 = 'initial structural length';
par.h_0 = 3e-4; free.h_0 = 1; units.h_0 = '1/d'; label.h_0 = 'hazard rate in the blank';

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
