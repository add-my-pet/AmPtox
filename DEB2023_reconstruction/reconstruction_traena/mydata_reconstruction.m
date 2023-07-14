function [data, auxData, metaData, txtData, weights] = mydata_reconstruction

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Ostreoida'; 
metaData.family     = 'Pectinidae';
metaData.species    = 'Pecten_maximus'; 
metaData.species_en = 'Great scallop, Traena'; 

metaData.author   = {'Starrlight Augustine','Romain Lavaud','Laure Pecquerie'};    


%% set data

% Traena Date (time of year)Length (cm)	
data.tL= [ ...
    151	152	153	154	155	156	157	158	159	160	161	162	163	164	165	166	167	168	169	170	171	172	173	174	175	176	177	178	179	180	181	182	183	184	185	186	187	188	189	190	191	192	193	194	195	196	197	198	199	200	201	202	203	204	205	206	207	208	209	210	211	212	213	214	215	216	217	218	219	220	221	222	223	224	225	226	227	228	229	230	231	232	233	234	235	236	237	238	239	240	241	242	243	244	245	246	247	248	249	250	251	252	253	254	255	256	257	258	259	260	261	262	263	264	265	266	267	268	269	270	271	272	273	274	275	276	277	278	279	280	281	282	283	284	285	286	287	288	289	290	291	292	293	294	295	296	297	298	299	300	301	302	303	304	305	306	307	308	309	310	311	312	313	314	315	316	317	318	319	320	321	322	323	324	325	326	327	328	;																																																																																																														
	1.815	1.828	1.841	1.859	1.869	1.880	1.894	1.910	1.928	1.944	1.961	1.981	2.000	2.016	2.030	2.041	2.054	2.067	2.084	2.102	2.118	2.136	2.153	2.169	2.183	2.197	2.214	2.228	2.242	2.260	2.282	2.302	2.320	2.340	2.358	2.375	2.395	2.415	2.434	2.450	2.465	2.484	2.504	2.524	2.544	2.565	2.585	2.606	2.627	2.648	2.669	2.692	2.715	2.738	2.761	2.784	2.807	2.827	2.849	2.874	2.897	2.919	2.941	2.964	2.987	3.010	3.034	3.055	3.079	3.101	3.125	3.149	3.171	3.195	3.218	3.242	3.265	3.289	3.312	3.336	3.359	3.381	3.405	3.429	3.452	3.475	3.497	3.520	3.544	3.565	3.586	3.608	3.630	3.650	3.671	3.693	3.715	3.736	3.759	3.783	3.806	3.827	3.848	3.870	3.891	3.912	3.932	3.953	3.976	3.996	4.017	4.037	4.059	4.081	4.103	4.123	4.143	4.164	4.186	4.208	4.230	4.251	4.272	4.293	4.317	4.338	4.358	4.380	4.402	4.423	4.445	4.466	4.489	4.513	4.535	4.557	4.579	4.601	4.623	4.646	4.669	4.690	4.711	4.731	4.751	4.771	4.791	4.811	4.831	4.851	4.871	4.891	4.908	4.926	4.945	4.961	4.978	4.995	5.012	5.029	5.045	5.060	5.073	5.085	5.094	5.103	5.112	5.121	5.129	5.136	5.143	5.149	5.156	5.164	5.172	5.179	5.186	5.190																																																																																																															
]';																																																																																																																																																																																																																																																																																																	
units.tL = {'d', 'cm'};  label.tL= {'time of year', 'length (Traena)'};  
Lw0.tL= 1.8; units.Lw0.tL= 'cm'; label.Lw0.tL= 'initial physical length'; 
bibkey.tL= 'Lava2014'; comment.tL= 'Traena Norway - 3 year old';
																																																																																																																																																																																																																																																																																																	
