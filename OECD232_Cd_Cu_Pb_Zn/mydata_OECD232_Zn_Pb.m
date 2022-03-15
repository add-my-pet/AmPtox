function [data, auxData, metaData, txtData, weights] = mydata_OECD232_Zn_Pb
%% set metaData (optional fields)

metaData.author = 'Bas Kooijman';
metaData.institution = 'VU University Amsterdam';
metaData.email = 'bas.kooijman@vu.nl';
metaData.date = [2022 03 01];
metaData.toxTest = 'OECD232';
metaData.species = 'Folsomia candida';
metaData.casno = '7440-66-6 & 7439-92-1';
metaData.compound = 'Zn & Pb';
metaData.endpoint = '# surviving individuals';
metaData.target = 'hazard rate';
metaData.DEBpars = 'NA';
metaData.DEBmodel = 'NA';

%% set data

c_Zn = [0 0.8 1.6 3.2 6.4 12.8]'; % mg/g, Zn concentrations
c_Pb = [0 0.8 1.6 3.2 6.4 12.8]'; % mg/g, Pb concentrations
t = (0:21)'; % d, exposure times in days
%
N_Zn_Pb_t(:,:,1) = [ ... % t = 0
30	30	30	30	30	30
30	30	30	30	30	30
30	30	30	30	30	30
30	30	30	30	30	30
30	30	30	30	30	30
30	30	30	30	30	30];
%
N_Zn_Pb_t(:,:,2) = [ ... % t = 1
30	30	30	30	30	25
30	29	30	29	30	27
30	29	29	29	27	18
28	25	22	22	17	0
0	0	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Pb_t(:,:,3) = [ ... % t = 2
29	30	30	30	29	20
30	28	28	28	30	23
30	25	29	28	25	12
26	24	20	16	14	0
0	0	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Pb_t(:,:,4) = [ ... % t = 3
28	30	30	30	29	20
29	26	27	28	28	20
30	24	29	25	21	12
20	18	17	15	8	0
0	0	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Pb_t(:,:,5) = [ ... % t = 4
28	30	29	29	28	19
28	26	27	28	28	20
30	24	27	25	21	11
19	17	15	14	8	0
0	0	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Pb_t(:,:,6) = [ ... % t = 5
28	29	28	29	28	17
28	26	25	28	27	19
29	24	26	24	21	10
19	17	13	12	8	0
0	0	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Pb_t(:,:,7) = [ ... % t = 6
27	29	28	25	25	13
28	26	24	26	27	19
29	23	26	23	21	9
19	17	13	11	8	0
0	0	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Pb_t(:,:,8) = [ ... % t = 7
27	29	27	24	23	11
28	25	22	26	27	15
29	22	26	22	19	9
19	17	13	11	8	0
0	0	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Pb_t(:,:,9) = [ ... % t = 8
27	28	27	24	20	9
26	25	22	25	27	13
29	22	26	22	19	9
19	17	13	11	7	0
0	0	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Pb_t(:,:,10) = [ ... % t = 9
27	27	24	23	18	8
26	23	22	24	24	11
29	22	24	20	18	9
18	17	13	11	7	0
0	0	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Pb_t(:,:,11) = [ ... % t = 10
26	26	24	20	17	7
26	21	21	22	22	11
29	22	24	20	16	9
18	17	13	11	7	0
0	0	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Pb_t(:,:,12) = [ ... % t = 11
25	25	23	18	14	7
26	21	20	20	22	8
28	21	24	20	14	8
18	17	13	11	5	0
0	0	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Pb_t(:,:,13) = [ ... % t = 12
25	25	23	16	12	7
26	21	20	20	22	7
28	21	24	20	12	4
18	17	13	11	5	0
0	0	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Pb_t(:,:,14) = [ ... % t = 13
25	25	22	15	8	6
25	19	20	18	22	6
27	21	23	19	11	4
17	17	13	11	4	0
0	0	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Pb_t(:,:,15) = [ ... % t = 14
24	25	22	15	7	4
25	19	20	18	20	3
27	20	21	19	11	4
17	16	13	11	4	0
0	0	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Pb_t(:,:,16) = [ ... % t = 15
24	25	22	14	7	2
24	18	20	14	20	3
25	19	21	19	10	3
17	16	13	11	3	0
0	0	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Pb_t(:,:,17) = [ ... % t = 16
24	25	20	13	6	2
24	18	19	14	15	3
23	18	21	19	9	1
16	15	13	11	2	0
0	0	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Pb_t(:,:,18) = [ ... % t = 17
24	25	20	12	6	0
24	18	17	14	13	2
23	18	21	18	9	1
15	15	13	11	1	0
0	0	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Pb_t(:,:,19) = [ ... % t = 18
24	24	18	11	5	0
24	18	16	14	13	2
23	17	21	18	9	1
14	15	13	11	1	0
0	0	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Pb_t(:,:,20) = [ ... % t = 19
24	24	18	11	4	0
22	17	16	13	13	1
22	16	20	17	9	1
14	15	13	11	1	0
0	0	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Pb_t(:,:,21) = [ ... % t = 20
24	23	17	10	4	0
21	17	16	13	12	1
21	16	20	17	8	1
14	15	13	11	1	0
0	0	0	0	0	0
0	0	0	0	0	0];
%
N_Zn_Pb_t(:,:,22) = [ ... % t = 21
24	21	17	9	4	0
21	16	16	13	12	0
18	15	19	17	8	0
13	14	13	11	1	0
0	0	0	0	0	0
0	0	0	0	0	0];
%
data.N_Zn_Pb_t = N_Zn_Pb_t;
init.N_Zn_Pb_t = 30; units.init.N_Zn_Pb_t = '-'; label.init.N_Zn_Pb_t = 'initial survivors';
units.N_Zn_Pb_t = {'mg/g', 'mg/g', '#', 'd'}; 
label.N_Zn_Pb_t = {'Conc Cu', 'Conc Pb', 'surviving individuals', 'exposure time'};  
treat.N_Zn_Pb_t = {2, {c_Zn, c_Pb, t}}; units.treat.N_Zn_Pb_t = {'mg/g','mg/g','d'}; 
label.treat.N_Zn_Pb_t = {'conc. of Cu and Pb, exposure time'};
temp.N_Zn_Pb_t = 18; units.temp.N_Zn_Pb_t = 'C'; label.temp.N_Zn_Pb_t = 'temperature';
bibkey.N_Zn_Pb_t = 'BaasHout2007';
title.N_Zn_Pb_t = '21 d exposure, effects on hazard rate';

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

