function [data, auxData, metaData, txtData, weights] = mydata_OECD202_dichromate
%% set metaData (optional fields)

metaData.author = 'Bas Kooijman';
metaData.institution = 'VU University Amsterdam';
metaData.email = 'bas.kooijman@vu.nl';
metaData.date = [2022 02 26];
metaData.toxTest = 'OECD202';
metaData.species = 'Daphnia_magna';
metaData.casno = '7778-50-9';
metaData.compound = 'Possium dichromate';
metaData.molWeight = 294.19; % g/mol, of Cd only
metaData.endpoint = '# of surviving individuals';
metaData.target = 'survival';
metaData.DEBpars = 'KooyGerg2019';
metaData.DEBmodel = 'std';

%% set data

% time - conc - # of surviving individuals
t = [0 2 5 7 9 12 14 16 19 21]'; % d, exposure time
c = [0.0  0.1  0.18  0.32  0.56  1.0]'; % mg/l, concentration of potassium dichromate
N = [ 50 50 50 50 50 50 % number of surviving individuals
      50 50 50 50 50 48
      50 50 50 50 48 36
      50 50 50 50 48 35
      49 50 50 50 48 31
      49 50 50 50 40 15
      49 50 50 48 32  9
      49 50 50 47 30  3
      49 50 50 47 23  0
      49 50 50 45 16  0];
data.tN = [t, N]; % compose data set
units.tN = {'d', '#'}; label.tN = {'exposure time', 'survivors'};  
treat.tN = {2, c}; units.treat.tN = 'mg/l'; label.treat.tN = 'dichromate conc.';
temp.tN = 20; units.temp.tN = 'C'; label.temp.tN = 'temperature';
initial.tN = 50; units.initial.tN = '#'; label.initial.tN = 'initial # of individuals';
bibkey.tN = {'KooyBeda1996b','KooyBeda1996'};
title.tN = 'Effects on hazard rate';
 
%% set weights for all real data
weights = setweights(data, []);

%% pack auxData and txtData for output
auxData.treat = treat; 
auxData.temp = temp; 
auxData.initial = initial; 
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.title = title;

%% model
TK1 = 'The temperature, food density and external concentration (i.e. in the water) are constant';
TK2 = 'The uptake rate is proportional to the surface area of the individual and to the external concentration';
TK3 = 'The elimination rate k_e is proportional to the internal concentration';
TD1 = 'Effects are linked to the internal concentration c, scaled such that it has the dimension of an external concentration';
TD2 = 'The stress s is absent (h_s=0) for concentrations less than c_0, and for larger concentrations equal to h_s=(c-c_0)*b';
TD3 = 'The hazard rate is h_0 + h_s, where h_0 is the background hazard rate';
metaData.model = struct('TK1',TK1, 'TK2',TK2, 'TK3',TK3, 'TD1',TD1, 'TD2',TD2, 'TD3',TD3);

%% Discussion points
D1 = 'The type of length in parameter L_0 should correspond with that in parameter L_m, so structural length';
D2 = 'Read (compound) DEB parameters from prt_report_my_pet(''Daphnia_magna'')';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% References
bibkey = 'OECD202'; type = 'techreport'; bib = [ ...
'author = {OECD}, ' ...
'year = {1984}, ' ...
'title  = {Test No. 202: Daphnia sp., Acute Immobilisation Test and Reproduction Test}, ' ...
'institution = {OECD Publishing, Paris}, ' ...
'series = {OECD Guidelines for the Testing of Chemicals}, ' ...
'howpublished = {\url{https://www.oecd.org/chemicalsafety/risk-assessment/1948249.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KooyBeda1996'; type = 'Book'; bib = [ ...
'author = {Kooijman, S.A.L.M. and Bedaux, J.J.M.}, ' ...
'year = {1996}, ' ...
'title  = {The analysis of aquatic toxicity data}, ' ...
'publisher = {VU University Press}, ' ...
'howpublished = {\url{https://research.vu.nl/en/publications/the-analysis-of-aquatic-toxicity-data}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KooyBeda1996b'; type = 'article'; bib = [ ...
'author = {Kooijman, S.A.L.M. and Bedaux, J.J.M.}, ' ...
'year = {1996}, ' ...
'title  = {Analysis of toxicity tests on \emph{Daphnia} survival and reproduction}, ' ...
'journal = {Water Res.}, ' ...
'volume = {30}, ' ...
'pages = {1711-1723}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KooyGerg2019'; type = 'misc'; bib = [ ...
'author = {Bas Kooijman and Andre Gergs}, ' ...
'year = {2019}, ' ...
'title  = {AmP Daphnia magna, version 2019/03/16}, ' ...
'howpublished = {\url{https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/entries_web/Daphnia_magna/Daphnia_magna_res.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
