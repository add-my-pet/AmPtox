function [data, auxData, metaData, txtData, weights] = mydata_OECD232_Cu_Cd
%% set metaData (optional fields)

metaData.author = 'Bas Kooijman';
metaData.institution = 'VU University Amsterdam';
metaData.email = 'bas.kooijman@vu.nl';
metaData.date = [2022 03 01];
metaData.toxTest = 'OECD232';
metaData.species = 'Folsomia candida';
metaData.casno = '60-57-1';
metaData.compound = 'Cu & Cd';
metaData.molWeight = 380.9; 
metaData.endpoint = '# surviving individuals';
metaData.target = 'hazard rate';
metaData.DEBpars = 'NA';
metaData.DEBmodel = 'NA';

%% set data

c_Cu = [0 0.4 0.8 1.6 3.2 6.4]'; % mg/g, Cu concentrations
c_Cd = [0 0.2 0.4 0.8 1.6 3.2]'; % mg/g, Cd concentrations
t = (0:21)'; % d, exposure times in days
%
N_Cu_Cd_t(:,:,1) = [ ... % t = 0
30	30	30	30	30	30
30	30	30	30	30	30
30	30	30	30	30	30
30	30	30	30	30	30
30	30	30	30	30	30
30	30	30	30	30	30]';
%
N_Cu_Cd_t(:,:,2) = [ ... % t = 1
30	30	30	30	27	5
29	30	30	30	28	7
29	29	28	30	22	6
29	30	30	28	23	4
29	30	25	26	16	1
30	27	20	21	16	0]';
%
N_Cu_Cd_t(:,:,3) = [ ... % t = 2
30	30	30	30	25	3
29	30	30	30	29	6
29	29	28	29	21	6
29	30	30	28	21	3
28	28	24	26	14	1
24	26	20	15	11	0]';
%
N_Cu_Cd_t(:,:,4) = [ ... % t = 3
29	30	30	29	24	2
29	30	30	30	28	4
27	28	28	29	20	5
28	30	30	28	18	2
28	27	23	24	4	0
24	22	17	10	8	0]';
%
N_Cu_Cd_t(:,:,5) = [ ... % t = 4
28	30	30	29	24	2
29	30	30	30	25	4
27	25	28	27	19	2
27	29	28	27	16	1
28	24	23	22	4	0
21	21	14	5	4	0]';
%
N_Cu_Cd_t(:,:,6) = [ ... % t = 5
28	30	29	29	23	2
29	30	30	30	23	3
26	25	28	27	16	2
26	28	27	27	14	1
27	23	21	19	2	0
21	20	11	4	3	0]';
%
N_Cu_Cd_t(:,:,7) = [ ... % t = 6
28	29	29	29	23	2
28	29	29	30	22	3
24	25	28	24	13	1
25	28	27	26	14	1
25	22	21	18	2	0
21	16	10	4	1	0]';
%
N_Cu_Cd_t(:,:,8) = [ ... % t = 7
28	29	29	28	22	2
28	29	29	30	21	3
24	23	27	24	13	0
24	28	27	25	12	1
23	22	20	15	0	0
18	14	9	4	0	0]';
%
N_Cu_Cd_t(:,:,9) = [ ... % t = 8
28	29	29	27	22	2
28	29	29	29	20	3
23	22	27	24	9	0
23	28	27	24	12	1
23	21	19	13	0	0
17	14	6	4	0	0]';
%
N_Cu_Cd_t(:,:,10) = [ ... % t = 9
26	29	29	27	22	1
28	29	29	29	20	3
23	22	27	24	9	0
23	28	27	24	11	1
22	19	17	13	0	0
17	12	6	4	0	0]';
%
N_Cu_Cd_t(:,:,11) = [ ... % t = 10
26	29	29	27	21	1
28	29	29	29	19	1
20	22	26	24	8	0
23	28	26	23	10	0
21	18	17	13	0	0
16	10	6	4	0	0]';
%
N_Cu_Cd_t(:,:,12) = [ ... % t = 11
26	28	29	26	20	1
28	29	29	27	18	1
20	21	26	23	8	0
23	28	25	23	10	0
20	18	16	12	0	0
16	9	6	3	0	0]';
%
N_Cu_Cd_t(:,:,13) = [ ... % t = 12
26	27	28	26	20	1
27	29	29	27	18	1
19	21	26	23	8	0
23	26	25	22	10	0
19	18	16	10	0	0
15	9	6	3	0	0]';
%
N_Cu_Cd_t(:,:,14) = [ ... % t = 13
26	27	26	26	20	1
26	29	27	27	16	1
19	21	26	23	8	0
23	22	24	22	8	0
17	17	15	10	0	0
13	7	6	3	0	0]';
%
N_Cu_Cd_t(:,:,15) = [ ... % t = 14
26	27	25	26	20	1
26	27	27	27	16	1
18	21	26	23	7	0
22	22	22	22	8	0
15	17	15	9	0	0
13	7	6	3	0	0]';
%
N_Cu_Cd_t(:,:,16) = [ ... % t = 15
26	27	25	26	20	1
26	26	25	26	16	1
18	20	25	23	6	0
20	19	22	22	6	0
13	16	10	9	0	0
10	5	6	3	0	0]';
%
N_Cu_Cd_t(:,:,17) = [ ... % t = 16
26	27	25	26	20	1
26	25	25	26	16	1
18	20	25	23	6	0
20	19	22	22	6	0
13	16	10	9	0	0
9	5	5	2	0	0]';
%
N_Cu_Cd_t(:,:,18) = [ ... % t = 17
25	27	25	26	20	1
26	25	25	26	16	1
18	20	25	23	5	0
20	19	22	22	6	0
13	16	8	9	0	0
9	4	5	2	0	0]';
%
N_Cu_Cd_t(:,:,19) = [ ... % t = 18
25	27	25	26	20	1
26	25	25	26	16	1
18	20	24	21	5	0
19	19	22	22	5	0
13	15	8	8	0	0
8	4	5	2	0	0]';
%
N_Cu_Cd_t(:,:,20) = [ ... % t = 19
25	27	25	26	18	0
26	25	24	26	15	1
18	20	23	21	4	0
18	19	22	21	5	0
12	12	8	7	0	0
8	4	5	2	0	0]';
%
N_Cu_Cd_t(:,:,21) = [ ... % t = 20
25	27	25	25	17	0
25	25	24	25	15	1
18	20	21	20	3	0
18	18	21	21	4	0
10	12	8	7	0	0
8	4	4	2	0	0]';
%
N_Cu_Cd_t(:,:,22) = [ ... % t = 21
25	27	25	25	17	0
25	25	24	25	15	0
18	19	20	19	3	0
18	18	21	21	4	0
10	12	8	7	0	0
8	4	4	2	0	0]';
%
data.N_Cu_Cd_t = N_Cu_Cd_t;
init.N_Cu_Cd_t = 30; units.init.N_Cu_Cd_t = '-'; label.init.N_Cu_Cd_t = 'initial survivors';
units.N_Cu_Cd_t = {'mg/g', 'mg/g', '#', 'd'}; 
label.N_Cu_Cd_t = {'Conc Cu', 'Conc Cd', 'surviving individuals', 'exposure time'};  
treat.N_Cu_Cd_t = {2, {c_Cu, c_Cd, t}}; units.treat.N_Cu_Cd_t = {'mg/g','mg/g','d'}; 
label.treat.N_Cu_Cd_t = {'conc. of Cu and Cd, exposure time'};
temp.N_Cu_Cd_t = 18; units.temp.N_Cu_Cd_t = 'C'; label.temp.N_Cu_Cd_t = 'temperature';
bibkey.N_Cu_Cd_t = 'BaasHout2007';
title.N_Cu_Cd_t = '21 d exposure, effects on hazard rate';

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

