function [data, auxData, metaData, txtData, weights] = mydata_OECD210_PAH
%% set metaData (optional fields)

metaData.author = 'Bas Kooijman';
metaData.institution = 'VU University Amsterdam';
metaData.email = 'bas.kooijman@vu.nl';
metaData.date = [2022 02 26];
metaData.toxTest = 'OECD210';
metaData.species = 'Danio_rerio';
metaData.casno = '-';
metaData.compound = 'Polycycic Aromatic Hydrocarbon mixture';
metaData.molWeight = '-'; 
metaData.endpoint = 'total length 37 d';
metaData.target = 'max spec assimilation';
metaData.DEBpars = 'Augu2018';
metaData.DEBmodel = 'abj';

%% set data

% time - conc - cum # of offspring per female
c = [0     0     5.6  10    18    32    56   100]'; % percentage of PAH mixture
L = [1.408 1.412 1.392 1.391 1.332 1.285 1.074 0.958]'; % cm, total length at 37 d
data.cL = [c, L]; % compose data set
units.cL = {'%', 'cm'}; label.cL = {'PAH mix', 'total length at 37 d'};  
temp.cL = 25; units.temp.cL = 'C'; label.temp.cL = 'temperature';
time.cL = 37; units.time.cL = 'd'; label.time.cL = 'exposure time';
bibkey.cL = {'HoofHenz1993'};
title.cL = 'Effects on spec assimilation';
 
%% set weights for all real data
weights = setweights(data, []);

%% pack auxData and txtData for output
auxData.time = time;
auxData.temp = temp; 
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.title = title;

%% model
TK1 = 'The temperature, food density and external concentration (i.e. in the water) are constant';
TK2 = 'The uptake rate is proportional to the surface area of the individual and to the external concentration';
TK3 = 'The elimination rate k_e is proportional to the internal concentration';
TD1 = 'Effects are linked to the internal concentration c, scaled such that it has the dimension of an external concentration';
TD2 = 'The stress s is absent (s=0) for concentrations less than c_0, and for larger concentrations equal to s=(c-c_0)/c_T';
TD3 = 'The assimilation rate is multiplied by (1 - s)';
metaData.model = struct('TK1',TK1, 'TK2',TK2, 'TK3',TK3, 'TD1',TD1, 'TD2',TD2, 'TD3',TD3);

%% Discussion points
D1 = 'The type of length in parameter L_0 should correspond with that in parameter v, so structural length';
D2 = 'Read (compound) DEB parameters from prt_report_my_pet(''Danio_rerio''), but shape coefficient del_M from results_Danio_rerio.mat in structure par';
D3 = 'This analysis is discussed in KooyBeda1996, KooyBeda1996a';
D4 = 'The parameter values apply at the temperature of the test';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% References
bibkey = 'OECD210'; type = 'techreport'; bib = [ ...
'doi = {10.1787/9789264203785-en}, ' ... 
'author = {OECD}, ' ...
'year = {2013}, ' ...
'title  = {Test 210: Fish, Early-life Stage Toxicity Test}, ' ...
'institution = {OECD Publishing, Paris}, ' ...
'series = {OECD Guidelines for the Testing of Chemicals, Section 2}, ' ...
'howpublished = {\url{https://www.oecd-ilibrary.org/environment/test-no-210-fish-early-life-stage-toxicity-test_9789264203785-en}}'];
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
bibkey = 'KooyBeda1996a'; type = 'article'; bib = [ ...
'author = {Kooijman, S.A.L.M. and Bedaux, J.J.M.}, ' ...
'year = {1996}, ' ...
'title  = {Analysis of toxicity tests on fish growth}, ' ...
'journal = {Water Res.}, ' ...
'volume = {30}, ' ...
'pages = {1633-1644}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Augu2018'; type = 'misc'; bib = [ ...
'author = {Starrlight Augustine}, ' ...
'year = {2018}, ' ...
'title  = {Am{P} {D}anio rerio, version 2018/08/09}, ' ...
'howpublished = {\url{https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/entries_web/Danio_rerio/Danio_rerio_res.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HoofHenz1993'; type = 'misc'; bib = [ ...
'author = {Hooftman, R. N. and Henzen, L. and Rosa, P.}, ' ...
'year = {1993}, ' ...
'title  = {Toxicity of a Aromatic Hydrocarbon mixture in an early stage toxicity test carried out in an intermitted flow-through system}, ' ...
'institution = {TNO-IMW, Delft, the Netherlands}, ' ...
'number = {IMW-R 93/253}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
