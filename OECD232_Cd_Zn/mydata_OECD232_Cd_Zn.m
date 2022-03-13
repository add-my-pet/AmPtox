function [data, auxData, metaData, txtData, weights] = mydata_OECD232_Cd_Zn
%% set metaData (optional fields)

metaData.author = 'Bas Kooijman';
metaData.institution = 'VU University Amsterdam';
metaData.email = 'bas.kooijman@vu.nl';
metaData.date = [2022 03 01];
metaData.toxTest = 'OECD232';
metaData.species = 'Folsomia candida';
metaData.casno = '7440-43-9 % 7440-66-6';
metaData.compound = 'Cd & Zn';
metaData.endpoint = '# surviving individuals';
metaData.target = 'hazard rate';
metaData.DEBpars = 'NA';
metaData.DEBmodel = 'NA';

%% set data

c_Cd = [0 0.2 0.4 0.8 1.6 3.2]'; % mg/g, Cd concentrations
c_Zn = [0 0.8 1.6 3.2 6.4 12.8]'; % mg/g, Zn concentrations
t = (0:21)'; % d, exposure times in days
%
N_Cd_Zn_t(:,:,1) = [ ... % t = 0
30	30	30	30	30	30
30	30	30	30	30	30
30	30	30	30	30	30
30	30	30	30	30	30
30	30	30	30	30	30
30	30	30	30	30	30];
%
N_Cd_Zn_t(:,:,2) = [ ... % t = 1
30	30	29	28	3	0
30	30	30	29	3	0
28	30	28	29	5	0
28	27	27	22	3	0
30	29	27	16	1	0
30	28	22	13	0	0];
%
N_Cd_Zn_t(:,:,3) = [ ... % t = 2
30	29	29	28	2	0
28	27	28	26	2	0
26	30	27	23	3	0
28	27	25	19	1	0
29	25	27	12	1	0
28	23	17	10	0	0];
%
N_Cd_Zn_t(:,:,4) = [ ... % t = 3
30	28	28	27	2	0
28	27	28	25	2	0
26	30	27	23	3	0
27	27	24	18	0	0
27	25	25	11	1	0
23	20	12	7	0	0];
%
N_Cd_Zn_t(:,:,5) = [ ... % t = 4
30	28	28	26	1	0
25	27	28	23	1	0
26	30	27	23	2	0
26	26	24	18	0	0
25	25	25	9	0	0
22	17	10	5	0	0];
%
N_Cd_Zn_t(:,:,6) = [ ... % t = 5
30	28	28	26	1	0
24	27	28	23	1	0
26	30	27	23	2	0
26	25	24	16	0	0
25	24	24	8	0	0
18	11	9	5	0	0];
%
N_Cd_Zn_t(:,:,7) = [ ... % t = 6
30	28	28	26	1	0
24	27	28	23	1	0
26	29	27	23	2	0
25	25	24	16	0	0
24	24	24	8	0	0
12	9	8	5	0	0];
%
N_Cd_Zn_t(:,:,8) = [ ... % t = 7
30	27	28	25	1	0
24	26	28	23	1	0
26	28	27	23	1	0
25	25	24	15	0	0
22	22	23	5	0	0
11	7	6	5	0	0];
%
N_Cd_Zn_t(:,:,9) = [ ... % t = 8
30	27	28	24	1	0
24	25	28	23	1	0
26	27	27	23	0	0
24	25	24	14	0	0
20	20	23	4	0	0
10	5	6	5	0	0];
%
N_Cd_Zn_t(:,:,10) = [ ... % t = 9
30	27	28	24	1	0
24	25	27	23	1	0
25	25	27	23	0	0
24	24	23	13	0	0
19	19	23	4	0	0
8	5	6	5	0	0];
%
N_Cd_Zn_t(:,:,11) = [ ... % t = 10
30	27	27	24	1	0
24	25	27	23	1	0
24	25	27	23	0	0
24	24	23	13	0	0
18	18	23	4	0	0
8	4	5	4	0	0];
%
N_Cd_Zn_t(:,:,12) = [ ... % t = 11
28	27	27	24	1	0
24	25	27	23	1	0
24	25	27	23	0	0
24	24	23	13	0	0
15	17	22	4	0	0
8	3	4	4	0	0];
%
N_Cd_Zn_t(:,:,13) = [ ... % t = 12
28	27	27	24	1	0
24	25	27	23	1	0
24	25	26	23	0	0
24	24	23	13	0	0
15	17	21	4	0	0
8	2	4	3	0	0];
%
N_Cd_Zn_t(:,:,14) = [ ... % t = 13
28	26	27	24	0	0
24	25	27	23	1	0
24	25	26	23	0	0
24	24	23	13	0	0
15	17	19	4	0	0
5	2	3	2	0	0];
%
N_Cd_Zn_t(:,:,15) = [ ... % t = 14
28	26	27	24	0	0
24	24	27	23	1	0
24	25	26	23	0	0
23	24	23	13	0	0
14	17	18	4	0	0
4	2	3	2	0	0];
%
N_Cd_Zn_t(:,:,16) = [ ... % t = 15
28	25	27	23	0	0
24	24	27	23	1	0
24	25	26	23	0	0
23	23	23	13	0	0
14	17	18	4	0	0
4	2	3	2	0	0];
%
N_Cd_Zn_t(:,:,17) = [ ... % t = 16
28	25	27	22	0	0
24	24	25	23	1	0
24	25	26	23	0	0
23	23	23	13	0	0
13	17	17	3	0	0
4	2	3	2	0	0];
%
N_Cd_Zn_t(:,:,18) = [ ... % t = 17
28	25	26	22	0	0
24	23	25	23	1	0
24	25	26	23	0	0
23	23	23	13	0	0
13	17	15	3	0	0
4	2	3	2	0	0];
%
N_Cd_Zn_t(:,:,19) = [ ... % t = 18
28	25	26	22	0	0
24	23	25	23	1	0
24	25	25	23	0	0
23	22	22	13	0	0
12	17	14	3	0	0
4	1	3	2	0	0];
%
N_Cd_Zn_t(:,:,20) = [ ... % t = 19
28	25	26	22	0	0
24	22	25	23	0	0
24	25	24	23	0	0
22	22	22	13	0	0
11	17	14	3	0	0
4	1	3	2	0   0];
%
N_Cd_Zn_t(:,:,21) = [ ... % t = 20
28	25	26	22	0	0
24	22	25	22	0	0
23	25	23	20	0	0
22	22	22	13	0	0
11	16	13	3	0	0
4	1	2	2	0	0];
%
N_Cd_Zn_t(:,:,22) = [ ... % t = 21
28	25	26	22	0	0
24	22	25	21	0	0
23	25	23	20	0	0
22	22	22	13	0	0
11	16	11	3	0	0
4	1	2	2	0	0];
%
data.N_Cd_Zn_t = N_Cd_Zn_t;
init.N_Cd_Zn_t = 30; units.init.N_Cd_Zn_t = '-'; label.init.N_Cd_Zn_t = 'initial survivors';
units.N_Cd_Zn_t = {'mg/g', 'mg/g', '#', 'd'}; 
label.N_Cd_Zn_t = {'Conc Cd', 'Conc Zn', 'surviving individuals', 'exposure time'};  
treat.N_Cd_Zn_t = {2, {c_Cd, c_Zn, t}}; units.treat.N_Cd_Zn_t = {'mg/g','mg/g','d'}; 
label.treat.N_Cd_Zn_t = {'conc. of Cd and Zn, exposure time'};
temp.N_Cd_Zn_t = 18; units.temp.N_Cd_Zn_t = 'C'; label.temp.N_Cd_Zn_t = 'temperature';
bibkey.N_Cd_Zn_t = 'BaasHout2007';
title.N_Cd_Zn_t = '21 d exposure, effects on hazard rate';