% Temperature Time Series Traena Norway
	temp.tL= [ ...  Temperature deg C, 	time of year																																																																																																																																																																																																																																																																																																
	6.6	6.6	6.4	6.4	6.4	6.2	6.2	5.8	5	5	5.8	5.8	5.6	5.8	5	4.8	4.8	4.8	4.8	6	6.2	6	5.4	5.2	4.2	4.2	4.6	4.8	5	5.2	4.8	5	5	4.8	4.6	4.8	4.6	4.4	4.2	4.2	4.4	4.2	4	3.9	3.6	4	4.4	4.6	4.6	4.4	4.4	4.2	4.2	4.4	4.5	4.6	4.6	4.7	4.8	4.2	4.6	5	5	5	5	5	4.8	4.8	4.8	4.8	5	5	5.2	5.2	5.2	5.4	5.6	5.6	5.8	5.8	5.8	5.8	5.6	5.6	5.8	5.8	6	6	6	6.2	6.2	6.4	6.4	6.4	6.4	6.6	6.6	6.6	6.6	7.2	7.2	7.4	7.6	7.8	7.8	8	8	8	8.2	8.2	8.2	8.2	9	9	9	9.6	9.6	9.4	10	10	10.4	10.6	10.4	9.8	9.8	9.4	9.4	10	10	10.6	12	11.6	11.8	11.6	11.6	11.6	11.6	11.6	11.6	11.6	12.4	12.4	12.4	12.4	12.6	12.6	12.8	13.2	13.4	13.4	13.4	13	12.8	12.8	13	13	12.4	12.4	12.8	12.6	12.4	12.4	12	12.2	12.2	12	12	12.2	12	12	12	12.2	12.4	12.2	12.2	12	11.8	11.8	11.8	12	12	12	11.8	11.8	11.8	11.6	11.8	11.4	11.6	11.8	12	11.8	11.8	11.8	11.8	11.7	11.8	11.8	11.8	11.8	11.8	11.8	11.8	11.8	11.8	11.8	11.8	11.8	11.8	11.8	11.6	11.4	11.2	11	11	11	11	11	10.8	10.6	10.8	11.8	11.6	11.2	11.4	11.2	11.2	11.2	11.2	11	11	11	11	11	11.2	11	10.8	10.8	11	11	10.6	10.6	10.2	10.2	10	10.2	10.2	9.8	9.8	9.8	9.8	9	9.3	8.8	8.8	8.6	8.6	8.5	8.8	9.2	9.2	9	8.8	8	8	8	7.8	6.8	6.8	6.6	6.8	6	6.4	6	6.4	6.4	6	6	5.2	5.5	5.5	5.5	5.5	6	5.8	6.6	5.8	5.9	6.2;
1	2	4	5	6	7	8	11	14	15	19	20	21	22	25	26	27	28	29	32	33	35	36	37	39	40	41	43	49	51	53	54	55	56	60	61	62	63	64	65	67	68	69	70	71	74	76	77	78	79	81	82	83	86	88	89	90	91	92	93	95	96	97	98	99	100	102	103	104	105	106	107	109	110	111	112	113	114	116	117	118	119	120	121	123	124	125	126	127	128	130	131	132	133	134	135	138	139	140	141	142	145	146	147	148	149	151	152	154	155	156	157	159	160	161	162	163	164	166	167	168	169	170	171	173	174	175	176	177	178	180	181	182	183	184	186	187	188	189	190	191	193	194	195	196	197	200	201	202	203	205	206	207	208	210	211	213	214	215	217	218	219	220	221	222	223	224	225	226	227	228	229	230	231	232	233	235	236	237	238	239	240	241	243	244	245	246	247	248	249	250	251	252	253	254	255	256	257	258	259	260	261	262	263	264	265	266	267	268	269	270	271	272	273	274	275	276	277	278	279	280	281	282	283	284	285	286	287	288	289	290	291	292	293	294	295	296	297	298	299	302	305	308	309	310	311	312	313	314	315	316	318	319	321	322	323	324	326	327	328	329	330	332	335	336	337	338	340	341	343	344	346	347	348	349	350	351	352	354	355	356	357	358	360	361	362	363	364	365
]';
temp.tL   = [temp.tL(:,2) C2K(temp.tL(:,1))];   % time of year, day first column and then temp converted to kelvin in the second column
units.temp.tL= 'K'; label.temp.tL= 'temperature';

  
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
