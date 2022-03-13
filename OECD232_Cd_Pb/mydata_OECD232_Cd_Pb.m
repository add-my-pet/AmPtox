function [data, auxData, metaData, txtData, weights] = mydata_OECD232_Cd_Pb
%% set metaData (optional fields)

metaData.author = 'Bas Kooijman';
metaData.institution = 'VU University Amsterdam';
metaData.email = 'bas.kooijman@vu.nl';
metaData.date = [2022 03 01];
metaData.toxTest = 'OECD232';
metaData.species = 'Folsomia candida';
metaData.casno = '7440-43-9 & 7439-92-1';
metaData.compound = 'Cd & Pb';
metaData.endpoint = '# surviving individuals';
metaData.target = 'hazard rate';
metaData.DEBpars = 'NA';
metaData.DEBmodel = 'NA';

%% set data

c_Cd = [0 0.2 0.4 0.8 1.6 3.2]'; % mg/g, Cd concentrations
c_Pb = [0 0.8 1.6 3.2 6.4 12.8]'; % mg/g, Pb concentrations
t = (0:21)'; % d, exposure times in days
%
N_Cd_Pb_t(:,:,1) = [ ... % t = 0
30	30	30	30	30	30
30	30	30	30	30	30
30	30	30	30	30	30
30	30	30	30	30	30
30	30	30	30	30	30
30	30	30	30	30	30];
%
N_Cd_Pb_t(:,:,2) = [ ... % t = 1
30	29	30	30	29	30
30	29	30	30	30	29
30	30	29	30	29	30
30	28	27	27	25	26
29	27	30	24	27	27
25	27	27	26	27	21];
%
N_Cd_Pb_t(:,:,3) = [ ... % t = 2
30	28	30	30	28	29
28	29	29	30	29	28
29	29	29	29	28	29
29	28	27	27	25	25
29	26	28	23	24	24
21	25	26	23	26	19];
%
N_Cd_Pb_t(:,:,4) = [ ... % t = 3
30	28	30	30	27	28
27	29	29	30	29	28
29	29	29	28	28	26
28	28	27	26	25	25
28	23	27	20	22	24
20	20	24	19	21	17];
%
N_Cd_Pb_t(:,:,5) = [ ... % t = 4
29	28	30	30	26	28
26	29	29	29	29	27
28	29	29	26	27	26
28	28	27	26	25	23
26	23	24	20	20	20
20	17	21	16	16	11];
%
N_Cd_Pb_t(:,:,6) = [ ... % t = 5
27	25	28	30	24	28
26	29	29	29	29	26
28	28	29	26	25	26
28	27	26	26	24	22
26	23	24	18	19	20
16	11	16	14	11	5];
%
N_Cd_Pb_t(:,:,7) = [ ... % t = 6
27	25	28	30	24	27
24	29	28	29	29	25
28	28	29	25	23	25
28	27	26	26	22	21
25	21	20	16	16	18
14	8	10	11	9	4];
%
N_Cd_Pb_t(:,:,8) = [ ... % t = 7
27	24	28	29	24	24
24	28	28	29	29	25
28	28	28	25	22	22
28	26	26	25	20	20
25	20	20	15	13	16
13	7	7	8	4	4];
%
N_Cd_Pb_t(:,:,9) = [ ... % t = 8
25	24	28	29	23	21
24	28	28	28	28	25
27	28	28	23	22	21
28	26	25	24	19	19
25	18	19	14	13	16
13	7	7	6	4	2];
%
N_Cd_Pb_t(:,:,10) = [ ... % t = 9
25	24	26	29	23	21
24	25	28	28	28	25
27	27	28	23	22	21
27	26	25	22	18	18
23	17	19	13	12	16
9	3	6	6	3	2];
%
N_Cd_Pb_t(:,:,11) = [ ... % t = 10
25	24	26	29	21	21
23	24	27	28	28	25
26	26	27	22	22	21
27	25	25	22	17	15
23	15	17	13	11	15
7	2	6	4	2	2];
%
N_Cd_Pb_t(:,:,12) = [ ... % t = 11
25	24	26	29	20	19
23	24	27	28	27	25
25	26	26	22	22	21
25	24	25	20	16	14
22	14	15	13	11	13
6	2	6	3	2	2];
%
N_Cd_Pb_t(:,:,13) = [ ... % t = 12
25	24	26	29	19	16
23	24	27	28	27	25
24	26	26	21	21	21
25	24	25	19	16	14
22	13	14	12	10	12
6	0	6	3	2	1];
%
N_Cd_Pb_t(:,:,14) = [ ... % t = 13
25	24	26	29	18	16
22	23	26	27	27	25
23	26	26	21	21	21
24	24	24	19	14	14
22	13	14	12	9	11
5	0	5	3	2	1];
%
N_Cd_Pb_t(:,:,15) = [ ... % t = 14
25	24	26	29	18	14
22	23	25	26	27	25
23	26	25	20	20	21
23	24	24	19	14	13
21	12	13	12	9	11
5	0	5	3	2	1];
%
N_Cd_Pb_t(:,:,16) = [ ... % t = 15
25	24	26	27	17	13
22	22	25	26	27	24
23	26	24	20	20	21
23	24	23	19	14	12
18	12	12	11	8	10
3	0	4	3	2	0];
%
N_Cd_Pb_t(:,:,17) = [ ... % t = 16
24	24	26	26	16	11
22	22	25	25	27	24
23	26	23	20	19	21
21	23	22	19	14	12
18	12	12	11	8	8
3	0	4	3	2	0];
%
N_Cd_Pb_t(:,:,18) = [ ... % t = 17
24	23	25	26	14	11
22	22	25	25	25	24
23	24	21	20	19	21
21	23	22	18	14	12
18	12	9	11	8	8
3	0	4	2	2	0];
%
N_Cd_Pb_t(:,:,19) = [ ... % t = 18
24	23	25	26	14	11
22	22	24	25	25	23
23	24	21	20	19	21
21	23	21	17	14	12
18	11	9	11	8	8
3	0	3	2	2	0];
%
N_Cd_Pb_t(:,:,20) = [ ... % t = 19
24	23	25	26	13	9
22	22	24	25	24	23
23	24	21	20	19	21
21	22	21	17	14	12
16	10	9	9	7	7
3	0	3	2	2	0];
%
N_Cd_Pb_t(:,:,21) = [ ... % t = 20
24	22	24	26	13	9
22	22	24	25	24	23
23	24	21	19	19	21
21	21	21	17	14	10
16	10	8	9	7	6
3	0	3	2	2	0];
%
N_Cd_Pb_t(:,:,22) = [ ... % t = 21
24	22	24	25	12	9
22	21	24	25	24	23
23	23	21	18	19	19
21	20	20	17	14	10
15	10	8	9	7	6
3	0	1	1	2	0];
%
data.N_Cd_Pb_t = N_Cd_Pb_t;
init.N_Cd_Pb_t = 30; units.init.N_Cd_Pb_t = '-'; label.init.N_Cd_Pb_t = 'initial survivors';
units.N_Cd_Pb_t = {'mg/g', 'mg/g', '#', 'd'}; 
label.N_Cd_Pb_t = {'Conc Cd', 'Conc Pb', 'surviving individuals', 'exposure time'};  
treat.N_Cd_Pb_t = {2, {c_Cd, c_Pb, t}}; units.treat.N_Cd_Pb_t = {'mg/g','mg/g','d'}; 
label.treat.N_Cd_Pb_t = {'conc. of Cu and Cd, exposure time'};
temp.N_Cd_Pb_t = 18; units.temp.N_Cd_Pb_t = 'C'; label.temp.N_Cd_Pb_t = 'temperature';
bibkey.N_Cd_Pb_t = 'BaasHout2007';
title.N_Cd_Pb_t = '21 d exposure, effects on hazard rate';

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

