close all; 
global pets

pets = {
        'OECD232_Cd_Pb'; 
        'OECD232_Cd_Zn'; 
        'OECD232_Cu_Cd'; 
        'OECD232_Cu_Pb'; 
        'OECD232_Zn_Cu';
        'OECD232_Zn_Pb'; 
        };

estim_options('default'); 
estim_options('max_step_number',5e2); 
estim_options('tol_simplex',1e-10);  

estim_options('pars_init_method', 1);
estim_options('results_output', 0);

%estim_options('method', 'no');

estim_pars; 
