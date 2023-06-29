%% Trajectory recontruction for P. maximus
% celtic sea

close all; 

global pets tf
pets = {'reconstruction'}; % this points to the name of the mydata, predict and pars_init files which will be read

% the knot abscissa for the scalted functional response
tf = round(linspace(1,192,20)'); % choose the interval between know which are estimated
% the more knots the longer it takes ... it is a good question what
% interval is best


estim_options('default'); 

% We recommend to do several continuation - maybe try 5-10 continuations with 500 steps,
% do 5000 steps the last round
estim_options('max_step_number',2e2); 
estim_options('max_fun_evals',5e3);   % don't change this

% 2 - starts ftom pars_init
% 1 - read parameters from results_reconstruction (use this for doing
% coninuations
estim_options('pars_init_method', 2); 
estim_options('results_output', 3); % 1, saves parameters into results_reconstruction
estim_options('method', 'no'); % set no if you don't want to estimate
% estim_options('pars_init_method', 1); 

% % YOU CAN COMMENT THESE WHEN NOT DOING CONTINUATIONS FROM THE RESULTS.MAT
% estim_pars; close all;
% estim_pars; close all;
% estim_pars; close all;
% estim_pars; close all;
% estim_pars; close all;
estim_pars; 


%% you can make additional plots here to check the prediction etc.

[data, auxData, metaData, txtData, weights] = mydata_reconstruction;
[par, metaPar, txtPar] = pars_init_reconstruction(metaData); 

vars_pull(auxData); vars_pull(data); 

t = linspace(1,192,100)'; % time axis for plotting the smoothed recontructed trajectory of the scaled functional response

% plot the reconstructed trajectory:
% prepare 2-n matrix with the first colum the knot-abscissa and the second
% column the knot coordinates. The knot coordinates are the parameters
% which were estimated. 
% Uses results which were saved in results_reconstruction.mat
load('results_reconstruction.mat') ; 
vars_pull(par); 
yf = zeros(length(tf),1); % create empty vector with knot-coordinates for the f values
for i = 1:length(tf)
eval(['yf(i) = f_',num2str(tf(i)),';'])
end
tyf = [tf yf]; % 2-n matrix with knot absicca (julian day) and knot coordinates (scaled functional response)
tyfs = [t, spline(t, tyf)]; % smoothed trajectory
figure()
plot(tyf(:,1), tyf(:,2),'bs','markersize',10,'markerfacecolor','b'); hold on
plot(tyfs(:,1), tyfs(:,2),'g', 'linewidth',2);
xlabel('julian time, day'); ylabel('scaled func resp., -')
legend('estimated knots','smoothed trajectory')
ylim([0 1]); xlim([0 t(end)])
set(gca,'fontsize',12)
              set(gcf,'PaperPositionMode','manual');
              set(gcf,'PaperUnits','points'); 
              set(gcf,'PaperPosition',[0 0 350 250]); % left bottom width height
 print('results_reconstruction_02.png', '-dpng')

prt_report_AmPtox 
