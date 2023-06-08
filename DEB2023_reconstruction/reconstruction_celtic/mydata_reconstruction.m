function [data, auxData, metaData, txtData, weights] = mydata_reconstruction

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Ostreoida'; 
metaData.family     = 'Pectinidae';
metaData.species    = 'Pecten_maximus, Celtic'; 
metaData.species_en = 'great scallop'; 

metaData.author   = {'Starrlight Augustine','Romain Lavaud','Laure Pecquerie'};    


%% set data

% Celtic sea : time (of yaer), Length (cm) 
data.tL= [...
1	2	3	4	5	6	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	22	23	24	25	26	27	28	29	30	31	32	33	34	35	36	37	38	39	40	41	42	43	44	45	46	47	48	49	50	51	52	53	54	55	56	57	58	59	60	61	62	63	64	65	66	67	68	69	70	71	72	73	74	75	76	77	78	79	80	81	82	83	84	85	86	87	88	89	90	91	92	93	94	95	96	97	98	99	100	101	102	103	104	105	106	107	108	109	110	111	112	113	114	115	116	117	118	119	120	121	122	123	124	125	126	127	128	129	130	131	132	133	134	135	136	137	138	139	140	141	142	143	144	145	146	147	148	149	150	151	152	153	154	155	156	157	158	159	160	161	162	163	164	165	166	167	168	169	170	171	172	173	174	175	176	177	178	179	180	181	182	183	184	185	186	187	188	189	190	191	192;
2.003	2.007	2.011	2.016	2.020	2.026	2.033	2.037	2.043	2.049	2.056	2.061	2.067	2.075	2.082	2.091	2.100	2.113	2.125	2.137	2.150	2.160	2.167	2.176	2.187	2.200	2.212	2.224	2.231	2.239	2.245	2.254	2.265	2.273	2.279	2.286	2.292	2.298	2.303	2.309	2.318	2.325	2.333	2.343	2.351	2.363	2.375	2.387	2.398	2.411	2.423	2.436	2.450	2.463	2.475	2.487	2.499	2.512	2.527	2.542	2.560	2.576	2.594	2.610	2.627	2.644	2.664	2.681	2.699	2.714	2.728	2.747	2.764	2.780	2.798	2.814	2.832	2.853	2.872	2.889	2.910	2.930	2.947	2.968	2.988	3.007	3.024	3.041	3.061	3.078	3.097	3.119	3.143	3.162	3.179	3.194	3.215	3.235	3.256	3.276	3.297	3.321	3.342	3.358	3.374	3.394	3.417	3.439	3.458	3.477	3.496	3.518	3.541	3.563	3.584	3.606	3.629	3.650	3.668	3.689	3.708	3.725	3.743	3.760	3.774	3.786	3.802	3.814	3.830	3.842	3.855	3.867	3.878	3.889	3.901	3.910	3.922	3.933	3.943	3.956	3.967	3.980	3.992	4.003	4.014	4.027	4.042	4.058	4.072	4.087	4.098	4.106	4.114	4.123	4.134	4.143	4.158	4.169	4.180	4.190	4.202	4.214	4.227	4.235	4.243	4.249	4.260	4.269	4.277	4.287	4.297	4.304	4.311	4.320	4.329	4.341	4.351	4.362	4.372	4.379	4.385	4.392	4.405	4.411	4.418	4.425	4.433	4.443	4.456	4.466	4.474	4.479
]';
units.tL  = {'d', 'cm'};  label.tL = {'time', 'length (Celtic sea)'};  
Lw0.tL = 2; units.Lw0.tL = 'cm'; label.Lw0.tL = 'initial physical length'; 

bibkey.tL = 'Lava2014';
comment.tL = 'Celtic Sea 162 m - 1 year old, data from chap 6, temp is constant 12 deg C';

% Temperature Time Series: day (Julian days), Temperature in deg C
temp.tL = 12; 
%temp.tL    = C2K(temp.tL(:,2));  
units.temp.tL = 'degC'; label.temp.tL = 'temperature';


  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.Lw0 = Lw0;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% References
bibkey = 'Lava2014'; type = 'PhdThesis'; bib = [...
'author = {Romain Lavuad}, ' ...     
'year = {2014}, ' ...
'title = {Environmental variability and energetic adaptability of the great scallop, \textit{Pecten maximus}, facing climate change}, ' ...
'school = {Vrije Universiteit Amsterdam} '];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

