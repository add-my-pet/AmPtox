function [data, auxData, metaData, txtData, weights] = mydata_OECD221_Cd
%% set metaData (optional fields)

metaData.author = 'Bas Kooijman';
metaData.institution = 'VU University Amsterdam';
metaData.email = 'bas.kooijman@vu.nl';
metaData.date = [2022 02 22];
metaData.toxTest = 'OECD201';
metaData.species = 'Poecilia reticulata';
metaData.casno = '60-57-1';
metaData.compound = 'Dieldrin';
metaData.molWeight = 380.9; 
metaData.endpoint = 'survival';
metaData.DEBpars = 'NA';
metaData.DEBmodel = 'NA';

%% set data

t = (0:7)'; % d, exposure times in days
c = [0 .32 5.6 10 18 32 56 100]'; % mug/l, dieldrin concentrations in sea water
N = [20*ones(1,8); 20*ones(1,6),19,18; ... % surviving guppies, data from IMW-TNO
     20 20 19 19 19 18 18 18; 20 20 17 15 14 12 9 8; ...
     20 18 15 9 4 4 3 2; 20 18 9 2 1 0 0 0; ...
     20 17 6 1 0 0 0 0; 20 5, zeros(1,6)]';
data.tN = [t, N]; initial = 20; % compose data set
units.tN = {'d', '#'}; label.tN = {'exposure time', 'surviving individuals'};  
treat.tN = {1, c}; units.treat.tN = 'mug/l'; label.treat.tN = 'conc. of dieldrin';
temp.tN = 25; units.temp.tN = 'C'; label.temp.tN = 'temperature';
bibkey.tN = {'Adem1980','KooyBeda1996'};
title.tN = 'Effects on hazard rate';
comment.tN = 'Exposed in natural seawater';

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
txtData.comment = comment;

%% model
TK1 = 'The temperature, food density and external concentration (i.e. in the water) are constant';
TK2 = 'The uptake rate is proportional to the external concentration';
TK3 = 'The elimination rate k_e is proportional to the internal concentration';
TD1 = 'Effects are linked to the internal concentration c, scaled such that it has the dimension of an external concentration';
TD2 = 'The hazard rate equals h+b*max(0,c-c_0) for no-effect concenteation c_0, killing rate b and blank hazrad rate h';
metaData.model = struct('TK1',TK1, 'TK2',TK2, 'TK3',TK3, 'TD1',TD1, 'TD2',TD2);

%% Discussion points
D1 = 'The type of length in parameter L0 should correspond with that in parameter v, so structural length';
D2 = 'Read (compound) DEB parameters from prt_report_my_pet(''Daphna_magna'')';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% References
bibkey = 'OECD203'; type = 'techreport'; bib = [ ...
'author = {OECD}, ' ...
'year = {2012}, ' ...
'title  = {Test No. 203: DFish, Acute Toxicity Test}, ' ...
'institution = {OECD Publishing, Paris}, ' ...
'series = {OECD Guidelines for the Testing of Chemicals, Section 2}, ' ...
'howpublished = {\url{https://www.oecd.org/chemicalsafety/risk-assessment/1948241.pdf}}'];
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
bibkey = 'Adem1980'; type = 'misc'; bib = [ ...
'author = {Adema, T.}, ' ...
'year = {1980}, ' ...
'note  = {Data provided by IMW-TNO Laboratories, Delft, discussed in KooyBeda1996}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