%% set weights for all real data
weights = setweights(data, []);

%% pack auxData and txtData for output
auxData.treat = treat; 
auxData.temp = temp; 
auxData.init = init; 
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.title = title;
%txtData.comment = comment;

%% model
TK1 = 'The temperature, food density and external concentrations (i.e. in the water) are constant';
TK2 = 'The uptake rates are proportional to the external concentrations';
TK3 = 'The elimination rates k_e are proportional to the internal concentrations';
TD1 = 'Effects are linked to the internal concentrations c_x and c_y, scaled such that they have the dimension of external concentrations';
TD2 = 'The hazard rate equals h+b_x*max(0,c_x-c_0x)+b_y*max(0,c_y-c_0y)+d_xy*max(0,c_x-c_0x)*max(0,c_y-c_0y) for no-effect concenteations c_0, killing rates b, interaction d_xy and blank hazard rate h';
metaData.model = struct('TK1',TK1, 'TK2',TK2, 'TK3',TK3, 'TD1',TD1, 'TD2',TD2);

%% Discussion points
D1 = 'Growth is neglected';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'To run this entry, first download apngasm64.exe and specify a path to it, such that your system can find it';
metaData.bibkey.F1 = 'download';
metaData.facts = struct('F1',F1);

%% References
bibkey = 'OECD232'; type = 'misc'; bib = [ ...
'author = {OECD}, ' ...
'year = {2015}, ' ...
'title  = {OECD guidelines 232 Collembolan Reproduction Test in Soil}, ' ...
'institution = {OECD Publishing, Paris}, ' ...
'howpublished = {\url{https://www.oecd.org/chemicalsafety/testing/Draft-Updated-Test-Guildeline-232-Collembolan-Reproduction-Test-in-soil.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KooyBeda1996'; type = 'Book'; bib = [ ...
'author = {Kooijman, S.A.L.M. and Bedaux, J.J.M.}, ' ...
'year = {1996}, ' ...
'title  = {The analysis of aquatic toxicity data}, ' ...
'publisher = {VU University Press}, ' ...
'howpublished = {\url{https://research.vu.nl/en/publications/the-analysis-of-aquatic-toxicity-data}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
estim_options('results_output', 3);
%
bibkey = 'BaasHout2007'; type = 'Article'; bib = [ ...
'author = {Jan Baas and Bart P.P. van Houte and Cornelis A.M. van Gestel and Sebastiaan A.L.M. Kooijman}, ' ...
'year = {2007}, ' ...
'title  = {MODELING THE EFFECTS OF BINARY MIXTURES ON SURVIVAL IN TIME}, ' ...
'journal = {Environmental Toxicology and Chemistry}, ' ...
'volume = {26(6)}, ' ...
'pages = {1320–1327}, ' ...
'doi = {10.1897/06-437r.1}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'download'; type = 'misc'; bib = [ ...
'author = {sourceforge}, ' ...
'year = {2022}, ' ...
'title  = {Animated png assembler}, ' ...
'institution = {sourceforge}, ' ...
'howpublished = {\url{https://sourceforge.net/projects/apngasm/files/2.91/apngasm-2.91-bin-win64.zip/download}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

