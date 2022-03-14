function [data, auxData, metaData, txtData, weights] = mydata_OECD232_Zn_Cu
%% set metaData (optional fields)

metaData.author = 'Bas Kooijman';
metaData.institution = 'VU University Amsterdam';
metaData.email = 'bas.kooijman@vu.nl';
metaData.date = [2022 03 01];
metaData.toxTest = 'OECD232';
metaData.species = 'Folsomia candida';
metaData.casno = '7440-66-6 & 7440-50-8';
metaData.compound = 'Zn & Cu';
metaData.endpoint = '# surviving individuals';
metaData.target = 'hazard rate';
metaData.DEBpars = 'NA';
metaData.DEBmodel = 'NA';

%% set data

c_Zn = [0 0.8 1.6 3.2 6.4 12.8]'; % mg/g, Zn concentrations
c_Cu = [0 0.4 0.8 1.6 3.2 6.4]'; % mg/g, Cu concentrations
t = (0:21)'; % d, exposure times in days
%
N_Zn_Cu_t(:,:,1) = [ ... % t = 0
30	30	30	30	30	30
30	30	30	30	30	30
30	30	30	30	30	30
30	30	30	30	30	30
30	30	30	30	30	30
30	30	30	30	30	30];
%
N_Zn_Cu_t(:,:,2) = [ ... % t = 1
30	30	30	30	29	0
30	30	29	30	30	0
30	29	30	27	29	0
30	30	23	27	0	0
10	5	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Cu_t(:,:,3) = [ ... % t = 2
30	30	30	30	26	0
30	30	29	29	24	0
30	29	30	25	22	0
28	29	22	23	0	0
6	3	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Cu_t(:,:,4) = [ ... % t = 3
30	29	30	29	25	0
30	30	29	29	18	0
30	29	26	25	20	0
26	28	19	22	0	0
4	3	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Cu_t(:,:,5) = [ ... % t = 4
30	29	30	29	22	0
30	30	29	28	15	0
30	29	26	22	18	0
25	28	16	19	0	0
4	1	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Cu_t(:,:,6) = [ ... % t = 5
30	29	30	29	21	0
30	30	29	27	14	0
30	29	26	21	18	0
25	26	14	16	0	0
4	1	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Cu_t(:,:,7) = [ ... % t = 6
29	29	30	29	19	0
30	30	29	27	11	0
30	28	26	20	13	0
24	26	14	15	0	0
4	1	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Cu_t(:,:,8) = [ ... % t = 7
29	28	30	29	18	0
30	30	29	27	10	0
30	28	26	20	10	0
24	24	13	14	0	0
4	1	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Cu_t(:,:,9) = [ ... % t = 8
29	28	30	29	16	0
30	30	29	27	8	0
30	28	26	20	8	0
24	24	12	11	0	0
4	1	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Cu_t(:,:,10) = [ ... % t = 9
28	28	30	28	15	0
30	30	29	27	7	0
30	28	25	20	7	0
24	24	11	11	0	0
4	1	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Cu_t(:,:,11) = [ ... % t = 10
28	28	29	27	13	0
30	30	27	27	7	0
30	28	25	20	7	0
24	23	11	10	0	0
4	1	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Cu_t(:,:,12) = [ ... % t = 11
28	27	29	27	13	0
30	30	27	25	7	0
30	28	25	20	7	0
24	23	11	9	0	0
4	1	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Cu_t(:,:,13) = [ ... % t = 12
28	27	29	26	13	0
30	30	27	24	7	0
30	28	25	19	7	0
24	23	10	8	0	0
4	1	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Cu_t(:,:,14) = [ ... % t = 13
28	27	28	26	12	0
30	30	27	23	6	0
30	28	25	17	7	0
24	22	10	8	0	0
4	1	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Cu_t(:,:,15) = [ ... % t = 14
27	27	27	26	12	0
30	29	26	22	6	0
30	27	25	16	7	0
24	22	10	8	0	0
4	1	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Cu_t(:,:,16) = [ ... % t = 15
27	27	26	26	12	0
30	29	26	20	6	0
30	27	25	15	7	0
24	22	10	8	0	0
3	1	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Cu_t(:,:,17) = [ ... % t = 16
27	26	26	26	12	0
30	29	26	20	6	0
29	27	25	14	7	0
24	19	10	8	0	0
3	1	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Cu_t(:,:,18) = [ ... % t = 17
27	26	25	26	11	0
29	29	26	20	6	0
29	27	23	14	7	0
24	19	10	8	0	0
3	1	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Cu_t(:,:,19) = [ ... % t = 18
27	25	25	26	10	0
29	29	26	20	5	0
29	27	23	13	7	0
24	19	9	8	0	0
3	1	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Cu_t(:,:,20) = [ ... % t = 19
27	25	25	25	10	0
28	27	26	20	5	0
29	27	22	12	6	0
24	19	9	8	0	0
3	1	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Cu_t(:,:,21) = [ ... % t = 20
27	25	24	25	10	0
28	27	26	19	5	0
29	27	22	11	6	0
23	19	9	6	0	0
3	0	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Cu_t(:,:,22) = [ ... % t = 21
27	25	24	24	9	0
28	27	26	19	4	0
29	27	20	11	5	0
23	19	9	6	0	0
3	0	0	0	0	0
0	0	0	0	0	0];
%
data.N_Zn_Cu_t = N_Zn_Cu_t;
init.N_Zn_Cu_t = 30; units.init.N_Zn_Cu_t = '-'; label.init.N_Zn_Cu_t = 'initial survivors';
units.N_Zn_Cu_t = {'mg/g', 'mg/g', '#', 'd'}; 
label.N_Zn_Cu_t = {'Conc Cu', 'Conc Pb', 'surviving individuals', 'exposure time'};  
treat.N_Zn_Cu_t = {2, {c_Zn, c_Cu, t}}; units.treat.N_Zn_Cu_t = {'mg/g','mg/g','d'}; 
label.treat.N_Zn_Cu_t = {'conc. of Cu and Pb, exposure time'};
temp.N_Zn_Cu_t = 18; units.temp.N_Zn_Cu_t = 'C'; label.temp.N_Zn_Cu_t = 'temperature';
bibkey.N_Zn_Cu_t = 'BaasHout2007';
title.N_Zn_Cu_t = '21 d exposure, effects on hazard rate';

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

