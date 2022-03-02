function [par, metaPar, txtPar] = pars_init_OECD203_Cu_Cd(~)
% input is not used, however it must remain for compatibility with the AmP estimation procedure 
 
metaPar.model = 'nat'; 

%% parameters 
% stress
par.c_0 = 2.77; free.c_0 = 1; units.c_0 = 'mug/l'; label.c_0 = ' No-Effect-Concentration (external)';
par.b = 0.3; free.b = 1; units.b = 'l/d.mug'; label.b = 'killing raste';
par.k_e = 0.72; free.k_e = 1; units.k_e = '1/d'; label.k_e = 'elimination rate';
% other
par.h = 0.008; free.h = 0; units.h = '1/d'; label.h = 'hazard rate in the blank';

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
