%% Trajectory recontruction for P. maximus

close all; 

global pets tf
pets = {'reconstruction'};

% 1-n vector with the knot-abscissa for the functional response trajectory
% that we are trying to reconstruct on the basis of growth data
% choose the interval between knots which are estimated
% make sure the beginning and end matches the first and last time point of
% the growth trajectory we are reconstructing.
tf = round(linspace(150,328,25)'); 
% note that the more knot-abscissa that we choose, the longer the procudure
% might be wise to start with 20 - 

estim_options('default'); 

% we recomment that on performs several continuations - maybe try 5-10 continuations with 500 steps,
% try 5000 for the last round 
estim_options('max_step_number',5e2); % change to 5e3 for the last round
estim_options('max_fun_evals',5e3);   % don't change this

% 2 - starts from pars_init
% 1 - read parameters from results_reconstruction (use this for doing
% coninuations
estim_options('pars_init_method', 1); 
estim_options('results_output', 3); % 1, saves parameters into results_reconstruction
estim_options('method', 'nm'); % set no if you don't want to estimate

% % KEEP THESE COMMENTED IF YOU ARE NOT DOING CONTINUATIONS FROM THE
% RESULT.MAT FILE
% estim_pars; close all;
% estim_pars; close all;
% estim_pars; close all;
% estim_pars; close all;
% estim_pars; close all;
estim_pars; 


%% Make additional plots here :


[data, auxData, metaData, txtData, weights] = mydata_reconstruction;
[par, metaPar, txtPar] = pars_init_reconstruction(metaData); 
vars_pull(auxData); vars_pull(data); 

% TEST THE DIFFERENT WAYS TEMPERATURE IS INTERPOLATED AND SMOOTHED
tT1 = interp1(temp.tL(:,1),temp.tL(:,2),tf,'linear'); % interpolation with matlab
tT2 = spline(tf, temp.tL); % interpolation with DEBtool spline
% notice that interp1 and spline do the same thing but take different
% arguments - 

% the following code allows smoothing the temperature : 
[kT, info] = knot(tf, temp.tL); % DEBtool routine which calculates knot-coordinates of cubic spline from knot-abcissa and data points according to weighted least squared criterium
t          = linspace(150,328,100)'; % time axis for plotting
tT3        = [t, spline(t, kT)]; % smoothed temperatures

% plot the temperature data along side the different interpolations
% (symbols) and then a smoothing of the temperatures
figure()
plot(temp.tL(:,1),K2C(temp.tL(:,2)), 'ro'); hold on
plot(tf,K2C(tT1), 'bs');
plot(tf,K2C(tT2), 'cs');
plot(tT3(:,1),K2C(tT3(:,2)), 'g', 'linewidth',2);
xlabel('julian time, day'); ylabel('temperature, deg C')
legend('data','interp1','spline','smoothed temp')
set(gca,'fontsize',12)
              set(gcf,'PaperPositionMode','manual');
              set(gcf,'PaperUnits','points'); 
              set(gcf,'PaperPosition',[0 0 350 250]); % left bottom width height
 print('results_reconstruction_02.png', '-dpng')


% plot the reconstructed trajectory:
% prepare 2-n matrix with the first colum the knot-abscissa and the second
% column the knot-coordinates. The knot coordinates are the parameters
% which were estimated. 
% Use the results which were saved in results_reconstruction.mat
load('results_reconstruction.mat') ; 
vars_pull(par); 
yf = zeros(length(tf),1); % create empty vector with knot-coordinates for the f values
for i = 1:length(tf)
eval(['yf(i) = f_',num2str(tf(i)),';'])
end
tyf = [tf yf];
tyfs = [t, spline(t, tyf)]; % smoothed trajectory - this version gives problems
figure()
plot(tyf(:,1), tyf(:,2),'bs','markersize',10,'markerfacecolor','b'); hold on
plot(tyfs(:,1), tyfs(:,2),'g', 'linewidth',2);
xlabel('julian time, day'); ylabel('scaled func resp., -')
legend('estimated knots','smoothed trajectory')
ylim([0 1]); xlim([0 350])
set(gca,'fontsize',12)
              set(gcf,'PaperPositionMode','manual');
              set(gcf,'PaperUnits','points'); 
              set(gcf,'PaperPosition',[0 0 350 250]); % left bottom width height
 print('results_reconstruction_03.png', '-dpng')

prt_report_AmPtox 
