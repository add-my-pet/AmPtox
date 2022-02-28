function [data, auxData, metaData, txtData, weights] = mydata_OECD222_Cu
%% set metaData (optional fields)

metaData.author = 'Bas Kooijman';
metaData.institution = 'VU University Amsterdam';
metaData.email = 'bas.kooijman@vu.nl';
metaData.date = [2022 02 27];
metaData.toxTest = 'OECD222';
metaData.species = 'Lumbricus rubellus';
metaData.casno = '7447-39-4';
metaData.compound = 'Copper chloride';
metaData.molWeight = 127.09; % g/mol, of Cu only
metaData.endpoint = 'body weight';
metaData.target = 'spec assimilation';
metaData.DEBpars = 'Kooy2022';
metaData.DEBmodel = 'std';

%% set data

t = [29 57 85 113 154 196]'; % d, exposure time
c = [13 60 145 362]'; % mg/kg, Cu conc
W = [4.8559  4.6815  4.0897  2.5763; % weight^1/3, mg^1/3
     7.4308  7.3061  6.2675  5.1526;
     8.9545  8.6907  7.6512  6.2675;
    10.3040  9.9716  8.9399  7.3471;
    10.9876 10.7167  9.5839  7.8128;
    10.9117 10.5657  9.3879  8.2460];
data.tWw = [t,1e-3*W.^3]; 
units.tWw = {'d', 'g'}; label.tWw = {'exposure time', 'body weight'};  
treat.tWw = {1, c}; units.treat.tWw = 'mg/kg'; label.treat.tWw = 'conc. of Cu';
temp.tWw = 20; units.temp.tWw = 'C'; label.temp.tWw = 'temperature';
bibkey.tWw = 'KlokRoos1996';
subtitle.tWw = 'Effects on spec assimilation';

%% set weights for all real data
weights = setweights(data, []);

%% pack auxData and txtData for output
auxData.treat = treat;
auxData.temp = temp; 
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.title = subtitle;

%% model
TK1 = 'The temperature, food density and external concentration (i.e. in the spoil) are constant';
TK2 = 'The uptake rate is proportional to the surface area of the individual and to the external concentration';
TK3 = 'The elimination rate k_e is proportional to the internal concentration';
TD1 = 'Effects are linked to the internal concentration c, scaled such that it has the dimension of an external concentration';
TD2 = 'The stress s is absent (s=0) for concentrations less than c_0, and for larger concentrations equal to s=(c-c_0)/c_T';
TD3 = 'The assimilation rate is multiplied by (1-s)';
metaData.model = struct('TK1',TK1, 'TK2',TK2, 'TK3',TK3, 'TD1',TD1, 'TD2',TD2, 'TD3',TD3);

%% Discussion points
D1 = 'The analysis is discussed in Kooy2010, Fig 6.10';
D2 = 'Read (compound) DEB parameters from prt_report_my_pet(''Lumbricus_rubellus'')';
D3 = 'The contribution of reserve to body weight was estimated to account for the contribution of gut contents to weight';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% References
bibkey = 'OECD222'; type = 'techreport'; bib = [ ...
'doi = {110.1787/9789264264496-en}, ' ... 
'author = {OECD}, ' ...
'year = {2016}, ' ...
'title  = {Test No. 222: Earthworm Reproduction Test (Eisenia fetida/Eisenia andrei}, ' ...
'institution = {OECD Publishing, Paris}, ' ...
'series = {OECD Guidelines for the Testing of Chemicals, Section 2}, ' ...
'howpublished = {\url{https://www.oecd-ilibrary.org/environment/test-no-222-earthworm-reproduction-test-eisenia-fetida-eisenia-andrei_9789264264496-en}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KlokRoos1996'; type = 'Article'; bib = [ ... 
'author = {C. Klok and A. M. de Roos}, ' ... 
'year = {1996}, ' ...
'title = {Population level consequences of toxicological influences on individual growth and reproduction of \emph{Lumbricus rubells} ({L}umbricidae, {O}ligochaeta)}, ' ...
'journal = {Ecotoxicol. Envionm. Saf.}, ' ...
'volume = {33}, ' ...
'pages = {118-137}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ... 
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2022'; type = 'misc'; bib = [ ...
'author = {Bas Kooijman}, ' ...
'year = {2022}, ' ...
'title  = {AmP Lumbricus rubellus, version 2022/02/27}, ' ...
'howpublished = {\url{https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/entries_web/Lumbricus_rubellus/Lumbricus_rubellus_res.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
