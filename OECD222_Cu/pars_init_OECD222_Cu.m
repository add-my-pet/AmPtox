function [par, metaPar, txtPar] = pars_init_OECD222_Cu(~)
% input is not used, however it must remain for compatibility with the AmP estimation procedure 
 
metaPar.model = 'nat'; 


%% parameters 
% stress
par.c_0 = 4.45; free.c_0 = 1; units.c_0 = 'mg/kg'; label.c_0 = ' No-Effect-Concentration (external, may be zero)';
par.c_T = 1193; free.c_T = 1; units.c_T = 'mg/kg'; label.c_T = 'tolerance concentration';
par.k_e = 0.0010741; free.k_e = 1; units.k_e = '1/d'; label.k_e = 'elimination rate at L = L_m';
% DEB
par.g  = 0.287153; free.g = 0; units.g = '-'; label.g = 'energy investment ratio';
par.k_M = 0.0888448; free.k_M = 0; units.k_M = '1/d'; label.k_M = 'somatic maint rate coeff';
par.v  = 0.023367; free.v = 1; units.v = 'cm/d'; label.v = 'energy conductance';
par.L_m = 0.91592; free.L_m = 0; units.L_m = 'cm'; label.L_m = 'max structural length';
par.ome = 4.01641; free.ome = 1; units.ome = 'd.cm^2'; label.ome = 'contribution of ash free dry mass of reserve to total ash free dry biomass';
% other
par.Ww0 = 0.008; free.Ww0 = 0; units.Ww0 = 'cm'; label.Ww0 = 'initial wet weight';
par.f = 1; free.f = 1; units.f = '-'; label.f = 'scaled functional response';

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
