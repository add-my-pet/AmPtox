function [data, auxData, metaData, txtData, weights] = mydata_OECD201_LAS

metaData.author = 'Bas Kooijman';
metaData.institution = 'VU University Amsterdam';
metaData.email = 'bas.kooijman@vu.nl';
metaData.date = [2022 02 28];
metaData.toxTest = 'OECD201';
metaData.species = 'Isochrysis aff. galbana';
metaData.casno = '68411-30-3';
metaData.compound = 'Sodium Linear Alkylbenzene Sulphonate';
metaData.molWeight = 334.449; % g/mol
metaData.endpoint = 'optical density';
metaData.target = 'survival';
metaData.DEBpars = 'NA';
metaData.DEBmodel = 'nat';

%% set data

t = [0	24	48	72	96]'; % Incubation times of the batch cultures (h)
c = (0:10)'; % Commercial Sodium Linear Alkylbenzene Sulphonate (LAS, mg/L)
OD = [ ... % optical densities
  0.285	0.318	0.461	0.634	0.807;
  0.287	0.310	0.439	0.623	0.786;
  0.285	0.305	0.424	0.610	0.777;
  0.284	0.301	0.415	0.582	0.749;
  0.283	0.300	0.410	0.572	0.708;
  0.285	0.296	0.391	0.543	0.683;
  0.287	0.295	0.373	0.521	0.650;
  0.284	0.291	0.363	0.483	0.616
  0.284	0.292	0.345	0.456	0.588;
  0.284	0.283	0.334	0.440	0.570;
  0.285	0.288	0.317	0.414	0.548]';

data.tOD = [t, OD]; % compose data set
units.tOD = {'h', '-'}; label.tOD = {'exposure time', 'optical density'};  
treat.tOD = {2, c}; units.treat.tOD = 'mg/l'; label.treat.tOD = 'LAS conc.';
temp.tOD = 20; units.temp.tOD = 'C'; label.temp.tOD = 'temperature';
init.tOD = 0.285; units.init.tOD = '-'; label.init.tOD = 'initial optical density';
bibkey.tOD = 'Pera2002';
title.tOD = 'Effects on hazard rate';
 
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

%% model
TK1 = 'The temperature and external concentration (i.e. in the water) are constant';
TK2 = 'The internal concentration is assumed to be in instantaneous equilibrium, in view of the small body size';
TD1 = 'The stress s is absent (h_s=0) for concentrations less than c_0, and for larger concentrations equal to h_s=(c-c_0)*b';
TD2 = 'The conversion from reserve to structure is divided by  1+(c-c_0)/c_T, for tolerance concentration c_T';
metaData.model = struct('TK1',TK1, 'TK2',TK2, 'TD1',TD1, 'TD2',TD2);

%% Discussion points
D1 = 'Nutrient (nitrogen) limited algal growth in batch culture';
D2 = 'Nutrient can inter-convert to background nutrient';
D3 = 'Living, dead and decomposing biomass contribute to light absorption';
D4 = 'Exposure in synthetic seawater';
D5 = 'This analysis is discussed in KooyBeda1996, KooyHans1996';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% References
bibkey = 'OECD201'; type = 'techreport'; bib = [ ...
'author = {OECD}, ' ...
'year = {1984}, ' ...
'title  = {Test No. 201: Alga, Growth Inhibition Test}, ' ...
'institution = {OECD Publishing, Paris}, ' ...
'series = {OECD Guidelines for the Testing of Chemicals}, ' ...
'howpublished = {\url{https://www.oecd.org/chemicalsafety/risk-assessment/1948257.pdf}}'];
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
bibkey = 'KooyHans1996'; type = 'article'; bib = [ ...
'author = {Kooijman, S. A. L. M. and Hanstveit, A. O. and Nyholm, N.}, ' ...
'year = {1996}, ' ...
'title  = {No-effect concentrations in alga growth inhibition tests}, ' ...
'journal = {Water Res.}, ' ...
'volume = {30}, ' ...
'pages = {1625-1632}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Pera2002'; type = 'misc'; bib = [ ...
'author = {Jose Antonio Perales Vargas-Machuca}, ' ...
'year = {2002}, ' ...
'note  = {Data kindly provided by Jose Antonio Perales Vargas-Machuca, Tecnolog\''{i}as del Medio Ambiente, Instituto de Investigaci\''{o}n Marina (INMAR), Universidad de C\''{a}diz}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
