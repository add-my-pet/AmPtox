function [par, metaPar, txtPar] = pars_OECD210_PAH(~)
% input is not used, however it must remain for compatibility with the AmP estimation procedure 
 
metaPar.model = 'nat'; 

%% parameters 
% stress
par.c_0 = 1.25; free.c_0 = 1; units.c_0 = 'percent'; label.c_0 = ' No-Effect-Concentration';
par.c_T = 286; free.c_T = 1; units.c_T = 'percent'; label.c_T = 'tolerance concentration';
par.k_e = 3.7; free.k_e = 1; units.k_e = '1/d';   label.k_e = 'elimination rate at L = L_m';
% DEB
par.L_m = 0.22178; free.L_m = 0; units.L_m = 'cm'; label.L_m = 'max structural length';
par.g = 1.91568; free.g = 0; units.g = '-'; label.g = 'energy investment ratio';
par.v = 0.0196; free.v = 0; units.v = 'cm/d'; label.v = 'energy conductance'; % pre-acceleration
par.k = 0.043353; free.k = 0; units.k = '-'; label.k = 'maintenance ratio'; 
par.v_Hb = 0.00767629; free.v_Hb = 0; units.v_Hb = '-'; label.v_Hb = 'scaled maturity at birth'; 
par.v_Hj = 0.360907; free.v_Hj = 0; units.v_Hj = '-'; label.v_Hj = 'scaled maturity at end acceleration'; 
par.v_Hp = 22.8691; free.v_Hp = 0; units.v_Hp = '-'; label.v_Hp = 'scaled maturity at puberty'; 
par.T_A = 8000; free.T_A = 0; units.T_A = 'K'; label.T_A = 'Arrhenius temperature'; 
% other
par.Lw_0 = 0.4; free.Lw_0 = 0; units.Lw_0 = 'cm'; label.Lw_0 = 'initial total length';
par.del_M = 0.1425; free.del_M = 0; units.del_M = '-'; label.del_M = 'shape coefficient';
par.f = 0.6; free.f = 1; units.f = '-'; label.f = 'scaled functional response';

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
