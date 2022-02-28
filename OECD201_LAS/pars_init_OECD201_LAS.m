function [par, metaPar, txtPar] = pars_init_OECD201_LAS(~)
% input is not used, however it must remain for compatibility with the AmP estimation procedure 
 
metaPar.model = 'nat'; 

%% parameters 
% stress
par.c_0 = 1.6464e-08; free.c_0 = 1; units.c_0 = 'mg/l'; label.c_0 = ' No-Effect-Concentration';
par.b = 2.1166e-09; free.b = 1; units.b = 'l/d.mg'; label.b = 'killing rate';
par.c_T = 309.5695; free.c_T = 1; units.c_T = 'mg/l'; label.c_T = 'tolerance conc for costs\ of structure';
% DEB
par.K  = 15.1; free.K = 0; units.K = 'mM'; label.K = 'half saturation constant';
par.y_EV = 485.8941; free.y_EV = 1; units.y_EV = 'mol/OD'; label.y_EV = 'yield of reserves on structure';
par.k_N  = 143; free.k_N = 0; units.k_N = 'mol/(OD.h)'; label.k_N = 'max spec nutrient uptake rate';
par.k_E  = 0.013; free.k_E = 0; units.k_E = '1/h'; label.k_E = 'reserve turnover rate';
% environmental
par.k_NB  = 0.0016498; free.k_NB = 1; units.k_NB = '1/h'; label.k_NB = 'exchange from nutrient to background';
par.k_BN  = 6.1575e-08; free.k_BN = 1; units.k_BN = '1/h'; label.k_BN = 'exchange from background to nutrient';
par.k_0  = 0.00054932; free.k_0 = 1; units.k_0 = '1/h'; label.k_0 = 'dead biomass decay rate ';
% other
par.B_0 = 0.026; free.B_0 = 0; units.B_0 = 'mM'; label.B_0 = 'initial background nutrient';
par.N_0 = 0.016806; free.N_0 = 1; units.N_0 = '1/d'; label.N_0 = 'initial nutrient';
par.X_0 = 0.26283; free.X_0 = 1; units.X_0 = '1/d'; label.X_0 = 'initial biomass';
par.w = 1; free.w = 0; units.w = '-'; label.w = 'weight in OD for living biomass';
par.wd = 1; free.wd = 0; units.wd = '-'; label.wd = 'weight in OD for dead biomass';
par.w0 = -627.7418; free.w0 = 1; units.w0 = '-'; label.w0= 'weight in OD for decomposed biomass';

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
