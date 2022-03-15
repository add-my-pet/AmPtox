function [data, auxData, metaData, txtData, weights] = mydata_OECD232_Cu_Pb
%% set metaData (optional fields)

metaData.author = 'Bas Kooijman';
metaData.institution = 'VU University Amsterdam';
metaData.email = 'bas.kooijman@vu.nl';
metaData.date = [2022 03 01];
metaData.toxTest = 'OECD232';
metaData.species = 'Folsomia candida';
metaData.casno = '7440-50-8 & 7439-92-1';
metaData.compound = 'Cu & Pb';
metaData.endpoint = '# surviving individuals';
metaData.target = 'hazard rate';
metaData.DEBpars = 'NA';
metaData.DEBmodel = 'NA';

%% set data

c_Cu = [0 0.4 0.8 1.6 3.2 6.4]'; % mg/g, Cu concentrations
c_Pb = [0 0.8 1.6 3.2 6.4 12.8]'; % mg/g, Pb concentrations
t = (0:21)'; % d, exposure times in days
%
N_Cu_Pb_t(:,:,1) = [ ... % t = 0
30	30	30	30	30	30
30	30	30	30	30	30
30	30	30	30	30	30
30	30	30	30	30	30
30	30	30	30	30	30
30	30	30	30	30	30];
%
N_Cu_Pb_t(:,:,2) = [ ... % t = 1
30	30	30	30	30	29
29	30	30	30	28	29
29	30	30	30	29	28
30	30	29	30	28	16
29	27	29	29	13	0
2	0	0	0	0	0];
%
N_Cu_Pb_t(:,:,3) = [ ... % t = 2
30	30	30	30	30	28
28	30	28	30	28	28
28	30	30	30	29	25
30	30	29	29	25	14
27	25	28	24	12	0
0	0	0	0	0	0];
%
N_Cu_Pb_t(:,:,4) = [ ... % t = 3
30	30	30	30	29	28
28	30	28	30	28	26
28	30	30	30	27	23
30	30	28	28	23	12
26	20	26	22	9	0
0	0	0	0	0	0];
%
N_Cu_Pb_t(:,:,5) = [ ... % t = 4
29	28	30	29	29	25
26	30	27	30	27	25
28	30	30	30	25	23
30	29	28	28	18	10
25	15	25	20	8	0
0	0	0	0	0	0];
%
N_Cu_Pb_t(:,:,6) = [ ... % t = 5
29	28	30	29	29	25
26	30	26	30	27	24
28	30	30	29	25	21
30	29	27	28	18	10
23	12	20	18	7	0
0	0	0	0	0	0];
%
N_Cu_Pb_t(:,:,7) = [ ... % t = 6
29	28	30	26	26	20
25	28	26	30	26	23
28	30	30	29	25	21
30	28	27	28	15	10
23	12	19	16	5	0
0	0	0	0	0	0];
%
N_Cu_Pb_t(:,:,8) = [ ... % t = 7
29	28	30	26	22	15
25	28	26	30	23	21
28	29	30	29	24	19
30	28	27	28	14	10
19	11	15	14	3	0
0	0	0	0	0	0];
%
N_Cu_Pb_t(:,:,9) = [ ... % t = 8
29	28	29	26	19	11
25	28	26	29	22	18
28	28	30	29	24	16
30	27	27	28	12	10
16	11	15	11	2	0
0	0	0	0	0	0];
%
N_Cu_Pb_t(:,:,10) = [ ... % t = 9
27	28	29	25	18	11
24	28	26	26	21	16
28	27	27	29	23	16
30	27	27	28	12	10
16	11	15	11	2	0
0	0	0	0	0	0];
%
N_Cu_Pb_t(:,:,11) = [ ... % t = 10
26	28	29	25	18	10
24	28	26	26	21	16
28	27	27	29	23	16
30	27	26	25	12	9
11	11	13	11	2	0
0	0	0	0	0	0];
%
N_Cu_Pb_t(:,:,12) = [ ... % t = 11
26	27	29	25	17	9
24	28	26	26	20	13
28	25	27	28	20	16
30	26	26	24	10	8
11	10	12	9	2	0
0	0	0	0	0	0];
%
N_Cu_Pb_t(:,:,13) = [ ... % t = 12
26	26	29	25	17	8
23	28	25	25	20	13
28	25	27	28	20	16
30	26	26	24	10	8
11	10	12	9	1	0
0	0	0	0	0	0];
%
N_Cu_Pb_t(:,:,14) = [ ... % t = 13
26	25	29	24	16	7
23	28	24	24	20	10
27	25	26	27	20	15
29	26	26	24	10	6
11	9	9	7	1	0
0	0	0	0	0	0];
%
N_Cu_Pb_t(:,:,15) = [ ... % t = 14
26	25	29	23	13	7
23	28	24	24	19	8
26	25	26	25	18	14
29	26	25	23	9	6
10	9	9	6	1	0
0	0	0	0	0	0];
%
N_Cu_Pb_t(:,:,16) = [ ... % t = 15
26	25	29	23	13	6
23	28	24	24	18	8
26	24	26	25	18	13
29	26	25	23	9	5
9	9	9	5	1	0
0	0	0	0	0	0];
%
N_Cu_Pb_t(:,:,17) = [ ... % t = 16
25	25	27	23	13	6
23	28	24	24	17	8
25	24	25	24	17	10
27	26	23	22	8	4
9	8	8	5	1	0
0	0	0	0	0	0];
%
N_Cu_Pb_t(:,:,18) = [ ... % t = 17
25	25	26	23	10	6
23	28	24	24	17	8
25	24	25	24	15	6
26	25	23	21	6	3
9	7	7	4	1	0
0	0	0	0	0	0];
%
N_Cu_Pb_t(:,:,19) = [ ... % t = 18
25	25	25	21	10	4
23	28	24	23	17	8
25	24	25	23	14	6
26	25	23	20	6	3
9	7	5	4	1	0
0	0	0	0	0	0];
%
N_Cu_Pb_t(:,:,20) = [ ... % t = 19
25	25	25	19	9	2
23	28	24	23	15	8
25	23	25	22	14	6
26	25	23	20	6	2
9	6	5	3	0	0
0	0	0	0	0	0];
%
N_Cu_Pb_t(:,:,21) = [ ... % t = 20
25	25	25	19	6	2
23	28	23	22	15	7
25	23	24	22	14	5
26	25	23	18	5	2
8	6	4	3	0	0
0	0	0	0	0	0];
%
N_Cu_Pb_t(:,:,22) = [ ... % t = 21
25	25	25	19	5	1
23	28	23	22	15	7
25	22	22	22	13	5
26	25	22	17	5	2
8	5	4	2	0	0
0	0	0	0	0	0];
%
data.N_Cu_Pb_t = N_Cu_Pb_t;
init.N_Cu_Pb_t = 30; units.init.N_Cu_Pb_t = '-'; label.init.N_Cu_Pb_t = 'initial survivors';
units.N_Cu_Pb_t = {'mg/g', 'mg/g', '#', 'd'}; 
label.N_Cu_Pb_t = {'Conc Cu', 'Conc Pb', 'surviving individuals', 'exposure time'};  
treat.N_Cu_Pb_t = {2, {c_Cu, c_Pb, t}}; units.treat.N_Cu_Pb_t = {'mg/g','mg/g','d'}; 
label.treat.N_Cu_Pb_t = {'conc. of Cu and Pb, exposure time'};
temp.N_Cu_Pb_t = 18; units.temp.N_Cu_Pb_t = 'C'; label.temp.N_Cu_Pb_t = 'temperature';
bibkey.N_Cu_Pb_t = 'BaasHout2007';
title.N_Cu_Pb_t = '21 d exposure, effects on hazard rate';

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

