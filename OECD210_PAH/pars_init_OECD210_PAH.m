function [par, metaPar, txtPar] = pars_OECD2010_PAH(~)
% input is not used, however it must remain for compatibility with the AmP estimation procedure 
 
metaPar.model = 'nat'; 

%% parameters 
% stress
par.c_0 = 1.25; free.c_0 = 1; units.c_0 = 'percent'; label.c_0 = ' No-Effect-Concentration';
par.c_T = 286; free.c_T = 1; units.c_T = 'percent'; label.c_T = 'tolerance concentration';
par.k_e = 3.7; free.k_e = 1; units.k_e = '1/d';   label.k_e = 'elimination rate at L = L_m';
% DEB
par.g  = 1.91568; free.g = 0; units.g = '-'; label.g = 'energy investment ratio';
par.k_M = 0.0461; free.k_M = 0; units.k_M = '1/d'; label.k_M = 'somatic maint rate coeff';
par.v  = 3.41871*0.0196; free.v = 1; units.v = 'cm/d'; label.v = 'energy conductance'; % s_M * v
% other
par.Lw_0 = 0.4; free.Lw_0 = 0; units.Lw_0 = 'cm'; label.Lw_0 = 'initial total length';
par.del_M = 0.1425; free.del_M = 0; units.del_M = '-'; label.del_M = 'shape coefficient';

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
