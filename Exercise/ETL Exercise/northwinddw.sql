--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    categorykey integer NOT NULL,
    categoryname character varying(15) NOT NULL,
    description text
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city (
    citykey integer NOT NULL,
    cityname character varying(40) NOT NULL,
    statekey integer,
    countrykey integer
);


ALTER TABLE public.city OWNER TO postgres;

--
-- Name: city_citykey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.city_citykey_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_citykey_seq OWNER TO postgres;

--
-- Name: city_citykey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.city_citykey_seq OWNED BY public.city.citykey;


--
-- Name: continent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.continent (
    continentkey integer NOT NULL,
    continentname character varying(20) NOT NULL
);


ALTER TABLE public.continent OWNER TO postgres;

--
-- Name: continent_continentkey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.continent_continentkey_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.continent_continentkey_seq OWNER TO postgres;

--
-- Name: continent_continentkey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.continent_continentkey_seq OWNED BY public.continent.continentkey;


--
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    countrykey integer NOT NULL,
    countryname character varying(40) NOT NULL,
    countrycode character varying(3) NOT NULL,
    countrycapital character varying(40) NOT NULL,
    population integer,
    subdivision text,
    continentkey integer NOT NULL
);


ALTER TABLE public.country OWNER TO postgres;

--
-- Name: country_countrykey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.country_countrykey_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_countrykey_seq OWNER TO postgres;

--
-- Name: country_countrykey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.country_countrykey_seq OWNED BY public.country.countrykey;


--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customerkey integer NOT NULL,
    customerid character(5) NOT NULL,
    companyname character varying(40) NOT NULL,
    address character varying(60),
    postalcode character varying(10),
    citykey integer
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: customer_customerkey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_customerkey_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_customerkey_seq OWNER TO postgres;

--
-- Name: customer_customerkey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_customerkey_seq OWNED BY public.customer.customerkey;


--
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    employeekey integer NOT NULL,
    firstname character varying(10) NOT NULL,
    lastname character varying(20) NOT NULL,
    title character varying(30),
    titleofcourtesy character varying(25),
    birthdate date,
    hiredate date,
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postalcode character varying(10),
    country character varying(15),
    supervisorkey integer
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- Name: employeeclosure; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employeeclosure (
    supervisorkey integer NOT NULL,
    employeekey integer NOT NULL,
    distance integer NOT NULL
);


ALTER TABLE public.employeeclosure OWNER TO postgres;

--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    productkey integer NOT NULL,
    productname character varying(40) NOT NULL,
    quantityperunit character varying(20),
    unitprice numeric,
    discontinued smallint NOT NULL,
    categorykey integer
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: sales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales (
    customerkey integer NOT NULL,
    employeekey integer NOT NULL,
    orderdatekey integer NOT NULL,
    duedatekey integer NOT NULL,
    shippeddatekey integer NOT NULL,
    shipperkey integer NOT NULL,
    productkey integer NOT NULL,
    supplierkey integer,
    orderno integer NOT NULL,
    orderlineno integer NOT NULL,
    unitprice numeric NOT NULL,
    quantity smallint NOT NULL,
    discount real NOT NULL,
    salesamount numeric NOT NULL,
    freight numeric NOT NULL
);


ALTER TABLE public.sales OWNER TO postgres;

--
-- Name: shipper; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipper (
    shipperkey integer NOT NULL,
    companyname character varying(40) NOT NULL
);


ALTER TABLE public.shipper OWNER TO postgres;

--
-- Name: state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.state (
    statekey integer NOT NULL,
    statename character varying(40) NOT NULL,
    englishstatename character varying(40),
    statetype character varying(40) NOT NULL,
    statecode character varying(3),
    statecapital character varying(40),
    regionname character varying(40),
    regioncode character varying(3),
    countrykey integer NOT NULL
);


ALTER TABLE public.state OWNER TO postgres;

--
-- Name: state_statekey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.state_statekey_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.state_statekey_seq OWNER TO postgres;

--
-- Name: state_statekey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.state_statekey_seq OWNED BY public.state.statekey;


--
-- Name: supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier (
    supplierkey integer NOT NULL,
    companyname character varying(40) NOT NULL,
    address character varying(60),
    postalcode character varying(10),
    citykey integer
);


ALTER TABLE public.supplier OWNER TO postgres;

--
-- Name: tempcities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tempcities (
    city character varying(40),
    state character varying(40),
    country character varying(40)
);


ALTER TABLE public.tempcities OWNER TO postgres;

--
-- Name: territories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.territories (
    employeekey integer NOT NULL,
    citykey integer NOT NULL
);


ALTER TABLE public.territories OWNER TO postgres;

--
-- Name: date; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."date" (
    datekey integer NOT NULL,
    date date,
    daynbweek smallint,
    daynameweek character varying(10),
    daynbmonth smallint,
    daynbyear smallint,
    weeknbyear smallint,
    monthnumber smallint,
    monthname character varying(10),
    quarter smallint,
    semester smallint,
    year smallint
);


ALTER TABLE public."date" OWNER TO postgres;

--
-- Name: date_datekey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.date_datekey_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.date_datekey_seq OWNER TO postgres;

--
-- Name: date_datekey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.date_datekey_seq OWNED BY public."date".datekey;


--
-- Name: city citykey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city ALTER COLUMN citykey SET DEFAULT nextval('public.city_citykey_seq'::regclass);


--
-- Name: continent continentkey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.continent ALTER COLUMN continentkey SET DEFAULT nextval('public.continent_continentkey_seq'::regclass);


--
-- Name: country countrykey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country ALTER COLUMN countrykey SET DEFAULT nextval('public.country_countrykey_seq'::regclass);


--
-- Name: customer customerkey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN customerkey SET DEFAULT nextval('public.customer_customerkey_seq'::regclass);


--
-- Name: state statekey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.state ALTER COLUMN statekey SET DEFAULT nextval('public.state_statekey_seq'::regclass);


--
-- Name: date datekey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."date" ALTER COLUMN datekey SET DEFAULT nextval('public.date_datekey_seq'::regclass);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (categorykey, categoryname, description) FROM stdin;
1	Beverages	Soft drinks, coffees, teas, beers, and ales
2	Condiments	Sweet and savory sauces, relishes, spreads, and seasonings
3	Confections	Desserts, candies, and sweet breads
4	Dairy Products	Cheeses
5	Grains/Cereals	Breads, crackers, pasta, and cereal
6	Meat/Poultry	Prepared meats
7	Produce	Dried fruit and bean curd
8	Seafood	Seaweed and fish
\.


--
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.city (citykey, cityname, statekey, countrykey) FROM stdin;
1	Annecy	172	\N
2	Århus	29	\N
3	Barcelona	454	\N
4	Barquisimeto	962	\N
5	Bergamo	282	\N
6	Berlin	230	\N
7	Bern	526	\N
8	Bräcke	520	\N
9	Brandenburg	231	\N
10	Bruxelles	21	\N
11	Buenos Aires	898	\N
12	Caracas	959	\N
13	Charleroi	22	\N
14	Frankfurt	231	\N
15	Genève	528	\N
16	Göteborg	513	\N
17	Graz	12	\N
18	I. de Margarita	966	\N
19	Lille	200	\N
20	Lisboa	438	\N
21	Luleå	502	\N
22	Lyngby	87	\N
23	Lyon	207	\N
24	Madrid	476	\N
25	Mannheim	228	\N
26	Marseille	144	\N
27	Melbourne	847	\N
28	México D.F.	766	\N
29	Montceau	208	\N
30	Montréal	755	\N
31	Nantes	185	\N
32	Osaka	883	\N
33	Oulu	129	\N
34	Oviedo	451	\N
35	Paris	224	\N
36	Ravenna	350	\N
37	Reggio Emilia	352	\N
38	Reims	193	\N
39	Resende	940	\N
40	Rio de Janeiro	940	\N
41	Salerno	357	\N
42	Salzburg	11	\N
43	San Cristóbal	969	\N
44	Sandvika	392	\N
45	Sevilla	476	\N
46	Stavern	410	\N
47	Ste-Hyacinthe	755	\N
48	Stockholm	500	\N
49	Strasbourg	143	\N
50	Stuttgart	228	\N
51	Sydney	842	\N
52	Tokyo	891	\N
53	Torino	370	\N
54	Toulouse	167	\N
55	Tsawassen	746	\N
56	Vancouver	746	\N
57	Versailles	227	\N
58	Warszawa	417	\N
59	Aachen	237	\N
60	Campinas	946	\N
61	Cork	247	\N
62	Cunewalde	240	\N
63	Cuxhaven	235	\N
64	Frankfurt a.M.	234	\N
65	Helsinki	126	\N
66	Kobenhavn	79	\N
67	Köln	237	\N
68	Lappeenranta	126	\N
69	Leipzig	240	\N
70	München	229	\N
71	Münster	237	\N
72	Sao Paulo	946	\N
73	Zaandam	387	\N
74	Albuquerque	821	\N
75	Anchorage	791	\N
76	Ann Arbor	812	\N
77	Atlanta	800	\N
78	Austin	833	\N
79	Beachwood	825	\N
80	Bedford	804	\N
81	Bellevue	807	\N
82	Bend	827	\N
83	Bentonville	793	\N
84	Bloomfield Hills	812	\N
85	Boise	802	\N
86	Boston	811	\N
87	Braintree	811	\N
88	Butte	816	\N
89	Cambridge	811	\N
90	Campbell	794	\N
91	Cary	823	\N
92	Chicago	803	\N
93	Colorado Springs	795	\N
94	Columbia	830	\N
95	Cowes	631	\N
96	Dallas	833	\N
97	Denver	795	\N
98	Edison	820	\N
99	Elgin	827	\N
100	Eugene	827	\N
101	Fairport	822	\N
102	Findlay	825	\N
103	Georgetown	830	\N
104	Greensboro	823	\N
105	Hoffman Estates	803	\N
106	Hollis	826	\N
107	Kirkland	837	\N
108	Lander	840	\N
109	London	622	\N
110	Louisville	807	\N
111	Manchester	648	\N
112	Melville	808	\N
113	Menlo Park	794	\N
114	Minneapolis	813	\N
115	Morristown	820	\N
116	New Orleans	808	\N
117	New York	822	\N
118	Newark	820	\N
119	Orlando	799	\N
120	Philadelphia	828	\N
121	Phoenix	792	\N
122	Portland	827	\N
123	Portsmouth	819	\N
124	Providence	829	\N
125	Racine	839	\N
126	Redmond	837	\N
127	Rockville	810	\N
128	Roseville	794	\N
129	San Francisco	794	\N
130	Santa Clara	794	\N
131	Santa Cruz	794	\N
132	Santa Monica	794	\N
133	Savannah	800	\N
134	Scottsdale	792	\N
135	Seattle	837	\N
136	Southfield	812	\N
137	Tampa	799	\N
138	Troy	812	\N
139	Walla Walla	837	\N
140	Westboro	811	\N
141	Wilton	796	\N
142	Singapore	21	22
\.


--
-- Data for Name: continent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.continent (continentkey, continentname) FROM stdin;
1	Europe
2	North America
3	Pacific
4	South America
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (countrykey, countryname, countrycode, countrycapital, population, subdivision, continentkey) FROM stdin;
1	Austria	AT	Vienna	8316487	Austria is divided into nine Bundesländer, or simply Länder (states; sing. Land).	1
2	Belgium	BE	Bruxelles	10584534	Belgium is divided into ten provinces (Flemish: provincies) and one capital region (Flemish: hoofdstedelijke gewest; French: région capitale).	1
3	Denmark	DK	Copenhagen	5475791	Denmark is divided into five regioner (regions; singular: region) and 98 municipalities (Danish, kommuner).	1
4	Finland	FI	Helsinki	5311891	Finland is divided into five läänit (sing. lääni, Swedish län: provinces) and one itsehallinnollinen maakunta (autonomous province), namely Åland. 	1
5	France	FR	Paris	64473140	France, in Europe and adjacent islands (Corsica), is divided into 96 départements (departments). It also has a number of possessions, some of which are classified as départements d'outre-mer (overseas departments). 	1
6	Germany	DE	Berlin	82210000	Germany is divided into sixteen Länder (sing. Land: state).	1
7	Ireland	IE	Dublin	6000000	Ireland is divided into 26 (traditional) counties.	1
8	Italy	IT	Roma	59536507	Italy is divided into 110 province (sing. provincia: provinces).	1
9	Netherlands	NL	Amsterdam	16408557	The Netherlands is divided into twelve provincies (provinces).	1
10	Norway	NO	Oslo	4752735	Norway is divided into 19 fylker (sing. fylke: counties).	1
11	Poland	PL	Warsaw	38518241	Poland is divided into sixteen wojewodztwa (voivodships).	1
12	Portugal	PT	Lisbon	10623032	Portugal is divided into eighteen distritos (districts) and two regiões autônomas (autonomous regions).	1
13	Spain	ES	Madrid	45200737	Spain is politically organized into 17 Autonomous Communities (comunidades autónomas) and 2 autonomous cities (ciudades autónomas) - Ceuta and Melilla. Administratively Spain also comprises fifty provinces.	1
14	Sweden	SE	Stockholm	91962274	Sweden is divided into 21 län (counties).	1
15	Switzerland	CH	Bern	7591400	Switzerland is divided into 26 cantons (French or English), kantone (German), cantoni (Italian), chantuns (Romansh).	1
16	United Kingdom	UK	London	60587300	Various	1
17	Canada	CA	Ottawa	33293000	Canada is divided into ten provinces and three territories (French: territoires).	2
18	Mexico	MX	Mexico D.F.	108700891	Mexico is divided into 31 estados (states) and one distrito federal (federal district).	2
19	United States	USA	Washington D.C.	304358000	The United States is divided into fifty states and one federal district.	2
20	Australia	AU	Canberra	21310000	Australia is divided into six states and four territories.	3
21	Japan	JP	Tokyo	127433494	Japan is divided into 43 ken (prefectures), one to (metropolis - Tokyo), one do (Area - Hokkaido), and two fu (urban prefectures - Kyoto and Osaka). The four words are combined in one, todofuken, to denote a division of any type.	3
22	Singapore	SG	Singapore	4588600	 The small physical size of Singapore does not justify the creation of national subdivisions in the form of provinces, states, and other national political divisions found in larger countries	3
23	Argentina	AR	Buenos Aires	40677348	Argentina is divided into 23 provincias (provinces) and a distrito federal (federal district).	4
24	Brazil	BR	Brasilia	186757608	Brazil is divided into 26 estados (states) and one distrito federal (federal district).	4
25	Venezuela	VE	Caracas	28199822	Venezuela is divided into 23 estados (states), one dependencias federales (federal dependencies), and one distrito capital (capital district).	4
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (customerkey, customerid, companyname, address, postalcode, citykey) FROM stdin;
312	HILAA	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	5022	43
313	LILAS	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	3508	4
314	LINOD	LINO-Delicateses	Ave. 5 de Mayo Porlamar	4980	18
315	MEREP	Mère Paillarde	43 rue St. Laurent	H1J 1C3	30
316	ALFKI	Alfreds Futterkiste	Obere Str. 57	12209	6
317	ANATR	Ana Trujillo Emparedados y helados	Avda. de la Constitución 2222	05021	28
318	ANTON	Antonio Moreno Taquería	Mataderos  2312	05023	28
319	BERGS	Berglunds snabbköp	Berguvsvägen  8	S-958 22	21
320	BLAUS	Blauer See Delikatessen	Forsterstr. 57	68306	25
321	BLONP	Blondesddsl père et fils	24, place Kléber	67000	49
322	BOLID	Bólido Comidas preparadas	C/ Araquil, 67	28023	24
323	BONAP	Bon app'	12, rue des Bouchers	13008	26
324	CACTU	Cactus Comidas para llevar	Cerrito 333	1010	11
325	CENTC	Centro comercial Moctezuma	Sierras de Granada 9993	05022	28
326	CHOPS	Chop-suey Chinese	Hauptstr. 29	3012	7
327	DUMON	Du monde entier	67, rue des Cinquante Otages	44000	31
328	ERNSH	Ernst Handel	Kirchgasse 6	8010	17
329	FISSA	FISSA Fabrica Inter. Salchichas S.A.	C/ Moralzarzal, 86	28034	24
330	FOLIG	Folies gourmandes	184, chaussée de Tournai	59000	19
331	FOLKO	Folk och fä HB	Åkergatan 24	S-844 67	8
332	FRANR	France restauration	54, rue Royale	44000	31
333	FRANS	Franchi S.p.A.	Via Monte Bianco 34	10100	53
334	FURIB	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	1675	20
335	GALED	Galería del gastrónomo	Rambla de Cataluña, 23	08022	3
336	GODOS	Godos Cocina Típica	C/ Romero, 33	41101	24
337	KOENE	Königlich Essen	Maubelstr. 90	14776	9
338	LACOR	La corne d'abondance	67, avenue de l'Europe	78000	57
339	LAMAI	La maison d'Asie	1 rue Alsace-Lorraine	31000	54
340	MAGAA	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	24100	5
341	MAISD	Maison Dewey	Rue Joseph-Bens 532	B-1180	10
342	OCEAN	Océano Atlántico Ltda.	Ing. Gustavo Moncada 8585 Piso 20-A	1010	11
343	PARIS	Paris spécialités	265, boulevard Charonne	75012	35
344	PERIC	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	05033	28
345	PICCO	Piccolo und mehr	Geislweg 14	5020	42
346	PRINI	Princesa Isabel Vinhos	Estrada da saúde n. 58	1756	20
347	RANCH	Rancho grande	Av. del Libertador 900	1010	11
348	REGGC	Reggiani Caseifici	Strada Provinciale 124	42100	37
349	RICSU	Richter Supermarkt	Grenzacherweg 237	1203	15
350	ROMEY	Romero y tomillo	Gran Vía, 1	28001	24
351	SANTG	Santé Gourmet	Erling Skakkes gate 78	4110	46
352	SPECD	Spécialités du monde	25, rue Lauriston	75016	35
353	SUPRD	Suprêmes délices	Boulevard Tirou, 255	B-6000	13
354	TORTU	Tortuga Restaurante	Avda. Azteca 123	05033	28
355	VAFFE	Vaffeljernet	Smagsloget 45	8200	2
356	VICTE	Victuailles en stock	2, rue du Commerce	69004	23
357	VINET	Vins et alcools Chevalier	59 rue de l'Abbaye	51100	38
358	WANDK	Die Wandernde Kuh	Adenauerallee 900	70563	25
359	WARTH	Wartian Herkku	Torikatu 38	90110	33
360	WOLZA	Wolski  Zajazd	ul. Filtrowa 68	01-012	58
361	DRACD	Drachenblut Delikatessen	Walserweg 21	52066	59
362	FRANK	Frankenversand	Berliner Platz 43	80805	70
363	LEHMS	Lehmanns Marktstand	Magazinweg 7	60528	64
364	MORGK	Morgenstern Gesundkost	Heerstr. 22	04179	62
365	OTTIK	Ottilies Käseladen	Mehrheimerstr. 369	50739	59
366	QUICK	QUICK-Stop	Taucherstraße 10	01307	62
367	SIMOB	Simons bistro	Vinbæltet 34	1734	66
368	TOMSP	Toms Spezialitäten	Luisenstr. 48	44087	59
369	WILMK	Wilman Kala	Keskuskatu 45	21240	65
370	BOTTM	Bottom-Dollar Markets	23 Tsawassen Blvd.	T2F 8M4	55
371	COMMI	Comércio Mineiro	Av. dos Lusíadas, 23	05432-043	60
372	FAMIA	Familia Arquibaldo	Rua Orós, 92	05442-030	60
373	GOURL	Gourmet Lanchonetes	Av. Brasil, 442	04876-786	60
374	GROSR	GROSELLA-Restaurante	5ª Ave. Los Palos Grandes	1081	12
375	HANAR	Hanari Carnes	Rua do Paço, 67	05454-876	39
376	LAUGB	Laughing Bacchus Wine Cellars	1900 Oak St.	V3F 2K1	55
377	QUEDE	Que Delícia	Rua da Panificadora, 12	02389-673	39
378	QUEEN	Queen Cozinha	Alameda dos Canàrios, 891	05487-020	60
379	RICAR	Ricardo Adocicados	Av. Copacabana, 267	02389-890	39
380	TRADH	Tradição Hipermercados	Av. Inês de Castro, 414	05634-030	60
381	WELLI	Wellington Importadora	Rua do Mercado, 12	08737-363	60
382	ISLAT	Island Trading	Garden House Crowther Way	PO31 7PJ	95
383	AROUT	Around the Horn	120 Hanover Sq.	WA1 1DP	109
384	BSBEV	B's Beverages	Fauntleroy Circus	EC2 5NT	109
385	CONSH	Consolidated Holdings	Berkeley Gardens 12  Brewery	WX1 6LT	109
386	EASTC	Eastern Connection	35 King George	WX3 6FW	109
387	NORTS	North/South	South House 300 Queensbridge	SW7 1RZ	109
388	SEVES	Seven Seas Imports	90 Wadhurst Rd.	OX15 4NB	109
389	GREAL	Great Lakes Food Market	2732 Baker Blvd.	97403	82
390	HUNGC	Hungry Coyote Import Store	City Center Plaza 516 Main St.	97827	82
391	LAZYK	Lazy K Kountry Store	12 Orchestra Terrace	99362	107
392	LETSS	Let's Stop N Shop	87 Polk St. Suite 5	94117	90
393	LONEP	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	97219	82
394	OLDWO	Old World Delicatessen	2743 Bering St.	99508	75
395	RATTC	Rattlesnake Canyon Grocery	2817 Milton Dr.	87110	74
396	SAVEA	Save-a-lot Markets	187 Suffolk Ln.	83720	85
397	SPLIR	Split Rail Beer & Ale	P.O. Box 555	82520	108
398	THEBI	The Big Cheese	89 Jefferson Way Suite 2	97201	82
399	THECR	The Cracker Box	55 Grizzly Peak Rd.	59801	88
400	TRAIH	Trail's Head Gourmet Provisioners	722 DaVinci Blvd.	98034	107
401	WHITC	White Clover Markets	305 - 14th Ave. S. Suite 3B	98128	107
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (employeekey, firstname, lastname, title, titleofcourtesy, birthdate, hiredate, address, city, region, postalcode, country, supervisorkey) FROM stdin;
1	Nancy	Davolio	Sales Representative	Ms.	1948-12-08	1992-05-01	507 - 20th Ave. E.\nApt. 2A	Seattle	WA	98122	USA	2
2	Andrew	Fuller	Vice President, Sales	Dr.	1952-02-19	1992-08-14	908 W. Capital Way	Tacoma	WA	98401	USA	\N
3	Janet	Leverling	Sales Representative	Ms.	1963-08-30	1992-04-01	722 Moss Bay Blvd.	Kirkland	WA	98033	USA	2
4	Margaret	Peacock	Sales Representative	Mrs.	1937-09-19	1993-05-03	4110 Old Redmond Rd.	Redmond	WA	98052	USA	2
5	Steven	Buchanan	Sales Manager	Mr.	1955-03-04	1993-10-17	14 Garrett Hill	London	\N	SW1 8JR	UK	2
6	Michael	Suyama	Sales Representative	Mr.	1963-07-02	1993-10-17	Coventry House\nMiner Rd.	London	\N	EC2 7JR	UK	5
7	Robert	King	Sales Representative	Mr.	1960-05-29	1994-01-02	Edgeham Hollow\nWinchester Way	London	\N	RG1 9SP	UK	5
8	Laura	Callahan	Inside Sales Coordinator	Ms.	1958-01-09	1994-03-05	4726 - 11th Ave. N.E.	Seattle	WA	98105	USA	2
9	Anne	Dodsworth	Sales Representative	Ms.	1966-01-27	1994-11-15	7 Houndstooth Rd.	London	\N	WG2 7LT	UK	5
\.


--
-- Data for Name: employeeclosure; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employeeclosure (supervisorkey, employeekey, distance) FROM stdin;
1	1	0
2	1	1
2	2	0
2	3	1
3	3	0
2	4	1
4	4	0
2	5	1
5	5	0
2	6	2
5	6	1
6	6	0
2	7	2
5	7	1
7	7	0
2	8	1
8	8	0
2	9	2
5	9	1
9	9	0
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (productkey, productname, quantityperunit, unitprice, discontinued, categorykey) FROM stdin;
1	Chai	10 boxes x 20 bags	18.0000	0	1
2	Chang	24 - 12 oz bottles	19.0000	0	1
3	Aniseed Syrup	12 - 550 ml bottles	10.0000	0	2
4	Chef Anton's Cajun Seasoning	48 - 6 oz jars	22.0000	0	2
5	Chef Anton's Gumbo Mix	36 boxes	21.3500	1	2
6	Grandma's Boysenberry Spread	12 - 8 oz jars	25.0000	0	2
7	Uncle Bob's Organic Dried Pears	12 - 1 lb pkgs.	30.0000	0	7
8	Northwoods Cranberry Sauce	12 - 12 oz jars	40.0000	0	2
9	Mishi Kobe Niku	18 - 500 g pkgs.	97.0000	1	6
10	Ikura	12 - 200 ml jars	31.0000	0	8
11	Queso Cabrales	1 kg pkg.	21.0000	0	4
12	Queso Manchego La Pastora	10 - 500 g pkgs.	38.0000	0	4
13	Konbu	2 kg box	6.0000	0	8
14	Tofu	40 - 100 g pkgs.	23.2500	0	7
15	Genen Shouyu	24 - 250 ml bottles	15.5000	0	2
16	Pavlova	32 - 500 g boxes	17.4500	0	3
17	Alice Mutton	20 - 1 kg tins	39.0000	1	6
18	Carnarvon Tigers	16 kg pkg.	62.5000	0	8
19	Teatime Chocolate Biscuits	10 boxes x 12 pieces	9.2000	0	3
20	Sir Rodney's Marmalade	30 gift boxes	81.0000	0	3
21	Sir Rodney's Scones	24 pkgs. x 4 pieces	10.0000	0	3
22	Gustaf's Knäckebröd	24 - 500 g pkgs.	21.0000	0	5
23	Tunnbröd	12 - 250 g pkgs.	9.0000	0	5
24	Guaraná Fantástica	12 - 355 ml cans	4.5000	1	1
25	NuNuCa Nuß-Nougat-Creme	20 - 450 g glasses	14.0000	0	3
26	Gumbär Gummibärchen	100 - 250 g bags	31.2300	0	3
27	Schoggi Schokolade	100 - 100 g pieces	43.9000	0	3
28	Rössle Sauerkraut	25 - 825 g cans	45.6000	1	7
29	Thüringer Rostbratwurst	50 bags x 30 sausgs.	123.7900	1	6
30	Nord-Ost Matjeshering	10 - 200 g glasses	25.8900	0	8
31	Gorgonzola Telino	12 - 100 g pkgs	12.5000	0	4
32	Mascarpone Fabioli	24 - 200 g pkgs.	32.0000	0	4
33	Geitost	500 g	2.5000	0	4
34	Sasquatch Ale	24 - 12 oz bottles	14.0000	0	1
35	Steeleye Stout	24 - 12 oz bottles	18.0000	0	1
36	Inlagd Sill	24 - 250 g  jars	19.0000	0	8
37	Gravad lax	12 - 500 g pkgs.	26.0000	0	8
38	Côte de Blaye	12 - 75 cl bottles	263.5000	0	1
39	Chartreuse verte	750 cc per bottle	18.0000	0	1
40	Boston Crab Meat	24 - 4 oz tins	18.4000	0	8
41	Jack's New England Clam Chowder	12 - 12 oz cans	9.6500	0	8
42	Singaporean Hokkien Fried Mee	32 - 1 kg pkgs.	14.0000	1	5
43	Ipoh Coffee	16 - 500 g tins	46.0000	0	1
44	Gula Malacca	20 - 2 kg bags	19.4500	0	2
45	Rogede sild	1k pkg.	9.5000	0	8
46	Spegesild	4 - 450 g glasses	12.0000	0	8
47	Zaanse koeken	10 - 4 oz boxes	9.5000	0	3
48	Chocolade	10 pkgs.	12.7500	0	3
49	Maxilaku	24 - 50 g pkgs.	20.0000	0	3
50	Valkoinen suklaa	12 - 100 g bars	16.2500	0	3
51	Manjimup Dried Apples	50 - 300 g pkgs.	53.0000	0	7
52	Filo Mix	16 - 2 kg boxes	7.0000	0	5
53	Perth Pasties	48 pieces	32.8000	1	6
54	Tourtière	16 pies	7.4500	0	6
55	Pâté chinois	24 boxes x 2 pies	24.0000	0	6
56	Gnocchi di nonna Alice	24 - 250 g pkgs.	38.0000	0	5
57	Ravioli Angelo	24 - 250 g pkgs.	19.5000	0	5
58	Escargots de Bourgogne	24 pieces	13.2500	0	8
59	Raclette Courdavault	5 kg pkg.	55.0000	0	4
60	Camembert Pierrot	15 - 300 g rounds	34.0000	0	4
61	Sirop d'érable	24 - 500 ml bottles	28.5000	0	2
62	Tarte au sucre	48 pies	49.3000	0	3
63	Vegie-spread	15 - 625 g jars	43.9000	0	2
64	Wimmers gute Semmelknödel	20 bags x 4 pieces	33.2500	0	5
65	Louisiana Fiery Hot Pepper Sauce	32 - 8 oz bottles	21.0500	0	2
66	Louisiana Hot Spiced Okra	24 - 8 oz jars	17.0000	0	2
67	Laughing Lumberjack Lager	24 - 12 oz bottles	14.0000	0	1
68	Scottish Longbreads	10 boxes x 8 pieces	12.5000	0	3
69	Gudbrandsdalsost	10 kg pkg.	36.0000	0	4
70	Outback Lager	24 - 355 ml bottles	15.0000	0	1
71	Flotemysost	10 - 500 g pkgs.	21.5000	0	4
72	Mozzarella di Giovanni	24 - 200 g pkgs.	34.8000	0	4
73	Röd Kaviar	24 - 150 g jars	15.0000	0	8
74	Longlife Tofu	5 kg pkg.	10.0000	0	7
75	Rhönbräu Klosterbier	24 - 0.5 l bottles	7.7500	0	1
76	Lakkalikööri	500 ml	18.0000	0	1
77	Original Frankfurter grüne Soße	12 boxes	13.0000	0	2
\.


--
-- Data for Name: sales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales (customerkey, employeekey, orderdatekey, duedatekey, shippeddatekey, shipperkey, productkey, supplierkey, orderno, orderlineno, unitprice, quantity, discount, salesamount, freight) FROM stdin;
357	5	4	32	16	3	11	5	10248	1	14.0000	12	0	168.0000	10.7933
357	5	4	32	16	3	42	20	10248	2	9.8000	10	0	98.0000	10.7933
357	5	4	32	16	3	72	14	10248	3	34.8000	5	0	174.0000	10.7933
368	6	5	47	10	1	14	6	10249	1	18.6000	9	0	167.4000	5.8050
368	6	5	47	10	1	51	24	10249	2	42.4000	40	0	1696.0000	5.8050
375	4	8	36	12	2	41	19	10250	1	7.7000	10	0	77.0000	21.9433
375	4	8	36	12	2	51	24	10250	2	42.4000	35	0.15	1261.4000	21.9433
375	4	8	36	12	2	65	2	10250	3	16.8000	15	0.15	214.2000	21.9433
356	3	8	36	15	1	22	9	10251	1	16.8000	6	0.05	95.7600	13.7800
356	3	8	36	15	1	57	26	10251	2	15.6000	15	0.05	222.3000	13.7800
356	3	8	36	15	1	65	2	10251	3	16.8000	20	0	336.0000	13.7800
353	4	9	37	11	2	20	8	10252	1	64.8000	40	0.05	2462.4001	17.1000
353	4	9	37	11	2	33	15	10252	2	2.0000	25	0.05	47.5000	17.1000
353	4	9	37	11	2	60	28	10252	3	27.2000	40	0	1088.0000	17.1000
375	3	10	24	16	2	31	14	10253	1	10.0000	20	0	200.0000	19.3900
375	3	10	24	16	2	39	18	10253	2	14.4000	42	0	604.8000	19.3900
375	3	10	24	16	2	49	23	10253	3	16.0000	40	0	640.0000	19.3900
326	5	11	39	23	2	24	10	10254	1	3.6000	15	0.15	45.9000	7.6600
326	5	11	39	23	2	55	25	10254	2	19.2000	21	0.15	342.7200	7.6600
326	5	11	39	23	2	74	4	10254	3	8.0000	21	0	168.0000	7.6600
349	9	12	40	15	3	2	1	10255	1	15.2000	20	0	304.0000	37.0825
349	9	12	40	15	3	16	7	10255	2	13.9000	35	0	486.5000	37.0825
349	9	12	40	15	3	36	17	10255	3	15.2000	25	0	380.0000	37.0825
349	9	12	40	15	3	59	28	10255	4	44.0000	30	0	1320.0000	37.0825
381	3	15	43	17	2	53	24	10256	1	26.2000	15	0	393.0000	6.9850
381	3	15	43	17	2	77	12	10256	2	10.4000	12	0	124.8000	6.9850
312	4	16	44	22	3	27	11	10257	1	35.1000	25	0	877.4999	27.3033
312	4	16	44	22	3	39	18	10257	2	14.4000	6	0	86.4000	27.3033
312	4	16	44	22	3	77	12	10257	3	10.4000	15	0	156.0000	27.3033
328	1	17	45	23	1	2	1	10258	1	15.2000	50	0.2	608.0000	46.8366
328	1	17	45	23	1	5	2	10258	2	17.0000	65	0.2	884.0000	46.8366
328	1	17	45	23	1	32	14	10258	3	25.6000	6	0.2	122.8800	46.8366
325	4	18	46	25	3	21	8	10259	1	8.0000	10	0	80.0000	1.6250
325	4	18	46	25	3	37	17	10259	2	20.8000	1	0	20.8000	1.6250
365	4	19	47	29	1	41	19	10260	1	7.7000	16	0.25	92.4000	13.7725
365	4	19	47	29	1	57	26	10260	2	15.6000	50	0	780.0000	13.7725
365	4	19	47	29	1	62	29	10260	3	39.4000	15	0.25	443.2500	13.7725
365	4	19	47	29	1	70	7	10260	4	12.0000	21	0.25	189.0000	13.7725
377	4	19	47	30	2	21	8	10261	1	8.0000	20	0	160.0000	1.5250
377	4	19	47	30	2	35	16	10261	2	14.4000	20	0	288.0000	1.5250
395	8	22	50	25	3	5	2	10262	1	17.0000	12	0.2	163.2000	16.0966
395	8	22	50	25	3	7	3	10262	2	24.0000	15	0	360.0000	16.0966
395	8	22	50	25	3	56	26	10262	3	30.4000	2	0	60.8000	16.0966
328	9	23	51	31	3	16	7	10263	1	13.9000	60	0.25	625.4999	36.5150
328	9	23	51	31	3	24	10	10263	2	3.6000	28	0	100.8000	36.5150
328	9	23	51	31	3	30	13	10263	3	20.7000	60	0.25	931.5001	36.5150
328	9	23	51	31	3	74	4	10263	4	8.0000	36	0.25	216.0000	36.5150
331	6	24	52	54	3	2	1	10264	1	15.2000	35	0	532.0000	1.8350
331	6	24	52	54	3	41	19	10264	2	7.7000	25	0.15	163.6250	1.8350
321	2	25	53	43	1	17	7	10265	1	31.2000	30	0	936.0000	27.6400
321	2	25	53	43	1	70	7	10265	2	12.0000	20	0	240.0000	27.6400
359	3	26	68	31	3	12	5	10266	1	30.4000	12	0.05	346.5600	25.7300
362	4	29	57	37	1	40	19	10267	1	14.7000	50	0	735.0000	69.5266
362	4	29	57	37	1	59	28	10267	2	44.0000	70	0.15	2618.0000	69.5266
362	4	29	57	37	1	76	23	10267	3	14.4000	15	0.15	183.6000	69.5266
374	8	30	58	33	3	29	12	10268	1	99.0000	10	0	990.0000	33.1450
374	8	30	58	33	3	72	14	10268	2	27.8000	4	0	111.2000	33.1450
401	5	31	45	40	1	33	15	10269	1	2.0000	60	0.05	114.0000	2.2800
401	5	31	45	40	1	72	14	10269	2	27.8000	20	0.05	528.2000	2.2800
359	1	32	60	33	1	36	17	10270	1	15.2000	30	0	456.0000	68.2700
359	1	32	60	33	1	43	20	10270	2	36.8000	25	0	920.0000	68.2700
397	6	32	60	61	2	33	15	10271	1	2.0000	24	0	48.0000	4.5400
395	6	33	61	37	2	20	8	10272	1	64.8000	6	0	388.8000	32.6766
395	6	33	61	37	2	31	14	10272	2	10.0000	40	0	400.0000	32.6766
395	6	33	61	37	2	72	14	10272	3	27.8000	24	0	667.2000	32.6766
366	3	36	64	43	3	10	4	10273	1	24.8000	24	0.05	565.4400	15.2140
366	3	36	64	43	3	31	14	10273	2	10.0000	15	0.05	142.5000	15.2140
366	3	36	64	43	3	33	15	10273	3	2.0000	20	0	40.0000	15.2140
366	3	36	64	43	3	40	19	10273	4	14.7000	60	0.05	837.9000	15.2140
366	3	36	64	43	3	76	23	10273	5	14.4000	33	0.05	451.4400	15.2140
357	6	37	65	47	1	71	15	10274	1	17.2000	20	0	344.0000	3.0050
357	6	37	65	47	1	72	14	10274	2	27.8000	7	0	194.6000	3.0050
340	1	38	66	40	1	24	10	10275	1	3.6000	12	0.05	41.0400	13.4650
340	1	38	66	40	1	59	28	10275	2	44.0000	6	0.05	250.8000	13.4650
354	8	39	53	45	3	10	4	10276	1	24.8000	15	0	372.0000	6.9200
354	8	39	53	45	3	13	6	10276	2	4.8000	10	0	48.0000	6.9200
364	2	40	68	44	3	28	12	10277	1	36.4000	20	0	728.0000	62.8850
364	2	40	68	44	3	62	29	10277	2	39.4000	12	0	472.8000	62.8850
319	8	43	71	47	2	44	20	10278	1	15.5000	16	0	248.0000	23.1725
319	8	43	71	47	2	59	28	10278	2	44.0000	15	0	660.0000	23.1725
319	8	43	71	47	2	63	7	10278	3	35.1000	8	0	280.8000	23.1725
319	8	43	71	47	2	73	17	10278	4	12.0000	25	0	300.0000	23.1725
363	8	44	72	47	2	17	7	10279	1	31.2000	15	0.25	351.0000	25.8300
319	2	45	73	74	1	24	10	10280	1	3.6000	12	0	43.2000	2.9933
319	2	45	73	74	1	55	25	10280	2	19.2000	20	0	384.0000	2.9933
319	2	45	73	74	1	75	12	10280	3	6.2000	30	0	186.0000	2.9933
350	4	45	59	52	1	19	8	10281	1	7.3000	1	0	7.3000	0.9800
350	4	45	59	52	1	24	10	10281	2	3.6000	6	0	21.6000	0.9800
350	4	45	59	52	1	35	16	10281	3	14.4000	4	0	57.6000	0.9800
350	4	46	74	52	1	30	13	10282	1	20.7000	6	0	124.2000	6.3450
350	4	46	74	52	1	57	26	10282	2	15.6000	2	0	31.2000	6.3450
313	3	47	75	54	3	15	6	10283	1	12.4000	20	0	248.0000	21.2025
313	3	47	75	54	3	19	8	10283	2	7.3000	18	0	131.4000	21.2025
313	3	47	75	54	3	60	28	10283	3	27.2000	35	0	952.0000	21.2025
313	3	47	75	54	3	72	14	10283	4	27.8000	3	0	83.4000	21.2025
363	4	50	78	58	1	27	11	10284	1	35.1000	15	0.25	394.8750	19.1400
363	4	50	78	58	1	44	20	10284	2	15.5000	21	0	325.5000	19.1400
363	4	50	78	58	1	60	28	10284	3	27.2000	20	0.25	408.0000	19.1400
363	4	50	78	58	1	67	16	10284	4	11.2000	5	0.25	42.0000	19.1400
366	1	51	79	57	2	1	1	10285	1	14.4000	45	0.2	518.4000	25.6100
366	1	51	79	57	2	40	19	10285	2	14.7000	40	0.2	470.4000	25.6100
366	1	51	79	57	2	53	24	10285	3	26.2000	36	0.2	754.5601	25.6100
366	8	52	80	61	3	35	16	10286	1	14.4000	100	0	1440.0000	114.6200
366	8	52	80	61	3	62	29	10286	2	39.4000	40	0	1576.0000	114.6200
379	8	53	81	59	3	16	7	10287	1	13.9000	40	0.15	472.6000	4.2533
379	8	53	81	59	3	34	16	10287	2	11.2000	20	0	224.0000	4.2533
379	8	53	81	59	3	46	21	10287	3	9.6000	15	0.15	122.4000	4.2533
348	4	54	82	65	1	54	25	10288	1	5.9000	10	0.1	53.1000	3.7250
348	4	54	82	65	1	68	8	10288	2	10.0000	3	0.1	27.0000	3.7250
384	7	57	85	59	3	3	1	10289	1	8.0000	30	0	240.0000	11.3850
384	7	57	85	59	3	64	12	10289	2	26.6000	9	0	239.4000	11.3850
371	8	58	86	65	1	5	2	10290	1	17.0000	20	0	340.0000	19.9250
371	8	58	86	65	1	29	12	10290	2	99.0000	15	0	1485.0000	19.9250
371	8	58	86	65	1	49	23	10290	3	16.0000	15	0	240.0000	19.9250
371	8	58	86	65	1	77	12	10290	4	10.4000	10	0	104.0000	19.9250
377	6	58	86	66	2	13	6	10291	1	4.8000	20	0.1	86.4000	2.1333
377	6	58	86	66	2	44	20	10291	2	15.5000	24	0.1	334.8000	2.1333
377	6	58	86	66	2	51	24	10291	3	42.4000	2	0.1	76.3200	2.1333
380	1	59	87	64	2	20	8	10292	1	64.8000	20	0	1296.0000	1.3500
354	1	60	88	73	3	18	7	10293	1	50.0000	12	0	600.0000	5.2950
354	1	60	88	73	3	24	10	10293	2	3.6000	10	0	36.0000	5.2950
354	1	60	88	73	3	63	7	10293	3	35.1000	5	0	175.5000	5.2950
354	1	60	88	73	3	75	12	10293	4	6.2000	6	0	37.2000	5.2950
395	4	61	89	67	2	1	1	10294	1	14.4000	18	0	259.2000	29.4520
395	4	61	89	67	2	17	7	10294	2	31.2000	15	0	468.0000	29.4520
395	4	61	89	67	2	43	20	10294	3	36.8000	15	0	552.0000	29.4520
395	4	61	89	67	2	60	28	10294	4	27.2000	21	0	571.2000	29.4520
395	4	61	89	67	2	75	12	10294	5	6.2000	6	0	37.2000	29.4520
357	2	64	92	72	2	56	26	10295	1	30.4000	4	0	121.6000	1.1500
313	6	65	93	73	1	11	5	10296	1	16.8000	12	0	201.6000	0.0400
313	6	65	93	73	1	16	7	10296	2	13.9000	30	0	417.0000	0.0400
313	6	65	93	73	1	69	15	10296	3	28.8000	15	0	432.0000	0.0400
321	5	66	108	72	2	39	18	10297	1	14.4000	60	0	864.0000	2.8700
321	5	66	108	72	2	72	14	10297	2	27.8000	20	0	556.0000	2.8700
379	4	68	96	75	2	19	8	10299	1	7.3000	15	0	109.5000	14.8800
379	4	68	96	75	2	70	7	10299	2	12.0000	20	0	240.0000	14.8800
340	2	71	99	80	2	66	2	10300	1	13.6000	30	0	408.0000	8.8400
340	2	71	99	80	2	68	8	10300	2	10.0000	20	0	200.0000	8.8400
358	8	71	99	79	2	40	19	10301	1	14.7000	10	0	147.0000	22.5400
358	8	71	99	79	2	56	26	10301	2	30.4000	20	0	608.0000	22.5400
353	4	72	100	101	2	17	7	10302	1	31.2000	40	0	1248.0000	2.0900
353	4	72	100	101	2	28	12	10302	2	36.4000	28	0	1019.2001	2.0900
353	4	72	100	101	2	43	20	10302	3	36.8000	12	0	441.6000	2.0900
336	7	73	101	80	2	40	19	10303	1	14.7000	40	0.1	529.2000	35.9433
336	7	73	101	80	2	65	2	10303	2	16.8000	30	0.1	453.6000	35.9433
336	7	73	101	80	2	68	8	10303	3	10.0000	15	0.1	135.0000	35.9433
354	1	74	102	79	2	49	23	10304	1	16.0000	30	0	480.0000	21.2633
354	1	74	102	79	2	59	28	10304	2	44.0000	10	0	440.0000	21.2633
354	1	74	102	79	2	71	15	10304	3	17.2000	2	0	34.4000	21.2633
394	8	75	103	101	3	18	7	10305	1	50.0000	25	0.1	1125.0000	85.8733
394	8	75	103	101	3	29	12	10305	2	99.0000	25	0.1	2227.5000	85.8733
394	8	75	103	101	3	39	18	10305	3	14.4000	30	0.1	388.8000	85.8733
350	1	78	106	85	3	30	13	10306	1	20.7000	10	0	207.0000	2.5200
350	1	78	106	85	3	53	24	10306	2	26.2000	10	0	262.0000	2.5200
350	1	78	106	85	3	54	25	10306	3	5.9000	5	0	29.5000	2.5200
393	2	79	107	87	2	62	29	10307	1	39.4000	10	0	394.0000	0.2800
393	2	79	107	87	2	68	8	10307	2	10.0000	3	0	30.0000	0.2800
317	7	80	108	86	3	69	15	10308	1	28.8000	1	0	28.8000	0.8050
317	7	80	108	86	3	70	7	10308	2	12.0000	5	0	60.0000	0.8050
398	8	82	110	89	2	16	7	10310	1	13.9000	10	0	139.0000	8.7600
398	8	82	110	89	2	62	29	10310	2	39.4000	5	0	197.0000	8.7600
327	1	82	96	88	3	42	20	10311	1	11.2000	6	0	67.2000	12.3450
327	1	82	96	88	3	69	15	10311	2	28.8000	7	0	201.6000	12.3450
358	2	85	113	95	2	28	12	10312	1	36.4000	4	0	145.6000	10.0650
358	2	85	113	95	2	43	20	10312	2	36.8000	24	0	883.2000	10.0650
358	2	85	113	95	2	53	24	10312	3	26.2000	20	0	524.0000	10.0650
358	2	85	113	95	2	75	12	10312	4	6.2000	10	0	62.0000	10.0650
366	2	86	114	96	2	36	17	10313	1	15.2000	12	0	182.4000	1.9600
395	1	87	115	96	2	32	14	10314	1	25.6000	40	0.1	921.6000	24.7200
395	1	87	115	96	2	58	27	10314	2	10.6000	30	0.1	286.2000	24.7200
395	1	87	115	96	2	62	29	10314	3	39.4000	25	0.1	886.5000	24.7200
382	4	88	116	95	2	34	16	10315	1	11.2000	14	0	156.8000	20.8800
382	4	88	116	95	2	70	7	10315	2	12.0000	30	0	360.0000	20.8800
395	1	89	117	100	3	41	19	10316	1	7.7000	10	0	77.0000	75.0750
395	1	89	117	100	3	62	29	10316	2	39.4000	70	0	2758.0000	75.0750
393	6	92	120	102	1	1	1	10317	1	14.4000	20	0	288.0000	12.6900
382	8	93	121	96	2	41	19	10318	1	7.7000	20	0	154.0000	2.3650
382	8	93	121	96	2	76	23	10318	2	14.4000	6	0	86.4000	2.3650
354	7	94	122	103	3	17	7	10319	1	31.2000	8	0	249.6000	21.5000
354	7	94	122	103	3	28	12	10319	2	36.4000	14	0	509.6000	21.5000
354	7	94	122	103	3	76	23	10319	3	14.4000	30	0	432.0000	21.5000
359	5	95	109	110	3	71	15	10320	1	17.2000	30	0	516.0000	34.5700
382	3	95	123	103	2	35	16	10321	1	14.4000	10	0	144.0000	3.4300
344	7	96	124	115	3	52	24	10322	1	5.6000	20	0	112.0000	0.4000
337	4	99	127	106	1	15	6	10323	1	12.4000	5	0	62.0000	1.6266
337	4	99	127	106	1	25	11	10323	2	11.2000	4	0	44.8000	1.6266
337	4	99	127	106	1	39	18	10323	3	14.4000	4	0	57.6000	1.6266
396	9	100	128	102	1	16	7	10324	1	13.9000	21	0.15	248.1150	42.8540
396	9	100	128	102	1	35	16	10324	2	14.4000	70	0.15	856.8000	42.8540
396	9	100	128	102	1	46	21	10324	3	9.6000	30	0	288.0000	42.8540
396	9	100	128	102	1	59	28	10324	4	44.0000	40	0.15	1496.0000	42.8540
396	9	100	128	102	1	63	7	10324	5	35.1000	80	0.15	2386.7998	42.8540
337	1	101	115	106	3	6	3	10325	1	20.0000	6	0	120.0000	12.9720
337	1	101	115	106	3	13	6	10325	2	4.8000	12	0	57.6000	12.9720
337	1	101	115	106	3	14	6	10325	3	18.6000	9	0	167.4000	12.9720
337	1	101	115	106	3	31	14	10325	4	10.0000	4	0	40.0000	12.9720
337	1	101	115	106	3	72	14	10325	5	27.8000	40	0	1112.0000	12.9720
322	4	102	130	106	2	4	2	10326	1	17.6000	24	0	422.4000	25.9733
322	4	102	130	106	2	57	26	10326	2	15.6000	16	0	249.6000	25.9733
322	4	102	130	106	2	75	12	10326	3	6.2000	50	0	310.0000	25.9733
331	2	103	131	106	1	2	1	10327	1	15.2000	25	0.2	304.0000	15.8400
331	2	103	131	106	1	11	5	10327	2	16.8000	50	0.2	672.0000	15.8400
331	2	103	131	106	1	30	13	10327	3	20.7000	35	0.2	579.6000	15.8400
331	2	103	131	106	1	58	27	10327	4	10.6000	30	0.2	254.4000	15.8400
334	4	106	134	109	3	59	28	10328	1	44.0000	9	0	396.0000	29.0100
334	4	106	134	109	3	65	2	10328	2	16.8000	40	0	672.0000	29.0100
334	4	106	134	109	3	68	8	10328	3	10.0000	10	0	100.0000	29.0100
397	4	107	149	115	2	19	8	10329	1	7.3000	10	0.05	69.3500	47.9175
397	4	107	149	115	2	30	13	10329	2	20.7000	8	0.05	157.3200	47.9175
397	4	107	149	115	2	38	18	10329	3	210.8000	20	0.05	4005.2000	47.9175
397	4	107	149	115	2	56	26	10329	4	30.4000	12	0.05	346.5600	47.9175
313	3	108	136	120	1	26	11	10330	1	24.9000	50	0.15	1058.2500	6.3750
313	3	108	136	120	1	72	14	10330	2	27.8000	25	0.15	590.7500	6.3750
323	9	108	150	113	1	54	25	10331	1	5.9000	15	0	88.5000	10.1900
315	3	109	151	113	2	18	7	10332	1	50.0000	40	0.2	1600.0000	17.6133
315	3	109	151	113	2	42	20	10332	2	11.2000	10	0.2	89.6000	17.6133
315	3	109	151	113	2	47	22	10332	3	7.6000	16	0.2	97.2800	17.6133
359	5	110	138	117	3	14	6	10333	1	18.6000	10	0	186.0000	0.1966
359	5	110	138	117	3	21	8	10333	2	8.0000	10	0.1	72.0000	0.1966
359	5	110	138	117	3	71	15	10333	3	17.2000	40	0.1	619.2000	0.1966
356	8	113	141	120	2	52	24	10334	1	5.6000	8	0	44.8000	4.2800
356	8	113	141	120	2	68	8	10334	2	10.0000	10	0	100.0000	4.2800
346	7	115	143	117	2	4	2	10336	1	17.6000	18	0.1	285.1200	15.5100
362	4	116	144	121	3	23	9	10337	1	7.2000	40	0	288.0000	21.6520
362	4	116	144	121	3	26	11	10337	2	24.9000	24	0	597.6000	21.6520
362	4	116	144	121	3	36	17	10337	3	15.2000	20	0	304.0000	21.6520
362	4	116	144	121	3	37	17	10337	4	20.8000	28	0	582.4000	21.6520
362	4	116	144	121	3	72	14	10337	5	27.8000	25	0	695.0000	21.6520
394	4	117	145	121	3	17	7	10338	1	31.2000	20	0	624.0000	42.1050
394	4	117	145	121	3	30	13	10338	2	20.7000	15	0	310.5000	42.1050
315	2	120	148	127	2	4	2	10339	1	17.6000	10	0	176.0000	5.2200
315	2	120	148	127	2	17	7	10339	2	31.2000	70	0.05	2074.8000	5.2200
315	2	120	148	127	2	62	29	10339	3	39.4000	28	0	1103.2001	5.2200
323	1	121	149	131	3	18	7	10340	1	50.0000	20	0.05	950.0000	55.4366
323	1	121	149	131	3	41	19	10340	2	7.7000	12	0.05	87.7800	55.4366
323	1	121	149	131	3	43	20	10340	3	36.8000	40	0.05	1398.3999	55.4366
367	7	121	149	128	3	33	15	10341	1	2.0000	8	0	16.0000	13.3900
367	7	121	149	128	3	59	28	10341	2	44.0000	9	0.15	336.6000	13.3900
362	4	122	136	127	2	2	1	10342	1	15.2000	24	0.2	291.8400	13.7075
362	4	122	136	127	2	31	14	10342	2	10.0000	56	0.2	448.0000	13.7075
362	4	122	136	127	2	36	17	10342	3	15.2000	40	0.2	486.4000	13.7075
362	4	122	136	127	2	55	25	10342	4	19.2000	40	0.2	614.4000	13.7075
363	4	123	151	129	1	64	12	10343	1	26.6000	50	0	1330.0000	36.7900
363	4	123	151	129	1	68	8	10343	2	10.0000	4	0.05	38.0000	36.7900
363	4	123	151	129	1	76	23	10343	3	14.4000	15	0	216.0000	36.7900
401	4	124	152	128	2	4	2	10344	1	17.6000	35	0	616.0000	11.6450
401	4	124	152	128	2	8	3	10344	2	32.0000	70	0.25	1680.0000	11.6450
366	2	127	155	134	2	8	3	10345	1	32.0000	70	0	2240.0000	83.0200
366	2	127	155	134	2	19	8	10345	2	7.3000	80	0	584.0000	83.0200
366	2	127	155	134	2	42	20	10345	3	11.2000	9	0	100.8000	83.0200
395	3	128	170	131	3	17	7	10346	1	31.2000	36	0.1	1010.8800	71.0400
395	3	128	170	131	3	56	26	10346	2	30.4000	20	0	608.0000	71.0400
372	4	129	157	131	3	25	11	10347	1	11.2000	10	0	112.0000	0.7750
372	4	129	157	131	3	39	18	10347	2	14.4000	50	0.15	612.0000	0.7750
372	4	129	157	131	3	40	19	10347	3	14.7000	4	0	58.8000	0.7750
372	4	129	157	131	3	75	12	10347	4	6.2000	6	0.15	31.6200	0.7750
358	4	130	158	138	2	1	1	10348	1	14.4000	15	0.15	183.6000	0.3900
358	4	130	158	138	2	23	9	10348	2	7.2000	25	0	180.0000	0.3900
397	7	131	159	138	1	54	25	10349	1	5.9000	24	0	141.6000	8.6300
339	6	134	162	156	2	50	23	10350	1	13.0000	15	0.1	175.5000	32.0950
339	6	134	162	156	2	69	15	10350	2	28.8000	18	0.1	466.5600	32.0950
328	1	134	162	143	1	38	18	10351	1	210.8000	20	0.05	4005.2000	40.5825
328	1	134	162	143	1	41	19	10351	2	7.7000	13	0	100.1000	40.5825
328	1	134	162	143	1	44	20	10351	3	15.5000	77	0.05	1133.8250	40.5825
328	1	134	162	143	1	65	2	10351	4	16.8000	10	0.05	159.6000	40.5825
334	3	135	149	141	3	24	10	10352	1	3.6000	10	0	36.0000	0.6500
334	3	135	149	141	3	54	25	10352	2	5.9000	20	0.15	100.3000	0.6500
345	7	136	164	148	3	11	5	10353	1	16.8000	12	0.2	161.2800	180.3150
345	7	136	164	148	3	38	18	10353	2	210.8000	50	0.2	8432.0000	180.3150
344	8	137	165	143	3	1	1	10354	1	14.4000	12	0	172.8000	26.9000
344	8	137	165	143	3	29	12	10354	2	99.0000	4	0	396.0000	26.9000
383	6	138	166	143	1	24	10	10355	1	3.6000	25	0	90.0000	20.9750
383	6	138	166	143	1	57	26	10355	2	15.6000	25	0	390.0000	20.9750
358	6	141	169	150	2	31	14	10356	1	10.0000	30	0	300.0000	12.2366
358	6	141	169	150	2	55	25	10356	2	19.2000	12	0	230.4000	12.2366
358	6	141	169	150	2	69	15	10356	3	28.8000	20	0	576.0000	12.2366
313	1	142	170	155	3	10	4	10357	1	24.8000	30	0.2	595.2000	11.6266
313	1	142	170	155	3	26	11	10357	2	24.9000	16	0	398.4000	11.6266
313	1	142	170	155	3	60	28	10357	3	27.2000	8	0.2	174.0800	11.6266
339	5	143	171	150	1	24	10	10358	1	3.6000	10	0.05	34.2000	6.5466
339	5	143	171	150	1	34	16	10358	2	11.2000	10	0.05	106.4000	6.5466
339	5	143	171	150	1	36	17	10358	3	15.2000	20	0.05	288.8000	6.5466
388	5	144	172	149	3	16	7	10359	1	13.9000	56	0.05	739.4800	96.1433
388	5	144	172	149	3	31	14	10359	2	10.0000	70	0.05	665.0000	96.1433
388	5	144	172	149	3	60	28	10359	3	27.2000	80	0.05	2067.2000	96.1433
321	4	145	173	155	3	28	12	10360	1	36.4000	30	0	1092.0000	26.3400
321	4	145	173	155	3	29	12	10360	2	99.0000	35	0	3465.0000	26.3400
321	4	145	173	155	3	38	18	10360	3	210.8000	10	0	2108.0000	26.3400
321	4	145	173	155	3	49	23	10360	4	16.0000	35	0	560.0000	26.3400
321	4	145	173	155	3	54	25	10360	5	5.9000	28	0	165.2000	26.3400
366	1	145	173	156	2	39	18	10361	1	14.4000	54	0.1	699.8400	91.5850
366	1	145	173	156	2	60	28	10361	2	27.2000	55	0.1	1346.4000	91.5850
323	3	148	176	151	1	25	11	10362	1	11.2000	50	0	560.0000	32.0133
323	3	148	176	151	1	51	24	10362	2	42.4000	20	0	848.0000	32.0133
323	3	148	176	151	1	54	25	10362	3	5.9000	24	0	141.6000	32.0133
361	4	149	177	157	3	31	14	10363	1	10.0000	20	0	200.0000	10.1800
361	4	149	177	157	3	75	12	10363	2	6.2000	12	0	74.4000	10.1800
361	4	149	177	157	3	76	23	10363	3	14.4000	12	0	172.8000	10.1800
386	1	149	191	157	1	69	15	10364	1	28.8000	30	0	864.0000	35.9850
386	1	149	191	157	1	71	15	10364	2	17.2000	5	0	86.0000	35.9850
318	3	150	178	155	2	11	5	10365	1	16.8000	24	0	403.2000	22.0000
335	8	151	193	183	2	65	2	10366	1	16.8000	5	0	84.0000	5.0700
335	8	151	193	183	2	77	12	10366	2	10.4000	5	0	52.0000	5.0700
355	7	151	179	155	3	34	16	10367	1	11.2000	36	0	403.2000	3.3875
355	7	151	179	155	3	54	25	10367	2	5.9000	18	0	106.2000	3.3875
355	7	151	179	155	3	65	2	10367	3	16.8000	15	0	252.0000	3.3875
355	7	151	179	155	3	77	12	10367	4	10.4000	7	0	72.8000	3.3875
328	2	152	180	155	2	21	8	10368	1	8.0000	5	0.1	36.0000	25.4875
328	2	152	180	155	2	28	12	10368	2	36.4000	13	0.1	425.8800	25.4875
328	2	152	180	155	2	57	26	10368	3	15.6000	25	0	390.0000	25.4875
328	2	152	180	155	2	64	12	10368	4	26.6000	35	0.1	837.9000	25.4875
397	8	155	183	162	2	29	12	10369	1	99.0000	20	0	1980.0000	97.8400
397	8	155	183	162	2	56	26	10369	2	30.4000	18	0.25	410.4000	97.8400
326	6	156	184	180	2	1	1	10370	1	14.4000	15	0.15	183.6000	0.3900
326	6	156	184	180	2	64	12	10370	2	26.6000	30	0	798.0000	0.3900
326	6	156	184	180	2	74	4	10370	3	8.0000	20	0.15	136.0000	0.3900
339	1	156	184	177	1	36	17	10371	1	15.2000	6	0.2	72.9600	0.4500
378	5	157	185	162	2	20	8	10372	1	64.8000	12	0.25	583.2000	222.6950
378	5	157	185	162	2	38	18	10372	2	210.8000	40	0.25	6324.0000	222.6950
378	5	157	185	162	2	60	28	10372	3	27.2000	70	0.25	1428.0001	222.6950
378	5	157	185	162	2	72	14	10372	4	27.8000	42	0.25	875.7000	222.6950
360	1	158	186	162	3	31	14	10374	1	10.0000	30	0	300.0000	1.9700
360	1	158	186	162	3	58	27	10374	2	10.6000	15	0	159.0000	1.9700
390	3	159	187	162	2	14	6	10375	1	18.6000	15	0	279.0000	10.0600
390	3	159	187	162	2	54	25	10375	2	5.9000	10	0	59.0000	10.0600
315	1	162	190	166	2	31	14	10376	1	10.0000	42	0.05	399.0000	20.3900
388	1	162	190	166	3	28	12	10377	1	36.4000	20	0.15	618.8000	11.1050
388	1	162	190	166	3	39	18	10377	2	14.4000	20	0.15	244.8000	11.1050
331	5	163	191	172	3	71	15	10378	1	17.2000	6	0	103.2000	5.4400
377	2	164	192	166	1	41	19	10379	1	7.7000	8	0.1	55.4400	15.0100
377	2	164	192	166	1	63	7	10379	2	35.1000	16	0.1	505.4400	15.0100
377	2	164	192	166	1	65	2	10379	3	16.8000	20	0.1	302.4000	15.0100
313	3	165	193	166	3	74	4	10381	1	8.0000	14	0	112.0000	7.9900
328	4	166	194	169	1	5	2	10382	1	17.0000	32	0	544.0000	18.9540
328	4	166	194	169	1	18	7	10382	2	50.0000	9	0	450.0000	18.9540
328	4	166	194	169	1	29	12	10382	3	99.0000	14	0	1386.0000	18.9540
328	4	166	194	169	1	33	15	10382	4	2.0000	60	0	120.0000	18.9540
328	4	166	194	169	1	74	4	10382	5	8.0000	50	0	400.0000	18.9540
383	8	169	197	171	3	13	6	10383	1	4.8000	20	0	96.0000	11.4133
383	8	169	197	171	3	50	23	10383	2	13.0000	15	0	195.0000	11.4133
383	8	169	197	171	3	56	26	10383	3	30.4000	20	0	608.0000	11.4133
319	3	169	197	173	3	20	8	10384	1	64.8000	28	0	1814.4001	84.3200
319	3	169	197	173	3	60	28	10384	2	27.2000	15	0	408.0000	84.3200
397	1	170	198	176	2	7	3	10385	1	24.0000	10	0.2	192.0000	10.3200
397	1	170	198	176	2	60	28	10385	2	27.2000	20	0.2	435.2000	10.3200
397	1	170	198	176	2	68	8	10385	3	10.0000	8	0.2	64.0000	10.3200
372	9	171	185	178	3	24	10	10386	1	3.6000	15	0	54.0000	6.9950
372	9	171	185	178	3	34	16	10386	2	11.2000	10	0	112.0000	6.9950
351	1	171	199	173	2	24	10	10387	1	3.6000	15	0	54.0000	23.4075
351	1	171	199	173	2	28	12	10387	2	36.4000	6	0	218.4000	23.4075
351	1	171	199	173	2	59	28	10387	3	44.0000	12	0	528.0000	23.4075
351	1	171	199	173	2	71	15	10387	4	17.2000	15	0	258.0000	23.4075
388	2	172	200	173	1	45	21	10388	1	7.6000	15	0.2	91.2000	11.6200
388	2	172	200	173	1	52	24	10388	2	5.6000	20	0.2	89.6000	11.6200
388	2	172	200	173	1	53	24	10388	3	26.2000	40	0	1048.0000	11.6200
370	4	173	201	177	2	10	4	10389	1	24.8000	16	0	396.8000	11.8550
370	4	173	201	177	2	55	25	10389	2	19.2000	15	0	288.0000	11.8550
370	4	173	201	177	2	62	29	10389	3	39.4000	20	0	788.0000	11.8550
370	4	173	201	177	2	70	7	10389	4	12.0000	30	0	360.0000	11.8550
328	6	176	204	179	1	31	14	10390	1	10.0000	60	0.1	540.0000	31.5950
328	6	176	204	179	1	35	16	10390	2	14.4000	40	0.1	518.4000	31.5950
328	6	176	204	179	1	46	21	10390	3	9.6000	45	0	432.0000	31.5950
328	6	176	204	179	1	72	14	10390	4	27.8000	24	0.1	600.4800	31.5950
361	3	176	204	184	3	13	6	10391	1	4.8000	18	0	86.4000	5.4500
345	2	177	205	185	3	69	15	10392	1	28.8000	50	0	1440.0000	122.4600
396	1	178	206	187	3	2	1	10393	1	15.2000	25	0.25	285.0000	25.3120
396	1	178	206	187	3	14	6	10393	2	18.6000	42	0.25	585.9000	25.3120
396	1	178	206	187	3	25	11	10393	3	11.2000	7	0.25	58.8000	25.3120
396	1	178	206	187	3	26	11	10393	4	24.9000	70	0.25	1307.2500	25.3120
396	1	178	206	187	3	31	14	10393	5	10.0000	32	0	320.0000	25.3120
390	1	178	206	187	3	13	6	10394	1	4.8000	10	0	48.0000	15.1700
390	1	178	206	187	3	62	29	10394	2	39.4000	10	0	394.0000	15.1700
312	6	179	207	187	1	46	21	10395	1	9.6000	28	0.1	241.9200	61.4700
312	6	179	207	187	1	53	24	10395	2	26.2000	70	0.1	1650.6000	61.4700
312	6	179	207	187	1	69	15	10395	3	28.8000	8	0	230.4000	61.4700
362	1	180	194	190	3	23	9	10396	1	7.2000	40	0	288.0000	45.1166
362	1	180	194	190	3	71	15	10396	2	17.2000	60	0	1032.0000	45.1166
362	1	180	194	190	3	72	14	10396	3	27.8000	21	0	583.8000	45.1166
346	5	180	208	186	1	21	8	10397	1	8.0000	10	0.15	68.0000	30.1300
346	5	180	208	186	1	51	24	10397	2	42.4000	18	0.15	648.7200	30.1300
396	2	183	211	193	3	35	16	10398	1	14.4000	30	0	432.0000	44.5800
396	2	183	211	193	3	55	25	10398	2	19.2000	120	0.1	2073.6001	44.5800
355	8	184	198	192	3	68	8	10399	1	10.0000	60	0	600.0000	6.8400
355	8	184	198	192	3	71	15	10399	2	17.2000	30	0	516.0000	6.8400
355	8	184	198	192	3	76	23	10399	3	14.4000	35	0	504.0000	6.8400
355	8	184	198	192	3	77	12	10399	4	10.4000	14	0	145.6000	6.8400
386	1	185	213	200	3	29	12	10400	1	99.0000	21	0	2079.0000	27.9766
386	1	185	213	200	3	35	16	10400	2	14.4000	35	0	504.0000	27.9766
386	1	185	213	200	3	49	23	10400	3	16.0000	30	0	480.0000	27.9766
395	1	185	213	194	1	30	13	10401	1	20.7000	18	0	372.6000	3.1275
395	1	185	213	194	1	56	26	10401	2	30.4000	70	0	2128.0000	3.1275
395	1	185	213	194	1	65	2	10401	3	16.8000	20	0	336.0000	3.1275
395	1	185	213	194	1	71	15	10401	4	17.2000	60	0	1032.0000	3.1275
328	8	186	228	194	2	23	9	10402	1	7.2000	60	0	432.0000	33.9400
328	8	186	228	194	2	63	7	10402	2	35.1000	65	0	2281.5000	33.9400
328	4	187	215	193	3	16	7	10403	1	13.9000	21	0.15	248.1150	36.8950
328	4	187	215	193	3	48	22	10403	2	10.2000	70	0.15	606.9000	36.8950
340	2	187	215	192	1	26	11	10404	1	24.9000	30	0.05	709.6500	51.9900
340	2	187	215	192	1	42	20	10404	2	11.2000	40	0.05	425.6000	51.9900
340	2	187	215	192	1	49	23	10404	3	16.0000	30	0.05	456.0000	51.9900
314	1	190	218	206	1	3	1	10405	1	8.0000	50	0	400.0000	34.8200
378	7	191	233	197	1	1	1	10406	1	14.4000	10	0	144.0000	21.6080
378	7	191	233	197	1	21	8	10406	2	8.0000	30	0.1	216.0000	21.6080
378	7	191	233	197	1	28	12	10406	3	36.4000	42	0.1	1375.9200	21.6080
378	7	191	233	197	1	36	17	10406	4	15.2000	5	0.1	68.4000	21.6080
378	7	191	233	197	1	40	19	10406	5	14.7000	2	0.1	26.4600	21.6080
365	2	191	219	214	2	11	5	10407	1	16.8000	30	0	504.0000	30.4933
365	2	191	219	214	2	69	15	10407	2	28.8000	15	0	432.0000	30.4933
365	2	191	219	214	2	71	15	10407	3	17.2000	15	0	258.0000	30.4933
330	8	192	220	198	1	37	17	10408	1	20.8000	10	0	208.0000	3.7533
330	8	192	220	198	1	54	25	10408	2	5.9000	6	0	35.4000	3.7533
330	8	192	220	198	1	62	29	10408	3	39.4000	35	0	1379.0000	3.7533
342	3	193	221	198	1	14	6	10409	1	18.6000	12	0	223.2000	14.9150
342	3	193	221	198	1	21	8	10409	2	8.0000	12	0	96.0000	14.9150
370	3	194	222	199	3	33	15	10410	1	2.0000	49	0	98.0000	1.2000
370	3	194	222	199	3	59	28	10410	2	44.0000	16	0	704.0000	1.2000
370	9	194	222	205	3	41	19	10411	1	7.7000	25	0.2	154.0000	7.8833
370	9	194	222	205	3	44	20	10411	2	15.5000	40	0.2	496.0000	7.8833
370	9	194	222	205	3	59	28	10411	3	44.0000	9	0.2	316.8000	7.8833
359	8	197	225	199	2	14	6	10412	1	18.6000	20	0.1	334.8000	3.7700
339	3	198	226	200	2	1	1	10413	1	14.4000	24	0	345.6000	31.8866
339	3	198	226	200	2	62	29	10413	2	39.4000	40	0	1576.0000	31.8866
339	3	198	226	200	2	76	23	10413	3	14.4000	14	0	201.6000	31.8866
372	2	198	226	201	3	19	8	10414	1	7.3000	18	0.05	124.8300	10.7400
372	2	198	226	201	3	33	15	10414	2	2.0000	50	0	100.0000	10.7400
390	3	199	227	208	1	17	7	10415	1	31.2000	2	0	62.4000	0.1000
390	3	199	227	208	1	33	15	10415	2	2.0000	20	0	40.0000	0.1000
359	8	200	228	211	3	19	8	10416	1	7.3000	20	0	146.0000	7.5733
359	8	200	228	211	3	53	24	10416	2	26.2000	10	0	262.0000	7.5733
359	8	200	228	211	3	57	26	10416	3	15.6000	20	0	312.0000	7.5733
367	4	200	228	212	3	38	18	10417	1	210.8000	50	0	10540.0000	17.5725
367	4	200	228	212	3	46	21	10417	2	9.6000	2	0.25	14.4000	17.5725
367	4	200	228	212	3	68	8	10417	3	10.0000	36	0.25	270.0000	17.5725
367	4	200	228	212	3	77	12	10417	4	10.4000	35	0	364.0000	17.5725
366	4	201	229	208	1	2	1	10418	1	15.2000	60	0	912.0000	4.3875
366	4	201	229	208	1	47	22	10418	2	7.6000	55	0	418.0000	4.3875
366	4	201	229	208	1	61	29	10418	3	22.8000	16	0	364.8000	4.3875
366	4	201	229	208	1	74	4	10418	4	8.0000	15	0	120.0000	4.3875
349	4	204	232	214	2	60	28	10419	1	27.2000	60	0.05	1550.4000	68.6750
349	4	204	232	214	2	69	15	10419	2	28.8000	20	0.05	547.2000	68.6750
381	3	205	233	211	1	9	4	10420	1	77.6000	20	0.1	1396.7999	11.0300
381	3	205	233	211	1	13	6	10420	2	4.8000	2	0.1	8.6400	11.0300
381	3	205	233	211	1	70	7	10420	3	12.0000	8	0.1	86.4000	11.0300
381	3	205	233	211	1	73	17	10420	4	12.0000	20	0.1	216.0000	11.0300
377	8	205	247	211	1	19	8	10421	1	7.3000	4	0.15	24.8200	24.8075
377	8	205	247	211	1	26	11	10421	2	24.9000	30	0	747.0000	24.8075
377	8	205	247	211	1	53	24	10421	3	26.2000	15	0.15	334.0500	24.8075
377	8	205	247	211	1	77	12	10421	4	10.4000	10	0.15	88.4000	24.8075
333	2	206	234	215	1	26	11	10422	1	24.9000	2	0	49.8000	3.0200
373	6	207	221	239	3	31	14	10423	1	10.0000	14	0	140.0000	12.2500
373	6	207	221	239	3	59	28	10423	2	44.0000	20	0	880.0000	12.2500
315	7	207	235	211	2	35	16	10424	1	14.4000	60	0.2	691.2000	123.5366
315	7	207	235	211	2	38	18	10424	2	210.8000	49	0.2	8263.3604	123.5366
315	7	207	235	211	2	68	8	10424	3	10.0000	30	0.2	240.0000	123.5366
339	6	208	236	229	2	55	25	10425	1	19.2000	10	0.25	144.0000	3.9650
339	6	208	236	229	2	76	23	10425	2	14.4000	20	0.25	216.0000	3.9650
335	4	211	239	221	1	56	26	10426	1	30.4000	5	0	152.0000	9.3450
335	4	211	239	221	1	64	12	10426	2	26.6000	7	0	186.2000	9.3450
345	4	211	239	246	2	14	6	10427	1	18.6000	35	0	651.0000	31.2900
348	7	212	240	219	1	46	21	10428	1	9.6000	20	0	192.0000	11.0900
328	4	214	228	218	1	17	7	10430	1	31.2000	45	0.2	1123.2001	114.6950
328	4	214	228	218	1	21	8	10430	2	8.0000	50	0	400.0000	114.6950
328	4	214	228	218	1	56	26	10430	3	30.4000	30	0	912.0000	114.6950
328	4	214	228	218	1	59	28	10430	4	44.0000	70	0.2	2464.0000	114.6950
370	4	214	228	222	2	17	7	10431	1	31.2000	50	0.25	1170.0001	14.7233
370	4	214	228	222	2	40	19	10431	2	14.7000	50	0.25	551.2500	14.7233
370	4	214	228	222	2	47	22	10431	3	7.6000	30	0.25	171.0000	14.7233
397	3	215	229	222	2	26	11	10432	1	24.9000	10	0	249.0000	2.1700
397	3	215	229	222	2	54	25	10432	2	5.9000	40	0	236.0000	2.1700
346	3	218	246	247	3	56	26	10433	1	30.4000	28	0	851.2000	73.8300
331	3	218	246	228	2	11	5	10434	1	16.8000	6	0	100.8000	8.9600
331	3	218	246	228	2	76	23	10434	2	14.4000	18	0.15	220.3200	8.9600
385	8	219	261	222	2	2	1	10435	1	15.2000	10	0	152.0000	3.0700
385	8	219	261	222	2	22	9	10435	2	16.8000	12	0	201.6000	3.0700
385	8	219	261	222	2	72	14	10435	3	27.8000	10	0	278.0000	3.0700
321	3	220	248	226	2	46	21	10436	1	9.6000	5	0	48.0000	39.1650
321	3	220	248	226	2	56	26	10436	2	30.4000	40	0.1	1094.3999	39.1650
321	3	220	248	226	2	64	12	10436	3	26.6000	30	0.1	718.2000	39.1650
321	3	220	248	226	2	75	12	10436	4	6.2000	24	0.1	133.9200	39.1650
359	8	220	248	227	1	53	24	10437	1	26.2000	15	0	393.0000	19.9700
368	3	221	249	229	2	19	8	10438	1	7.3000	15	0.2	87.6000	2.7466
368	3	221	249	229	2	34	16	10438	2	11.2000	20	0.2	179.2000	2.7466
368	3	221	249	229	2	57	26	10438	3	15.6000	15	0.2	187.2000	2.7466
315	6	222	250	225	3	12	5	10439	1	30.4000	15	0	456.0000	1.0175
315	6	222	250	225	3	16	7	10439	2	13.9000	16	0	222.4000	1.0175
315	6	222	250	225	3	64	12	10439	3	26.6000	6	0	159.6000	1.0175
315	6	222	250	225	3	74	4	10439	4	8.0000	30	0	240.0000	1.0175
396	4	225	253	243	2	2	1	10440	1	15.2000	45	0.15	581.4000	21.6325
396	4	225	253	243	2	16	7	10440	2	13.9000	49	0.15	578.9350	21.6325
396	4	225	253	243	2	29	12	10440	3	99.0000	24	0.15	2019.6001	21.6325
396	4	225	253	243	2	61	29	10440	4	22.8000	90	0.15	1744.2000	21.6325
394	3	225	267	257	2	27	11	10441	1	35.1000	50	0	1754.9999	73.0200
328	3	226	254	233	2	11	5	10442	1	16.8000	30	0	504.0000	15.9800
328	3	226	254	233	2	54	25	10442	2	5.9000	80	0	472.0000	15.9800
328	3	226	254	233	2	66	2	10442	3	13.6000	60	0	816.0000	15.9800
348	8	227	255	229	1	11	5	10443	1	16.8000	6	0.2	80.6400	6.9750
348	8	227	255	229	1	28	12	10443	2	36.4000	12	0	436.8000	6.9750
319	3	227	255	236	3	17	7	10444	1	31.2000	10	0	312.0000	0.8750
319	3	227	255	236	3	26	11	10444	2	24.9000	15	0	373.5000	0.8750
319	3	227	255	236	3	35	16	10444	3	14.4000	8	0	115.2000	0.8750
319	3	227	255	236	3	41	19	10444	4	7.7000	30	0	231.0000	0.8750
319	3	228	256	235	1	39	18	10445	1	14.4000	6	0	86.4000	4.6500
319	3	228	256	235	1	54	25	10445	2	5.9000	15	0	88.5000	4.6500
368	6	229	257	234	1	19	8	10446	1	7.3000	12	0.1	78.8400	3.6700
368	6	229	257	234	1	24	10	10446	2	3.6000	20	0.1	64.8000	3.6700
368	6	229	257	234	1	31	14	10446	3	10.0000	3	0.1	27.0000	3.6700
368	6	229	257	234	1	52	24	10446	4	5.6000	15	0.1	75.6000	3.6700
379	4	229	257	250	2	19	8	10447	1	7.3000	40	0	292.0000	22.8866
379	4	229	257	250	2	65	2	10447	2	16.8000	35	0	588.0000	22.8866
379	4	229	257	250	2	71	15	10447	3	17.2000	2	0	34.4000	22.8866
347	4	232	260	239	2	26	11	10448	1	24.9000	6	0	149.4000	19.4100
347	4	232	260	239	2	40	19	10448	2	14.7000	20	0	294.0000	19.4100
321	3	233	261	242	2	10	4	10449	1	24.8000	14	0	347.2000	17.7666
321	3	233	261	242	2	52	24	10449	2	5.6000	20	0	112.0000	17.7666
321	3	233	261	242	2	62	29	10449	3	39.4000	35	0	1379.0000	17.7666
356	8	234	262	254	2	10	4	10450	1	24.8000	20	0.2	396.8000	3.6150
356	8	234	262	254	2	54	25	10450	2	5.9000	6	0.2	28.3200	3.6150
366	4	234	248	255	3	55	25	10451	1	19.2000	120	0.1	2073.6001	47.2725
366	4	234	248	255	3	64	12	10451	2	26.6000	35	0.1	837.9000	47.2725
366	4	234	248	255	3	65	2	10451	3	16.8000	28	0.1	423.3600	47.2725
366	4	234	248	255	3	77	12	10451	4	10.4000	55	0.1	514.8000	47.2725
396	8	235	263	241	1	28	12	10452	1	36.4000	15	0	546.0000	70.1300
396	8	235	263	241	1	44	20	10452	2	15.5000	100	0.05	1472.5000	70.1300
383	1	236	264	241	2	48	22	10453	1	10.2000	15	0.1	137.7000	12.6800
383	1	236	264	241	2	70	7	10453	2	12.0000	25	0.1	270.0000	12.6800
339	4	236	264	240	3	16	7	10454	1	13.9000	20	0.2	222.4000	0.9133
339	4	236	264	240	3	33	15	10454	2	2.0000	20	0.2	32.0000	0.9133
339	4	236	264	240	3	46	21	10454	3	9.6000	10	0.2	76.8000	0.9133
359	8	239	281	246	2	39	18	10455	1	14.4000	20	0	288.0000	45.1125
359	8	239	281	246	2	53	24	10455	2	26.2000	50	0	1310.0000	45.1125
359	8	239	281	246	2	61	29	10455	3	22.8000	25	0	570.0000	45.1125
359	8	239	281	246	2	71	15	10455	4	17.2000	30	0	516.0000	45.1125
337	8	240	282	243	2	21	8	10456	1	8.0000	40	0.15	272.0000	4.0600
337	8	240	282	243	2	49	23	10456	2	16.0000	21	0.15	285.6000	4.0600
337	2	240	268	246	1	59	28	10457	1	44.0000	36	0	1584.0000	11.5700
353	7	241	269	247	3	26	11	10458	1	24.9000	30	0	747.0000	29.4120
353	7	241	269	247	3	28	12	10458	2	36.4000	30	0	1092.0000	29.4120
353	7	241	269	247	3	43	20	10458	3	36.8000	20	0	736.0000	29.4120
353	7	241	269	247	3	56	26	10458	4	30.4000	15	0	456.0000	29.4120
353	7	241	269	247	3	71	15	10458	5	17.2000	50	0	860.0001	29.4120
356	4	242	270	243	2	7	3	10459	1	24.0000	16	0.05	364.8000	8.3633
356	4	242	270	243	2	46	21	10459	2	9.6000	20	0.05	182.4000	8.3633
356	4	242	270	243	2	72	14	10459	3	27.8000	40	0	1112.0000	8.3633
331	8	243	271	246	1	68	8	10460	1	10.0000	21	0.25	157.5000	8.1350
331	8	243	271	246	1	75	12	10460	2	6.2000	4	0.25	18.6000	8.1350
313	1	243	271	248	3	21	8	10461	1	8.0000	40	0.25	240.0000	49.5366
313	1	243	271	248	3	30	13	10461	2	20.7000	28	0.25	434.7000	49.5366
313	1	243	271	248	3	55	25	10461	3	19.2000	60	0.25	864.0001	49.5366
385	2	246	274	261	1	13	6	10462	1	4.8000	1	0	4.8000	3.0850
385	2	246	274	261	1	23	9	10462	2	7.2000	21	0	151.2000	3.0850
353	5	247	275	249	3	19	8	10463	1	7.3000	21	0	153.3000	7.3900
353	5	247	275	249	3	42	20	10463	2	11.2000	50	0	560.0000	7.3900
334	4	247	275	257	2	4	2	10464	1	17.6000	16	0.2	225.2800	22.2500
334	4	247	275	257	2	43	20	10464	2	36.8000	3	0	110.4000	22.2500
334	4	247	275	257	2	56	26	10464	3	30.4000	30	0.2	729.6000	22.2500
334	4	247	275	257	2	60	28	10464	4	27.2000	20	0	544.0000	22.2500
355	1	248	276	257	3	24	10	10465	1	3.6000	25	0	90.0000	29.0080
355	1	248	276	257	3	29	12	10465	2	99.0000	18	0.1	1603.7999	29.0080
355	1	248	276	257	3	40	19	10465	3	14.7000	20	0	294.0000	29.0080
355	1	248	276	257	3	45	21	10465	4	7.6000	30	0.1	205.2000	29.0080
355	1	248	276	257	3	50	23	10465	5	13.0000	25	0	325.0000	29.0080
371	4	249	277	256	1	11	5	10466	1	16.8000	10	0	168.0000	5.9650
371	4	249	277	256	1	46	21	10466	2	9.6000	5	0	48.0000	5.9650
340	8	249	277	254	2	24	10	10467	1	3.6000	28	0	100.8000	2.4650
340	8	249	277	254	2	25	11	10467	2	11.2000	12	0	134.4000	2.4650
337	3	250	278	255	3	30	13	10468	1	20.7000	8	0	165.6000	22.0600
337	3	250	278	255	3	43	20	10468	2	36.8000	15	0	552.0000	22.0600
401	1	253	281	257	1	2	1	10469	1	15.2000	40	0.15	516.8000	20.0600
401	1	253	281	257	1	16	7	10469	2	13.9000	35	0.15	413.5250	20.0600
401	1	253	281	257	1	44	20	10469	3	15.5000	2	0.15	26.3500	20.0600
323	4	254	282	257	2	18	7	10470	1	50.0000	30	0	1500.0000	21.5200
323	4	254	282	257	2	23	9	10470	2	7.2000	15	0	108.0000	21.5200
323	4	254	282	257	2	64	12	10470	3	26.6000	8	0	212.8000	21.5200
384	2	254	282	261	3	7	3	10471	1	24.0000	30	0	720.0000	22.7950
384	2	254	282	261	3	56	26	10471	2	30.4000	20	0	608.0000	22.7950
388	8	255	283	262	1	24	10	10472	1	3.6000	80	0.05	273.6000	2.1000
388	8	255	283	262	1	51	24	10472	2	42.4000	18	0	763.2000	2.1000
382	1	256	270	264	3	33	15	10473	1	2.0000	12	0	24.0000	8.1850
382	1	256	270	264	3	71	15	10473	2	17.2000	12	0	206.4000	8.1850
344	5	256	284	264	2	14	6	10474	1	18.6000	12	0	223.2000	20.8725
344	5	256	284	264	2	28	12	10474	2	36.4000	18	0	655.2000	20.8725
344	5	256	284	264	2	40	19	10474	3	14.7000	21	0	308.7000	20.8725
344	5	256	284	264	2	75	12	10474	4	6.2000	10	0	62.0000	20.8725
353	9	257	285	278	1	31	14	10475	1	10.0000	35	0.15	297.5000	22.8400
353	9	257	285	278	1	66	2	10475	2	13.6000	60	0.15	693.6000	22.8400
353	9	257	285	278	1	76	23	10475	3	14.4000	42	0.15	514.0800	22.8400
312	8	260	288	267	3	55	25	10476	1	19.2000	2	0.05	36.4800	2.2050
312	8	260	288	267	3	70	7	10476	2	12.0000	12	0	144.0000	2.2050
346	5	260	288	268	2	1	1	10477	1	14.4000	15	0	216.0000	4.3400
346	5	260	288	268	2	21	8	10477	2	8.0000	21	0.25	126.0000	4.3400
346	5	260	288	268	2	39	18	10477	3	14.4000	20	0.25	216.0000	4.3400
356	2	261	275	269	3	10	4	10478	1	24.8000	20	0.05	471.2000	4.8100
395	3	262	290	264	3	38	18	10479	1	210.8000	30	0	6324.0000	177.2375
395	3	262	290	264	3	53	24	10479	2	26.2000	28	0	733.6000	177.2375
395	3	262	290	264	3	59	28	10479	3	44.0000	60	0	2640.0000	177.2375
395	3	262	290	264	3	64	12	10479	4	26.6000	30	0	798.0000	177.2375
330	6	263	291	267	2	47	22	10480	1	7.6000	30	0	228.0000	0.6750
330	6	263	291	267	2	59	28	10480	2	44.0000	12	0	528.0000	0.6750
379	8	263	291	268	2	49	23	10481	1	16.0000	24	0	384.0000	32.1650
379	8	263	291	268	2	60	28	10481	2	27.2000	40	0	1088.0000	32.1650
391	1	264	292	284	3	40	19	10482	1	14.7000	10	0	147.0000	7.4800
401	7	267	295	299	2	34	16	10483	1	11.2000	35	0.05	372.4000	7.6400
401	7	267	295	299	2	77	12	10483	2	10.4000	30	0.05	296.4000	7.6400
384	3	267	295	275	3	21	8	10484	1	8.0000	14	0	112.0000	2.2933
384	3	267	295	275	3	40	19	10484	2	14.7000	10	0	147.0000	2.2933
384	3	267	295	275	3	51	24	10484	3	42.4000	3	0	127.2000	2.2933
314	4	268	282	274	2	2	1	10485	1	15.2000	20	0.1	273.6000	16.1125
314	4	268	282	274	2	3	1	10485	2	8.0000	20	0.1	144.0000	16.1125
314	4	268	282	274	2	55	25	10485	3	19.2000	30	0.1	518.4000	16.1125
314	4	268	282	274	2	70	7	10485	4	12.0000	60	0.1	647.9999	16.1125
312	1	269	297	276	2	11	5	10486	1	16.8000	5	0	84.0000	10.1766
312	1	269	297	276	2	51	24	10486	2	42.4000	25	0	1060.0000	10.1766
312	1	269	297	276	2	74	4	10486	3	8.0000	16	0	128.0000	10.1766
378	2	269	297	271	2	19	8	10487	1	7.3000	5	0	36.5000	23.6900
378	2	269	297	271	2	26	11	10487	2	24.9000	30	0	747.0000	23.6900
378	2	269	297	271	2	54	25	10487	3	5.9000	24	0.25	106.2000	23.6900
362	8	270	298	276	2	59	28	10488	1	44.0000	30	0	1320.0000	2.4650
362	8	270	298	276	2	73	17	10488	2	12.0000	20	0.2	192.0000	2.4650
345	6	271	299	283	2	11	5	10489	1	16.8000	15	0.25	189.0000	2.6450
345	6	271	299	283	2	16	7	10489	2	13.9000	18	0	250.2000	2.6450
312	7	274	302	277	2	59	28	10490	1	44.0000	60	0	2640.0000	70.0633
312	7	274	302	277	2	68	8	10490	2	10.0000	30	0	300.0000	70.0633
312	7	274	302	277	2	75	12	10490	3	6.2000	36	0	223.2000	70.0633
334	8	274	302	282	3	44	20	10491	1	15.5000	15	0.15	197.6250	8.4800
334	8	274	302	282	3	77	12	10491	2	10.4000	7	0.15	61.8800	8.4800
370	3	275	303	285	1	25	11	10492	1	11.2000	60	0.05	638.4000	31.4450
370	3	275	303	285	1	42	20	10492	2	11.2000	20	0.05	212.8000	31.4450
339	4	276	304	284	3	65	2	10493	1	16.8000	15	0.1	226.8000	3.5466
339	4	276	304	284	3	66	2	10493	2	13.6000	10	0.1	122.4000	3.5466
339	4	276	304	284	3	69	15	10493	3	28.8000	10	0.1	259.2000	3.5466
371	4	276	304	283	2	56	26	10494	1	30.4000	30	0	912.0000	65.9900
376	3	277	305	285	3	23	9	10495	1	7.2000	10	0	72.0000	1.5500
376	3	277	305	285	3	41	19	10495	2	7.7000	20	0	154.0000	1.5500
376	3	277	305	285	3	77	12	10495	3	10.4000	5	0	52.0000	1.5500
380	7	278	306	281	2	31	14	10496	1	10.0000	20	0.05	190.0000	46.7700
363	7	278	306	281	1	56	26	10497	1	30.4000	14	0	425.6000	12.0700
363	7	278	306	281	1	72	14	10497	2	27.8000	25	0	695.0000	12.0700
363	7	278	306	281	1	77	12	10497	3	10.4000	25	0	260.0000	12.0700
312	8	281	309	285	2	24	10	10498	1	4.5000	14	0	63.0000	9.9166
312	8	281	309	285	2	40	19	10498	2	18.4000	5	0	92.0000	9.9166
312	8	281	309	285	2	42	20	10498	3	14.0000	30	0	420.0000	9.9166
313	4	282	310	290	2	28	12	10499	1	45.6000	20	0	912.0000	51.0100
313	4	282	310	290	2	49	23	10499	2	20.0000	25	0	500.0000	51.0100
339	6	283	311	291	1	15	6	10500	1	15.5000	12	0.05	176.7000	21.3400
339	6	283	311	291	1	28	12	10500	2	45.6000	8	0.05	346.5600	21.3400
320	9	283	311	290	3	54	25	10501	1	7.4500	20	0	149.0000	8.8500
344	2	284	312	303	1	45	21	10502	1	9.5000	21	0	199.5000	23.1066
344	2	284	312	303	1	53	24	10502	2	32.8000	6	0	196.8000	23.1066
344	2	284	312	303	1	67	16	10502	3	14.0000	30	0	420.0000	23.1066
401	4	285	313	292	3	2	1	10504	1	19.0000	12	0	228.0000	14.7825
401	4	285	313	292	3	21	8	10504	2	10.0000	12	0	120.0000	14.7825
401	4	285	313	292	3	53	24	10504	3	32.8000	10	0	328.0000	14.7825
401	4	285	313	292	3	61	29	10504	4	28.5000	25	0	712.5000	14.7825
315	3	288	316	295	3	62	29	10505	1	49.3000	3	0	147.9000	7.1300
337	9	289	317	306	2	25	11	10506	1	14.0000	18	0.1	226.8000	10.5950
337	9	289	317	306	2	70	7	10506	2	15.0000	14	0.1	189.0000	10.5950
318	7	289	317	296	1	43	20	10507	1	46.0000	15	0.15	586.5001	23.7250
318	7	289	317	296	1	48	22	10507	2	12.7500	15	0.15	162.5625	23.7250
365	1	290	318	317	2	13	6	10508	1	6.0000	10	0	60.0000	2.4950
365	1	290	318	317	2	39	18	10508	2	18.0000	10	0	180.0000	2.4950
320	4	291	319	303	1	28	12	10509	1	45.6000	3	0	136.8000	0.1500
396	6	292	320	302	3	29	12	10510	1	123.7900	36	0	4456.4399	183.8150
396	6	292	320	302	3	75	12	10510	2	7.7500	36	0.1	251.1000	183.8150
323	4	292	320	295	3	4	2	10511	1	22.0000	50	0.15	935.0001	116.8800
323	4	292	320	295	3	7	3	10511	2	30.0000	50	0.15	1275.0000	116.8800
323	4	292	320	295	3	8	3	10511	3	40.0000	10	0.15	340.0000	116.8800
372	7	295	323	298	2	24	10	10512	1	4.5000	10	0.15	38.2500	0.8825
372	7	295	323	298	2	46	21	10512	2	12.0000	9	0.15	91.8000	0.8825
372	7	295	323	298	2	47	22	10512	3	9.5000	6	0.15	48.4500	0.8825
372	7	295	323	298	2	60	28	10512	4	34.0000	12	0.15	346.8000	0.8825
358	7	296	338	302	1	21	8	10513	1	10.0000	40	0.2	320.0000	35.2166
358	7	296	338	302	1	32	14	10513	2	32.0000	50	0.2	1280.0000	35.2166
358	7	296	338	302	1	61	29	10513	3	28.5000	15	0.2	342.0000	35.2166
328	3	296	324	320	2	20	8	10514	1	81.0000	39	0	3159.0000	157.9900
328	3	296	324	320	2	28	12	10514	2	45.6000	35	0	1596.0000	157.9900
328	3	296	324	320	2	56	26	10514	3	38.0000	70	0	2660.0000	157.9900
328	3	296	324	320	2	65	2	10514	4	21.0500	39	0	820.9500	157.9900
328	3	296	324	320	2	75	12	10514	5	7.7500	50	0	387.5000	157.9900
366	2	297	311	327	1	9	4	10515	1	97.0000	16	0.15	1319.2001	40.8940
366	2	297	311	327	1	16	7	10515	2	17.4500	50	0	872.5001	40.8940
366	2	297	311	327	1	27	11	10515	3	43.9000	120	0	5268.0000	40.8940
366	2	297	311	327	1	33	15	10515	4	2.5000	16	0.15	34.0000	40.8940
366	2	297	311	327	1	60	28	10515	5	34.0000	84	0.15	2427.6001	40.8940
387	3	298	326	303	3	52	24	10517	1	7.0000	6	0	42.0000	10.6900
387	3	298	326	303	3	59	28	10517	2	55.0000	4	0	220.0000	10.6900
387	3	298	326	303	3	70	7	10517	3	15.0000	6	0	90.0000	10.6900
354	4	299	313	309	2	24	10	10518	1	4.5000	5	0	22.5000	72.7166
354	4	299	313	309	2	38	18	10518	2	263.5000	15	0	3952.5000	72.7166
354	4	299	313	309	2	44	20	10518	3	19.4500	9	0	175.0500	72.7166
326	6	302	330	305	3	10	4	10519	1	31.0000	16	0.05	471.2000	30.5866
326	6	302	330	305	3	56	26	10519	2	38.0000	40	0	1520.0000	30.5866
326	6	302	330	305	3	60	28	10519	3	34.0000	10	0.05	323.0000	30.5866
351	7	303	331	305	1	24	10	10520	1	4.5000	8	0	36.0000	6.6850
351	7	303	331	305	1	53	24	10520	2	32.8000	5	0	164.0000	6.6850
324	8	303	331	306	2	35	16	10521	1	18.0000	3	0	54.0000	5.7400
324	8	303	331	306	2	41	19	10521	2	9.6500	10	0	96.5000	5.7400
324	8	303	331	306	2	68	8	10521	3	12.5000	6	0	75.0000	5.7400
363	4	304	332	310	1	1	1	10522	1	18.0000	40	0.2	576.0000	11.3325
363	4	304	332	310	1	8	3	10522	2	40.0000	24	0	960.0000	11.3325
363	4	304	332	310	1	30	13	10522	3	25.8900	20	0.2	414.2400	11.3325
363	4	304	332	310	1	40	19	10522	4	18.4000	25	0.2	368.0000	11.3325
388	7	305	333	334	2	17	7	10523	1	39.0000	25	0.1	877.4999	19.4075
388	7	305	333	334	2	20	8	10523	2	81.0000	15	0.1	1093.5000	19.4075
388	7	305	333	334	2	37	17	10523	3	26.0000	18	0.1	421.2000	19.4075
388	7	305	333	334	2	41	19	10523	4	9.6500	6	0.1	52.1100	19.4075
319	1	305	333	311	2	10	4	10524	1	31.0000	2	0	62.0000	61.1975
319	1	305	333	311	2	30	13	10524	2	25.8900	10	0	258.9000	61.1975
319	1	305	333	311	2	43	20	10524	3	46.0000	60	0	2760.0000	61.1975
319	1	305	333	311	2	54	25	10524	4	7.4500	15	0	111.7500	61.1975
323	1	306	334	327	2	36	17	10525	1	19.0000	30	0	570.0000	5.5300
323	1	306	334	327	2	40	19	10525	2	18.4000	15	0.1	248.4000	5.5300
359	4	309	337	319	2	1	1	10526	1	18.0000	8	0.15	122.4000	19.5300
359	4	309	337	319	2	13	6	10526	2	6.0000	10	0	60.0000	19.5300
359	4	309	337	319	2	56	26	10526	3	38.0000	30	0.15	969.0000	19.5300
366	7	309	337	311	1	4	2	10527	1	22.0000	50	0.1	989.9999	20.9500
366	7	309	337	311	1	36	17	10527	2	19.0000	30	0.1	513.0000	20.9500
389	6	310	324	313	2	11	5	10528	1	21.0000	3	0	63.0000	1.1166
389	6	310	324	313	2	33	15	10528	2	2.5000	8	0.2	16.0000	1.1166
389	6	310	324	313	2	72	14	10528	3	34.8000	9	0	313.2000	1.1166
341	5	311	339	313	2	55	25	10529	1	24.0000	14	0	336.0000	22.2300
341	5	311	339	313	2	68	8	10529	2	12.5000	20	0	250.0000	22.2300
341	5	311	339	313	2	69	15	10529	3	36.0000	10	0	360.0000	22.2300
345	3	312	340	316	2	17	7	10530	1	39.0000	40	0	1560.0000	84.8050
345	3	312	340	316	2	43	20	10530	2	46.0000	25	0	1150.0000	84.8050
345	3	312	340	316	2	61	29	10530	3	28.5000	20	0	570.0000	84.8050
345	3	312	340	316	2	76	23	10530	4	18.0000	50	0	900.0000	84.8050
342	7	312	340	323	1	59	28	10531	1	55.0000	2	0	110.0000	8.1200
386	7	313	341	316	3	30	13	10532	1	25.8900	15	0	388.3500	37.2300
386	7	313	341	316	3	66	2	10532	2	17.0000	24	0	408.0000	37.2300
331	8	316	344	326	1	4	2	10533	1	22.0000	50	0.05	1045.0000	62.6800
331	8	316	344	326	1	72	14	10533	2	34.8000	24	0	835.2000	62.6800
331	8	316	344	326	1	73	17	10533	3	15.0000	24	0.05	342.0000	62.6800
363	8	316	344	318	2	30	13	10534	1	25.8900	10	0	258.9000	9.3133
363	8	316	344	318	2	40	19	10534	2	18.4000	10	0.2	147.2000	9.3133
363	8	316	344	318	2	54	25	10534	3	7.4500	10	0.2	59.6000	9.3133
318	4	317	345	325	1	11	5	10535	1	21.0000	50	0.1	945.0000	3.9100
318	4	317	345	325	1	40	19	10535	2	18.4000	10	0.1	165.6000	3.9100
318	4	317	345	325	1	57	26	10535	3	19.5000	5	0.1	87.7500	3.9100
318	4	317	345	325	1	59	28	10535	4	55.0000	15	0.1	742.5000	3.9100
363	3	318	346	341	2	12	5	10536	1	38.0000	15	0.25	427.5000	14.7200
363	3	318	346	341	2	31	14	10536	2	12.5000	20	0	250.0000	14.7200
363	3	318	346	341	2	33	15	10536	3	2.5000	30	0	75.0000	14.7200
363	3	318	346	341	2	60	28	10536	4	34.0000	35	0.25	892.5000	14.7200
349	1	318	332	323	1	31	14	10537	1	12.5000	30	0	375.0000	15.7700
349	1	318	332	323	1	51	24	10537	2	53.0000	6	0	318.0000	15.7700
349	1	318	332	323	1	58	27	10537	3	13.2500	20	0	265.0000	15.7700
349	1	318	332	323	1	72	14	10537	4	34.8000	21	0	730.8000	15.7700
349	1	318	332	323	1	73	17	10537	5	15.0000	9	0	135.0000	15.7700
384	9	319	347	320	3	70	7	10538	1	15.0000	7	0	105.0000	2.4350
384	9	319	347	320	3	72	14	10538	2	34.8000	1	0	34.8000	2.4350
384	6	320	348	327	3	13	6	10539	1	6.0000	8	0	48.0000	3.0900
384	6	320	348	327	3	21	8	10539	2	10.0000	15	0	150.0000	3.0900
384	6	320	348	327	3	33	15	10539	3	2.5000	15	0	37.5000	3.0900
384	6	320	348	327	3	49	23	10539	4	20.0000	6	0	120.0000	3.0900
366	3	323	351	348	3	3	1	10540	1	10.0000	60	0	600.0000	251.9100
366	3	323	351	348	3	26	11	10540	2	31.2300	40	0	1249.2000	251.9100
366	3	323	351	348	3	38	18	10540	3	263.5000	30	0	7905.0000	251.9100
366	3	323	351	348	3	68	8	10540	4	12.5000	35	0	437.5000	251.9100
375	2	323	351	333	1	24	10	10541	1	4.5000	35	0.1	141.7500	17.1625
375	2	323	351	333	1	38	18	10541	2	263.5000	4	0.1	948.6000	17.1625
375	2	323	351	333	1	65	2	10541	3	21.0500	36	0.1	682.0200	17.1625
375	2	323	351	333	1	71	15	10541	4	21.5000	9	0.1	174.1500	17.1625
337	1	324	352	330	3	11	5	10542	1	21.0000	15	0.05	299.2500	5.4750
337	1	324	352	330	3	54	25	10542	2	7.4500	24	0.05	169.8600	5.4750
313	8	325	353	327	2	12	5	10543	1	38.0000	30	0.15	969.0000	24.0850
313	8	325	353	327	2	23	9	10543	2	9.0000	70	0.15	535.5000	24.0850
393	4	325	353	334	1	28	12	10544	1	45.6000	7	0	319.2000	12.4550
393	4	325	353	334	1	67	16	10544	2	14.0000	7	0	98.0000	12.4550
391	8	326	354	361	2	11	5	10545	1	21.0000	10	0	210.0000	11.9200
356	1	327	355	331	3	7	3	10546	1	30.0000	10	0	300.0000	64.9066
356	1	327	355	331	3	35	16	10546	2	18.0000	30	0	540.0000	64.9066
356	1	327	355	331	3	62	29	10546	3	49.3000	40	0	1972.0000	64.9066
388	3	327	355	337	2	32	14	10547	1	32.0000	24	0.15	652.8000	89.2150
388	3	327	355	337	2	36	17	10547	2	19.0000	60	0	1140.0000	89.2150
368	3	330	358	337	2	34	16	10548	1	14.0000	10	0.25	105.0000	0.7150
368	3	330	358	337	2	41	19	10548	2	9.6500	14	0	135.1000	0.7150
366	5	331	345	334	1	31	14	10549	1	12.5000	55	0.15	584.3750	57.0800
366	5	331	345	334	1	45	21	10549	2	9.5000	100	0.15	807.5000	57.0800
366	5	331	345	334	1	51	24	10549	3	53.0000	48	0.15	2162.4001	57.0800
336	7	332	360	341	3	17	7	10550	1	39.0000	8	0.1	280.8000	1.0800
336	7	332	360	341	3	19	8	10550	2	9.2000	10	0	92.0000	1.0800
336	7	332	360	341	3	21	8	10550	3	10.0000	6	0.1	54.0000	1.0800
336	7	332	360	341	3	61	29	10550	4	28.5000	10	0.1	256.5000	1.0800
334	4	332	374	341	3	16	7	10551	1	17.4500	40	0.15	593.3000	24.3166
334	4	332	374	341	3	35	16	10551	2	18.0000	20	0.15	306.0000	24.3166
334	4	332	374	341	3	44	20	10551	3	19.4500	40	0	778.0000	24.3166
312	2	333	361	340	1	69	15	10552	1	36.0000	18	0	648.0000	41.6100
312	2	333	361	340	1	75	12	10552	2	7.7500	30	0	232.5000	41.6100
359	2	334	362	338	2	11	5	10553	1	21.0000	15	0	315.0000	29.8980
359	2	334	362	338	2	16	7	10553	2	17.4500	14	0	244.3000	29.8980
359	2	334	362	338	2	22	9	10553	3	21.0000	24	0	504.0000	29.8980
359	2	334	362	338	2	31	14	10553	4	12.5000	30	0	375.0000	29.8980
359	2	334	362	338	2	35	16	10553	5	18.0000	6	0	108.0000	29.8980
365	4	334	362	340	3	16	7	10554	1	17.4500	30	0.05	497.3250	30.2425
365	4	334	362	340	3	23	9	10554	2	9.0000	20	0.05	171.0000	30.2425
365	4	334	362	340	3	62	29	10554	3	49.3000	20	0.05	936.7000	30.2425
365	4	334	362	340	3	77	12	10554	4	13.0000	10	0.05	123.5000	30.2425
396	6	337	365	339	3	14	6	10555	1	23.2500	30	0.2	558.0000	50.4980
396	6	337	365	339	3	19	8	10555	2	9.2000	35	0.2	257.6000	50.4980
396	6	337	365	339	3	24	10	10555	3	4.5000	18	0.2	64.8000	50.4980
396	6	337	365	339	3	51	24	10555	4	53.0000	20	0.2	848.0000	50.4980
396	6	337	365	339	3	56	26	10555	5	38.0000	40	0.2	1216.0000	50.4980
367	2	338	380	348	1	72	14	10556	1	34.8000	24	0	835.2000	9.8000
363	9	338	352	341	2	64	12	10557	1	33.2500	30	0	997.5000	48.3600
363	9	338	352	341	2	75	12	10557	2	7.7500	20	0	155.0000	48.3600
383	1	339	367	345	2	47	22	10558	1	9.5000	25	0	237.5000	14.5940
383	1	339	367	345	2	51	24	10558	2	53.0000	20	0	1060.0000	14.5940
383	1	339	367	345	2	52	24	10558	3	7.0000	30	0	210.0000	14.5940
383	1	339	367	345	2	53	24	10558	4	32.8000	18	0	590.4000	14.5940
383	1	339	367	345	2	73	17	10558	5	15.0000	3	0	45.0000	14.5940
321	6	340	368	348	1	41	19	10559	1	9.6500	12	0.05	110.0100	4.0250
321	6	340	368	348	1	55	25	10559	2	24.0000	18	0.05	410.4000	4.0250
362	8	341	369	344	1	30	13	10560	1	25.8900	20	0	517.8000	18.3250
362	8	341	369	344	1	62	29	10560	2	49.3000	15	0.25	554.6250	18.3250
331	2	341	369	344	2	44	20	10561	1	19.4500	10	0	194.5000	121.1050
331	2	341	369	344	2	51	24	10561	2	53.0000	50	0	2650.0000	121.1050
348	1	344	372	347	1	33	15	10562	1	2.5000	20	0.1	45.0000	11.4750
348	1	344	372	347	1	62	29	10562	2	49.3000	10	0.1	443.7000	11.4750
379	2	345	387	359	2	36	17	10563	1	19.0000	25	0	475.0000	30.2150
379	2	345	387	359	2	52	24	10563	2	7.0000	70	0	490.0000	30.2150
395	4	345	373	351	3	17	7	10564	1	39.0000	16	0.05	592.8000	4.5833
395	4	345	373	351	3	31	14	10564	2	12.5000	6	0.05	71.2500	4.5833
395	4	345	373	351	3	55	25	10564	3	24.0000	25	0.05	570.0000	4.5833
315	8	346	374	353	2	24	10	10565	1	4.5000	25	0.1	101.2500	3.5750
315	8	346	374	353	2	64	12	10565	2	33.2500	18	0.1	538.6500	3.5750
321	9	347	375	353	1	11	5	10566	1	21.0000	35	0.15	624.7500	29.4666
321	9	347	375	353	1	18	7	10566	2	62.5000	18	0.15	956.2500	29.4666
321	9	347	375	353	1	76	23	10566	3	18.0000	10	0	180.0000	29.4666
335	3	348	376	374	3	10	4	10568	1	31.0000	5	0	155.0000	6.5400
395	5	351	379	376	1	31	14	10569	1	12.5000	35	0.2	350.0000	29.4900
395	5	351	379	376	1	76	23	10569	2	18.0000	30	0	540.0000	29.4900
315	3	352	380	354	3	11	5	10570	1	21.0000	15	0.05	299.2500	94.4950
315	3	352	380	354	3	56	26	10570	2	38.0000	60	0.05	2166.0000	94.4950
328	8	352	394	369	3	14	6	10571	1	23.2500	11	0.15	217.3875	13.0300
328	8	352	394	369	3	42	20	10571	2	14.0000	28	0.15	333.2000	13.0300
319	3	353	381	360	2	16	7	10572	1	17.4500	12	0.1	188.4600	29.1075
319	3	353	381	360	2	32	14	10572	2	32.0000	10	0.1	288.0000	29.1075
319	3	353	381	360	2	40	19	10572	3	18.4000	50	0	920.0000	29.1075
319	3	353	381	360	2	75	12	10572	4	7.7500	15	0.1	104.6250	29.1075
318	7	354	382	355	3	17	7	10573	1	39.0000	18	0	702.0000	28.2800
318	7	354	382	355	3	34	16	10573	2	14.0000	40	0	560.0000	28.2800
318	7	354	382	355	3	53	24	10573	3	32.8000	25	0	820.0000	28.2800
400	4	354	382	365	2	33	15	10574	1	2.5000	14	0	35.0000	9.4000
400	4	354	382	365	2	40	19	10574	2	18.4000	2	0	36.8000	9.4000
400	4	354	382	365	2	62	29	10574	3	49.3000	10	0	493.0000	9.4000
400	4	354	382	365	2	64	12	10574	4	33.2500	6	0	199.5000	9.4000
364	5	355	369	365	1	59	28	10575	1	55.0000	12	0	660.0000	31.8350
364	5	355	369	365	1	63	7	10575	2	43.9000	6	0	263.4000	31.8350
364	5	355	369	365	1	72	14	10575	3	34.8000	30	0	1044.0000	31.8350
364	5	355	369	365	1	76	23	10575	4	18.0000	10	0	180.0000	31.8350
354	3	358	372	365	3	1	1	10576	1	18.0000	10	0	180.0000	6.1866
354	3	358	372	365	3	31	14	10576	2	12.5000	20	0	250.0000	6.1866
354	3	358	372	365	3	44	20	10576	3	19.4500	21	0	408.4500	6.1866
400	9	358	400	365	2	39	18	10577	1	18.0000	10	0	180.0000	8.4700
400	9	358	400	365	2	75	12	10577	2	7.7500	20	0	155.0000	8.4700
400	9	358	400	365	2	77	12	10577	3	13.0000	18	0	234.0000	8.4700
384	4	359	387	390	3	35	16	10578	1	18.0000	20	0	360.0000	14.8000
384	4	359	387	390	3	57	26	10578	2	19.5000	6	0	117.0000	14.8000
392	1	360	388	369	2	15	6	10579	1	15.5000	10	0	155.0000	6.8650
392	1	360	388	369	2	75	12	10579	2	7.7500	21	0	162.7500	6.8650
365	4	361	389	366	3	14	6	10580	1	23.2500	15	0.05	331.3125	25.2966
365	4	361	389	366	3	41	19	10580	2	9.6500	9	0.05	82.5075	25.2966
365	4	361	389	366	3	65	2	10580	3	21.0500	30	0.05	599.9250	25.2966
372	3	361	389	367	1	75	12	10581	1	7.7500	50	0.2	310.0000	3.0100
320	3	362	390	379	2	57	26	10582	1	19.5000	4	0	78.0000	13.8550
320	3	362	390	379	2	76	23	10582	2	18.0000	14	0	252.0000	13.8550
359	2	365	393	369	2	29	12	10583	1	123.7900	10	0	1237.9000	2.4266
359	2	365	393	369	2	60	28	10583	2	34.0000	24	0.15	693.6000	2.4266
359	2	365	393	369	2	69	15	10583	3	36.0000	10	0.15	306.0000	2.4266
321	4	365	393	369	1	31	14	10584	1	12.5000	50	0.05	593.7500	59.1400
381	7	366	394	375	1	47	22	10585	1	9.5000	15	0	142.5000	13.4100
348	9	367	395	374	1	52	24	10586	1	7.0000	4	0.15	23.8000	0.4800
377	1	367	395	374	1	26	11	10587	1	31.2300	6	0	187.3800	20.8400
377	1	367	395	374	1	35	16	10587	2	18.0000	20	0	360.0000	20.8400
377	1	367	395	374	1	77	12	10587	3	13.0000	20	0	260.0000	20.8400
366	2	368	396	375	3	18	7	10588	1	62.5000	40	0.2	2000.0000	97.3350
366	2	368	396	375	3	42	20	10588	2	14.0000	100	0.2	1120.0000	97.3350
389	8	369	397	379	2	35	16	10589	1	18.0000	4	0	72.0000	4.4200
315	4	372	400	379	3	1	1	10590	1	18.0000	20	0	360.0000	22.3850
315	4	372	400	379	3	77	12	10590	2	13.0000	60	0.05	740.9999	22.3850
355	1	372	386	381	1	3	1	10591	1	10.0000	14	0	140.0000	18.6400
355	1	372	386	381	1	7	3	10591	2	30.0000	10	0	300.0000	18.6400
355	1	372	386	381	1	54	25	10591	3	7.4500	50	0	372.5000	18.6400
363	3	373	401	381	1	15	6	10592	1	15.5000	25	0.05	368.1250	16.0500
363	3	373	401	381	1	26	11	10592	2	31.2300	5	0.05	148.3425	16.0500
363	7	374	402	409	2	20	8	10593	1	81.0000	21	0.2	1360.8000	58.0666
363	7	374	402	409	2	69	15	10593	2	36.0000	20	0.2	576.0000	58.0666
363	7	374	402	409	2	76	23	10593	3	18.0000	4	0.2	57.6000	58.0666
394	3	374	402	381	2	52	24	10594	1	7.0000	24	0	168.0000	2.6200
394	3	374	402	381	2	58	27	10594	2	13.2500	30	0	397.5000	2.6200
328	2	375	403	379	1	35	16	10595	1	18.0000	30	0.25	405.0000	32.2600
328	2	375	403	379	1	61	29	10595	2	28.5000	120	0.25	2565.0000	32.2600
328	2	375	403	379	1	69	15	10595	3	36.0000	65	0.25	1755.0000	32.2600
401	8	376	404	408	1	56	26	10596	1	38.0000	5	0.2	152.0000	5.4466
401	8	376	404	408	1	63	7	10596	2	43.9000	24	0.2	842.8801	5.4466
401	8	376	404	408	1	75	12	10596	3	7.7500	30	0.2	186.0000	5.4466
345	7	376	404	383	3	24	10	10597	1	4.5000	35	0.2	126.0000	11.7066
345	7	376	404	383	3	57	26	10597	2	19.5000	20	0	390.0000	11.7066
345	7	376	404	383	3	65	2	10597	3	21.0500	12	0.2	202.0800	11.7066
395	1	379	407	383	3	27	11	10598	1	43.9000	50	0	2195.0000	22.2100
395	1	379	407	383	3	71	15	10598	2	21.5000	9	0	193.5000	22.2100
384	6	380	422	386	3	62	29	10599	1	49.3000	10	0	493.0000	29.9800
390	4	381	409	386	1	54	25	10600	1	7.4500	4	0	29.8000	22.5650
390	4	381	409	386	1	73	17	10600	2	15.0000	30	0	450.0000	22.5650
312	7	381	423	387	1	13	6	10601	1	6.0000	60	0	360.0000	29.1500
312	7	381	423	387	1	59	28	10601	2	55.0000	35	0	1925.0000	29.1500
355	8	382	410	387	2	77	12	10602	1	13.0000	5	0.25	48.7500	2.9200
396	8	383	411	404	2	22	9	10603	1	21.0000	48	0	1008.0000	24.3850
396	8	383	411	404	2	49	23	10603	2	20.0000	25	0.05	475.0000	24.3850
334	1	383	411	394	1	48	22	10604	1	12.7500	6	0.1	68.8500	3.7300
334	1	383	411	394	1	76	23	10604	2	18.0000	10	0.1	162.0000	3.7300
315	1	386	414	394	2	16	7	10605	1	17.4500	30	0.05	497.3250	94.7825
315	1	386	414	394	2	59	28	10605	2	55.0000	20	0.05	1045.0000	94.7825
315	1	386	414	394	2	60	28	10605	3	34.0000	70	0.05	2261.0000	94.7825
315	1	386	414	394	2	71	15	10605	4	21.5000	15	0.05	306.3750	94.7825
380	4	387	415	396	3	4	2	10606	1	22.0000	20	0.2	352.0000	26.4666
380	4	387	415	396	3	55	25	10606	2	24.0000	20	0.2	384.0000	26.4666
380	4	387	415	396	3	62	29	10606	3	49.3000	10	0.2	394.4000	26.4666
396	5	387	415	390	1	7	3	10607	1	30.0000	45	0	1350.0000	40.0480
396	5	387	415	390	1	17	7	10607	2	39.0000	100	0	3900.0000	40.0480
396	5	387	415	390	1	33	15	10607	3	2.5000	14	0	35.0000	40.0480
396	5	387	415	390	1	40	19	10607	4	18.4000	42	0	772.8000	40.0480
396	5	387	415	390	1	72	14	10607	5	34.8000	12	0	417.6000	40.0480
368	4	388	416	397	2	56	26	10608	1	38.0000	28	0	1064.0000	27.7900
327	7	389	417	395	2	1	1	10609	1	18.0000	3	0	54.0000	0.6166
327	7	389	417	395	2	10	4	10609	2	31.0000	10	0	310.0000	0.6166
327	7	389	417	395	2	21	8	10609	3	10.0000	6	0	60.0000	0.6166
339	8	390	418	402	1	36	17	10610	1	19.0000	21	0.25	299.2500	26.7800
360	6	390	418	397	2	1	1	10611	1	18.0000	6	0	108.0000	26.8833
360	6	390	418	397	2	2	1	10611	2	19.0000	10	0	190.0000	26.8833
360	6	390	418	397	2	60	28	10611	3	34.0000	15	0	510.0000	26.8833
396	1	393	421	397	2	10	4	10612	1	31.0000	70	0	2170.0000	108.8160
396	1	393	421	397	2	36	17	10612	2	19.0000	55	0	1045.0000	108.8160
396	1	393	421	397	2	49	23	10612	3	20.0000	18	0	360.0000	108.8160
396	1	393	421	397	2	60	28	10612	4	34.0000	40	0	1360.0000	108.8160
396	1	393	421	397	2	76	23	10612	5	18.0000	80	0	1440.0000	108.8160
312	4	394	422	397	2	13	6	10613	1	6.0000	8	0.1	43.2000	4.0550
312	4	394	422	397	2	75	12	10613	2	7.7500	40	0	310.0000	4.0550
320	8	394	422	397	3	11	5	10614	1	21.0000	14	0	294.0000	0.6433
320	8	394	422	397	3	21	8	10614	2	10.0000	8	0	80.0000	0.6433
320	8	394	422	397	3	39	18	10614	3	18.0000	5	0	90.0000	0.6433
369	2	395	423	402	3	55	25	10615	1	24.0000	5	0	120.0000	0.7500
389	1	396	424	401	2	38	18	10616	1	263.5000	15	0.05	3754.8750	29.1325
389	1	396	424	401	2	56	26	10616	2	38.0000	14	0	532.0000	29.1325
389	1	396	424	401	2	70	7	10616	3	15.0000	15	0.05	213.7500	29.1325
389	1	396	424	401	2	71	15	10616	4	21.5000	15	0.05	306.3750	29.1325
389	4	396	424	400	2	59	28	10617	1	55.0000	30	0.15	1402.5000	18.5300
315	1	397	439	404	1	6	3	10618	1	25.0000	70	0	1750.0000	51.5600
315	1	397	439	404	1	56	26	10618	2	38.0000	20	0	760.0000	51.5600
315	1	397	439	404	1	68	8	10618	3	12.5000	15	0	187.5000	51.5600
315	3	400	428	403	3	21	8	10619	1	10.0000	42	0	420.0000	45.5250
315	3	400	428	403	3	22	9	10619	2	21.0000	40	0	840.0000	45.5250
376	2	401	429	410	3	24	10	10620	1	4.5000	5	0	22.5000	0.4700
376	2	401	429	410	3	52	24	10620	2	7.0000	5	0	35.0000	0.4700
382	4	401	429	407	2	19	8	10621	1	9.2000	5	0	46.0000	5.9325
382	4	401	429	407	2	23	9	10621	2	9.0000	10	0	90.0000	5.9325
382	4	401	429	407	2	70	7	10621	3	15.0000	20	0	300.0000	5.9325
382	4	401	429	407	2	71	15	10621	4	21.5000	15	0	322.5000	5.9325
379	4	402	430	407	3	2	1	10622	1	19.0000	20	0	380.0000	25.4850
379	4	402	430	407	3	68	8	10622	2	12.5000	18	0.2	180.0000	25.4850
362	8	403	431	408	2	14	6	10623	1	23.2500	21	0	488.2500	19.4360
362	8	403	431	408	2	19	8	10623	2	9.2000	15	0.1	124.2000	19.4360
362	8	403	431	408	2	21	8	10623	3	10.0000	25	0.1	225.0000	19.4360
362	8	403	431	408	2	24	10	10623	4	4.5000	3	0	13.5000	19.4360
362	8	403	431	408	2	35	16	10623	5	18.0000	30	0.1	486.0000	19.4360
399	4	403	431	415	2	28	12	10624	1	45.6000	10	0	456.0000	31.6000
399	4	403	431	415	2	29	12	10624	2	123.7900	6	0	742.7400	31.6000
399	4	403	431	415	2	44	20	10624	3	19.4500	10	0	194.5000	31.6000
317	3	404	432	410	1	14	6	10625	1	23.2500	3	0	69.7500	14.6333
317	3	404	432	410	1	42	20	10625	2	14.0000	5	0	70.0000	14.6333
317	3	404	432	410	1	60	28	10625	3	34.0000	10	0	340.0000	14.6333
319	1	407	435	416	2	53	24	10626	1	32.8000	12	0	393.6000	46.2300
319	1	407	435	416	2	60	28	10626	2	34.0000	20	0	680.0000	46.2300
319	1	407	435	416	2	71	15	10626	3	21.5000	20	0	430.0000	46.2300
396	8	407	449	417	3	62	29	10627	1	49.3000	15	0	739.5000	53.7300
396	8	407	449	417	3	73	17	10627	2	15.0000	35	0.15	446.2500	53.7300
321	4	408	436	416	3	1	1	10628	1	18.0000	25	0	450.0000	30.3600
336	4	408	436	416	3	29	12	10629	1	123.7900	20	0	2475.8000	42.7300
336	4	408	436	416	3	64	12	10629	2	33.2500	9	0	299.2500	42.7300
337	1	409	437	415	2	55	25	10630	1	24.0000	12	0.05	273.6000	16.1750
337	1	409	437	415	2	76	23	10630	2	18.0000	35	0	630.0000	16.1750
339	8	410	438	411	1	75	12	10631	1	7.7500	8	0.1	55.8000	0.8700
358	8	410	438	415	1	2	1	10632	1	19.0000	30	0.05	541.5000	20.6900
358	8	410	438	415	1	33	15	10632	2	2.5000	20	0.05	47.5000	20.6900
328	7	411	439	414	3	12	5	10633	1	38.0000	36	0.15	1162.7999	119.4750
328	7	411	439	414	3	13	6	10633	2	6.0000	13	0.15	66.3000	119.4750
328	7	411	439	414	3	26	11	10633	3	31.2300	35	0.15	929.0925	119.4750
328	7	411	439	414	3	62	29	10633	4	49.3000	80	0.15	3352.3999	119.4750
330	4	411	439	417	3	7	3	10634	1	30.0000	35	0	1050.0000	121.8450
330	4	411	439	417	3	18	7	10634	2	62.5000	50	0	3125.0000	121.8450
330	4	411	439	417	3	51	24	10634	3	53.0000	15	0	795.0000	121.8450
330	4	411	439	417	3	75	12	10634	4	7.7500	2	0	15.5000	121.8450
340	8	414	442	417	3	4	2	10635	1	22.0000	10	0.1	198.0000	15.8200
340	8	414	442	417	3	5	2	10635	2	21.3500	15	0.1	288.2250	15.8200
340	8	414	442	417	3	22	9	10635	3	21.0000	40	0	840.0000	15.8200
359	4	415	443	422	1	4	2	10636	1	22.0000	25	0	550.0000	0.5750
359	4	415	443	422	1	58	27	10636	2	13.2500	6	0	79.5000	0.5750
378	6	415	443	422	1	11	5	10637	1	21.0000	10	0	210.0000	67.0966
378	6	415	443	422	1	50	23	10637	2	16.2500	25	0.05	385.9375	67.0966
378	6	415	443	422	1	56	26	10637	3	38.0000	60	0.05	2166.0000	67.0966
314	3	416	444	428	1	45	21	10638	1	9.5000	20	0	190.0000	52.8133
314	3	416	444	428	1	65	2	10638	2	21.0500	21	0	442.0500	52.8133
314	3	416	444	428	1	72	14	10638	3	34.8000	60	0	2088.0000	52.8133
351	7	416	444	423	3	18	7	10639	1	62.5000	8	0	500.0000	38.6400
358	4	417	445	424	1	69	15	10640	1	36.0000	20	0.25	540.0000	11.7750
358	4	417	445	424	1	70	7	10640	2	15.0000	15	0.25	168.7500	11.7750
312	4	418	446	422	2	2	1	10641	1	19.0000	50	0	950.0000	89.8050
312	4	418	446	422	2	40	19	10641	2	18.4000	60	0	1104.0000	89.8050
367	7	418	446	432	3	21	8	10642	1	10.0000	30	0.2	240.0000	20.9450
367	7	418	446	432	3	61	29	10642	2	28.5000	20	0.2	456.0000	20.9450
316	6	421	449	429	1	28	12	10643	1	45.6000	15	0.25	512.9999	9.8200
316	6	421	449	429	1	39	18	10643	2	18.0000	21	0.25	283.5000	9.8200
316	6	421	449	429	1	46	21	10643	3	12.0000	2	0.25	18.0000	9.8200
381	3	421	449	428	2	18	7	10644	1	62.5000	4	0.1	225.0000	0.0466
381	3	421	449	428	2	43	20	10644	2	46.0000	20	0	920.0000	0.0466
381	3	421	449	428	2	46	21	10644	3	12.0000	21	0.1	226.8000	0.0466
375	4	422	450	429	1	18	7	10645	1	62.5000	20	0	1250.0000	6.2050
375	4	422	450	429	1	36	17	10645	2	19.0000	15	0	285.0000	6.2050
377	4	423	437	430	2	19	8	10647	1	9.2000	30	0	276.0000	22.7700
377	4	423	437	430	2	39	18	10647	2	18.0000	20	0	360.0000	22.7700
379	5	424	466	436	2	22	9	10648	1	21.0000	15	0	315.0000	7.1250
379	5	424	466	436	2	24	10	10648	2	4.5000	15	0.15	57.3750	7.1250
341	5	424	452	425	3	28	12	10649	1	45.6000	20	0	912.0000	3.1000
341	5	424	452	425	3	72	14	10649	2	34.8000	15	0	522.0000	3.1000
372	5	425	453	430	3	30	13	10650	1	25.8900	30	0	776.7000	58.9366
372	5	425	453	430	3	53	24	10650	2	32.8000	25	0.05	778.9999	58.9366
372	5	425	453	430	3	54	25	10650	3	7.4500	30	0	223.5000	58.9366
358	8	428	456	438	2	19	8	10651	1	9.2000	12	0.25	82.8000	10.3000
358	8	428	456	438	2	22	9	10651	2	21.0000	20	0.25	315.0000	10.3000
373	4	428	456	435	2	30	13	10652	1	25.8900	2	0.25	38.8350	3.5700
373	4	428	456	435	2	42	20	10652	2	14.0000	20	0	280.0000	3.5700
362	1	429	457	446	1	16	7	10653	1	17.4500	30	0.1	471.1500	46.6250
362	1	429	457	446	1	60	28	10653	2	34.0000	20	0.1	612.0000	46.6250
319	5	429	457	438	1	4	2	10654	1	22.0000	12	0.1	237.6000	18.4200
319	5	429	457	438	1	39	18	10654	2	18.0000	20	0.1	324.0000	18.4200
319	5	429	457	438	1	54	25	10654	3	7.4500	6	0.1	40.2300	18.4200
348	1	430	458	438	2	41	19	10655	1	9.6500	20	0.2	154.4000	4.4100
389	6	431	459	437	1	14	6	10656	1	23.2500	3	0.1	62.7750	19.0500
389	6	431	459	437	1	44	20	10656	2	19.4500	28	0.1	490.1400	19.0500
389	6	431	459	437	1	47	22	10656	3	9.5000	6	0.1	51.3000	19.0500
396	2	431	459	442	2	15	6	10657	1	15.5000	50	0	775.0000	58.7816
396	2	431	459	442	2	41	19	10657	2	9.6500	24	0	231.6000	58.7816
396	2	431	459	442	2	46	21	10657	3	12.0000	45	0	540.0000	58.7816
396	2	431	459	442	2	47	22	10657	4	9.5000	10	0	95.0000	58.7816
396	2	431	459	442	2	56	26	10657	5	38.0000	45	0	1710.0000	58.7816
396	2	431	459	442	2	60	28	10657	6	34.0000	30	0	1020.0000	58.7816
366	4	432	460	435	1	21	8	10658	1	10.0000	60	0	600.0000	91.0375
366	4	432	460	435	1	40	19	10658	2	18.4000	70	0.05	1223.6000	91.0375
366	4	432	460	435	1	60	28	10658	3	34.0000	55	0.05	1776.5000	91.0375
366	4	432	460	435	1	77	12	10658	4	13.0000	70	0.05	864.4999	91.0375
378	7	432	460	437	2	31	14	10659	1	12.5000	20	0.05	237.5000	35.2700
378	7	432	460	437	2	40	19	10659	2	18.4000	24	0.05	419.5200	35.2700
378	7	432	460	437	2	70	7	10659	3	15.0000	40	0.05	570.0000	35.2700
390	8	435	463	472	1	20	8	10660	1	81.0000	21	0	1701.0000	111.2900
393	3	436	464	445	2	68	8	10662	1	12.5000	10	0	125.0000	1.2800
323	2	437	451	460	2	40	19	10663	1	18.4000	30	0.05	524.4000	37.7166
323	2	437	451	460	2	42	20	10663	2	14.0000	30	0.05	399.0000	37.7166
323	2	437	451	460	2	51	24	10663	3	53.0000	20	0.05	1007.0000	37.7166
334	1	437	465	446	3	10	4	10664	1	31.0000	24	0.15	632.4000	0.4233
334	1	437	465	446	3	56	26	10664	2	38.0000	12	0.15	387.6000	0.4233
334	1	437	465	446	3	65	2	10664	3	21.0500	15	0.15	268.3875	0.4233
393	1	438	466	444	2	51	24	10665	1	53.0000	20	0	1060.0000	8.7700
393	1	438	466	444	2	59	28	10665	2	55.0000	1	0	55.0000	8.7700
393	1	438	466	444	2	76	23	10665	3	18.0000	10	0	180.0000	8.7700
349	7	439	467	449	2	29	12	10666	1	123.7900	36	0	4456.4399	116.2100
349	7	439	467	449	2	65	2	10666	2	21.0500	10	0	210.5000	116.2100
328	7	439	467	446	1	69	15	10667	1	36.0000	45	0.2	1296.0000	39.0450
328	7	439	467	446	1	71	15	10667	2	21.5000	14	0.2	240.8000	39.0450
358	1	442	470	450	2	31	14	10668	1	12.5000	8	0.1	90.0000	15.7400
358	1	442	470	450	2	55	25	10668	2	24.0000	4	0.1	86.4000	15.7400
358	1	442	470	450	2	64	12	10668	3	33.2500	15	0.1	448.8750	15.7400
367	2	442	470	449	1	36	17	10669	1	19.0000	30	0	570.0000	24.3900
362	4	443	471	445	1	23	9	10670	1	9.0000	32	0	288.0000	40.6960
362	4	443	471	445	1	46	21	10670	2	12.0000	60	0	720.0000	40.6960
362	4	443	471	445	1	67	16	10670	3	14.0000	25	0	350.0000	40.6960
362	4	443	471	445	1	73	17	10670	4	15.0000	50	0	750.0000	40.6960
362	4	443	471	445	1	75	12	10670	5	7.7500	25	0	193.7500	40.6960
332	1	444	472	451	1	16	7	10671	1	17.4500	10	0	174.5000	10.1133
332	1	444	472	451	1	62	29	10671	2	49.3000	10	0	493.0000	10.1133
332	1	444	472	451	1	65	2	10671	3	21.0500	12	0	252.6000	10.1133
319	9	444	458	453	2	38	18	10672	1	263.5000	15	0.1	3557.2500	47.8750
319	9	444	458	453	2	71	15	10672	2	21.5000	12	0	258.0000	47.8750
369	2	445	473	446	1	16	7	10673	1	17.4500	3	0	52.3500	7.5866
369	2	445	473	446	1	42	20	10673	2	14.0000	6	0	84.0000	7.5866
369	2	445	473	446	1	43	20	10673	3	46.0000	6	0	276.0000	7.5866
382	4	445	473	457	2	23	9	10674	1	9.0000	5	0	45.0000	0.9000
362	5	446	474	450	2	14	6	10675	1	23.2500	30	0	697.5000	10.6166
362	5	446	474	450	2	53	24	10675	2	32.8000	10	0	328.0000	10.6166
362	5	446	474	450	2	58	27	10675	3	13.2500	30	0	397.5000	10.6166
354	2	449	477	456	2	10	4	10676	1	31.0000	2	0	62.0000	0.6700
354	2	449	477	456	2	19	8	10676	2	9.2000	7	0	64.4000	0.6700
354	2	449	477	456	2	44	20	10676	3	19.4500	21	0	408.4500	0.6700
318	1	449	477	453	3	26	11	10677	1	31.2300	30	0.15	796.3650	2.0150
318	1	449	477	453	3	33	15	10677	2	2.5000	8	0.15	17.0000	2.0150
396	7	450	478	473	3	12	5	10678	1	38.0000	100	0	3800.0000	97.2450
396	7	450	478	473	3	33	15	10678	2	2.5000	30	0	75.0000	97.2450
396	7	450	478	473	3	41	19	10678	3	9.6500	120	0	1158.0000	97.2450
396	7	450	478	473	3	54	25	10678	4	7.4500	30	0	223.5000	97.2450
321	8	450	478	457	3	59	28	10679	1	55.0000	12	0	660.0000	27.9400
394	1	451	479	453	1	16	7	10680	1	17.4500	50	0.25	654.3750	8.8700
394	1	451	479	453	1	31	14	10680	2	12.5000	20	0.25	187.5000	8.8700
394	1	451	479	453	1	42	20	10680	3	14.0000	40	0.25	420.0000	8.8700
389	3	452	480	457	3	19	8	10681	1	9.2000	30	0.1	248.4000	25.3766
389	3	452	480	457	3	21	8	10681	2	10.0000	12	0.1	108.0000	25.3766
389	3	452	480	457	3	64	12	10681	3	33.2500	28	0	931.0000	25.3766
318	3	452	480	458	2	33	15	10682	1	2.5000	30	0	75.0000	12.0433
318	3	452	480	458	2	66	2	10682	2	17.0000	4	0	68.0000	12.0433
318	3	452	480	458	2	75	12	10682	3	7.7500	30	0	232.5000	12.0433
327	2	453	481	458	1	52	24	10683	1	7.0000	9	0	63.0000	4.4000
365	3	453	481	457	1	40	19	10684	1	18.4000	20	0	368.0000	48.5433
365	3	453	481	457	1	47	22	10684	2	9.5000	40	0	380.0000	48.5433
365	3	453	481	457	1	60	28	10684	3	34.0000	30	0	1020.0000	48.5433
373	4	456	470	460	2	10	4	10685	1	31.0000	20	0	620.0000	11.2500
373	4	456	470	460	2	41	19	10685	2	9.6500	4	0	38.6000	11.2500
373	4	456	470	460	2	47	22	10685	3	9.5000	15	0	142.5000	11.2500
345	2	457	485	465	1	17	7	10686	1	39.0000	30	0.2	936.0000	48.2500
345	2	457	485	465	1	26	11	10686	2	31.2300	15	0	468.4500	48.2500
355	4	458	472	464	2	10	4	10688	1	31.0000	18	0.1	502.2000	99.6966
355	4	458	472	464	2	28	12	10688	2	45.6000	60	0.1	2462.3999	99.6966
355	4	458	472	464	2	34	16	10688	3	14.0000	14	0	196.0000	99.6966
319	1	458	486	464	2	1	1	10689	1	18.0000	35	0.25	472.5000	13.4200
375	1	459	487	460	1	56	26	10690	1	38.0000	20	0.25	570.0000	7.9000
375	1	459	487	460	1	77	12	10690	2	13.0000	30	0.25	292.5000	7.9000
366	2	460	502	479	2	1	1	10691	1	18.0000	30	0	540.0000	162.0100
366	2	460	502	479	2	29	12	10691	2	123.7900	40	0	4951.6001	162.0100
366	2	460	502	479	2	43	20	10691	3	46.0000	40	0	1840.0000	162.0100
366	2	460	502	479	2	44	20	10691	4	19.4500	24	0	466.8000	162.0100
366	2	460	502	479	2	62	29	10691	5	49.3000	48	0	2366.3999	162.0100
316	4	460	488	470	2	63	7	10692	1	43.9000	20	0	878.0000	61.0200
401	3	463	477	467	3	9	4	10693	1	97.0000	6	0	582.0000	34.8350
401	3	463	477	467	3	54	25	10693	2	7.4500	60	0.15	379.9500	34.8350
401	3	463	477	467	3	69	15	10693	3	36.0000	30	0.15	918.0000	34.8350
401	3	463	477	467	3	73	17	10693	4	15.0000	15	0.15	191.2500	34.8350
366	8	463	491	466	3	7	3	10694	1	30.0000	90	0	2700.0000	132.7866
366	8	463	491	466	3	59	28	10694	2	55.0000	25	0	1375.0000	132.7866
366	8	463	491	466	3	70	7	10694	3	15.0000	50	0	750.0000	132.7866
369	7	464	506	471	1	8	3	10695	1	40.0000	10	0	400.0000	5.5733
369	7	464	506	471	1	12	5	10695	2	38.0000	4	0	152.0000	5.5733
369	7	464	506	471	1	24	10	10695	3	4.5000	20	0	90.0000	5.5733
401	8	465	507	471	3	17	7	10696	1	39.0000	20	0	780.0000	51.2750
401	8	465	507	471	3	46	21	10696	2	12.0000	18	0	216.0000	51.2750
314	3	465	493	471	1	19	8	10697	1	9.2000	7	0.25	48.3000	11.3800
314	3	465	493	471	1	35	16	10697	2	18.0000	9	0.25	121.5000	11.3800
314	3	465	493	471	1	58	27	10697	3	13.2500	30	0.25	298.1250	11.3800
314	3	465	493	471	1	70	7	10697	4	15.0000	30	0.25	337.5000	11.3800
328	4	466	494	474	1	11	5	10698	1	21.0000	15	0	315.0000	54.4940
328	4	466	494	474	1	17	7	10698	2	39.0000	8	0.05	296.4000	54.4940
328	4	466	494	474	1	29	12	10698	3	123.7900	12	0.05	1411.2061	54.4940
328	4	466	494	474	1	65	2	10698	4	21.0500	65	0.05	1299.8375	54.4940
328	4	466	494	474	1	70	7	10698	5	15.0000	8	0.05	114.0000	54.4940
364	3	466	494	470	3	47	22	10699	1	9.5000	12	0	114.0000	0.5800
396	3	467	495	473	1	1	1	10700	1	18.0000	5	0.2	72.0000	16.2750
396	3	467	495	473	1	34	16	10700	2	14.0000	12	0.2	134.4000	16.2750
396	3	467	495	473	1	68	8	10700	3	12.5000	40	0.2	400.0000	16.2750
396	3	467	495	473	1	71	15	10700	4	21.5000	60	0.2	1032.0000	16.2750
316	4	470	512	478	1	3	1	10702	1	10.0000	6	0	60.0000	11.9700
316	4	470	512	478	1	76	23	10702	2	18.0000	15	0	270.0000	11.9700
331	6	471	499	477	2	2	1	10703	1	19.0000	5	0	95.0000	50.7666
331	6	471	499	477	2	59	28	10703	2	55.0000	35	0	1925.0000	50.7666
331	6	471	499	477	2	73	17	10703	3	15.0000	35	0	525.0000	50.7666
378	6	471	499	495	1	4	2	10704	1	22.0000	6	0	132.0000	1.5933
378	6	471	499	495	1	24	10	10704	2	4.5000	35	0	157.5000	1.5933
378	6	471	499	495	1	48	22	10704	3	12.7500	24	0	306.0000	1.5933
312	9	472	500	506	2	31	14	10705	1	12.5000	20	0	250.0000	1.7600
312	9	472	500	506	2	32	14	10705	2	32.0000	4	0	128.0000	1.7600
394	8	473	501	478	3	16	7	10706	1	17.4500	20	0	349.0000	45.2100
394	8	473	501	478	3	43	20	10706	2	46.0000	24	0	1104.0000	45.2100
394	8	473	501	478	3	59	28	10706	3	55.0000	8	0	440.0000	45.2100
383	4	473	487	480	3	55	25	10707	1	24.0000	21	0	504.0000	7.2466
383	4	473	487	480	3	57	26	10707	2	19.5000	40	0	780.0000	7.2466
383	4	473	487	480	3	70	7	10707	3	15.0000	28	0.15	357.0000	7.2466
398	6	474	516	493	2	5	2	10708	1	21.3500	4	0	85.4000	1.4800
398	6	474	516	493	2	36	17	10708	2	19.0000	5	0	95.0000	1.4800
373	1	474	502	508	3	8	3	10709	1	40.0000	40	0	1600.0000	70.2666
373	1	474	502	508	3	51	24	10709	2	53.0000	28	0	1484.0000	70.2666
373	1	474	502	508	3	60	28	10709	3	34.0000	10	0	340.0000	70.2666
333	1	477	505	480	1	19	8	10710	1	9.2000	5	0	46.0000	2.4900
333	1	477	505	480	1	47	22	10710	2	9.5000	5	0	47.5000	2.4900
396	5	478	520	486	2	19	8	10711	1	9.2000	12	0	110.4000	17.4700
396	5	478	520	486	2	41	19	10711	2	9.6500	42	0	405.3000	17.4700
396	5	478	520	486	2	53	24	10711	3	32.8000	120	0	3936.0000	17.4700
396	1	479	507	481	1	10	4	10713	1	31.0000	18	0	558.0000	41.7625
396	1	479	507	481	1	26	11	10713	2	31.2300	30	0	936.9000	41.7625
396	1	479	507	481	1	45	21	10713	3	9.5000	110	0	1045.0000	41.7625
396	1	479	507	481	1	46	21	10713	4	12.0000	24	0	288.0000	41.7625
396	5	479	507	484	3	2	1	10714	1	19.0000	30	0.25	427.5000	4.8980
396	5	479	507	484	3	17	7	10714	2	39.0000	27	0.25	789.7500	4.8980
396	5	479	507	484	3	47	22	10714	3	9.5000	50	0.25	356.2500	4.8980
396	5	479	507	484	3	56	26	10714	4	38.0000	18	0.25	513.0000	4.8980
396	5	479	507	484	3	58	27	10714	5	13.2500	12	0.25	119.2500	4.8980
323	3	480	494	486	1	10	4	10715	1	31.0000	21	0	651.0000	31.6000
323	3	480	494	486	1	71	15	10715	2	21.5000	30	0	645.0000	31.6000
347	4	481	509	484	2	21	8	10716	1	10.0000	5	0	50.0000	7.5233
347	4	481	509	484	2	51	24	10716	2	53.0000	7	0	371.0000	7.5233
347	4	481	509	484	2	61	29	10716	3	28.5000	10	0	285.0000	7.5233
362	1	481	509	486	2	21	8	10717	1	10.0000	32	0.05	304.0000	19.7500
362	1	481	509	486	2	54	25	10717	2	7.4500	15	0	111.7500	19.7500
362	1	481	509	486	2	69	15	10717	3	36.0000	25	0.05	855.0000	19.7500
337	1	484	512	486	3	12	5	10718	1	38.0000	36	0	1368.0000	42.7200
337	1	484	512	486	3	16	7	10718	2	17.4500	20	0	349.0000	42.7200
337	1	484	512	486	3	36	17	10718	3	19.0000	40	0	760.0000	42.7200
337	1	484	512	486	3	62	29	10718	4	49.3000	20	0	986.0000	42.7200
392	8	484	512	493	2	18	7	10719	1	62.5000	12	0.25	562.5000	17.1466
392	8	484	512	493	2	30	13	10719	2	25.8900	3	0.25	58.2525	17.1466
392	8	484	512	493	2	54	25	10719	3	7.4500	40	0.25	223.5000	17.1466
377	8	485	499	493	2	35	16	10720	1	18.0000	21	0	378.0000	4.7650
377	8	485	499	493	2	71	15	10720	2	21.5000	8	0	172.0000	4.7650
366	5	486	514	488	3	44	20	10721	1	19.4500	50	0.05	923.8751	48.9200
396	8	486	528	492	1	2	1	10722	1	19.0000	3	0	57.0000	18.6450
396	8	486	528	492	1	31	14	10722	2	12.5000	50	0	625.0000	18.6450
396	8	486	528	492	1	68	8	10722	3	12.5000	45	0	562.5000	18.6450
396	8	486	528	492	1	75	12	10722	4	7.7500	42	0	325.5000	18.6450
401	3	487	515	513	1	26	11	10723	1	31.2300	15	0	468.4500	21.7200
315	8	487	529	493	2	10	4	10724	1	31.0000	16	0	496.0000	28.8750
315	8	487	529	493	2	61	29	10724	2	28.5000	5	0	142.5000	28.8750
372	4	488	516	493	3	41	19	10725	1	9.6500	12	0	115.8000	3.6100
372	4	488	516	493	3	52	24	10725	2	7.0000	4	0	28.0000	3.6100
372	4	488	516	493	3	55	25	10725	3	24.0000	6	0	144.0000	3.6100
386	4	491	505	523	1	4	2	10726	1	22.0000	25	0	550.0000	8.2800
386	4	491	505	523	1	11	5	10726	2	21.0000	5	0	105.0000	8.2800
348	2	491	519	523	1	17	7	10727	1	39.0000	20	0.05	741.0000	29.9666
348	2	491	519	523	1	56	26	10727	2	38.0000	10	0.05	361.0000	29.9666
348	2	491	519	523	1	59	28	10727	3	55.0000	10	0.05	522.5000	29.9666
378	4	492	520	499	2	30	13	10728	1	25.8900	15	0	388.3500	14.5825
378	4	492	520	499	2	40	19	10728	2	18.4000	6	0	110.4000	14.5825
378	4	492	520	499	2	55	25	10728	3	24.0000	12	0	288.0000	14.5825
378	4	492	520	499	2	60	28	10728	4	34.0000	15	0	510.0000	14.5825
314	8	492	534	502	3	1	1	10729	1	18.0000	50	0	900.0000	47.0200
314	8	492	534	502	3	21	8	10729	2	10.0000	30	0	300.0000	47.0200
314	8	492	534	502	3	50	23	10729	3	16.2500	40	0	650.0000	47.0200
323	5	493	521	502	1	16	7	10730	1	17.4500	15	0.05	248.6625	6.7066
323	5	493	521	502	1	31	14	10730	2	12.5000	3	0.05	35.6250	6.7066
323	5	493	521	502	1	65	2	10730	3	21.0500	10	0.05	199.9750	6.7066
326	7	494	522	502	1	21	8	10731	1	10.0000	40	0.05	380.0000	48.3250
326	7	494	522	502	1	51	24	10731	2	53.0000	30	0.05	1510.5000	48.3250
323	3	494	522	495	1	76	23	10732	1	18.0000	20	0	360.0000	16.9700
319	1	495	523	498	3	14	6	10733	1	23.2500	16	0	372.0000	36.7033
319	1	495	523	498	3	28	12	10733	2	45.6000	20	0	912.0000	36.7033
319	1	495	523	498	3	52	24	10733	3	7.0000	25	0	175.0000	36.7033
373	2	495	523	500	3	6	3	10734	1	25.0000	30	0	750.0000	0.5433
373	2	495	523	500	3	30	13	10734	2	25.8900	15	0	388.3500	0.5433
373	2	495	523	500	3	76	23	10734	3	18.0000	20	0	360.0000	0.5433
392	6	498	526	509	2	61	29	10735	1	28.5000	20	0.1	513.0000	22.9850
392	6	498	526	509	2	77	12	10735	2	13.0000	2	0.1	23.4000	22.9850
357	2	499	527	506	2	13	6	10737	1	6.0000	4	0	24.0000	3.8950
357	2	499	527	506	2	41	19	10737	2	9.6500	12	0	115.8000	3.8950
352	2	500	528	506	1	16	7	10738	1	17.4500	3	0	52.3500	2.9100
357	3	500	528	505	3	36	17	10739	1	19.0000	6	0	114.0000	5.5400
357	3	500	528	505	3	52	24	10739	2	7.0000	18	0	126.0000	5.5400
401	4	501	529	513	2	28	12	10740	1	45.6000	5	0.2	182.4000	20.4700
401	4	501	529	513	2	35	16	10740	2	18.0000	35	0.2	504.0000	20.4700
401	4	501	529	513	2	45	21	10740	3	9.5000	40	0.2	304.0000	20.4700
401	4	501	529	513	2	56	26	10740	4	38.0000	14	0.2	425.6000	20.4700
383	4	502	516	506	3	2	1	10741	1	19.0000	15	0.2	228.0000	10.9600
370	3	502	530	506	3	3	1	10742	1	10.0000	20	0	200.0000	81.2433
370	3	502	530	506	3	60	28	10742	2	34.0000	50	0	1700.0000	81.2433
370	3	502	530	506	3	72	14	10742	3	34.8000	35	0	1218.0000	81.2433
383	1	505	533	509	2	46	21	10743	1	12.0000	28	0.05	319.2000	23.7200
355	6	505	533	512	1	40	19	10744	1	18.4000	50	0.2	736.0000	69.1900
366	9	506	534	515	1	18	7	10745	1	62.5000	24	0	1500.0000	0.8800
366	9	506	534	515	1	44	20	10745	2	19.4500	16	0	311.2000	0.8800
366	9	506	534	515	1	59	28	10745	3	55.0000	45	0	2475.0000	0.8800
366	9	506	534	515	1	72	14	10745	4	34.8000	7	0	243.6000	0.8800
326	1	507	535	509	3	13	6	10746	1	6.0000	6	0	36.0000	7.8575
326	1	507	535	509	3	42	20	10746	2	14.0000	28	0	392.0000	7.8575
326	1	507	535	509	3	62	29	10746	3	49.3000	9	0	443.7000	7.8575
326	1	507	535	509	3	69	15	10746	4	36.0000	40	0	1440.0000	7.8575
345	6	507	535	514	1	31	14	10747	1	12.5000	8	0	100.0000	29.3325
345	6	507	535	514	1	41	19	10747	2	9.6500	35	0	337.7500	29.3325
345	6	507	535	514	1	63	7	10747	3	43.9000	9	0	395.1000	29.3325
345	6	507	535	514	1	69	15	10747	4	36.0000	30	0	1080.0000	29.3325
396	3	508	536	516	1	23	9	10748	1	9.0000	44	0	396.0000	77.5166
396	3	508	536	516	1	40	19	10748	2	18.4000	40	0	736.0000	77.5166
396	3	508	536	516	1	56	26	10748	3	38.0000	28	0	1064.0000	77.5166
382	4	508	536	537	2	56	26	10749	1	38.0000	15	0	570.0000	20.5100
382	4	508	536	537	2	59	28	10749	2	55.0000	6	0	330.0000	20.5100
382	4	508	536	537	2	76	23	10749	3	18.0000	10	0	180.0000	20.5100
359	9	509	537	512	1	14	6	10750	1	23.2500	5	0.15	98.8125	26.4333
359	9	509	537	512	1	45	21	10750	2	9.5000	40	0.15	323.0000	26.4333
359	9	509	537	512	1	59	28	10750	3	55.0000	25	0.15	1168.7500	26.4333
349	3	512	540	521	3	26	11	10751	1	31.2300	12	0.1	337.2840	32.6975
349	3	512	540	521	3	30	13	10751	2	25.8900	30	0	776.7000	32.6975
349	3	512	540	521	3	50	23	10751	3	16.2500	20	0.1	292.5000	32.6975
349	3	512	540	521	3	73	17	10751	4	15.0000	15	0	225.0000	32.6975
387	2	512	540	516	3	1	1	10752	1	18.0000	8	0	144.0000	0.6950
387	2	512	540	516	3	69	15	10752	2	36.0000	3	0	108.0000	0.6950
333	3	513	541	515	1	45	21	10753	1	9.5000	4	0	38.0000	3.8500
333	3	513	541	515	1	74	4	10753	2	10.0000	5	0	50.0000	3.8500
340	6	513	541	515	3	40	19	10754	1	18.4000	3	0	55.2000	2.3800
323	4	514	542	516	2	47	22	10755	1	9.5000	30	0.25	213.7500	4.1775
323	4	514	542	516	2	56	26	10755	2	38.0000	30	0.25	855.0000	4.1775
323	4	514	542	516	2	57	26	10755	3	19.5000	14	0.25	204.7500	4.1775
323	4	514	542	516	2	69	15	10755	4	36.0000	25	0.25	675.0000	4.1775
397	8	515	543	520	2	18	7	10756	1	62.5000	21	0.2	1050.0000	18.3025
397	8	515	543	520	2	36	17	10756	2	19.0000	20	0.2	304.0000	18.3025
397	8	515	543	520	2	68	8	10756	3	12.5000	6	0.2	60.0000	18.3025
397	8	515	543	520	2	69	15	10756	4	36.0000	20	0.2	576.0000	18.3025
396	6	515	543	533	1	34	16	10757	1	14.0000	30	0	420.0000	2.0475
396	6	515	543	533	1	59	28	10757	2	55.0000	7	0	385.0000	2.0475
396	6	515	543	533	1	62	29	10757	3	49.3000	30	0	1479.0000	2.0475
396	6	515	543	533	1	64	12	10757	4	33.2500	24	0	798.0000	2.0475
349	3	516	544	522	3	26	11	10758	1	31.2300	20	0	624.6000	46.0566
349	3	516	544	522	3	52	24	10758	2	7.0000	60	0	420.0000	46.0566
349	3	516	544	522	3	70	7	10758	3	15.0000	40	0	600.0000	46.0566
317	3	516	544	530	3	32	14	10759	1	32.0000	10	0	320.0000	11.9900
341	4	519	547	528	1	25	11	10760	1	14.0000	12	0.25	126.0000	51.8800
341	4	519	547	528	1	27	11	10760	2	43.9000	40	0	1756.0000	51.8800
341	4	519	547	528	1	43	20	10760	3	46.0000	30	0.25	1035.0000	51.8800
395	5	520	548	526	2	25	11	10761	1	14.0000	35	0.25	367.5000	9.3300
395	5	520	548	526	2	75	12	10761	2	7.7500	18	0	139.5000	9.3300
331	3	520	548	527	1	39	18	10762	1	18.0000	16	0	288.0000	82.1850
331	3	520	548	527	1	47	22	10762	2	9.5000	30	0	285.0000	82.1850
331	3	520	548	527	1	51	24	10762	3	53.0000	28	0	1484.0000	82.1850
331	3	520	548	527	1	56	26	10762	4	38.0000	60	0	2280.0000	82.1850
330	3	521	549	526	3	21	8	10763	1	10.0000	40	0	400.0000	12.4500
330	3	521	549	526	3	22	9	10763	2	21.0000	6	0	126.0000	12.4500
330	3	521	549	526	3	24	10	10763	3	4.5000	20	0	90.0000	12.4500
328	6	521	549	526	3	3	1	10764	1	10.0000	20	0.1	180.0000	72.7250
328	6	521	549	526	3	39	18	10764	2	18.0000	130	0.1	2105.9998	72.7250
366	3	522	550	527	3	65	2	10765	1	21.0500	80	0.1	1515.6000	42.7400
365	4	523	551	527	1	2	1	10766	1	19.0000	40	0	760.0000	52.5166
365	4	523	551	527	1	7	3	10766	2	30.0000	35	0	1050.0000	52.5166
365	4	523	551	527	1	68	8	10766	3	12.5000	40	0	500.0000	52.5166
353	4	523	551	533	3	42	20	10767	1	14.0000	2	0	28.0000	1.5900
383	3	526	554	533	2	22	9	10768	1	21.0000	4	0	84.0000	36.5800
383	3	526	554	533	2	31	14	10768	2	12.5000	50	0	625.0000	36.5800
383	3	526	554	533	2	60	28	10768	3	34.0000	15	0	510.0000	36.5800
383	3	526	554	533	2	71	15	10768	4	21.5000	12	0	258.0000	36.5800
355	3	526	554	530	1	41	19	10769	1	9.6500	30	0.05	275.0250	16.2650
355	3	526	554	530	1	52	24	10769	2	7.0000	15	0.05	99.7500	16.2650
355	3	526	554	530	1	61	29	10769	3	28.5000	20	0	570.0000	16.2650
355	3	526	554	530	1	62	29	10769	4	49.3000	15	0	739.5000	16.2650
375	8	527	555	535	3	11	5	10770	1	21.0000	15	0.25	236.2500	5.3200
328	9	528	556	551	2	71	15	10771	1	21.5000	16	0	344.0000	11.1900
363	3	528	556	537	2	29	12	10772	1	123.7900	18	0	2228.2200	45.6400
363	3	528	556	537	2	59	28	10772	2	55.0000	25	0	1375.0000	45.6400
328	1	529	557	534	3	17	7	10773	1	39.0000	33	0	1287.0000	32.1433
328	1	529	557	534	3	31	14	10773	2	12.5000	70	0.2	700.0000	32.1433
328	1	529	557	534	3	75	12	10773	3	7.7500	7	0.2	43.4000	32.1433
331	4	529	543	530	1	31	14	10774	1	12.5000	2	0.25	18.7500	24.1000
331	4	529	543	530	1	66	2	10774	2	17.0000	50	0	850.0000	24.1000
399	7	530	558	544	1	10	4	10775	1	31.0000	6	0	186.0000	10.1250
399	7	530	558	544	1	67	16	10775	2	14.0000	3	0	42.0000	10.1250
328	1	533	561	536	3	31	14	10776	1	12.5000	16	0.05	190.0000	87.8825
328	1	533	561	536	3	42	20	10776	2	14.0000	12	0.05	159.6000	87.8825
328	1	533	561	536	3	45	21	10776	3	9.5000	27	0.05	243.6750	87.8825
328	1	533	561	536	3	51	24	10776	4	53.0000	120	0.05	6042.0000	87.8825
373	7	533	547	570	2	42	20	10777	1	14.0000	20	0.2	224.0000	3.0100
319	3	534	562	542	1	41	19	10778	1	9.6500	10	0	96.5000	6.7900
364	3	534	562	563	2	16	7	10779	1	17.4500	20	0	349.0000	29.0650
364	3	534	562	563	2	62	29	10779	2	49.3000	20	0	986.0000	29.0650
313	2	534	548	543	1	70	7	10780	1	15.0000	35	0	525.0000	21.0650
313	2	534	548	543	1	77	12	10780	2	13.0000	15	0	195.0000	21.0650
359	2	535	563	537	3	54	25	10781	1	7.4500	3	0.2	17.8800	24.3866
359	2	535	563	537	3	56	26	10781	2	38.0000	20	0.2	608.0000	24.3866
359	2	535	563	537	3	74	4	10781	3	10.0000	35	0	350.0000	24.3866
324	9	535	563	540	3	31	14	10782	1	12.5000	1	0	12.5000	1.1000
375	4	536	564	537	2	31	14	10783	1	12.5000	10	0	125.0000	62.4900
375	4	536	564	537	2	38	18	10783	2	263.5000	5	0	1317.5000	62.4900
340	4	536	564	540	3	36	17	10784	1	19.0000	30	0	570.0000	23.3633
340	4	536	564	540	3	39	18	10784	2	18.0000	2	0.15	30.6000	23.3633
340	4	536	564	540	3	72	14	10784	3	34.8000	30	0.15	887.4000	23.3633
374	1	536	564	542	3	10	4	10785	1	31.0000	10	0	310.0000	0.7550
374	1	536	564	542	3	75	12	10785	2	7.7500	10	0	77.5000	0.7550
378	8	537	565	541	1	8	3	10786	1	40.0000	30	0.2	960.0000	36.9566
378	8	537	565	541	1	30	13	10786	2	25.8900	15	0.2	310.6800	36.9566
378	8	537	565	541	1	75	12	10786	3	7.7500	42	0.2	260.4000	36.9566
339	2	537	551	544	1	2	1	10787	1	19.0000	15	0.05	270.7500	124.9650
339	2	537	551	544	1	29	12	10787	2	123.7900	20	0.05	2352.0100	124.9650
366	1	540	568	568	2	19	8	10788	1	9.2000	50	0.05	437.0000	21.3500
366	1	540	568	568	2	75	12	10788	2	7.7500	40	0.05	294.5000	21.3500
330	1	540	568	549	2	18	7	10789	1	62.5000	30	0	1875.0000	25.1500
330	1	540	568	549	2	35	16	10789	2	18.0000	15	0	270.0000	25.1500
330	1	540	568	549	2	63	7	10789	3	43.9000	30	0	1317.0000	25.1500
330	1	540	568	549	2	68	8	10789	4	12.5000	18	0	225.0000	25.1500
373	6	540	568	544	1	7	3	10790	1	30.0000	3	0.15	76.5000	14.1150
373	6	540	568	544	1	56	26	10790	2	38.0000	20	0.15	646.0000	14.1150
362	6	541	569	550	2	29	12	10791	1	123.7900	14	0.05	1646.4070	8.4250
362	6	541	569	550	2	41	19	10791	2	9.6500	20	0.05	183.3500	8.4250
360	1	541	569	549	3	2	1	10792	1	19.0000	10	0	190.0000	7.9300
360	1	541	569	549	3	54	25	10792	2	7.4500	3	0	22.3500	7.9300
360	1	541	569	549	3	68	8	10792	3	12.5000	15	0	187.5000	7.9300
383	3	542	570	557	3	41	19	10793	1	9.6500	14	0	135.1000	2.2600
383	3	542	570	557	3	52	24	10793	2	7.0000	8	0	56.0000	2.2600
377	6	542	570	551	1	14	6	10794	1	23.2500	15	0.2	279.0000	10.7450
377	6	542	570	551	1	54	25	10794	2	7.4500	6	0.2	35.7600	10.7450
328	8	542	570	569	2	16	7	10795	1	17.4500	65	0	1134.2500	63.3300
328	8	542	570	569	2	17	7	10795	2	39.0000	35	0.25	1023.7500	63.3300
312	3	543	571	563	1	26	11	10796	1	31.2300	21	0.2	524.6640	6.6300
312	3	543	571	563	1	44	20	10796	2	19.4500	10	0	194.5000	6.6300
312	3	543	571	563	1	64	12	10796	3	33.2500	35	0.2	931.0000	6.6300
312	3	543	571	563	1	69	15	10796	4	36.0000	24	0.2	691.2000	6.6300
361	7	543	571	554	2	11	5	10797	1	21.0000	20	0	420.0000	33.3500
382	2	544	572	554	1	62	29	10798	1	49.3000	2	0	98.6000	1.1650
382	2	544	572	554	1	72	14	10798	2	34.8000	10	0	348.0000	1.1650
337	9	544	586	554	3	13	6	10799	1	6.0000	20	0.15	102.0000	10.2533
337	9	544	586	554	3	24	10	10799	2	4.5000	20	0.15	76.5000	10.2533
337	9	544	586	554	3	59	28	10799	3	55.0000	25	0	1375.0000	10.2533
388	1	544	572	554	3	11	5	10800	1	21.0000	50	0.1	945.0000	45.8133
388	1	544	572	554	3	51	24	10800	2	53.0000	10	0.1	477.0000	45.8133
388	1	544	572	554	3	54	25	10800	3	7.4500	7	0.1	46.9350	45.8133
322	4	547	575	549	2	17	7	10801	1	39.0000	40	0.25	1170.0000	48.5450
322	4	547	575	549	2	29	12	10801	2	123.7900	20	0.25	1856.8500	48.5450
367	4	547	575	551	2	30	13	10802	1	25.8900	25	0.25	485.4375	64.3150
367	4	547	575	551	2	51	24	10802	2	53.0000	30	0.25	1192.5000	64.3150
367	4	547	575	551	2	55	25	10802	3	24.0000	60	0.25	1080.0000	64.3150
367	4	547	575	551	2	62	29	10802	4	49.3000	5	0.25	184.8750	64.3150
381	4	548	576	555	1	19	8	10803	1	9.2000	24	0.05	209.7600	18.4100
381	4	548	576	555	1	25	11	10803	2	14.0000	15	0.05	199.5000	18.4100
381	4	548	576	555	1	59	28	10803	3	55.0000	15	0.05	783.7500	18.4100
388	6	548	576	556	2	10	4	10804	1	31.0000	36	0	1116.0000	9.1100
388	6	548	576	556	2	28	12	10804	2	45.6000	24	0	1094.3999	9.1100
388	6	548	576	556	2	49	23	10804	3	20.0000	4	0.15	68.0000	9.1100
398	2	548	576	558	3	34	16	10805	1	14.0000	10	0	140.0000	118.6700
398	2	548	576	558	3	38	18	10805	2	263.5000	10	0	2635.0000	118.6700
356	3	549	577	554	2	2	1	10806	1	19.0000	20	0.25	285.0000	7.3700
356	3	549	577	554	2	65	2	10806	2	21.0500	2	0	42.1000	7.3700
356	3	549	577	554	2	74	4	10806	3	10.0000	15	0.25	112.5000	7.3700
333	4	549	577	579	1	40	19	10807	1	18.4000	1	0	18.4000	1.3600
394	2	550	578	558	3	56	26	10808	1	38.0000	20	0.15	646.0000	22.7650
394	2	550	578	558	3	76	23	10808	2	18.0000	50	0.15	765.0000	22.7650
381	7	550	578	556	1	52	24	10809	1	7.0000	20	0	140.0000	4.8700
376	2	550	578	556	3	13	6	10810	1	6.0000	7	0	42.0000	1.4433
376	2	550	578	556	3	25	11	10810	2	14.0000	5	0	70.0000	1.4433
376	2	550	578	556	3	70	7	10810	3	15.0000	5	0	75.0000	1.4433
314	8	551	579	557	1	19	8	10811	1	9.2000	15	0	138.0000	10.4066
314	8	551	579	557	1	23	9	10811	2	9.0000	18	0	162.0000	10.4066
314	8	551	579	557	1	40	19	10811	3	18.4000	30	0	552.0000	10.4066
348	5	551	579	561	1	31	14	10812	1	12.5000	16	0.1	180.0000	19.9266
348	5	551	579	561	1	72	14	10812	2	34.8000	40	0.1	1252.7999	19.9266
348	5	551	579	561	1	77	12	10812	3	13.0000	20	0	260.0000	19.9266
379	1	554	582	558	1	2	1	10813	1	19.0000	12	0.2	182.4000	23.6900
379	1	554	582	558	1	46	21	10813	2	12.0000	35	0	420.0000	23.6900
356	3	554	582	563	3	41	19	10814	1	9.6500	20	0	193.0000	32.7350
356	3	554	582	563	3	43	20	10814	2	46.0000	20	0.15	782.0001	32.7350
356	3	554	582	563	3	48	22	10814	3	12.7500	8	0.15	86.7000	32.7350
356	3	554	582	563	3	61	29	10814	4	28.5000	30	0.15	726.7500	32.7350
396	2	554	582	563	3	33	15	10815	1	2.5000	16	0	40.0000	14.6200
389	4	555	583	584	2	38	18	10816	1	263.5000	30	0.05	7509.7500	359.8900
389	4	555	583	584	2	62	29	10816	2	49.3000	20	0.05	936.7000	359.8900
337	3	555	569	562	2	26	11	10817	1	31.2300	40	0.15	1061.8199	76.5175
337	3	555	569	562	2	38	18	10817	2	263.5000	30	0	7905.0000	76.5175
337	3	555	569	562	2	40	19	10817	3	18.4000	60	0.15	938.4000	76.5175
337	3	555	569	562	2	62	29	10817	4	49.3000	25	0.15	1047.6250	76.5175
340	7	556	584	561	3	32	14	10818	1	32.0000	20	0	640.0000	32.7400
340	7	556	584	561	3	41	19	10818	2	9.6500	20	0	193.0000	32.7400
324	2	556	584	565	3	43	20	10819	1	46.0000	7	0	322.0000	9.8800
324	2	556	584	565	3	75	12	10819	2	7.7500	20	0	155.0000	9.8800
395	3	556	584	562	2	56	26	10820	1	38.0000	30	0	1140.0000	37.5200
397	1	557	585	564	1	35	16	10821	1	18.0000	20	0	360.0000	18.3400
397	1	557	585	564	1	51	24	10821	2	53.0000	6	0	318.0000	18.3400
400	6	557	585	565	3	62	29	10822	1	49.3000	3	0	147.9000	3.5000
400	6	557	585	565	3	70	7	10822	2	15.0000	6	0	90.0000	3.5000
313	5	558	586	562	2	11	5	10823	1	21.0000	20	0.1	378.0000	40.9925
313	5	558	586	562	2	57	26	10823	2	19.5000	15	0	292.5000	40.9925
313	5	558	586	562	2	59	28	10823	3	55.0000	40	0.1	1980.0000	40.9925
313	5	558	586	562	2	77	12	10823	4	13.0000	15	0.1	175.5000	40.9925
331	8	558	586	579	1	41	19	10824	1	9.6500	12	0	115.8000	0.6150
331	8	558	586	579	1	70	7	10824	2	15.0000	9	0	135.0000	0.6150
361	1	558	586	563	1	26	11	10825	1	31.2300	12	0	374.7600	39.6250
361	1	558	586	563	1	53	24	10825	2	32.8000	20	0	656.0000	39.6250
321	6	561	589	586	1	31	14	10826	1	12.5000	35	0	437.5000	3.5450
321	6	561	589	586	1	57	26	10826	2	19.5000	15	0	292.5000	3.5450
323	1	561	575	586	2	10	4	10827	1	31.0000	15	0	465.0000	31.7700
323	1	561	575	586	2	39	18	10827	2	18.0000	21	0	378.0000	31.7700
347	9	562	576	584	1	20	8	10828	1	81.0000	5	0	405.0000	45.4250
347	9	562	576	584	1	38	18	10828	2	263.5000	2	0	527.0000	45.4250
382	9	562	590	572	1	2	1	10829	1	19.0000	10	0	190.0000	38.6800
382	9	562	590	572	1	8	3	10829	2	40.0000	20	0	800.0000	38.6800
382	9	562	590	572	1	13	6	10829	3	6.0000	10	0	60.0000	38.6800
382	9	562	590	572	1	60	28	10829	4	34.0000	21	0	714.0000	38.6800
380	4	562	604	570	2	6	3	10830	1	25.0000	6	0	150.0000	20.4575
380	4	562	604	570	2	39	18	10830	2	18.0000	28	0	504.0000	20.4575
380	4	562	604	570	2	60	28	10830	3	34.0000	30	0	1020.0000	20.4575
380	4	562	604	570	2	68	8	10830	4	12.5000	24	0	300.0000	20.4575
351	3	563	591	572	2	19	8	10831	1	9.2000	2	0	18.4000	18.0475
351	3	563	591	572	2	35	16	10831	2	18.0000	8	0	144.0000	18.0475
351	3	563	591	572	2	38	18	10831	3	263.5000	8	0	2108.0000	18.0475
351	3	563	591	572	2	43	20	10831	4	46.0000	9	0	414.0000	18.0475
339	2	563	591	568	2	13	6	10832	1	6.0000	3	0.2	14.4000	10.8150
339	2	563	591	568	2	25	11	10832	2	14.0000	10	0.2	112.0000	10.8150
339	2	563	591	568	2	44	20	10832	3	19.4500	16	0.2	248.9600	10.8150
339	2	563	591	568	2	64	12	10832	4	33.2500	3	0	99.7500	10.8150
365	6	564	592	572	2	7	3	10833	1	30.0000	20	0.1	540.0000	23.8300
365	6	564	592	572	2	31	14	10833	2	12.5000	9	0.1	101.2500	23.8300
365	6	564	592	572	2	53	24	10833	3	32.8000	9	0.1	265.6800	23.8300
380	1	564	592	568	3	29	12	10834	1	123.7900	8	0.05	940.8040	14.8900
380	1	564	592	568	3	30	13	10834	2	25.8900	20	0.05	491.9100	14.8900
316	1	564	592	570	3	59	28	10835	1	55.0000	15	0	825.0000	34.7650
316	1	564	592	570	3	77	12	10835	2	13.0000	2	0.2	20.8000	34.7650
328	7	565	593	570	1	22	9	10836	1	21.0000	52	0	1092.0000	82.3760
328	7	565	593	570	1	35	16	10836	2	18.0000	6	0	108.0000	82.3760
328	7	565	593	570	1	57	26	10836	3	19.5000	24	0	468.0000	82.3760
328	7	565	593	570	1	60	28	10836	4	34.0000	60	0	2040.0000	82.3760
328	7	565	593	570	1	64	12	10836	5	33.2500	30	0	997.5000	82.3760
319	9	565	593	572	3	13	6	10837	1	6.0000	6	0	36.0000	3.3300
319	9	565	593	572	3	40	19	10837	2	18.4000	25	0	460.0000	3.3300
319	9	565	593	572	3	47	22	10837	3	9.5000	40	0.25	285.0000	3.3300
319	9	565	593	572	3	76	23	10837	4	18.0000	21	0.25	283.5000	3.3300
314	3	568	596	572	3	1	1	10838	1	18.0000	4	0.25	54.0000	19.7600
314	3	568	596	572	3	18	7	10838	2	62.5000	25	0.25	1171.8750	19.7600
314	3	568	596	572	3	36	17	10838	3	19.0000	50	0.25	712.5000	19.7600
380	3	568	596	571	3	58	27	10839	1	13.2500	30	0.1	357.7500	17.7150
380	3	568	596	571	3	72	14	10839	2	34.8000	15	0.1	469.8000	17.7150
314	4	568	610	596	2	25	11	10840	1	14.0000	6	0.2	67.2000	1.3550
314	4	568	610	596	2	39	18	10840	2	18.0000	10	0.2	144.0000	1.3550
353	5	569	597	578	2	10	4	10841	1	31.0000	16	0	496.0000	106.0750
353	5	569	597	578	2	56	26	10841	2	38.0000	30	0	1140.0000	106.0750
353	5	569	597	578	2	59	28	10841	3	55.0000	50	0	2750.0000	106.0750
353	5	569	597	578	2	77	12	10841	4	13.0000	15	0	195.0000	106.0750
354	1	569	597	578	3	11	5	10842	1	21.0000	15	0	315.0000	13.6050
354	1	569	597	578	3	43	20	10842	2	46.0000	5	0	230.0000	13.6050
354	1	569	597	578	3	68	8	10842	3	12.5000	20	0	250.0000	13.6050
354	1	569	597	578	3	70	7	10842	4	15.0000	12	0	180.0000	13.6050
356	4	570	598	575	2	51	24	10843	1	53.0000	4	0.25	159.0000	9.2600
345	8	570	598	575	2	22	9	10844	1	21.0000	35	0	735.0000	25.2200
366	8	570	584	579	1	23	9	10845	1	9.0000	70	0.1	566.9999	42.5960
366	8	570	584	579	1	35	16	10845	2	18.0000	25	0.1	405.0000	42.5960
366	8	570	584	579	1	42	20	10845	3	14.0000	42	0.1	529.2000	42.5960
366	8	570	584	579	1	58	27	10845	4	13.2500	60	0.1	715.4999	42.5960
366	8	570	584	579	1	64	12	10845	5	33.2500	48	0	1596.0000	42.5960
353	2	571	613	572	3	4	2	10846	1	22.0000	21	0	462.0000	18.8200
353	2	571	613	572	3	70	7	10846	2	15.0000	30	0	450.0000	18.8200
353	2	571	613	572	3	74	4	10846	3	10.0000	20	0	200.0000	18.8200
396	4	571	585	590	3	1	1	10847	1	18.0000	80	0.2	1152.0000	81.2616
396	4	571	585	590	3	19	8	10847	2	9.2000	12	0.2	88.3200	81.2616
396	4	571	585	590	3	37	17	10847	3	26.0000	60	0.2	1248.0001	81.2616
396	4	571	585	590	3	45	21	10847	4	9.5000	36	0.2	273.6000	81.2616
396	4	571	585	590	3	60	28	10847	5	34.0000	45	0.2	1224.0000	81.2616
396	4	571	585	590	3	71	15	10847	6	21.5000	55	0.2	946.0001	81.2616
385	7	572	600	578	2	5	2	10848	1	21.3500	30	0	640.5000	19.1200
385	7	572	600	578	2	9	4	10848	2	97.0000	3	0	291.0000	19.1200
337	9	572	600	579	2	3	1	10849	1	10.0000	49	0	490.0000	0.2800
337	9	572	600	579	2	26	11	10849	2	31.2300	18	0.15	477.8190	0.2800
356	1	572	614	579	1	25	11	10850	1	14.0000	20	0.15	238.0000	16.3966
356	1	572	614	579	1	33	15	10850	2	2.5000	4	0.15	8.5000	16.3966
356	1	572	614	579	1	70	7	10850	3	15.0000	30	0.15	382.5000	16.3966
379	5	575	603	582	1	2	1	10851	1	19.0000	5	0.05	90.2500	40.1375
379	5	575	603	582	1	25	11	10851	2	14.0000	10	0.05	133.0000	40.1375
379	5	575	603	582	1	57	26	10851	3	19.5000	10	0.05	185.2500	40.1375
379	5	575	603	582	1	59	28	10851	4	55.0000	42	0.05	2194.5000	40.1375
395	8	575	589	579	1	2	1	10852	1	19.0000	15	0	285.0000	58.0166
395	8	575	589	579	1	17	7	10852	2	39.0000	6	0	234.0000	58.0166
395	8	575	589	579	1	62	29	10852	3	49.3000	50	0	2465.0000	58.0166
320	9	576	604	583	2	18	7	10853	1	62.5000	10	0	625.0000	53.8300
328	3	576	604	585	2	10	4	10854	1	31.0000	100	0.15	2635.0000	50.1100
328	3	576	604	585	2	13	6	10854	2	6.0000	65	0.15	331.5000	50.1100
394	3	576	604	584	1	16	7	10855	1	17.4500	50	0	872.5001	42.7425
394	3	576	604	584	1	31	14	10855	2	12.5000	14	0	175.0000	42.7425
394	3	576	604	584	1	56	26	10855	3	38.0000	24	0	912.0000	42.7425
394	3	576	604	584	1	65	2	10855	4	21.0500	15	0.15	268.3875	42.7425
318	3	577	605	590	2	2	1	10856	1	19.0000	20	0	380.0000	29.2150
318	3	577	605	590	2	42	20	10856	2	14.0000	20	0	280.0000	29.2150
319	8	577	605	586	2	3	1	10857	1	10.0000	30	0	300.0000	62.9500
319	8	577	605	586	2	26	11	10857	2	31.2300	35	0.25	819.7875	62.9500
319	8	577	605	586	2	29	12	10857	3	123.7900	10	0.25	928.4250	62.9500
338	2	578	606	583	1	7	3	10858	1	30.0000	5	0	150.0000	17.5033
338	2	578	606	583	1	27	11	10858	2	43.9000	10	0	439.0000	17.5033
338	2	578	606	583	1	70	7	10858	3	15.0000	4	0	60.0000	17.5033
362	1	578	606	582	2	24	10	10859	1	4.5000	40	0.25	135.0000	25.3666
362	1	578	606	582	2	54	25	10859	2	7.4500	35	0.25	195.5625	25.3666
362	1	578	606	582	2	64	12	10859	3	33.2500	30	0.25	748.1250	25.3666
332	3	578	606	584	3	51	24	10860	1	53.0000	3	0	159.0000	9.6300
332	3	578	606	584	3	76	23	10860	2	18.0000	20	0	360.0000	9.6300
401	4	579	607	597	2	17	7	10861	1	39.0000	42	0	1638.0000	2.9860
401	4	579	607	597	2	18	7	10861	2	62.5000	20	0	1250.0000	2.9860
401	4	579	607	597	2	21	8	10861	3	10.0000	40	0	400.0000	2.9860
401	4	579	607	597	2	33	15	10861	4	2.5000	35	0	87.5000	2.9860
401	4	579	607	597	2	62	29	10861	5	49.3000	3	0	147.9000	2.9860
363	8	579	621	582	2	11	5	10862	1	21.0000	25	0	525.0000	26.6150
363	8	579	621	582	2	52	24	10862	2	7.0000	8	0	56.0000	26.6150
312	4	582	610	597	2	1	1	10863	1	18.0000	20	0.15	306.0000	15.1300
312	4	582	610	597	2	58	27	10863	2	13.2500	12	0.15	135.1500	15.1300
383	4	582	610	589	2	35	16	10864	1	18.0000	4	0	72.0000	1.5200
383	4	582	610	589	2	67	16	10864	2	14.0000	15	0	210.0000	1.5200
366	2	582	596	592	1	38	18	10865	1	263.5000	60	0.05	15019.5000	174.0700
366	2	582	596	592	1	39	18	10865	2	18.0000	80	0.05	1368.0000	174.0700
319	5	583	611	592	1	2	1	10866	1	19.0000	21	0.25	299.2500	36.3700
319	5	583	611	592	1	24	10	10866	2	4.5000	6	0.25	20.2500	36.3700
319	5	583	611	592	1	30	13	10866	3	25.8900	40	0.25	776.7000	36.3700
393	6	583	625	591	1	53	24	10867	1	32.8000	3	0	98.4000	1.9300
378	7	584	612	603	2	26	11	10868	1	31.2300	20	0	624.6000	63.7566
378	7	584	612	603	2	35	16	10868	2	18.0000	30	0	540.0000	63.7566
378	7	584	612	603	2	49	23	10868	3	20.0000	42	0.1	756.0000	63.7566
388	5	584	612	589	1	1	1	10869	1	18.0000	40	0	720.0000	35.8200
388	5	584	612	589	1	11	5	10869	2	21.0000	10	0	210.0000	35.8200
388	5	584	612	589	1	23	9	10869	3	9.0000	50	0	450.0000	35.8200
388	5	584	612	589	1	68	8	10869	4	12.5000	20	0	250.0000	35.8200
360	5	584	612	593	3	35	16	10870	1	18.0000	3	0	54.0000	6.0200
360	5	584	612	593	3	51	24	10870	2	53.0000	2	0	106.0000	6.0200
323	9	585	613	590	2	6	3	10871	1	25.0000	50	0.05	1187.5000	37.4233
323	9	585	613	590	2	16	7	10871	2	17.4500	12	0.05	198.9300	37.4233
323	9	585	613	590	2	17	7	10871	3	39.0000	16	0.05	592.8000	37.4233
336	5	585	613	589	2	55	25	10872	1	24.0000	10	0.05	228.0000	43.8300
336	5	585	613	589	2	62	29	10872	2	49.3000	20	0.05	936.7000	43.8300
336	5	585	613	589	2	64	12	10872	3	33.2500	15	0.05	473.8125	43.8300
336	5	585	613	589	2	65	2	10872	4	21.0500	21	0.05	419.9475	43.8300
369	4	586	614	589	1	21	8	10873	1	10.0000	20	0	200.0000	0.4100
369	4	586	614	589	1	28	12	10873	2	45.6000	3	0	136.8000	0.4100
336	5	586	614	591	2	10	4	10874	1	31.0000	10	0	310.0000	19.5800
319	4	586	614	611	2	19	8	10875	1	9.2000	25	0	230.0000	10.7900
319	4	586	614	611	2	47	22	10875	2	9.5000	21	0.1	179.5500	10.7900
319	4	586	614	611	2	49	23	10875	3	20.0000	15	0	300.0000	10.7900
323	7	589	617	592	3	46	21	10876	1	12.0000	21	0	252.0000	30.2100
323	7	589	617	592	3	64	12	10876	2	33.2500	20	0	665.0000	30.2100
379	1	589	617	599	1	16	7	10877	1	17.4500	30	0.25	392.6250	19.0300
379	1	589	617	599	1	18	7	10877	2	62.5000	25	0	1562.5000	19.0300
366	4	590	618	592	1	20	8	10878	1	81.0000	20	0.05	1539.0000	46.6900
369	3	590	618	592	3	40	19	10879	1	18.4000	12	0	220.8000	2.8333
369	3	590	618	592	3	65	2	10879	2	21.0500	10	0	210.5000	2.8333
369	3	590	618	592	3	76	23	10879	3	18.0000	10	0	180.0000	2.8333
331	7	590	632	598	1	23	9	10880	1	9.0000	30	0.2	216.0000	29.3366
331	7	590	632	598	1	61	29	10880	2	28.5000	30	0.2	684.0001	29.3366
331	7	590	632	598	1	70	7	10880	3	15.0000	50	0.2	600.0000	29.3366
324	4	591	619	598	1	73	17	10881	1	15.0000	10	0	150.0000	2.8400
396	4	591	619	600	3	42	20	10882	1	14.0000	25	0	350.0000	7.7000
396	4	591	619	600	3	49	23	10882	2	20.0000	20	0.15	340.0000	7.7000
396	4	591	619	600	3	54	25	10882	3	7.4500	32	0.15	202.6400	7.7000
393	8	592	620	600	3	24	10	10883	1	4.5000	8	0	36.0000	0.5300
392	4	592	620	593	2	21	8	10884	1	10.0000	40	0.05	380.0000	30.3233
392	4	592	620	593	2	56	26	10884	2	38.0000	21	0.05	758.1000	30.3233
392	4	592	620	593	2	65	2	10884	3	21.0500	12	0.05	239.9700	30.3233
353	6	592	620	598	3	2	1	10885	1	19.0000	20	0	380.0000	1.4100
353	6	592	620	598	3	24	10	10885	2	4.5000	12	0	54.0000	1.4100
353	6	592	620	598	3	70	7	10885	3	15.0000	30	0	450.0000	1.4100
353	6	592	620	598	3	77	12	10885	4	13.0000	25	0	325.0000	1.4100
375	1	593	621	610	1	10	4	10886	1	31.0000	70	0	2170.0000	1.6633
375	1	593	621	610	1	31	14	10886	2	12.5000	35	0	437.5000	1.6633
375	1	593	621	610	1	77	12	10886	3	13.0000	40	0	520.0000	1.6633
335	8	593	621	596	3	25	11	10887	1	14.0000	5	0	70.0000	1.2500
336	1	596	624	603	2	2	1	10888	1	19.0000	20	0	380.0000	25.9350
336	1	596	624	603	2	68	8	10888	2	12.5000	18	0	225.0000	25.9350
395	9	596	624	603	3	11	5	10889	1	21.0000	40	0	840.0000	140.3050
395	9	596	624	603	3	38	18	10889	2	263.5000	40	0	10540.0000	140.3050
327	7	596	624	598	1	17	7	10890	1	39.0000	15	0	585.0000	10.9200
327	7	596	624	598	1	34	16	10890	2	14.0000	10	0	140.0000	10.9200
327	7	596	624	598	1	41	19	10890	3	9.6500	14	0	135.1000	10.9200
363	7	597	625	599	2	30	13	10891	1	25.8900	15	0.05	368.9325	20.3700
341	4	597	625	599	2	59	28	10892	1	55.0000	40	0.05	2090.0000	120.2700
337	9	598	626	600	2	8	3	10893	1	40.0000	30	0	1200.0000	15.5560
337	9	598	626	600	2	24	10	10893	2	4.5000	10	0	45.0000	15.5560
337	9	598	626	600	2	29	12	10893	3	123.7900	24	0	2970.9600	15.5560
337	9	598	626	600	2	30	13	10893	4	25.8900	35	0	906.1500	15.5560
337	9	598	626	600	2	36	17	10893	5	19.0000	20	0	380.0000	15.5560
396	1	598	626	600	1	13	6	10894	1	6.0000	28	0.05	159.6000	38.7100
396	1	598	626	600	1	69	15	10894	2	36.0000	50	0.05	1710.0000	38.7100
396	1	598	626	600	1	75	12	10894	3	7.7500	120	0.05	883.4999	38.7100
328	3	598	626	603	1	24	10	10895	1	4.5000	110	0	495.0000	40.6875
328	3	598	626	603	1	39	18	10895	2	18.0000	45	0	810.0000	40.6875
328	3	598	626	603	1	40	19	10895	3	18.4000	91	0	1674.4000	40.6875
328	3	598	626	603	1	60	28	10895	4	34.0000	100	0	3400.0000	40.6875
341	7	599	627	607	3	45	21	10896	1	9.5000	15	0	142.5000	16.2250
341	7	599	627	607	3	56	26	10896	2	38.0000	16	0	608.0000	16.2250
342	4	600	628	614	2	13	6	10898	1	6.0000	5	0	30.0000	1.2700
313	5	600	628	606	3	39	18	10899	1	18.0000	8	0.15	122.4000	1.2100
381	1	600	628	612	2	70	7	10900	1	15.0000	3	0.25	33.7500	1.6600
312	4	603	631	606	1	41	19	10901	1	9.6500	30	0	289.5000	31.0450
312	4	603	631	606	1	71	15	10901	2	21.5000	30	0	645.0000	31.0450
331	1	603	631	611	1	55	25	10902	1	24.0000	30	0.15	612.0001	22.0750
331	1	603	631	611	1	62	29	10902	2	49.3000	6	0.15	251.4300	22.0750
375	3	604	632	612	3	13	6	10903	1	6.0000	40	0	240.0000	12.2366
375	3	604	632	612	3	65	2	10903	2	21.0500	21	0	442.0500	12.2366
375	3	604	632	612	3	68	8	10903	3	12.5000	20	0	250.0000	12.2366
401	3	604	632	607	3	58	27	10904	1	13.2500	15	0	198.7500	81.4750
401	3	604	632	607	3	62	29	10904	2	49.3000	35	0	1725.5000	81.4750
381	9	604	632	614	2	1	1	10905	1	18.0000	20	0.05	342.0000	13.7200
360	4	605	619	611	3	61	29	10906	1	28.5000	15	0	427.5000	26.2900
352	6	605	633	607	3	75	12	10907	1	7.7500	14	0	108.5000	9.1900
348	4	606	634	614	2	7	3	10908	1	30.0000	20	0.05	570.0000	16.4800
348	4	606	634	614	2	52	24	10908	2	7.0000	14	0.05	93.1000	16.4800
351	1	606	634	618	2	7	3	10909	1	30.0000	12	0	360.0000	17.6833
351	1	606	634	618	2	16	7	10909	2	17.4500	15	0	261.7500	17.6833
351	1	606	634	618	2	41	19	10909	3	9.6500	5	0	48.2500	17.6833
369	1	606	634	612	3	19	8	10910	1	9.2000	12	0	110.4000	12.7033
369	1	606	634	612	3	49	23	10910	2	20.0000	10	0	200.0000	12.7033
369	1	606	634	612	3	61	29	10910	3	28.5000	5	0	142.5000	12.7033
336	3	606	634	613	1	1	1	10911	1	18.0000	10	0	180.0000	12.7300
336	3	606	634	613	1	17	7	10911	2	39.0000	12	0	468.0000	12.7300
336	3	606	634	613	1	67	16	10911	3	14.0000	15	0	210.0000	12.7300
378	4	606	634	612	1	4	2	10913	1	22.0000	30	0.25	495.0000	11.0166
378	4	606	634	612	1	33	15	10913	2	2.5000	40	0.25	75.0000	11.0166
378	4	606	634	612	1	58	27	10913	3	13.2500	15	0	198.7500	11.0166
378	6	607	635	610	1	71	15	10914	1	21.5000	25	0	537.5000	21.1900
354	2	607	635	610	2	17	7	10915	1	39.0000	10	0	390.0000	1.1700
354	2	607	635	610	2	33	15	10915	2	2.5000	30	0	75.0000	1.1700
354	2	607	635	610	2	54	25	10915	3	7.4500	10	0	74.5000	1.1700
347	1	607	635	617	2	16	7	10916	1	17.4500	6	0	104.7000	21.2566
347	1	607	635	617	2	32	14	10916	2	32.0000	6	0	192.0000	21.2566
347	1	607	635	617	2	57	26	10916	3	19.5000	20	0	390.0000	21.2566
350	4	610	638	619	2	30	13	10917	1	25.8900	1	0	25.8900	4.1450
350	4	610	638	619	2	60	28	10917	2	34.0000	10	0	340.0000	4.1450
370	3	610	638	619	3	1	1	10918	1	18.0000	60	0.25	810.0000	24.4150
370	3	610	638	619	3	60	28	10918	2	34.0000	25	0.25	637.5000	24.4150
314	2	610	638	612	2	16	7	10919	1	17.4500	24	0	418.8000	6.6000
314	2	610	638	612	2	25	11	10919	2	14.0000	24	0	336.0000	6.6000
314	2	610	638	612	2	40	19	10919	3	18.4000	20	0	368.0000	6.6000
383	4	611	639	617	2	50	23	10920	1	16.2500	24	0	390.0000	29.6100
355	1	611	653	617	1	35	16	10921	1	18.0000	10	0	180.0000	88.2400
355	1	611	653	617	1	63	7	10921	2	43.9000	40	0	1756.0000	88.2400
375	5	611	639	613	3	17	7	10922	1	39.0000	15	0	585.0000	31.3700
375	5	611	639	613	3	24	10	10922	2	4.5000	35	0	157.5000	31.3700
339	7	611	653	621	3	42	20	10923	1	14.0000	10	0.2	112.0000	22.7533
339	7	611	653	621	3	43	20	10923	2	46.0000	10	0.2	368.0000	22.7533
339	7	611	653	621	3	67	16	10923	3	14.0000	24	0.2	268.8000	22.7533
319	3	612	640	647	2	10	4	10924	1	31.0000	20	0.1	558.0000	50.5066
319	3	612	640	647	2	28	12	10924	2	45.6000	30	0.1	1231.2000	50.5066
319	3	612	640	647	2	75	12	10924	3	7.7500	6	0	46.5000	50.5066
375	3	612	640	621	1	36	17	10925	1	19.0000	25	0.15	403.7500	1.1350
375	3	612	640	621	1	52	24	10925	2	7.0000	12	0.15	71.4000	1.1350
317	4	612	640	619	3	11	5	10926	1	21.0000	2	0	42.0000	9.9800
317	4	612	640	619	3	13	6	10926	2	6.0000	10	0	60.0000	9.9800
317	4	612	640	619	3	19	8	10926	3	9.2000	7	0	64.4000	9.9800
317	4	612	640	619	3	72	14	10926	4	34.8000	10	0	348.0000	9.9800
338	4	613	641	647	1	20	8	10927	1	81.0000	5	0	405.0000	6.5966
338	4	613	641	647	1	52	24	10927	2	7.0000	5	0	35.0000	6.5966
338	4	613	641	647	1	76	23	10927	3	18.0000	20	0	360.0000	6.5966
335	1	613	641	626	1	47	22	10928	1	9.5000	5	0	47.5000	0.6800
335	1	613	641	626	1	76	23	10928	2	18.0000	5	0	90.0000	0.6800
362	6	613	641	620	1	21	8	10929	1	10.0000	60	0	600.0000	11.3100
362	6	613	641	620	1	75	12	10929	2	7.7500	49	0	379.7500	11.3100
362	6	613	641	620	1	77	12	10929	3	13.0000	15	0	195.0000	11.3100
353	4	614	656	626	3	21	8	10930	1	10.0000	36	0	360.0000	3.8875
353	4	614	656	626	3	27	11	10930	2	43.9000	25	0	1097.5000	3.8875
353	4	614	656	626	3	55	25	10930	3	24.0000	25	0.2	480.0000	3.8875
353	4	614	656	626	3	58	27	10930	4	13.2500	30	0.2	318.0000	3.8875
349	4	614	628	627	2	13	6	10931	1	6.0000	42	0.15	214.2000	6.8000
349	4	614	628	627	2	57	26	10931	2	19.5000	30	0	585.0000	6.8000
323	8	614	642	632	1	16	7	10932	1	17.4500	30	0.1	471.1500	33.6600
323	8	614	642	632	1	62	29	10932	2	49.3000	14	0.1	621.1800	33.6600
323	8	614	642	632	1	72	14	10932	3	34.8000	16	0	556.8000	33.6600
323	8	614	642	632	1	75	12	10932	4	7.7500	20	0.1	139.5000	33.6600
382	6	614	642	624	3	53	24	10933	1	32.8000	2	0	65.6000	27.0750
382	6	614	642	624	3	61	29	10933	2	28.5000	30	0	855.0000	27.0750
363	3	617	645	620	3	6	3	10934	1	25.0000	20	0	500.0000	32.0100
381	4	617	645	626	3	1	1	10935	1	18.0000	21	0	378.0000	15.8633
381	4	617	645	626	3	18	7	10935	2	62.5000	4	0.25	187.5000	15.8633
381	4	617	645	626	3	23	9	10935	3	9.0000	8	0.25	54.0000	15.8633
389	3	617	645	626	2	36	17	10936	1	19.0000	30	0.2	456.0000	33.6800
324	7	618	632	621	3	28	12	10937	1	45.6000	8	0	364.8000	15.7550
324	7	618	632	621	3	34	16	10937	2	14.0000	20	0	280.0000	15.7550
366	3	618	646	624	2	13	6	10938	1	6.0000	20	0.25	90.0000	7.9725
366	3	618	646	624	2	43	20	10938	2	46.0000	24	0.25	828.0000	7.9725
366	3	618	646	624	2	60	28	10938	3	34.0000	49	0.25	1249.5000	7.9725
366	3	618	646	624	2	71	15	10938	4	21.5000	35	0.25	564.3750	7.9725
340	2	618	646	621	2	2	1	10939	1	19.0000	10	0.15	161.5000	38.1650
340	2	618	646	621	2	67	16	10939	2	14.0000	40	0.15	476.0000	38.1650
323	8	619	647	631	3	7	3	10940	1	30.0000	8	0	240.0000	9.8850
323	8	619	647	631	3	13	6	10940	2	6.0000	20	0	120.0000	9.8850
396	7	619	647	628	2	31	14	10941	1	12.5000	44	0.25	412.5000	100.2025
396	7	619	647	628	2	62	29	10941	2	49.3000	30	0.25	1109.2500	100.2025
396	7	619	647	628	2	68	8	10941	3	12.5000	80	0.25	750.0000	100.2025
396	7	619	647	628	2	72	14	10941	4	34.8000	50	0	1740.0000	100.2025
348	9	619	647	626	3	49	23	10942	1	20.0000	28	0	560.0000	17.9500
384	4	619	647	627	2	13	6	10943	1	6.0000	15	0	90.0000	0.7233
384	4	619	647	627	2	22	9	10943	2	21.0000	21	0	441.0000	0.7233
384	4	619	647	627	2	46	21	10943	3	12.0000	15	0	180.0000	0.7233
370	6	620	634	621	3	11	5	10944	1	21.0000	5	0.25	78.7500	17.6400
370	6	620	634	621	3	44	20	10944	2	19.4500	18	0.25	262.5750	17.6400
370	6	620	634	621	3	56	26	10944	3	38.0000	18	0	684.0000	17.6400
364	4	620	648	626	1	13	6	10945	1	6.0000	20	0	120.0000	5.1100
364	4	620	648	626	1	31	14	10945	2	12.5000	10	0	125.0000	5.1100
355	1	620	648	627	2	10	4	10946	1	31.0000	25	0	775.0000	9.0666
355	1	620	648	627	2	24	10	10946	2	4.5000	25	0	112.5000	9.0666
355	1	620	648	627	2	77	12	10946	3	13.0000	40	0	520.0000	9.0666
384	3	621	649	624	2	59	28	10947	1	55.0000	4	0	220.0000	3.2600
336	3	621	649	627	3	50	23	10948	1	16.2500	9	0	146.2500	7.7966
336	3	621	649	627	3	51	24	10948	2	53.0000	40	0	2120.0000	7.7966
336	3	621	649	627	3	55	25	10948	3	24.0000	4	0	96.0000	7.7966
370	2	621	649	625	3	6	3	10949	1	25.0000	12	0	300.0000	18.6100
370	2	621	649	625	3	10	4	10949	2	31.0000	30	0	930.0000	18.6100
370	2	621	649	625	3	17	7	10949	3	39.0000	6	0	234.0000	18.6100
370	2	621	649	625	3	62	29	10949	4	49.3000	60	0	2958.0000	18.6100
340	1	624	652	631	2	4	2	10950	1	22.0000	5	0	110.0000	2.5000
349	9	624	666	646	2	33	15	10951	1	2.5000	15	0.05	35.6250	10.2833
349	9	624	666	646	2	41	19	10951	2	9.6500	6	0.05	55.0050	10.2833
349	9	624	666	646	2	75	12	10951	3	7.7500	50	0.05	368.1250	10.2833
316	1	624	666	632	1	6	3	10952	1	25.0000	16	0.05	380.0000	20.2100
316	1	624	666	632	1	28	12	10952	2	45.6000	2	0	91.2000	20.2100
383	9	624	638	633	2	20	8	10953	1	81.0000	50	0.05	3847.4998	11.8600
383	9	624	638	633	2	31	14	10953	2	12.5000	50	0.05	593.7500	11.8600
314	5	625	667	628	1	16	7	10954	1	17.4500	28	0.15	415.3100	6.9775
314	5	625	667	628	1	31	14	10954	2	12.5000	25	0.15	265.6250	6.9775
314	5	625	667	628	1	45	21	10954	3	9.5000	30	0	285.0000	6.9775
314	5	625	667	628	1	60	28	10954	4	34.0000	24	0.15	693.6000	6.9775
331	8	625	653	628	2	75	12	10955	1	7.7500	12	0.2	74.4000	3.2600
320	6	625	667	628	2	21	8	10956	1	10.0000	12	0	120.0000	14.8833
320	6	625	667	628	2	47	22	10956	2	9.5000	14	0	133.0000	14.8833
320	6	625	667	628	2	51	24	10956	3	53.0000	8	0	424.0000	14.8833
312	8	626	654	635	3	30	13	10957	1	25.8900	30	0	776.7000	35.1200
312	8	626	654	635	3	35	16	10957	2	18.0000	40	0	720.0000	35.1200
312	8	626	654	635	3	64	12	10957	3	33.2500	8	0	266.0000	35.1200
342	7	626	654	635	2	5	2	10958	1	21.3500	20	0	427.0000	16.5200
342	7	626	654	635	2	7	3	10958	2	30.0000	6	0	180.0000	16.5200
342	7	626	654	635	2	72	14	10958	3	34.8000	5	0	174.0000	16.5200
373	6	626	668	631	2	75	12	10959	1	7.7500	20	0.15	131.7500	4.9800
312	3	627	641	647	1	24	10	10960	1	4.5000	10	0.25	33.7500	1.0400
312	3	627	641	647	1	41	19	10960	2	9.6500	24	0	231.6000	1.0400
378	8	627	655	638	1	52	24	10961	1	7.0000	6	0.05	39.9000	52.2350
378	8	627	655	638	1	76	23	10961	2	18.0000	60	0	1080.0000	52.2350
366	8	627	655	631	2	7	3	10962	1	30.0000	45	0	1350.0000	55.1580
366	8	627	655	631	2	13	6	10962	2	6.0000	77	0	462.0000	55.1580
366	8	627	655	631	2	53	24	10962	3	32.8000	20	0	656.0000	55.1580
366	8	627	655	631	2	69	15	10962	4	36.0000	9	0	324.0000	55.1580
366	8	627	655	631	2	76	23	10962	5	18.0000	44	0	792.0000	55.1580
334	9	627	655	634	3	60	28	10963	1	34.0000	2	0.15	57.8000	2.7000
352	3	628	656	632	2	18	7	10964	1	62.5000	6	0	375.0000	29.1266
352	3	628	656	632	2	38	18	10964	2	263.5000	5	0	1317.5000	29.1266
352	3	628	656	632	2	69	15	10964	3	36.0000	10	0	360.0000	29.1266
394	6	628	656	638	3	51	24	10965	1	53.0000	16	0	848.0000	144.3800
326	4	628	656	647	1	37	17	10966	1	26.0000	8	0	208.0000	9.0633
326	4	628	656	647	1	56	26	10966	2	38.0000	12	0.15	387.6000	9.0633
326	4	628	656	647	1	62	29	10966	3	49.3000	12	0.15	502.8600	9.0633
368	2	631	659	641	2	19	8	10967	1	9.2000	12	0	110.4000	31.1100
368	2	631	659	641	2	49	23	10967	2	20.0000	40	0	800.0000	31.1100
328	1	631	659	640	3	12	5	10968	1	38.0000	30	0	1140.0000	24.8666
328	1	631	659	640	3	24	10	10968	2	4.5000	30	0	135.0000	24.8666
328	1	631	659	640	3	64	12	10968	3	33.2500	4	0	133.0000	24.8666
371	1	631	659	638	2	46	21	10969	1	12.0000	9	0	108.0000	0.2100
322	9	632	646	663	1	52	24	10970	1	7.0000	40	0.2	224.0000	16.1600
332	2	632	660	641	2	29	12	10971	1	123.7900	14	0	1733.0601	121.8200
338	4	632	660	634	2	17	7	10972	1	39.0000	6	0	234.0000	0.0100
338	4	632	660	634	2	33	15	10972	2	2.5000	7	0	17.5000	0.0100
338	6	632	660	635	2	26	11	10973	1	31.2300	5	0	156.1500	5.0566
338	6	632	660	635	2	41	19	10973	2	9.6500	6	0	57.9000	5.0566
338	6	632	660	635	2	75	12	10973	3	7.7500	10	0	77.5000	5.0566
397	3	633	647	642	3	63	7	10974	1	43.9000	10	0	439.0000	12.9600
370	1	633	661	635	3	8	3	10975	1	40.0000	16	0	640.0000	16.1350
370	1	633	661	635	3	75	12	10975	2	7.7500	10	0	77.5000	16.1350
312	1	633	675	642	1	28	12	10976	1	45.6000	20	0	912.0000	37.9700
331	8	634	662	649	3	39	18	10977	1	18.0000	30	0	540.0000	52.1250
331	8	634	662	649	3	47	22	10977	2	9.5000	30	0	285.0000	52.1250
331	8	634	662	649	3	51	24	10977	3	53.0000	10	0	530.0000	52.1250
331	8	634	662	649	3	63	7	10977	4	43.9000	20	0	878.0000	52.1250
341	9	634	662	662	2	8	3	10978	1	40.0000	20	0.15	680.0000	8.2050
341	9	634	662	662	2	21	8	10978	2	10.0000	40	0.15	340.0000	8.2050
341	9	634	662	662	2	40	19	10978	3	18.4000	10	0	184.0000	8.2050
341	9	634	662	662	2	44	20	10978	4	19.4500	6	0.15	99.1950	8.2050
328	8	634	662	639	2	7	3	10979	1	30.0000	18	0	540.0000	58.8450
328	8	634	662	639	2	12	5	10979	2	38.0000	20	0	760.0000	58.8450
328	8	634	662	639	2	24	10	10979	3	4.5000	80	0	360.0000	58.8450
328	8	634	662	639	2	27	11	10979	4	43.9000	30	0	1317.0000	58.8450
328	8	634	662	639	2	31	14	10979	5	12.5000	24	0	300.0000	58.8450
328	8	634	662	639	2	63	7	10979	6	43.9000	35	0	1536.5000	58.8450
331	4	635	677	656	1	75	12	10980	1	7.7500	40	0.2	248.0000	1.2600
375	1	635	663	641	2	38	18	10981	1	263.5000	60	0	15810.0000	193.3700
370	2	635	663	647	1	7	3	10982	1	30.0000	20	0	600.0000	7.0050
370	2	635	663	647	1	43	20	10982	2	46.0000	9	0	414.0000	7.0050
396	2	635	663	645	2	13	6	10983	1	6.0000	84	0.15	428.4000	328.7700
396	2	635	663	645	2	57	26	10983	2	19.5000	15	0	292.5000	328.7700
396	1	638	666	642	3	16	7	10984	1	17.4500	55	0	959.7501	70.4066
396	1	638	666	642	3	24	10	10984	2	4.5000	20	0	90.0000	70.4066
396	1	638	666	642	3	36	17	10984	3	19.0000	40	0	760.0000	70.4066
342	8	638	666	660	2	11	5	10986	1	21.0000	30	0	630.0000	54.4650
342	8	638	666	660	2	20	8	10986	2	81.0000	15	0	1215.0000	54.4650
342	8	638	666	660	2	76	23	10986	3	18.0000	10	0	180.0000	54.4650
342	8	638	666	660	2	77	12	10986	4	13.0000	15	0	195.0000	54.4650
386	8	639	667	645	1	7	3	10987	1	30.0000	60	0	1800.0000	61.8266
386	8	639	667	645	1	43	20	10987	2	46.0000	6	0	276.0000	61.8266
386	8	639	667	645	1	72	14	10987	3	34.8000	20	0	696.0000	61.8266
395	3	639	667	649	2	7	3	10988	1	30.0000	60	0	1800.0000	30.5700
395	3	639	667	649	2	62	29	10988	2	49.3000	40	0.1	1774.7999	30.5700
377	2	639	667	641	1	6	3	10989	1	25.0000	40	0	1000.0000	11.5866
377	2	639	667	641	1	11	5	10989	2	21.0000	15	0	315.0000	11.5866
377	2	639	667	641	1	41	19	10989	3	9.6500	4	0	38.6000	11.5866
328	2	640	682	646	3	21	8	10990	1	10.0000	65	0	650.0000	29.4025
328	2	640	682	646	3	34	16	10990	2	14.0000	60	0.15	714.0001	29.4025
328	2	640	682	646	3	55	25	10990	3	24.0000	65	0.15	1326.0001	29.4025
328	2	640	682	646	3	61	29	10990	4	28.5000	66	0.15	1598.8500	29.4025
366	1	640	668	646	1	2	1	10991	1	19.0000	50	0.2	760.0000	12.8366
366	1	640	668	646	1	70	7	10991	2	15.0000	20	0.2	240.0000	12.8366
366	1	640	668	646	1	76	23	10991	3	18.0000	90	0.2	1296.0000	12.8366
398	1	640	668	642	3	72	14	10992	1	34.8000	2	0	69.6000	4.2700
331	7	640	668	649	3	29	12	10993	1	123.7900	50	0.25	4642.1250	4.4050
331	7	640	668	649	3	41	19	10993	2	9.6500	35	0.25	253.3125	4.4050
355	2	641	655	648	3	59	28	10994	1	55.0000	18	0.05	940.5000	65.5300
344	1	641	669	645	3	51	24	10995	1	53.0000	20	0	1060.0000	23.0000
344	1	641	669	645	3	60	28	10995	2	34.0000	4	0	136.0000	23.0000
366	4	641	669	649	2	42	20	10996	1	14.0000	40	0	560.0000	1.1200
313	8	642	684	652	2	32	14	10997	1	32.0000	50	0	1600.0000	24.6366
313	8	642	684	652	2	46	21	10997	2	12.0000	20	0.25	180.0000	24.6366
313	8	642	684	652	2	52	24	10997	3	7.0000	20	0.25	105.0000	24.6366
360	8	642	656	656	2	24	10	10998	1	4.5000	12	0	54.0000	5.0775
360	8	642	656	656	2	61	29	10998	2	28.5000	7	0	199.5000	5.0775
360	8	642	656	656	2	74	4	10998	3	10.0000	20	0	200.0000	5.0775
360	8	642	656	656	2	75	12	10998	4	7.7500	30	0	232.5000	5.0775
365	6	642	670	649	2	41	19	10999	1	9.6500	20	0.05	183.3500	32.1166
365	6	642	670	649	2	51	24	10999	2	53.0000	15	0.05	755.2500	32.1166
365	6	642	670	649	2	77	12	10999	3	13.0000	21	0.05	259.3500	32.1166
395	2	645	673	653	3	4	2	11000	1	22.0000	25	0.25	412.5000	18.3733
395	2	645	673	653	3	24	10	11000	2	4.5000	30	0.25	101.2500	18.3733
395	2	645	673	653	3	77	12	11000	3	13.0000	30	0	390.0000	18.3733
331	2	645	673	653	2	7	3	11001	1	30.0000	60	0	1800.0000	49.3250
331	2	645	673	653	2	22	9	11001	2	21.0000	25	0	525.0000	49.3250
331	2	645	673	653	2	46	21	11001	3	12.0000	25	0	300.0000	49.3250
331	2	645	673	653	2	55	25	11001	4	24.0000	6	0	144.0000	49.3250
396	4	645	673	655	1	13	6	11002	1	6.0000	56	0	336.0000	35.2900
396	4	645	673	655	1	35	16	11002	2	18.0000	15	0.15	229.5000	35.2900
396	4	645	673	655	1	42	20	11002	3	14.0000	24	0.15	285.6000	35.2900
396	4	645	673	655	1	55	25	11002	4	24.0000	40	0	960.0000	35.2900
399	3	645	673	647	3	1	1	11003	1	18.0000	4	0	72.0000	4.9700
399	3	645	673	647	3	40	19	11003	2	18.4000	10	0	184.0000	4.9700
399	3	645	673	647	3	52	24	11003	3	7.0000	10	0	70.0000	4.9700
341	3	646	674	659	1	26	11	11004	1	31.2300	6	0	187.3800	22.4200
341	3	646	674	659	1	76	23	11004	2	18.0000	6	0	108.0000	22.4200
369	2	646	674	649	1	1	1	11005	1	18.0000	2	0	36.0000	0.3750
369	2	646	674	649	1	59	28	11005	2	55.0000	10	0	550.0000	0.3750
389	3	646	674	654	2	1	1	11006	1	18.0000	8	0	144.0000	12.5950
389	3	646	674	654	2	29	12	11006	2	123.7900	2	0.25	185.6850	12.5950
346	8	647	675	652	2	8	3	11007	1	40.0000	30	0	1200.0000	67.4133
346	8	647	675	652	2	29	12	11007	2	123.7900	10	0	1237.9000	67.4133
346	8	647	675	652	2	42	20	11007	3	14.0000	14	0	196.0000	67.4133
336	2	647	675	649	1	24	10	11009	1	4.5000	12	0	54.0000	19.7033
336	2	647	675	649	1	36	17	11009	2	19.0000	18	0.25	256.5000	19.7033
336	2	647	675	649	1	60	28	11009	3	34.0000	9	0	306.0000	19.7033
348	2	648	676	660	2	7	3	11010	1	30.0000	20	0	600.0000	14.3550
348	2	648	676	660	2	24	10	11010	2	4.5000	10	0	45.0000	14.3550
316	3	648	676	652	1	58	27	11011	1	13.2500	40	0.05	503.5000	0.6050
316	3	648	676	652	1	71	15	11011	2	21.5000	20	0	430.0000	0.6050
362	1	648	662	656	3	19	8	11012	1	9.2000	50	0.05	437.0000	80.9833
362	1	648	662	656	3	60	28	11012	2	34.0000	36	0.05	1162.7999	80.9833
362	1	648	662	656	3	71	15	11012	3	21.5000	60	0.05	1225.5000	80.9833
350	2	648	676	649	1	23	9	11013	1	9.0000	10	0	90.0000	8.2475
350	2	648	676	649	1	42	20	11013	2	14.0000	4	0	56.0000	8.2475
350	2	648	676	649	1	45	21	11013	3	9.5000	20	0	190.0000	8.2475
350	2	648	676	649	1	68	8	11013	4	12.5000	2	0	25.0000	8.2475
314	2	649	677	654	3	41	19	11014	1	9.6500	28	0.1	243.1800	23.6000
351	2	649	663	659	2	30	13	11015	1	25.8900	15	0	388.3500	2.3100
351	2	649	663	659	2	77	12	11015	2	13.0000	18	0	234.0000	2.3100
383	9	649	677	652	2	31	14	11016	1	12.5000	15	0	187.5000	16.9000
383	9	649	677	652	2	36	17	11016	2	19.0000	16	0	304.0000	16.9000
328	9	652	680	659	2	3	1	11017	1	10.0000	25	0	250.0000	251.4200
328	9	652	680	659	2	59	28	11017	2	55.0000	110	0	6050.0000	251.4200
328	9	652	680	659	2	70	7	11017	3	15.0000	30	0	450.0000	251.4200
393	4	652	680	655	2	12	5	11018	1	38.0000	20	0	760.0000	3.8833
393	4	652	680	655	2	18	7	11018	2	62.5000	10	0	625.0000	3.8833
393	4	652	680	655	2	56	26	11018	3	38.0000	5	0	190.0000	3.8833
365	2	653	681	655	2	10	4	11020	1	31.0000	24	0.15	632.4000	43.3000
366	3	653	681	660	1	2	1	11021	1	19.0000	11	0.25	156.7500	59.4360
366	3	653	681	660	1	20	8	11021	2	81.0000	15	0	1215.0000	59.4360
366	3	653	681	660	1	26	11	11021	3	31.2300	63	0	1967.4900	59.4360
366	3	653	681	660	1	51	24	11021	4	53.0000	44	0.25	1749.0000	59.4360
366	3	653	681	660	1	72	14	11021	5	34.8000	35	0	1218.0000	59.4360
375	9	653	681	673	2	19	8	11022	1	9.2000	35	0	322.0000	3.1350
375	9	653	681	673	2	69	15	11022	2	36.0000	30	0	1080.0000	3.1350
384	1	653	667	663	2	7	3	11023	1	30.0000	4	0	120.0000	61.9150
384	1	653	667	663	2	43	20	11023	2	46.0000	30	0	1380.0000	61.9150
386	4	654	682	659	1	26	11	11024	1	31.2300	12	0	374.7600	18.5900
386	4	654	682	659	1	33	15	11024	2	2.5000	30	0	75.0000	18.5900
386	4	654	682	659	1	65	2	11024	3	21.0500	21	0	442.0500	18.5900
386	4	654	682	659	1	71	15	11024	4	21.5000	50	0	1075.0000	18.5900
359	6	654	682	663	3	1	1	11025	1	18.0000	10	0.1	162.0000	14.5850
359	6	654	682	663	3	13	6	11025	2	6.0000	20	0.1	108.0000	14.5850
333	4	654	682	667	1	18	7	11026	1	62.5000	8	0	500.0000	23.5450
333	4	654	682	667	1	51	24	11026	2	53.0000	10	0	530.0000	23.5450
370	1	655	683	659	1	24	10	11027	1	4.5000	30	0.25	101.2500	26.2600
370	1	655	683	659	1	62	29	11027	2	49.3000	21	0.25	776.4750	26.2600
337	2	655	683	661	1	55	25	11028	1	24.0000	35	0	840.0000	14.7950
337	2	655	683	661	1	59	28	11028	2	55.0000	24	0	1320.0000	14.7950
326	4	655	683	666	1	56	26	11029	1	38.0000	20	0	760.0000	23.9200
326	4	655	683	666	1	63	7	11029	2	43.9000	12	0	526.8000	23.9200
396	7	656	684	666	2	2	1	11030	1	19.0000	100	0.25	1425.0000	207.6875
396	7	656	684	666	2	5	2	11030	2	21.3500	70	0	1494.5000	207.6875
396	7	656	684	666	2	29	12	11030	3	123.7900	60	0.25	5570.5498	207.6875
396	7	656	684	666	2	59	28	11030	4	55.0000	100	0.25	4125.0000	207.6875
396	6	656	684	663	2	1	1	11031	1	18.0000	45	0	810.0000	45.4440
396	6	656	684	663	2	13	6	11031	2	6.0000	80	0	480.0000	45.4440
396	6	656	684	663	2	24	10	11031	3	4.5000	21	0	94.5000	45.4440
396	6	656	684	663	2	64	12	11031	4	33.2500	20	0	665.0000	45.4440
396	6	656	684	663	2	71	15	11031	5	21.5000	16	0	344.0000	45.4440
401	2	656	684	662	3	36	17	11032	1	19.0000	35	0	665.0000	202.0633
401	2	656	684	662	3	38	18	11032	2	263.5000	25	0	6587.5000	202.0633
401	2	656	684	662	3	59	28	11032	3	55.0000	30	0	1650.0000	202.0633
349	7	656	684	662	3	53	24	11033	1	32.8000	70	0.1	2066.3999	42.3700
349	7	656	684	662	3	69	15	11033	2	36.0000	36	0.1	1166.3999	42.3700
394	8	659	701	666	1	21	8	11034	1	10.0000	15	0.1	135.0000	13.4400
394	8	659	701	666	1	44	20	11034	2	19.4500	12	0	233.4000	13.4400
394	8	659	701	666	1	61	29	11034	3	28.5000	6	0	171.0000	13.4400
353	2	659	687	663	2	1	1	11035	1	18.0000	10	0	180.0000	0.0425
353	2	659	687	663	2	35	16	11035	2	18.0000	60	0	1080.0000	0.0425
353	2	659	687	663	2	42	20	11035	3	14.0000	30	0	420.0000	0.0425
353	2	659	687	663	2	54	25	11035	4	7.4500	10	0	74.5000	0.0425
361	8	659	687	661	3	13	6	11036	1	6.0000	7	0	42.0000	74.7350
361	8	659	687	661	3	59	28	11036	2	55.0000	30	0	1650.0000	74.7350
336	7	660	688	666	1	70	7	11037	1	15.0000	4	0	60.0000	3.2000
353	1	660	688	669	2	40	19	11038	1	18.4000	5	0.2	73.6000	9.8633
353	1	660	688	669	2	52	24	11038	2	7.0000	2	0	14.0000	9.8633
353	1	660	688	669	2	71	15	11038	3	21.5000	30	0	645.0000	9.8633
326	3	661	689	667	2	2	1	11041	1	19.0000	30	0.2	456.0000	24.1100
326	3	661	689	667	2	63	7	11041	2	43.9000	30	0	1317.0000	24.1100
371	2	661	675	670	1	44	20	11042	1	19.4500	15	0	291.7500	14.9950
371	2	661	675	670	1	61	29	11042	2	28.5000	4	0	114.0000	14.9950
352	5	661	689	668	2	11	5	11043	1	21.0000	10	0	210.0000	8.8000
360	4	662	690	670	1	62	29	11044	1	49.3000	12	0	591.6000	8.7200
358	8	662	690	663	2	12	5	11046	1	38.0000	20	0.05	722.0000	23.8800
358	8	662	690	663	2	32	14	11046	2	32.0000	15	0.05	456.0000	23.8800
358	8	662	690	663	2	35	16	11046	3	18.0000	18	0.05	307.8000	23.8800
386	7	663	691	670	3	1	1	11047	1	18.0000	25	0.25	337.5000	23.3100
386	7	663	691	670	3	5	2	11047	2	21.3500	30	0.25	480.3750	23.3100
370	7	663	691	669	3	68	8	11048	1	12.5000	42	0	525.0000	24.1200
373	3	663	691	673	1	2	1	11049	1	19.0000	10	0.2	152.0000	4.1700
373	3	663	691	673	1	12	5	11049	2	38.0000	4	0.2	121.6000	4.1700
331	8	666	694	674	2	76	23	11050	1	18.0000	50	0.1	809.9999	59.4100
375	3	666	694	670	1	43	20	11052	1	46.0000	30	0.2	1104.0000	33.6300
375	3	666	694	670	1	61	29	11052	2	28.5000	10	0.2	228.0000	33.6300
345	2	666	694	668	2	18	7	11053	1	62.5000	35	0.2	1750.0000	17.6833
345	2	666	694	668	2	32	14	11053	2	32.0000	20	0	640.0000	17.6833
345	2	666	694	668	2	64	12	11053	3	33.2500	25	0.2	665.0000	17.6833
312	7	667	695	674	2	24	10	11055	1	4.5000	15	0	67.5000	30.2300
312	7	667	695	674	2	25	11	11055	2	14.0000	15	0	210.0000	30.2300
312	7	667	695	674	2	51	24	11055	3	53.0000	20	0	1060.0000	30.2300
312	7	667	695	674	2	57	26	11055	4	19.5000	20	0	390.0000	30.2300
386	8	667	681	670	2	7	3	11056	1	30.0000	40	0	1200.0000	92.9866
386	8	667	681	670	2	55	25	11056	2	24.0000	35	0	840.0000	92.9866
386	8	667	681	670	2	60	28	11056	3	34.0000	50	0	1700.0000	92.9866
387	3	668	696	670	3	70	7	11057	1	15.0000	3	0	45.0000	4.1300
333	2	669	697	673	2	60	28	11060	1	34.0000	4	0	136.0000	5.4900
333	2	669	697	673	2	77	12	11060	2	13.0000	10	0	130.0000	5.4900
396	1	670	698	673	1	17	7	11064	1	39.0000	77	0.1	2702.7000	6.0180
396	1	670	698	673	1	41	19	11064	2	9.6500	12	0	115.8000	6.0180
396	1	670	698	673	1	53	24	11064	3	32.8000	25	0.1	737.9999	6.0180
396	1	670	698	673	1	55	25	11064	4	24.0000	4	0.1	86.4000	6.0180
396	1	670	698	673	1	68	8	11064	5	12.5000	55	0	687.5000	6.0180
401	7	670	698	673	2	16	7	11066	1	17.4500	3	0	52.3500	14.9066
401	7	670	698	673	2	19	8	11066	2	9.2000	42	0	386.4000	14.9066
401	7	670	698	673	2	34	16	11066	3	14.0000	35	0	490.0000	14.9066
361	1	673	687	675	2	41	19	11067	1	9.6500	9	0	86.8500	7.9800
354	1	673	701	675	2	39	18	11069	1	18.0000	20	0	360.0000	15.6700
\.


--
-- Data for Name: shipper; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipper (shipperkey, companyname) FROM stdin;
1	Speedy Express
2	United Package
3	Federal Shipping
\.


--
-- Data for Name: state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.state (statekey, statename, englishstatename, statetype, statecode, statecapital, regionname, regioncode, countrykey) FROM stdin;
7	Burgenland	\N	state	BU	Eisenstadt	\N	\N	1
8	Kärnten	Carinthia	state	KA	Klagenfurt	\N	\N	1
9	Niederösterreich	Lower Austria	state	NO	St. Pölten	\N	\N	1
10	Oberösterreich	Upper Austria	state	OO	Linz	\N	\N	1
11	Salzburg	\N	state	SZ	Salzburg	\N	\N	1
12	Steiermark	Styria	state	ST	Graz	\N	\N	1
13	Tirol	Tyrol	state	TR	Innsbruck	\N	\N	1
14	Vorarlberg	\N	state	VO	Bregenz	\N	\N	1
15	Wien	Vienna	state	WI	Vienna	\N	\N	1
16	Antwerp	\N	province	AN	Antwerp	Vlaanderen 	\N	2
17	Limburg	\N	province	LI	Hasselt	Vlaanderen 	\N	2
18	Vlaams Brabant	Flemish Brabant	province	VB	Leuven	Vlaanderen 	\N	2
19	Oost-Vlaanderen	East Flanders	province	OV	Leuven	Vlaanderen 	\N	2
20	West-Vlaanderen	West Flanders	province	WV	Brugge	Vlaanderen 	\N	2
21	Bruxelles	Brussels	capital region	BU	Bruxelles	Bruxelles	\N	2
22	Hainaut	\N	province	HT	Mons	Wallonie	\N	2
23	Brabant wallon	Walloon Brabant	province	BW	Wavre	Wallonie	\N	2
24	Namur	\N	province	NA	Namur	Wallonie	\N	2
25	Liège	\N	province	LG	Liège	Wallonie	\N	2
26	Luxembourg	\N	province	LX	Arlon	Wallonie	\N	2
27	Aabenraa	\N	municipality	AA	Aabenraa	Syddanmark	SD	3
28	Aalborg	\N	municipality	AA	Aalborg	Nordjylland	ND	3
29	Århus	\N	municipality	AR	Århus	Midtjylland	MJ	3
30	Ærø	\N	municipality	AE	Ærø	Syddanmark	SD	3
31	Albertslund	\N	municipality	AB	Albertslund	Hovedstaden	HS	3
32	Allerød	\N	municipality	AL	Allerød	Hovedstaden	HS	3
33	Assens	\N	municipality	AS	Assens	Syddanmark	SD	3
34	Ballerup	\N	municipality	BA	Ballerup	Hovedstaden	HS	3
35	Billund	\N	municipality	BI	Billund	Syddanmark	SD	3
36	Bogense	\N	municipality	BO	Bogense	Syddanmark	SD	3
37	Bornholms	\N	municipality	BO	Bornholms	Hovedstaden	HS	3
38	Brøndby	\N	municipality	BR	Brøndby	Hovedstaden	HS	3
39	Brønderslev	\N	municipality	BD	Brønderslev	Nordjylland	ND	3
40	Christiansø	\N	municipality	CH	Christiansø	Hovedstaden	HS	3
41	Dragør	\N	municipality	DR	Dragør	Hovedstaden	HS	3
42	Egedal	\N	municipality	EG	Egedal	Hovedstaden	HS	3
43	Esbjerg	\N	municipality	ES	Esbjerg	Syddanmark	SD	3
44	Fåborg-Midtfyn	\N	municipality	FM	Fåborg-Midtfyn	Syddanmark	SD	3
45	Fanø	\N	municipality	FA	Fanø	Syddanmark	SD	3
46	Favrskov	\N	municipality	FA	Favrskov	Midtjylland	MJ	3
47	Faxe	\N	municipality	FA	Faxe	Sjælland	SL	3
48	Fredensborg	\N	municipality	FN	Fredensborg	Hovedstaden	HS	3
49	Fredericia	\N	municipality	FR	Fredericia	Syddanmark	SD	3
50	Frederiksberg	\N	municipality	FB	Frederiksberg	Hovedstaden	HS	3
51	Frederikshavn	\N	municipality	FR	Frederikshavn	Nordjylland	ND	3
52	Frederikssund	\N	municipality	FS	Frederikssund	Hovedstaden	HS	3
53	Frederiksværk-Hundested	\N	municipality	FH	Frederiksværk-Hundested	Hovedstaden	HS	3
54	Furesø	\N	municipality	FU	Furesø	Hovedstaden	HS	3
55	Gentofte	\N	municipality	GE	Gentofte	Hovedstaden	HS	3
56	Gladsaxe	\N	municipality	GX	Gladsaxe	Hovedstaden	HS	3
57	Glostrup	\N	municipality	GP	Glostrup	Hovedstaden	HS	3
58	Greve	\N	municipality	GR	Greve	Sjælland	SL	3
59	Gribskov	\N	municipality	GR	Gribskov	Hovedstaden	HS	3
60	Guldborgsund	\N	municipality	GU	Guldborgsund	Sjælland	SL	3
61	Haderslev	\N	municipality	HA	Haderslev	Syddanmark	SD	3
62	Hedensted	\N	municipality	HD	Hedensted	Midtjylland	MJ	3
63	Helsingør	\N	municipality	HG	Helsingør	Hovedstaden	HS	3
64	Herlev	\N	municipality	HV	Herlev	Hovedstaden	HS	3
65	Herning	\N	municipality	HG	Herning	Midtjylland	MJ	3
66	Hillerød	\N	municipality	HI	Hillerød	Hovedstaden	HS	3
67	Hjørring	\N	municipality	HJ	Hjørring	Nordjylland	ND	3
68	Høje-Taastrup	\N	municipality	HT	Høje-Taastrup	Hovedstaden	HS	3
69	Holbæk	\N	municipality	HO	Holbæk	Sjælland	SL	3
70	Holstebro	\N	municipality	HB	Holstebro	Midtjylland	MJ	3
71	Horsens	\N	municipality	HS	Horsens	Midtjylland	MJ	3
72	Hørsholm	\N	municipality	HO	Hørsholm	Hovedstaden	HS	3
73	Hvidovre	\N	municipality	HD	Hvidovre	Hovedstaden	HS	3
74	Ikast-Brande	\N	municipality	IB	Ikast-Brande	Midtjylland	MJ	3
75	Ishøj	\N	municipality	IS	Ishøj	Hovedstaden	HS	3
76	Jammerbugt	\N	municipality	JA	Jammerbugt	Nordjylland	ND	3
77	Kalundborg	\N	municipality	KA	Kalundborg	Sjælland	SL	3
78	Kerteminde	\N	municipality	KE	Kerteminde	Syddanmark	SD	3
79	Københavns	Kobenhavn	municipality	KO	Københavns	Hovedstaden	HS	3
80	Køge	\N	municipality	KO	Køge	Sjælland	SL	3
81	Kolding	\N	municipality	KO	Kolding	Syddanmark	SD	3
82	Læsø	\N	municipality	LA	Læsø	Nordjylland	ND	3
83	Langeland	\N	municipality	LA	Langeland	Syddanmark	SD	3
84	Lejre	\N	municipality	LE	Lejre	Sjælland	SL	3
85	Lemvig	\N	municipality	LE	Lemvig	Midtjylland	MJ	3
86	Lolland	\N	municipality	LO	Lolland	Sjælland	SL	3
87	Lyngby-Taarbæk	\N	municipality	LT	Lyngby-Taarbæk	Hovedstaden	HS	3
88	Mariager Fjord	\N	municipality	MF	Mariager Fjord	Nordjylland	ND	3
89	Middelfart	\N	municipality	MI	Middelfart	Syddanmark	SD	3
90	Morsø	\N	municipality	MO	Morsø	Nordjylland	ND	3
91	Næstved	\N	municipality	NA	Næstved	Sjælland	SL	3
92	Norddjurs	\N	municipality	NO	Norddjurs	Midtjylland	MJ	3
93	Nyborg	\N	municipality	NY	Nyborg	Syddanmark	SD	3
94	Odder	\N	municipality	OD	Odder	Midtjylland	MJ	3
95	Odense	\N	municipality	OD	Odense	Syddanmark	SD	3
96	Odsherred	\N	municipality	OD	Odsherred	Sjælland	SL	3
97	Randers	\N	municipality	RA	Randers	Midtjylland	MJ	3
98	Rebild	\N	municipality	RE	Rebild	Nordjylland	ND	3
99	Ringkøbing-Skjern	\N	municipality	RS	Ringkøbing-Skjern	Midtjylland	MJ	3
100	Ringsted	\N	municipality	RI	Ringsted	Sjælland	SL	3
101	Rødovre	\N	municipality	RO	Rødovre	Hovedstaden	HS	3
102	Roskilde	\N	municipality	RO	Roskilde	Sjælland	SL	3
103	Rudersdal	\N	municipality	RU	Rudersdal	Hovedstaden	HS	3
104	Samsø	\N	municipality	SA	Samsø	Midtjylland	MJ	3
105	Silkeborg	\N	municipality	SI	Silkeborg	Midtjylland	MJ	3
106	Skanderborg	\N	municipality	SD	Skanderborg	Midtjylland	MJ	3
107	Skive	\N	municipality	SV	Skive	Midtjylland	MJ	3
108	Slagelse	\N	municipality	SL	Slagelse	Sjælland	SL	3
109	Solrød	\N	municipality	SD	Solrød	Sjælland	SL	3
110	Sønderborg	\N	municipality	SO	Sønderborg	Syddanmark	SD	3
111	Sorø	\N	municipality	SO	Sorø	Sjælland	SL	3
112	Stevns	\N	municipality	ST	Stevns	Sjælland	SL	3
113	Struer	\N	municipality	ST	Struer	Midtjylland	MJ	3
114	Svendborg	\N	municipality	SV	Svendborg	Syddanmark	SD	3
115	Syddjurs	\N	municipality	SY	Syddjurs	Midtjylland	MJ	3
116	Tårnby	\N	municipality	TA	Tårnby	Hovedstaden	HS	3
117	Thisted	\N	municipality	TH	Thisted	Nordjylland	ND	3
118	Tønder	\N	municipality	TO	Tønder	Syddanmark	SD	3
119	Vallensbæk	\N	municipality	VA	Vallensbæk	Hovedstaden	HS	3
120	Varde	\N	municipality	VA	Varde	Syddanmark	SD	3
121	Vejen	\N	municipality	VN	Vejen	Syddanmark	SD	3
122	Vejle	\N	municipality	VL	Vejle	Syddanmark	SD	3
123	Vesthimmerland	\N	municipality	VE	Vesthimmerland	Nordjylland	ND	3
124	Viborg	\N	municipality	VI	Viborg	Midtjylland	MJ	3
125	Vordingborg	\N	municipality	VO	Vordingborg	Sjælland	SL	3
126	Etelä-Suomen	Southern Finland	province	VO	Hämeenlinna	\N	\N	4
127	Länsi-Suomen	Western Finland	province	LS	Turku	\N	\N	4
128	Itä-Suomen	Eastern Finland	province	IS	Mikkeli	\N	\N	4
129	Oulu	\N	province	OU	Oulu	\N	\N	4
130	Lapin	Lapland	province	LP	Rovaniemi	\N	\N	4
131	Ahvenanmaan	Åland	autonomous province	AL	Mariehamn	\N	\N	4
132	Ain	\N	department	AI	Bourg-en-Bresse	Rhône-Alpes	V	5
133	Aisne	\N	department	AS	Laon	Picardie	S	5
134	Allier	\N	department	AL	Moulins	Auvergne	C	5
135	Alpes-de-Haute-Provence	\N	department	AP	Digne	Provence-Alpes-Côte-d'Azur	U	5
136	Alpes-Maritimes	\N	department	AM	Nice	Provence-Alpes-Côte-d'Azur	U	5
137	Ardèche	\N	department	AH	Privas	Rhône-Alpes	V	5
138	Ardennes	\N	department	AN	Charleville-Mézières	Champagne-Ardenne	G	5
139	Ariège	\N	department	AG	Foix	Midi-Pyrénées	N	5
140	Aube	\N	department	AB	Troyes	Champagne-Ardenne	G	5
141	Aude	\N	department	AD	Carcassonne	Languedoc-Roussillon	K	5
142	Aveyron	\N	department	AV	Rodez	Midi-Pyrénées	N	5
143	Bas-Rhin	\N	department	BR	Strasbourg	Alsace	A	5
144	Bouches-du-Rhône	\N	department	BD	Marseille	Provence-Alpes-Côte-d'Azur	U	5
145	Calvados	\N	department	CV	Caen	Basse-Normandie	P	5
146	Cantal	\N	department	CL	Aurillac	Auvergne	C	5
147	Charente	\N	department	CT	Angoulême	Poitou-Charentes	T	5
148	Charente-Maritime	\N	department	CM	La Rochelle	Poitou-Charentes	T	5
149	Cher	\N	department	CH	Bourges	Centre	F	5
150	Corrèze	\N	department	CZ	Tulle	Limousin	L	5
151	Corse-du-Sud	\N	department	CS	Ajaccio	Corse	H	5
152	Côte-d'Or	\N	department	CO	Dijon	Bourgogne	D	5
153	Côtes-d'Armor	\N	department	CA	Saint-Brieuc	Bretagne	E	5
154	Creuse	\N	department	CR	Guéret	Limousin	L	5
155	Deux-Sèvres	\N	department	DS	Niort	Poitou-Charentes	T	5
156	Dordogne	\N	department	DD	Périgueux	Aquitaine	B	5
157	Doubs	\N	department	DB	Besançon	Franche-Comté	I	5
158	Drôme	\N	department	DM	Valence	Rhône-Alpes	V	5
159	Essonne	\N	department	ES	Évry	Île-de-France	J	5
160	Eure	\N	department	EU	Évreux	Haute-Normandie	Q	5
161	Eure-et-Loir	\N	department	EL	Chartres	Centre	F	5
162	Finistère	\N	department	FI	Quimper	Bretagne	E	5
163	Gard	\N	department	GA	Nîmes	Languedoc-Roussillon	K	5
164	Gers	\N	department	GE	Auch	Midi-Pyrénées	N	5
165	Gironde	\N	department	GI	Bordeaux	Aquitaine	B	5
166	Haute-Corse	\N	department	HC	Bastia	Corse	H	5
167	Haute-Garonne	\N	department	HG	Toulouse	Midi-Pyrénées	N	5
168	Haute-Loire	\N	department	HL	Le Puy	Auvergne	C	5
169	Haute-Marne	\N	department	HM	Chaumont	Champagne-Ardenne	G	5
170	Hautes-Alpes	\N	department	HA	Gap	Provence-Alpes-Côte-d'Azur	U	5
171	Haute-Saône	\N	department	HN	Vesoul	Franche-Comté	I	5
172	Haute-Savoie	\N	department	HS	Annecy	Rhône-Alpes	V	5
173	Hautes-Pyrénées	\N	department	HP	Tarbes	Midi-Pyrénées	N	5
174	Haute-Vienne	\N	department	HV	Limoges	Limousin	L	5
175	Haut-Rhin	\N	department	HR	Colmar	Alsace	A	5
176	Hauts-de-Seine	\N	department	HD	Nanterre	Île-de-France	J	5
177	Hérault	\N	department	HE	Montpellier	Languedoc-Roussillon	K	5
178	Ille-et-Vilaine	\N	department	IV	Rennes	Bretagne	E	5
179	Indre	\N	department	IN	Châteauroux	Centre	F	5
180	Indre-et-Loire	\N	department	IL	Tours	Centre	F	5
181	Isère	\N	department	IS	Grenoble	Rhône-Alpes	V	5
182	Jura	\N	department	JU	Lons-le-Saunier	Franche-Comté	I	5
183	Landes	\N	department	LD	Mont-de-Marsan	Aquitaine	B	5
184	Loire	\N	department	LR	Saint-Étienne	Rhône-Alpes	V	5
185	Loire-Atlantique	\N	department	LA	Nantes	Pays de la Loire	R	5
186	Loiret	\N	department	LT	Orléans	Centre	F	5
187	Loir-et-Cher	\N	department	LC	Blois	Centre	F	5
188	Lot	\N	department	LO	Cahors	Midi-Pyrénées	N	5
189	Lot-et-Garonne	\N	department	LG	Agen	Aquitaine	B	5
190	Lozère	\N	department	LZ	Mende	Languedoc-Roussillon	K	5
191	Maine-et-Loire	\N	department	ML	Angers	Pays de la Loire	R	5
192	Manche	\N	department	MH	Saint-Lô	Basse-Normandie	P	5
193	Marne	\N	department	MR	Châlons-en-Champagne	Champagne-Ardenne	G	5
194	Mayenne	\N	department	MY	Laval	Pays de la Loire	R	5
195	Meurthe-et-Moselle	\N	department	MM	Nancy	Lorraine	M	5
196	Meuse	\N	department	MS	Bar-le-Duc	Lorraine	M	5
197	Morbihan	\N	department	MB	Vannes	Bretagne	E	5
198	Moselle	\N	department	MO	Metz	Lorraine	M	5
199	Nièvre	\N	department	NI	Nevers	Bourgogne	D	5
200	Nord	\N	department	NO	Lille	Nord-Pas-de-Calais	O	5
201	Oise	\N	department	OI	Beauvais	Picardie	S	5
202	Orne	\N	department	OR	Alençon	Basse-Normandie	P	5
203	Pas-de-Calais	\N	department	PC	Arras	Nord-Pas-de-Calais	O	5
204	Puy-de-Dôme	\N	department	PD	Clermont-Ferrand	Auvergne	C	5
205	Pyrénées-Atlantiques	\N	department	PA	Pau	Aquitaine	B	5
206	Pyrénées-Orientales	\N	department	PO	Perpignan	Languedoc-Roussillon	K	5
207	Rhône	\N	department	RH	Lyon	Rhône-Alpes	V	5
208	Saône-et-Loire	\N	department	SL	Mâcon	Bourgogne	D	5
209	Sarthe	\N	department	ST	Le Mans	Pays de la Loire	R	5
210	Savoie	\N	department	SV	Chambéry	Rhône-Alpes	V	5
211	Seine-et-Marne	\N	department	SE	Melun	Île-de-France	J	5
212	Seine-Maritime	\N	department	SM	Rouen	Haute-Normandie	Q	5
213	Seine-Saint-Denis	\N	department	SS	Bobigny	Île-de-France	J	5
214	Somme	\N	department	SO	Amiens	Picardie	S	5
215	Tarn	\N	department	TA	Albi	Midi-Pyrénées	N	5
216	Tarn-et-Garonne	\N	department	TG	Montauban	Midi-Pyrénées	N	5
217	Territoire de Belfort	\N	department	TB	Belfort	Franche-Comté	I	5
218	Val-de-Marne	\N	department	VM	Créteil	Île-de-France	J	5
219	Val-d'Oise	\N	department	VO	Cergy-Pontoise	Île-de-France	J	5
220	Var	\N	department	VR	Toulon	Provence-Alpes-Côte-d'Azur	U	5
221	Vaucluse	\N	department	VC	Avignon	Provence-Alpes-Côte-d'Azur	U	5
222	Vendée	\N	department	VD	La Roche-sur-Yon	Pays de la Loire	R	5
223	Vienne	\N	department	VN	Poitiers	Poitou-Charentes	T	5
224	Paris	\N	department	VP	Paris	Île-de-France	J	5
225	Vosges	\N	department	VG	Épinal	Lorraine	M	5
226	Yonne	\N	department	YO	Auxerre	Bourgogne	D	5
227	Yvelines	\N	department	YV	Versailles	Île-de-France	J	5
228	Baden-Württemberg	Baden-Wurttemberg	state	BW	Stuttgart	\N	\N	6
229	Bayern	Bavaria	state	BY	Munich	\N	\N	6
230	Berlin	\N	state	BE	Berlin	\N	\N	6
231	Brandenburg	\N	state	BB	Potsdam	\N	\N	6
232	Bremen	\N	state	HB	Bremen	\N	\N	6
233	Hamburg	\N	state	HH	Hamburg	\N	\N	6
234	Hessen	Hesse	state	HE	Wiesbaden	\N	\N	6
235	Niedersachsen	Lower Saxony	state	NI	Hanover	\N	\N	6
236	Mecklenburg-Vorpommern	Mecklenburg-West Pomerania	state	MV	Schwerin	\N	\N	6
237	Nordrhein-Westfalen	North Rhine-Westphalia	state	NW	Dusseldorf	\N	\N	6
238	Rheinland-Pfalz	Rhineland-Palatinate	state	RP	Mainz	\N	\N	6
239	Saarland	\N	state	SL	Saarbrucken	\N	\N	6
240	Sachsen	Saxony	state	SN	Dresden	\N	\N	6
241	Sachsen-Anhalt	Saxony-Anhalt	state	ST	Magdeburg	\N	\N	6
242	Schleswig-Holstein	Schleswig-Holstein	state	SH	Kiel	\N	\N	6
243	Thüringen	Thuringia	state	TH	Erfurt	\N	\N	6
244	Ceatharlach	Carlow	county	CW	Carlow	\N	\N	7
245	An Cabhán	Cavan	county	CN	Cavan	\N	\N	7
246	An Clár	Clare	county	CE	Ennis	\N	\N	7
247	Corcaigh	Cork	county	CK	Cork	\N	\N	7
248	Dún na nGall	Donegal	county	DL	Lifford	\N	\N	7
249	Baile Átha Cliath	Dublin	county	DN	Dublin	\N	\N	7
250	Gaillimh	Galway	county	GY	Galway	\N	\N	7
251	Ciarraí	Kerry	county	KY	Tralee	\N	\N	7
252	Cill Dara	Kildare	county	KE	Naas	\N	\N	7
253	Cill Chainnigh	Kilkenny	county	KK	Kilkenny	\N	\N	7
254	Laoise	Laois	county	LS	Portlaoise	\N	\N	7
255	Liatroim	Leitrim	county	LM	Carrick on Shannon	\N	\N	7
256	Luimneach	Limerick	county	LK	Limerick	\N	\N	7
257	An Longfort	Longford	county	LD	Longford	\N	\N	7
258	Lú	Louth	county	LH	Dundalk	\N	\N	7
259	Maigh Eo	Mayo	county	MO	Castlebar	\N	\N	7
260	An Mhí	Meath	county	MH	Trim	\N	\N	7
261	Muineachán	Monaghan	county	MN	Monaghan	\N	\N	7
262	Uíbh Fhailí	Offaly	county	OY	Tullamore	\N	\N	7
263	Ros Comáin	Roscommon	county	RN	Roscommon	\N	\N	7
264	Sligeach	Sligo	county	SO	Sligo	\N	\N	7
265	Tiobraid Árann	Tipperary	county	TY	Clonmel (S), Nenagh (N)	\N	\N	7
266	Port Láirge	Waterford	county	WD	Waterford	\N	\N	7
267	An Iarmhí	Westmeath	county	WH	Mullingar	\N	\N	7
268	Loch Garman	Wexford	county	WX	Wexford	\N	\N	7
269	Cill Mhantáin	Wicklow	county	WW	Wicklow	\N	\N	7
270	Agrigento	\N	province	AG	Agrigento	Sicilia	SC	8
271	Alessandria	\N	province	AL	Alessandria	Piemonte	PM	8
272	Ancona	\N	province	AN	Ancona	Marche	MH	8
273	Aosta	\N	province	AO	Aosta	Valle d'Aosta	VD	8
274	Arezzo	\N	province	AR	Arezzo	Toscana	TC	8
275	Ascoli Piceno	\N	province	AC	Ascoli Piceno	Marche	MH	8
276	Asti	\N	province	AT	Asti	Piemonte	PM	8
277	Avellino	\N	province	AV	Avellino	Campania	CM	8
278	Bari	\N	province	BB	Bari	Apulia	PU	8
279	Barletta-Andria-Trani	\N	province	BT	Andria	Apulia	PU	8
280	Belluno	\N	province	BL	Belluno	Veneto	VN	8
281	Benevento	\N	province	BN	Benevento	Campania	CM	8
282	Bergamo	\N	province	BG	Bergamo	Lombardia	LM	8
283	Biella	\N	province	BI	Biella	Piemonte	PM	8
284	Bologna	\N	province	BO	Bologna	Emilia-Romagna	ER	8
285	Bolzano	\N	province	BZ	Bolzano	Trentino-Alto Adige	TT	8
286	Brescia	\N	province	BS	Brescia	Lombardia	LM	8
287	Brindisi	\N	province	BR	Brindisi	Apulia	PU	8
288	Cagliari	\N	province	CG	Cagliari	Sardegna	SD	8
289	Caltanissetta	\N	province	CL	Caltanissetta	Sicilia	SC	8
290	Campobasso	\N	province	CB	Campobasso	Molise	ML	8
291	Carbonia-Iglesias	\N	province	CI	Carbonia	Sardegna	SD	8
292	Caserta	\N	province	CE	Caserta	Campania	CM	8
293	Catania	\N	province	CT	Catania	Sicilia	SC	8
294	Catanzaro	\N	province	CZ	Catanzaro	Calabria	CI	8
295	Chieti	\N	province	CH	Chieti	Abruzzo	AB	8
296	Como	\N	province	CO	Como	Lombardia	LM	8
297	Cosenza	\N	province	CS	Cosenza	Calabria	CI	8
298	Cremona	\N	province	CR	Cremona	Lombardia	LM	8
299	Crotone	\N	province	KR	Crotone	Calabria	CI	8
300	Cuneo	\N	province	CN	Cuneo	Piemonte	PM	8
301	Enna	\N	province	EN	Enna	Sicilia	SC	8
302	Fermo	\N	province	FM	Fermo	Marche	MH	8
303	Ferrara	\N	province	FE	Ferrara	Emilia-Romagna	ER	8
304	Firenze	Florence	province	FI	Firenze	Toscana	TC	8
305	Foggia	\N	province	FA	Foggia	Apulia	PU	8
306	Forlì-Cesena	\N	province	FO	Forlì	Emilia-Romagna	ER	8
307	Frosinone	\N	province	FR	Frosinone	Lazio	LZ	8
308	Genova	Genoa	province	GE	Genova	Liguria	LG	8
309	Gorizia	\N	province	GO	Gorizia	Friuli-Venezia Giulia	FV	8
310	Grosseto	\N	province	GR	Grosseto	Toscana	TC	8
311	Imperia	\N	province	IM	Imperia	Liguria	LG	8
312	Isernia	\N	province	IS	Isernia	Molise	ML	8
313	L'Aquila	\N	province	AQ	L'Aquila	Abruzzo	AB	8
314	La Spezia	\N	province	SP	La Spezia	Liguria	LG	8
315	Latina	\N	province	LT	Latina	Lazio	LZ	8
316	Lecce	\N	province	LE	Lecce	Apulia	PU	8
317	Lecco	\N	province	LC	Lecco	Lombardia	LM	8
318	Livorno	\N	province	LI	Livorno	Toscana	TC	8
319	Lodi	\N	province	LO	Lodi	Lombardia	LM	8
320	Lucca	\N	province	LU	Lucca	Toscana	TC	8
321	Macerata	\N	province	MC	Macerata	Marche	MH	8
322	Mantua	\N	province	MN	Mantua	Lombardia	LM	8
323	Massa-Carrara	\N	province	MS	Massa	Toscana	TC	8
324	Matera	\N	province	MT	Matera	Basilicata	BC	8
325	Medio Campidano	\N	province	MD	Sanluri	Sardegna	SD	8
326	Messina	\N	province	ME	Messina	Sicilia	SC	8
327	Milano	Milan	province	MA	Milano	Lombardia	LM	8
328	Modena	\N	province	MO	Modena	Emilia-Romagna	ER	8
329	Monza e Brianza	\N	province	MZ	Monza	Lombardia	LM	8
330	Napoli	Naples	province	NA	Naples	Campania	CM	8
331	Novara	\N	province	NO	Novara	Piemonte	PM	8
332	Nuoro	\N	province	NR	Nuoro	Sardegna	SD	8
333	Ogliastra	\N	province	OG	Tortoli	Sardegna	SD	8
334	Olbia-Tempio	\N	province	OT	Olbia	Sardegna	SD	8
335	Oristano	\N	province	ON	Oristano	Sardegna	SD	8
336	Padova	Padua	province	PD	Padova	Veneto	VN	8
337	Palermo	\N	province	PA	Palermo	Sicilia	SC	8
338	Parma	\N	province	PR	Parma	Emilia-Romagna	ER	8
339	Pavia	\N	province	PV	Pavia	Lombardia	LM	8
340	Perugia	\N	province	PG	Perugia	Umbria	UM	8
341	Pesaro e Urbino	\N	province	PS	Pesaro	Marche	MH	8
342	Pescara	\N	province	PE	Pescara	Abruzzo	AB	8
343	Piacenza	\N	province	PC	Piacenza	Emilia-Romagna	ER	8
344	Pisa	\N	province	PI	Pisa	Toscana	TC	8
345	Pistoia	\N	province	PT	Pistoia	Toscana	TC	8
346	Pordenone	\N	province	PN	Pordenone	Friuli-Venezia Giulia	FV	8
347	Potenza	\N	province	PZ	Potenza	Basilicata	BC	8
348	Prato	\N	province	PO	Prato	Toscana	TC	8
349	Ragusa	\N	province	RG	Ragusa	Sicilia	SC	8
350	Ravenna	\N	province	RA	Ravenna	Emilia-Romagna	ER	8
351	Reggio Calabria	\N	province	RC	Reggio Calabria	Calabria	CI	8
352	Reggio Emilia	\N	province	RE	Reggio Emilia	Emilia-Romagna	ER	8
353	Rieti	\N	province	RI	Rieti	Lazio	LZ	8
354	Rimini	\N	province	RN	Rimini	Emilia-Romagna	ER	8
355	Roma	Rome	province	RM	Roma	Lazio	LZ	8
356	Rovigo	\N	province	RO	Rovigo	Veneto	VN	8
357	Salerno	\N	province	SA	Salerno	Campania	CM	8
358	Sassari	\N	province	SX	Sassari	Sardegna	SD	8
359	Savona	\N	province	SV	Savona	Liguria	LG	8
360	Siena	\N	province	SI	Siena	Toscana	TC	8
361	Sondrio	\N	province	SO	Sondrio	Lombardia	LM	8
362	Siracusa	Syracuse	province	SR	Siracusa	Sicilia	SC	8
363	Taranto	\N	province	TA	Taranto	Apulia	PU	8
364	Teramo	\N	province	TE	Teramo	Abruzzo	AB	8
365	Terni	\N	province	TR	Terni	Umbria	UM	8
366	Trapani	\N	province	TP	Trapani	Sicilia	SC	8
367	Trento	\N	province	TN	Trento	Trentino-Alto Adige	TT	8
368	Treviso	\N	province	TV	Treviso	Veneto	VN	8
369	Trieste	\N	province	TS	Trieste	Friuli-Venezia Giulia	FV	8
370	Torino	Turin	province	TO	Torino	Piemonte	PM	8
371	Udine	\N	province	UD	Udine	Friuli-Venezia Giulia	FV	8
372	Varese	\N	province	VA	Varese	Lombardia	LM	8
373	Venezia	Venice	province	VE	Venezia	Veneto	VN	8
374	Verbano-Cusio-Ossola	\N	province	VB	Verbania	Piemonte	PM	8
375	Vercelli	\N	province	VC	Vercelli	Piemonte	PM	8
376	Verona	\N	province	VR	Verona	Veneto	VN	8
377	Vibo Valentia	\N	province	VV	Vibo Valentia	Calabria	CI	8
378	Vicenza	\N	province	VI	Vicenza	Veneto	VN	8
379	Viterbo	\N	province	VT	Viterbo	Lazio	LZ	8
380	Drenthe	\N	province	DR	Assen	\N	\N	9
381	Flevoland	\N	province	FL	Lelystad	\N	\N	9
382	Friesland	\N	province	FR	Leeuwarden	\N	\N	9
383	Gelderland	\N	province	GE	Arnhem	\N	\N	9
384	Groningen	\N	province	GR	Groningen	\N	\N	9
385	Limburg	\N	province	LI	Maastricht	\N	\N	9
386	Noord-Brabant	North Brabant	province	NB	's-Hertogenbosch	\N	\N	9
387	Noord-Holland	North Holland	province	NH	Haarlem	\N	\N	9
388	Overijssel	\N	province	OV	Zwolle	\N	\N	9
389	Utrecht	\N	province	UT	Utrecht	\N	\N	9
390	Zeeland	\N	province	ZE	Middelburg	\N	\N	9
391	Zuid-Holland	South Holland	province	ZH	The Hague	\N	\N	9
392	Akershus	\N	county	AK	Oslo	\N	\N	10
393	Aust-Agder	\N	county	AA	Arendal	\N	\N	10
394	Buskerud	\N	county	BU	Drammen	\N	\N	10
395	Finnmark	\N	county	FI	Vadsø	\N	\N	10
396	Hedmark	\N	county	HE	Hamar	\N	\N	10
397	Hordaland	\N	county	HO	Bergen	\N	\N	10
398	Møre og Romsdal	\N	county	MR	Molde	\N	\N	10
399	Nordland	\N	county	NO	Bodø	\N	\N	10
400	Nord-Trøndelag	\N	county	NT	Steinkjer	\N	\N	10
401	Oppland	\N	county	OP	Lillehammer	\N	\N	10
402	Oslo	\N	county	OS	Oslo	\N	\N	10
403	Østfold	\N	county	OF	Sarpsborg	\N	\N	10
404	Rogaland	\N	county	RO	Stavanger	\N	\N	10
405	Sogn og Fjordane	\N	county	SF	Hermansverk	\N	\N	10
406	Sør-Trøndelag	\N	county	ST	Trondheim	\N	\N	10
407	Telemark	\N	county	TE	Skien	\N	\N	10
408	Troms	\N	county	TR	Tromsø	\N	\N	10
409	Vest-Agder	\N	county	VA	Kristiansand	\N	\N	10
410	Vestfold	\N	county	VF	Tønsberg	\N	\N	10
411	Dolnoslaskie	\N	voivodship	DS	Wroclaw	\N	\N	11
412	Kujawsko-pomorskie	\N	voivodship	KP	Bydgoszcz	\N	\N	11
413	Lódzkie	\N	voivodship	LD	Lódz	\N	\N	11
414	Lubelskie	\N	voivodship	LU	Lublin	\N	\N	11
415	Lubuskie	\N	voivodship	LB	Gorzów	\N	\N	11
416	Malopolskie	\N	voivodship	MA	Kraków	\N	\N	11
417	Mazowieckie	\N	voivodship	MZ	Warszawa	\N	\N	11
418	Opolskie	\N	voivodship	OP	Opole	\N	\N	11
419	Podkarpackie	\N	voivodship	PK	Rzeszów	\N	\N	11
420	Podlaskie	\N	voivodship	PD	Bialystok	\N	\N	11
421	Pomorskie	\N	voivodship	PM	Gdansk	\N	\N	11
422	Slaskie	\N	voivodship	SL	Katowice	\N	\N	11
423	Swietokrzyskie	\N	voivodship	SK	Kielce	\N	\N	11
424	Warminsko-mazurskie	\N	voivodship	WN	Olsztyn	\N	\N	11
425	Wielkopolskie	\N	voivodship	WP	Poznan	\N	\N	11
426	Zachodniopomorskie	\N	voivodship	ZP	Szczecin	\N	\N	11
427	Aveiro	\N	district	AV	Aveiro	Centro	\N	12
428	Azores	\N	autonomous region	AC	Ponta Delgada	Açores	\N	12
429	Beja	\N	district	BE	Beja	Alentejo	\N	12
430	Braga	\N	district	BR	Braga	Norte	\N	12
431	Bragança	\N	district	BA	Bragança	Norte	\N	12
432	Castelo Branco	\N	district	CB	Castelo Branco	Centro	\N	12
433	Coimbra	\N	district	CO	Coimbra	Centro	\N	12
434	Évora	\N	district	EV	Évora	Alentejo	\N	12
435	Faro	\N	district	FA	Faro	Algarve	\N	12
436	Guarda	\N	district	GU	Guarda	Centro	\N	12
437	Leiria	\N	district	LE	Leiria	Centro	\N	12
438	Lisboa	\N	district	LI	Lisboa	Lisboa e Vale do Tejo	\N	12
439	Madeira	\N	autonomous region	MA	Funchal	Madeira	\N	12
440	Portalegre	\N	district	PA	Portalegre	Alentejo	\N	12
441	Porto	\N	district	PO	Porto	Norte	\N	12
442	Santarém	\N	district	SA	Santarém	Lisboa e Vale do Tejo	\N	12
443	Setúbal	\N	district	SE	Setúbal	Lisboa e Vale do Tejo	\N	12
444	Viana do Castelo	\N	district	VC	Viana do Castelo	Norte	\N	12
445	Vila Real	\N	district	VR	Vila Real	Norte	\N	12
446	Viseu	\N	district	VI	Viseu	Centro	\N	12
447	Álava	\N	province	\N	Vitoria	País Vasco	\N	13
448	Albacete	\N	province	\N	Albacete	Castilla-La Mancha	\N	13
449	Alicante	\N	province	\N	Alicante	Comunidad Valenciana	\N	13
450	Almería	\N	province	\N	Almería	Andalucía	\N	13
451	Asturias	\N	province	\N	Oviedo	Principado de Asturias	\N	13
452	Ávila	\N	province	\N	Ávila	Castilla y León	\N	13
453	Badajoz	\N	province	\N	Badajoz	Extremadura	\N	13
454	Barcelona	\N	province	\N	Barcelona	Cataluña	\N	13
455	Burgos	\N	province	\N	Burgos	Castilla y León	\N	13
456	Cáceres	\N	province	\N	Cáceres	Extremadura	\N	13
457	Cádiz	\N	province	\N	Cádiz	Andalucía	\N	13
458	Cantabria	\N	province	\N	Santander	Cantabria	\N	13
459	Castellón	\N	province	\N	Castellón de la Plana	Comunidad Valenciana	\N	13
460	Ciudad Real	\N	province	\N	Ciudad Real	Castilla-La Mancha	\N	13
461	Córdoba	\N	province	\N	Córdoba	Andalucía	\N	13
462	La Coruña	\N	province	\N	La Coruña	Galicia	\N	13
463	Cuenca	\N	province	\N	Cuenca	Castilla-La Mancha	\N	13
464	Gerona	\N	province	\N	Gerona	Cataluña	\N	13
465	Granada	\N	province	\N	Granada	Andalucía	\N	13
466	Guadalajara	\N	province	\N	Guadalajara	Castilla-La Mancha	\N	13
467	Guipúzcoa	\N	province	\N	San Sebastián	País Vasco	\N	13
468	Huelva	\N	province	\N	Huelva	Andalucía	\N	13
469	Huesca	\N	province	\N	Huesca	Aragón	\N	13
470	Islas Baleares	\N	province	\N	Palma de Mallorca	Islas Baleares	\N	13
471	Santa Cruz de Tenerife	\N	province	\N	Santa Cruz de Tenerife	Islas Canarias	\N	13
472	Jaén	\N	province	\N	Jaén	Andalucía	\N	13
473	León	\N	province	\N	León	Castilla y León	\N	13
474	Lérida	\N	province	\N	Lérida	Cataluña	\N	13
475	Lugo	\N	province	\N	Lugo	Galicia	\N	13
476	Madrid	\N	province	\N	Madrid	Comunidad de Madrid	\N	13
477	Málaga	\N	province	\N	Málaga	Andalucía	\N	13
478	Murcia	\N	province	\N	Murcia	Región de Murcia	\N	13
479	Navarra	\N	province	\N	Pamplona	Comunidad Foral de Navarra	\N	13
480	Orense	\N	province	\N	Orense	Galicia	\N	13
481	Palencia	\N	province	\N	Palencia	Castilla y León	\N	13
482	Las Palmas	\N	province	\N	Las Palmas de Gran Canaria	Islas Canarias	\N	13
483	Pontevedra	\N	province	\N	Pontevedra	Galicia	\N	13
484	La Rioja	\N	province	\N	Logroño	La Rioja	\N	13
485	Salamanca	\N	province	\N	Salamanca	Castilla y León	\N	13
486	Segovia	\N	province	\N	Segovia	Castilla y León	\N	13
487	Sevilla	\N	province	\N	Sevilla	Andalucía	\N	13
488	Soria	\N	province	\N	Soria	Castilla y León	\N	13
489	Tarragona	\N	province	\N	Tarragona	Cataluña	\N	13
491	Teruel	\N	province	\N	Teruel	Aragón	\N	13
492	Toledo	\N	province	\N	Toledo	Castilla-La Mancha	\N	13
493	Valencia	\N	province	\N	Valencia	Comunidad Valenciana	\N	13
494	Valladolid	\N	province	\N	Valladolid	Castilla y León	\N	13
495	Vizcaya	\N	province	\N	Bilbao	País Vasco	\N	13
496	Zamora	\N	province	\N	Zamora	Castilla y León	\N	13
497	Zaragoza	\N	province	\N	Zaragoza	Aragón	\N	13
498	Ceuta	\N	autonomous city	\N	Ceuta	Ceuta y Melilla	\N	13
499	Melilla	\N	autonomous city	\N	Melilla	Ceuta y Melilla	\N	13
500	Stockholm	\N	county	ST	Stockholm	\N	\N	14
501	Västerbotten	\N	county	VB	Umeå	\N	\N	14
502	Norrbotten	\N	county	NB	Luleå	\N	\N	14
503	Uppsala	\N	county	C	Uppsala	\N	\N	14
504	Södermanland	\N	county	SD	Nyköping	\N	\N	14
505	Östergötland	\N	county	OG	Linköping	\N	\N	14
506	Jönköping	\N	county	JO	Jönköping	\N	\N	14
507	Kronoberg	\N	county	KR	Växjö	\N	\N	14
508	Kalmar	\N	county	KA	Kalmar	\N	\N	14
509	Gotland	\N	county	GT	Visby	\N	\N	14
510	Blekinge	\N	county	BL	Karlskrona	\N	\N	14
511	Skåne	\N	county	SN	Malmö	\N	\N	14
512	Halland	\N	county	HA	Halmstad	\N	\N	14
513	Västra Götaland	\N	county	VG	Gothenburg	\N	\N	14
514	Värmland	\N	county	VR	Karlstad	\N	\N	14
515	Örebro	\N	county	OR	Örebro	\N	\N	14
516	Västmanland	\N	county	VM	Västerås	\N	\N	14
517	Dalarna	\N	county	KO	Falun	\N	\N	14
518	Gävleborg	\N	county	GV	Gävle	\N	\N	14
519	Västernorrland	\N	county	VN	Härnösand	\N	\N	14
520	Jämtland	\N	county	JA	Östersund	\N	\N	14
521	Aargau	\N	canton	AG	Aarau	\N	\N	15
522	Appenzell Outer Rhodes	\N	canton	AR	Herisau	\N	\N	15
523	Appenzell Inner Rhodes	\N	canton	AI	Appenzell	\N	\N	15
524	Basel-Landschaft	\N	canton	BL	Liestal	\N	\N	15
525	Basel-Stadt	\N	canton	BS	Basel	\N	\N	15
526	Bern	\N	canton	BE	Bern	\N	\N	15
527	Fribourg	\N	canton	FR	Fribourg	\N	\N	15
528	Geneva	\N	canton	GE	Geneva	\N	\N	15
529	Glarus	\N	canton	GL	Glarus	\N	\N	15
530	Graubünden	\N	canton	GR	Chur	\N	\N	15
531	Jura	\N	canton	JU	Delémont	\N	\N	15
532	Lucerne	\N	canton	LU	Lucerne	\N	\N	15
533	Neuchâtel	\N	canton	NE	Neuchâtel	\N	\N	15
534	Nidwalden	\N	canton	NW	Stans	\N	\N	15
535	Obwalden	\N	canton	OW	Sarnen	\N	\N	15
536	Sankt Gallen	\N	canton	SG	Saint Gall	\N	\N	15
537	Schaffhausen	\N	canton	SH	Schaffhausen	\N	\N	15
538	Schwyz	\N	canton	SZ	Schwyz	\N	\N	15
539	Solothurn	\N	canton	SO	Solothurn	\N	\N	15
540	Thurgau	\N	canton	TG	Frauenfeld	\N	\N	15
541	Ticino	\N	canton	TI	Bellinzona	\N	\N	15
542	Uri	\N	canton	UR	Altdorf	\N	\N	15
543	Valais	\N	canton	VS	Sion	\N	\N	15
544	Vaud	\N	canton	VD	Lausanne	\N	\N	15
545	Zug	\N	canton	ZG	Zug	\N	\N	15
546	Zurich	\N	canton	ZH	Zürich	\N	\N	15
547	Aberdeen	\N	Unitary district (city)	AR	Aberdeen	\N	\N	16
548	Aberdeenshire	\N	Unitary district	AS	Aberdeen	\N	\N	16
549	Anglesey	\N	Unitary authority (Wales)	AY	Llangefni	\N	\N	16
550	Angus	\N	Unitary district	AG	Forfar	\N	\N	16
551	Antrim	\N	District	AN	Antrim	\N	\N	16
552	Ards	\N	District	AD	Newtownards	\N	\N	16
553	Argyll and Bute	\N	Unitary district	AB	Lochgilphead	\N	\N	16
554	Armagh	\N	District	AM	Armagh	\N	\N	16
555	Ballymena	\N	District	BL	Ballymena	\N	\N	16
556	Ballymoney	\N	District	BY	Ballymoney	\N	\N	16
557	Banbridge	\N	District	BB	Banbridge	\N	\N	16
558	Barnsley	\N	Metropolitan borough	BX	Barnsley	\N	\N	16
559	Bath and North East Somerset	\N	Unitary authority	BN	Bristol	\N	\N	16
560	Bedfordshire	\N	Administrative county	BD	Bedford	\N	\N	16
561	Belfast	\N	District	BF	Belfast	\N	\N	16
562	Birmingham	\N	Metropolitan borough (city)	BI	Birmingham	\N	\N	16
563	Blackburn with Darwen	\N	Unitary authority	BW	Blackburn	\N	\N	16
564	Blackpool	\N	Unitary authority	BP	Blackpool	\N	\N	16
565	Blaenau Gwent	\N	Unitary authority (Wales)	BG	Ebbw Vale	\N	\N	16
566	Bolton	\N	Metropolitan borough	BT	Bolton	\N	\N	16
567	Bournemouth	\N	Unitary authority	BM	Bournemouth	\N	\N	16
568	Bracknell Forest	\N	Unitary authority	BC	Bracknell	\N	\N	16
569	Bradford	\N	Metropolitan borough (city)	BV	Bradford	\N	\N	16
570	Bridgend	\N	Unitary authority (Wales)	BJ	Bridgend	\N	\N	16
571	Brighton and Hove	\N	Unitary authority	BH	Hove	\N	\N	16
572	Bristol	\N	Unitary authority (city)	BS	Bristol	\N	\N	16
573	Buckinghamshire	\N	Administrative county	BU	Aylesbury	\N	\N	16
574	Bury	\N	Metropolitan borough	BR	Bury	\N	\N	16
575	Caerphilly	\N	Unitary authority (Wales)	CP	Tredomen, Ystrad Fawr	\N	\N	16
576	Calderdale	\N	Metropolitan borough	CX	Halifax	\N	\N	16
577	Cambridgeshire	\N	Administrative county	CM	Cambridge	\N	\N	16
578	Cardiff	\N	Unitary authority (Wales)	CA	Cardiff	\N	\N	16
579	Carmarthenshire	\N	Unitary authority (Wales)	CI	Carmarthen	\N	\N	16
580	Carrickfergus	\N	District	CF	Carrickfergus	\N	\N	16
581	Castlereagh	\N	District	CS	Castlereagh	\N	\N	16
582	Ceredigion	\N	Unitary authority (Wales)	CG	Aberaeron, Aberystwyth	\N	\N	16
583	Cheshire	\N	Administrative county	CH	Chester	\N	\N	16
584	Clackmannanshire	\N	Unitary district	CC	Alloa	\N	\N	16
585	Coleraine	\N	District	CL	Coleraine	\N	\N	16
586	Conwy	\N	Unitary authority (Wales)	CW	Conwy	\N	\N	16
587	Cookstown	\N	District	CK	Cookstown	\N	\N	16
588	Cornwall	\N	Administrative county	CO	Truro	\N	\N	16
589	Coventry	\N	Metropolitan borough (city)	CT	Coventry	\N	\N	16
590	Craigavon	\N	District	CR	Craigavon	\N	\N	16
591	Cumbria	\N	Administrative county	CU	Carlisle	\N	\N	16
592	Darlington	\N	Unitary authority	DA	Darlington	\N	\N	16
593	Denbighshire	\N	Unitary authority (Wales)	DI	Ruthin	\N	\N	16
594	Derby	\N	Unitary authority (city)	DE	Derby	\N	\N	16
595	Derbyshire	\N	Administrative county	DB	Matlock	\N	\N	16
596	Derry	\N	District	LD	Londonderry	\N	\N	16
597	Devon	\N	Administrative county	DO	Exeter	\N	\N	16
598	Doncaster	\N	Metropolitan borough	DC	Doncaster	\N	\N	16
599	Dorset	\N	Administrative county	DS	Dorchester	\N	\N	16
600	Down	\N	District	DW	Downpatrick	\N	\N	16
601	Dudley	\N	Metropolitan borough	DY	Dudley	\N	\N	16
602	Dumfries and Galloway	\N	Unitary district	DG	Dumfries	\N	\N	16
603	Dundee	\N	Unitary district (city)	DU	Dundee	\N	\N	16
604	Dungannon	\N	District	DN	Dungannon	\N	\N	16
605	Durham	\N	Administrative county	DH	Durham	\N	\N	16
606	East Ayrshire	\N	Unitary district	EA	Kilmarnock	\N	\N	16
607	East Dunbartonshire	\N	Unitary district	ED	Kirkintilloch	\N	\N	16
608	East Lothian	\N	Unitary district	EL	Haddington	\N	\N	16
609	East Renfrewshire	\N	Unitary district	ER	Giffnock	\N	\N	16
610	East Riding of Yorkshire	\N	Unitary authority	EY	Beverley	\N	\N	16
611	East Sussex	\N	Administrative county	ES	Lewes	\N	\N	16
612	Edinburgh	\N	Unitary district (city)	EB	Edinburgh	\N	\N	16
613	Eilean Siar	\N	Island area	WI	Stornoway	\N	\N	16
614	Essex	\N	Administrative county	EX	Chelmsford	\N	\N	16
615	Falkirk	\N	Unitary district	FK	Falkirk	\N	\N	16
616	Fermanagh	\N	District	FE	Enniskillen	\N	\N	16
617	Fife	\N	Unitary district	FI	Glenrothes	\N	\N	16
618	Flintshire	\N	Unitary authority (Wales)	FL	Mold	\N	\N	16
619	Gateshead	\N	Metropolitan borough	GH	Gateshead	\N	\N	16
620	Glasgow	\N	Unitary district (city)	GG	Glasgow	\N	\N	16
621	Gloucestershire	\N	Administrative county	GC	Gloucester	\N	\N	16
622	London	\N	Region	GL	London	\N	\N	16
623	Gwynedd	\N	Unitary authority (Wales)	GD	Caernarfon	\N	\N	16
624	Halton	\N	Unitary authority	HL	Widnes	\N	\N	16
625	Hampshire	\N	Administrative county	HA	Winchester	\N	\N	16
626	Hartlepool	\N	Unitary authority	HP	Hartlepool	\N	\N	16
627	Herefordshire	\N	Unitary authority (county)	HE	Hereford	\N	\N	16
628	Hertfordshire	\N	Administrative county	HT	Hertford	\N	\N	16
629	Highland	\N	Unitary district	HI	Inverness	\N	\N	16
630	Inverclyde	\N	Unitary district	IC	Greenock	\N	\N	16
631	Isle of Wight	\N	Unitary authority	IW	Newport	\N	\N	16
632	Isles of Scilly	\N	Unitary authority	IS	Hugh Town	\N	\N	16
633	Kent	\N	Administrative county	KE	Maidstone	\N	\N	16
634	Kingston upon Hull	\N	Unitary authority (city)	KH	Kingston-upon-Hull	\N	\N	16
635	Kirklees	\N	Metropolitan borough	KK	Huddersfield	\N	\N	16
636	Knowsley	\N	Metropolitan borough	KN	Huyton	\N	\N	16
637	Lancashire	\N	Administrative county	LA	Preston	\N	\N	16
638	Larne	\N	District	LR	Larne	\N	\N	16
639	Leeds	\N	Metropolitan borough (city)	LS	Leeds	\N	\N	16
640	Leicester	\N	Unitary authority (city)	LC	Leicester	\N	\N	16
641	Leicestershire	\N	Administrative county	LE	Leicester	\N	\N	16
642	Limavady	\N	District	LM	Limavady	\N	\N	16
643	Lincolnshire	\N	Administrative county	LI	Lincoln	\N	\N	16
644	Lisburn	\N	District	LB	Lisburn	\N	\N	16
645	Liverpool	\N	Metropolitan borough (city)	LV	Liverpool	\N	\N	16
646	Luton	\N	Unitary authority	LU	Luton	\N	\N	16
647	Magherafelt	\N	District	MF	Magherafelt	\N	\N	16
648	Manchester	\N	Metropolitan borough (city)	MN	Manchester	\N	\N	16
649	Medway	\N	Unitary authority	MW	Strood	\N	\N	16
650	Merthyr Tydfil	\N	Unitary authority (Wales)	MT	Merthyr Tydfil	\N	\N	16
651	Middlesbrough	\N	Unitary authority	MB	Middlesbrough	\N	\N	16
652	Midlothian	\N	Unitary district	ML	Dalkeith	\N	\N	16
653	Milton Keynes	\N	Unitary authority	MK	Milton Keynes	\N	\N	16
654	Monmouthshire	\N	Unitary authority (Wales)	MM	Cwmbran	\N	\N	16
655	Moray	\N	Unitary district	MO	Elgin	\N	\N	16
656	Moyle	\N	District	MY	Ballycastle	\N	\N	16
657	Neath Port Talbot	\N	Unitary authority (Wales)	NP	Port Talbot	\N	\N	16
658	Newcastle upon Tyne	\N	Metropolitan borough (city)	NU	Newcastle-upon-Tyne	\N	\N	16
659	Newport	\N	Unitary authority (Wales)	NO	Newport	\N	\N	16
660	Newry and Mourne	\N	District	NM	Newry	\N	\N	16
661	Newtownabbey	\N	District	NW	Newtownabbey	\N	\N	16
662	Norfolk	\N	Administrative county	NF	Norwich	\N	\N	16
663	Northamptonshire	\N	Administrative county	NA	Northampton	\N	\N	16
664	North Ayrshire	\N	Unitary district	NR	Irvine	\N	\N	16
665	North Down	\N	District	ND	Bangor	\N	\N	16
666	North East Lincolnshire	\N	Unitary authority	NE	Grimsby	\N	\N	16
667	North Lanarkshire	\N	Unitary district	NN	Motherwell	\N	\N	16
668	North Lincolnshire	\N	Unitary authority	NL	Scunthorpe	\N	\N	16
669	North Somerset	\N	Unitary authority	NS	Weston-super-Mare	\N	\N	16
670	North Tyneside	\N	Metropolitan borough	NI	Wallsend	\N	\N	16
671	Northumberland	\N	Administrative county	NB	Morpeth	\N	\N	16
672	North Yorkshire	\N	Administrative county	NY	Northallerton	\N	\N	16
673	Nottingham	\N	Unitary authority (city)	NG	Nottingham	\N	\N	16
674	Nottinghamshire	\N	Administrative county	NT	Nottingham	\N	\N	16
675	Oldham	\N	Metropolitan borough	OL	Oldham	\N	\N	16
676	Omagh	\N	District	OM	Omagh	\N	\N	16
677	Orkney Islands	\N	Island area	OR	Kirkwall	\N	\N	16
678	Oxfordshire	\N	Administrative county	OX	Oxford	\N	\N	16
679	Pembrokeshire	\N	Unitary authority (Wales)	PE	Haverfordwest	\N	\N	16
680	Perthshire and Kinross	\N	Unitary district	PK	Perth	\N	\N	16
681	Peterborough	\N	Unitary authority	PB	Peterborough	\N	\N	16
682	Plymouth	\N	Unitary authority (city)	PM	Plymouth	\N	\N	16
683	Poole	\N	Unitary authority	PL	Poole	\N	\N	16
684	Portsmouth	\N	Unitary authority (city)	PS	Portsmouth	\N	\N	16
685	Powys	\N	Unitary authority (Wales)	PO	Llandrindod Wells	\N	\N	16
686	Reading	\N	Unitary authority	RG	Reading	\N	\N	16
687	Redcar and Cleveland	\N	Unitary authority	RC	South Bank	\N	\N	16
688	Renfrewshire	\N	Unitary district	RF	Paisley Strathclyde	\N	\N	16
689	Rhondda, Cynon, Taff	\N	Unitary authority (Wales)	RT	Tonypandy	\N	\N	16
690	Rochdale	\N	Metropolitan borough	RD	Rochdale	\N	\N	16
691	Rotherham	\N	Metropolitan borough	RH	Rotherham	\N	\N	16
692	Rutland	\N	Unitary authority	RL	Oakham	\N	\N	16
693	Saint Helens	\N	Metropolitan borough	SZ	Saint Helens	\N	\N	16
694	Salford	\N	Metropolitan borough (city)	ZF	Manchester	\N	\N	16
695	Sandwell	\N	Metropolitan borough	ZW	Oldbury	\N	\N	16
696	Scottish Borders	\N	Unitary district	BO	Newtown Saint Boswells	\N	\N	16
697	Sefton	\N	Metropolitan borough	SE	Bootle, Southport	\N	\N	16
698	Sheffield	\N	Metropolitan borough (city)	SV	Sheffield	\N	\N	16
699	Shetland Islands	\N	Island area	SH	Lerwick	\N	\N	16
700	Shropshire	\N	Administrative county	SP	Shrewsbury	\N	\N	16
701	Slough	\N	Unitary authority	ZL	Slough	\N	\N	16
702	Solihull	\N	Metropolitan borough	SI	Solihull	\N	\N	16
703	Somerset	\N	Administrative county	SM	Taunton	\N	\N	16
704	Southampton	\N	Unitary authority (city)	ZH	Southampton	\N	\N	16
705	South Ayrshire	\N	Unitary district	SA	Ayr	\N	\N	16
706	Southend-on-Sea	\N	Unitary authority	SS	Southend-on-Sea	\N	\N	16
707	South Gloucestershire	\N	Unitary authority	SJ	Thornbury	\N	\N	16
708	South Lanarkshire	\N	Unitary district	SL	Hamilton	\N	\N	16
709	South Tyneside	\N	Metropolitan borough	SX	South Shields	\N	\N	16
710	Staffordshire	\N	Administrative county	ST	Stafford	\N	\N	16
711	Stirling	\N	Unitary district	ZG	Stirling	\N	\N	16
712	Stockport	\N	Metropolitan borough	SK	Stockport	\N	\N	16
713	Stockton-on-Tees	\N	Unitary authority	ZT	Stockton-on-Tees	\N	\N	16
714	Stoke-on-Trent	\N	Unitary authority (city)	SO	Stoke-on-Trent	\N	\N	16
715	Strabane	\N	District	SB	Strabane	\N	\N	16
716	Suffolk	\N	Administrative county	SF	Ipswich	\N	\N	16
717	Sunderland	\N	Metropolitan borough (city)	SD	Sunderland	\N	\N	16
718	Surrey	\N	Administrative county	SR	Kingston upon Thames	\N	\N	16
719	Swansea	\N	Unitary authority (Wales)	SW	Swansea	\N	\N	16
720	Swindon	\N	Unitary authority	SN	Swindon	\N	\N	16
721	Tameside	\N	Metropolitan borough	TM	Ashton-under-Lyne	\N	\N	16
722	Telford and Wrekin	\N	Unitary authority	TK	Telford	\N	\N	16
723	Thurrock	\N	Unitary authority	TR	Grays	\N	\N	16
724	Torbay	\N	Unitary authority	TB	Torquay	\N	\N	16
725	Torfaen	\N	Unitary authority (Wales)	TF	Pontypool	\N	\N	16
726	Trafford	\N	Metropolitan borough	TD	Stretford	\N	\N	16
727	Vale of Glamorgan	\N	Unitary authority (Wales)	VG	Barry	\N	\N	16
728	Wakefield	\N	Metropolitan borough (city)	WK	Wakefield	\N	\N	16
729	Walsall	\N	Metropolitan borough	WZ	Walsall	\N	\N	16
730	Warrington	\N	Unitary authority	WT	Warrington	\N	\N	16
731	Warwickshire	\N	Administrative county	WR	Warwick	\N	\N	16
732	West Berkshire	\N	Unitary authority	WB	Newbury	\N	\N	16
733	West Dunbartonshire	\N	Unitary district	WD	Dumbarton	\N	\N	16
734	West Lothian	\N	Unitary district	WH	Livingston	\N	\N	16
735	West Sussex	\N	Administrative county	WS	Chichester	\N	\N	16
736	Wigan	\N	Metropolitan borough	WN	Wigan	\N	\N	16
737	Wiltshire	\N	Administrative county	WL	Trowbridge	\N	\N	16
738	Windsor and Maidenhead	\N	Unitary authority	WA	Maidenhead	\N	\N	16
739	Wirral	\N	Metropolitan borough	WQ	Wallasey	\N	\N	16
740	Wokingham	\N	Unitary authority	WO	Wokingham	\N	\N	16
741	Wolverhampton	\N	Metropolitan borough	WV	Wolverhampton	\N	\N	16
742	Worcestershire	\N	Administrative county	WC	Worcester	\N	\N	16
743	Wrexham	\N	Unitary authority (Wales)	WX	Wrexham	\N	\N	16
744	York	\N	Unitary authority (city)	YK	York	\N	\N	16
745	Alberta	\N	province	AB	Edmonton	\N	\N	17
746	British Columbia	\N	province	BC	Victoria	\N	\N	17
747	Manitoba	\N	province	MB	Winnipeg	\N	\N	17
748	New Brunswick	\N	province	NB	Fredericton	\N	\N	17
749	Newfoundland and Labrador	\N	province	NL	St. John's	\N	\N	17
750	Northwest Territories	\N	Area	NT	Yellowknife	\N	\N	17
751	Nova Scotia	\N	province	NS	Halifax	\N	\N	17
752	Nunavut	\N	Area	NU	Iqaluit	\N	\N	17
753	Ontario	\N	province	ON	Toronto	\N	\N	17
754	Prince Edward Island	\N	province	PE	Charlottetown	\N	\N	17
755	Québec	Quebec	province	QC	Quebec City	\N	\N	17
756	Saskatchewan	\N	province	SK	Regina	\N	\N	17
757	Yukon Area	\N	Area	YT	Whitehorse	\N	\N	17
758	Aguascalientes	\N	state	AG	Aguascalientes	\N	\N	18
759	Baja California	\N	state	BN	Mexicali	\N	\N	18
760	Baja California Sur	\N	state	BS	La Paz	\N	\N	18
761	Campeche	\N	state	CM	Campeche	\N	\N	18
762	Chiapas	\N	state	CP	Tuxtla Gutiérrez	\N	\N	18
763	Chihuahua	\N	state	CH	Chihuahua	\N	\N	18
764	Coahuila	\N	state	CA	Saltillo	\N	\N	18
765	Colima	\N	state	CL	Colima	\N	\N	18
766	México D.F.	\N	federal district	DF	México	\N	\N	18
767	Durango	\N	state	DU	Durango	\N	\N	18
768	Guanajuato	\N	state	GJ	Guanajuato	\N	\N	18
769	Guerrero	\N	state	GR	Chilpancingo	\N	\N	18
770	Hidalgo	\N	state	HI	Pachuca	\N	\N	18
771	Jalisco	\N	state	JA	Guadalajara	\N	\N	18
772	México	\N	state	MX	Toluca	\N	\N	18
773	Michoacán	\N	state	MC	Morelia	\N	\N	18
774	Morelos	\N	state	MR	Cuernavaca	\N	\N	18
775	Nayarit	\N	state	NA	Tepic	\N	\N	18
776	Nuevo León	\N	state	NL	Monterrey	\N	\N	18
777	Oaxaca	\N	state	OA	Oaxaca	\N	\N	18
778	Puebla	\N	state	PU	Puebla	\N	\N	18
779	Querétaro	\N	state	QE	Querétaro	\N	\N	18
780	Quintana Roo	\N	state	QR	Chetumal	\N	\N	18
781	San Luis Potosí	\N	state	SL	San Luis Potosí	\N	\N	18
782	Sinaloa	\N	state	SI	Culiacán	\N	\N	18
783	Sonora	\N	state	SO	Hermosillo	\N	\N	18
784	Tabasco	\N	state	TB	Villahermosa	\N	\N	18
785	Tamaulipas	\N	state	TM	Ciudad Victoria	\N	\N	18
786	Tlaxcala	\N	state	TL	Tlaxcala	\N	\N	18
787	Veracruz	\N	state	VE	Xalapa	\N	\N	18
788	Yucatán	\N	state	YU	Mérida	\N	\N	18
789	Zacatecas	\N	state	ZA	Zacatecas	\N	\N	18
790	Alabama	\N	state	AL	Montgomery	Southeast	\N	19
791	Alaska	\N	state	AK	Juneau	Alaska	\N	19
792	Arizona	\N	state	AZ	Phoenix	Southwest	\N	19
793	Arkansas	\N	state	AR	Little Rock	Southeast	\N	19
794	California	\N	state	CA	Sacramento	West	\N	19
795	Colorado	\N	state	CO	Denver	West	\N	19
796	Connecticut	\N	state	CT	Hartford	Northeast	\N	19
797	Delaware	\N	state	DE	Dover	Northeast	\N	19
798	District of Columbia	\N	federal district	DC	Washington	Northeast	\N	19
799	Florida	\N	state	FL	Tallahassee	Southeast	\N	19
800	Georgia	\N	state	GA	Atlanta	Southeast	\N	19
801	Hawaii	\N	state	HI	Honolulu	Hawaii	\N	19
802	Idaho	\N	state	ID	Boise	West	\N	19
803	Illinois	\N	state	IL	Springfield	Midwest	\N	19
804	Indiana	\N	state	IN	Indianapolis	Midwest	\N	19
805	Iowa	\N	state	IA	Des Moines	Midwest	\N	19
806	Kansas	\N	state	KS	Topeka	Midwest	\N	19
807	Kentucky	\N	state	KY	Frankfort	Southeast	\N	19
808	Louisiana	\N	state	LA	Baton Rouge	Southeast	\N	19
809	Maine	\N	state	ME	Augusta	Northeast	\N	19
810	Maryland	\N	state	MD	Annapolis	Northeast	\N	19
811	Massachusetts	\N	state	MA	Boston	Northeast	\N	19
812	Michigan	\N	state	MI	Lansing	Midwest	\N	19
813	Minnesota	\N	state	MN	Saint Paul	Midwest	\N	19
814	Mississippi	\N	state	MS	Jackson	Southeast	\N	19
815	Missouri	\N	state	MO	Jefferson City	Midwest	\N	19
816	Montana	\N	state	MT	Helena	West	\N	19
817	Nebraska	\N	state	NE	Lincoln	Midwest	\N	19
818	Nevada	\N	state	NV	Carson City	West	\N	19
819	New Hampshire	\N	state	NH	Concord	Northeast	\N	19
820	New Jersey	\N	state	NJ	Trenton	Northeast	\N	19
821	New Mexico	\N	state	NM	Santa Fe	Southwest	\N	19
822	New York	\N	state	NY	Albany	Northeast	\N	19
823	North Carolina	\N	state	NC	Raleigh	Southeast	\N	19
824	North Dakota	\N	state	ND	Bismarck	Midwest	\N	19
825	Ohio	\N	state	OH	Columbus	Midwest	\N	19
826	Oklahoma	\N	state	OK	Oklahoma City	Southwest	\N	19
827	Oregon	\N	state	OR	Salem	West	\N	19
828	Pennsylvania	\N	state	PA	Harrisburg	Northeast	\N	19
829	Rhode Island	\N	state	RI	Providence	Northeast	\N	19
830	South Carolina	\N	state	SC	Columbia	Southeast	\N	19
831	South Dakota	\N	state	SD	Pierre	Midwest	\N	19
832	Tennessee	\N	state	TN	Nashville	Southeast	\N	19
833	Texas	\N	state	TX	Austin	Southwest	\N	19
834	Utah	\N	state	UT	Salt Lake City	West	\N	19
835	Vermont	\N	state	VT	Montpelier	Northeast	\N	19
836	Virginia	\N	state	VA	Richmond	Southeast	\N	19
837	Washington	\N	state	WA	Olympia	West	\N	19
838	West Virginia	\N	state	WV	Charleston	Southeast	\N	19
839	Wisconsin	\N	state	WI	Madison	Midwest	\N	19
840	Wyoming	\N	state	WY	Cheyenne	West	\N	19
841	Australian Capital Territory	\N	territory	ACT	Canberra	\N	\N	20
842	New South Wales	\N	state	NSW	Sydney	\N	\N	20
843	Northern Territory	\N	territory	NT	Darwin	\N	\N	20
844	Queensland	\N	state	QLD	Brisbane	\N	\N	20
845	South Australia	\N	state	SA	Adelaide	\N	\N	20
846	Tasmania	\N	state	TAS	Hobart	\N	\N	20
847	Victoria	\N	state	VIC	Melbourne	\N	\N	20
848	Western Australia	\N	state	WA	Perth	\N	\N	20
849	Ashmore and Cartier Islands	\N	territory	AS	Darwin	\N	\N	20
850	Coral Sea Islands Area	\N	territory	CR	Kingston	\N	\N	20
851	Aichi	\N	prefecture	AI	Nagoya	Chubu	\N	21
852	Akita	\N	prefecture	AK	Akita	Tohoku	\N	21
853	Aomori	\N	prefecture	AO	Aomori	Tohoku	\N	21
854	Chiba	\N	prefecture	CH	Chiba	Kanto	\N	21
855	Ehime	\N	prefecture	EH	Matsuyama	Shikoku	\N	21
856	Fukui	\N	prefecture	FI	Fukui	Chubu	\N	21
857	Fukuoka	\N	prefecture	FO	Fukuoka	Kyushu	\N	21
858	Fukushima	\N	prefecture	FS	Fukushima	Tohoku	\N	21
859	Gifu	\N	prefecture	GF	Gifu	Chubu	\N	21
860	Gumma	\N	prefecture	GM	Maebashi	Kanto	\N	21
861	Hiroshima	\N	prefecture	HS	Hiroshima	Chugoku	\N	21
862	Hokkaido	\N	Area	HK	Sapporo	Hokkaido	\N	21
863	Hyogo	\N	prefecture	HG	Kobe	Kinki	\N	21
864	Ibaraki	\N	prefecture	IB	Mito	Kanto	\N	21
865	Ishikawa	\N	prefecture	IS	Kanazawa	Chubu	\N	21
866	Iwate	\N	prefecture	IW	Morioka	Tohoku	\N	21
867	Kagawa	\N	prefecture	KG	Takamatsu	Shikoku	\N	21
868	Kagoshima	\N	prefecture	KS	Kagoshima	Kyushu	\N	21
869	Kanagawa	\N	prefecture	KN	Yokohama	Kanto	\N	21
870	Kochi	\N	prefecture	KC	Kochi	Shikoku	\N	21
871	Kumamoto	\N	prefecture	KM	Kumamoto	Kyushu	\N	21
872	Kyoto	\N	urban prefecture	KY	Kyoto	Kinki	\N	21
873	Mie	\N	prefecture	ME	Tsu	Kinki	\N	21
874	Miyagi	\N	prefecture	MG	Sendai	Tohoku	\N	21
875	Miyazaki	\N	prefecture	MZ	Miyazaki	Kyushu	\N	21
876	Nagano	\N	prefecture	NN	Nagano	Chubu	\N	21
877	Nagasaki	\N	prefecture	NS	Nagasaki	Kyushu	\N	21
878	Nara	\N	prefecture	NR	Nara	Kinki	\N	21
879	Niigata	\N	prefecture	NI	Niigata	Chubu	\N	21
880	Oita	\N	prefecture	OT	Oita	Kyushu	\N	21
881	Okayama	\N	prefecture	OY	Okayama	Chugoku	\N	21
882	Okinawa	\N	prefecture	ON	Naha	Ryukyu	\N	21
883	Osaka	\N	urban prefecture	OS	Osaka	Kinki	\N	21
884	Saga	\N	prefecture	SG	Saga	Kyushu	\N	21
885	Saitama	\N	prefecture	ST	Saitama	Kanto	\N	21
886	Shiga	\N	prefecture	SH	Otsu	Kinki	\N	21
887	Shimane	\N	prefecture	SM	Matsue	Chugoku	\N	21
888	Shizuoka	\N	prefecture	SZ	Shizuoka	Chubu	\N	21
889	Tochigi	\N	prefecture	TC	Utsunomiya	Kanto	\N	21
890	Tokushima	\N	prefecture	TS	Tokushima	Shikoku	\N	21
891	Tokyo	\N	metropolis	TK	Tokyo	Kanto	\N	21
892	Tottori	\N	prefecture	TT	Tottori	Chugoku	\N	21
893	Toyama	\N	prefecture	TY	Toyama	Chubu	\N	21
894	Wakayama	\N	prefecture	WK	Wakayama	Kinki	\N	21
895	Yamagata	\N	prefecture	YT	Yamagata	Tohoku	\N	21
896	Yamaguchi	\N	prefecture	YC	Yamaguchi	Chugoku	\N	21
897	Yamanashi	\N	prefecture	YN	Kofu	Chubu	\N	21
898	Buenos Aires Capital Federal	\N	federal district	DF	Buenos Aires	\N	\N	23
899	Buenos Aires	\N	province	BA	La Plata	\N	\N	23
900	Catamarca	\N	province	CT	San Fernando del Valle de Catamarca	\N	\N	23
901	Chaco	\N	province	CC	Resistencia	\N	\N	23
902	Chubut	\N	province	CH	Rawson	\N	\N	23
903	Córdoba	\N	province	CB	Córdoba	\N	\N	23
904	Corrientes	\N	province	CN	Corrientes	\N	\N	23
905	Entre Ríos	\N	province	ER	Paraná	\N	\N	23
906	Formosa	\N	province	FM	Formosa	\N	\N	23
907	Jujuy	\N	province	JY	San Salvador de Jujuy	\N	\N	23
908	La Pampa	\N	province	LP	Santa Rosa	\N	\N	23
909	La Rioja	\N	province	LR	La Rioja	\N	\N	23
910	Mendoza	\N	province	MZ	Mendoza	\N	\N	23
911	Misiones	\N	province	MN	Posadas	\N	\N	23
912	Neuquén	\N	province	NQ	Neuquén	\N	\N	23
913	Río Negro	\N	province	RN	Viedma	\N	\N	23
914	Salta	\N	province	SA	Salta	\N	\N	23
915	San Juan	\N	province	SJ	San Juan	\N	\N	23
916	San Luis	\N	province	SL	San Luis	\N	\N	23
917	Santa Cruz	\N	province	SC	Río Gallegos	\N	\N	23
918	Santa Fe	\N	province	SF	Santa Fe	\N	\N	23
919	Santiago del Estero	\N	province	SE	Santiago del Estero	\N	\N	23
920	Tierra del Fuego	\N	province	TF	Ushuaia	\N	\N	23
921	Tucumán	\N	province	TM	San Miguel de Tucumán	\N	\N	23
922	Acre	\N	state	AC	Rio Branco	Norte	\N	24
923	Alagoas	\N	state	AL	Maceió	Nordeste	\N	24
924	Amapá	\N	state	AP	Macapá	Norte	\N	24
925	Amazonas	\N	state	AM	Manaus	Norte	\N	24
926	Bahia	\N	state	BA	Salvador	Nordeste	\N	24
927	Ceará	\N	state	CE	Fortaleza	Nordeste	\N	24
928	Distrito Federal	\N	federal district	DF	Brasília	Centro-Oeste	\N	24
929	Espírito Santo	\N	state	ES	Vitória	Sudeste	\N	24
930	Goiás	\N	state	GO	Goiânia	Centro-Oeste	\N	24
931	Maranhão	\N	state	MA	São Luís	Nordeste	\N	24
932	Mato Grosso	\N	state	MT	Cuiabá	Centro-Oeste	\N	24
933	Mato Grosso do Sul	\N	state	MS	Campo Grande	Centro-Oeste	\N	24
934	Minas Gerais	\N	state	MG	Belo Horizonte	Sudeste	\N	24
935	Pará	\N	state	PA	Belém	Norte	\N	24
936	Paraíba	\N	state	PB	João Pessoa	Nordeste	\N	24
937	Paraná	\N	state	PR	Curitiba	Sul	\N	24
938	Pernambuco	\N	state	PE	Recife	Nordeste	\N	24
939	Piauí	\N	state	PI	Teresina	Nordeste	\N	24
940	Rio de Janeiro	\N	state	RJ	Rio de Janeiro	Sudeste	\N	24
941	Rio Grande do Norte	\N	state	RN	Natal	Nordeste	\N	24
942	Rio Grande do Sul	\N	state	RS	Porto Alegre	Sul	\N	24
943	Rondônia	\N	state	RO	Porto Velho	Norte	\N	24
944	Roraima	\N	state	RR	Boa Vista	Norte	\N	24
945	Santa Catarina	\N	state	SC	Florianópolis	Sul	\N	24
946	São Paulo	Sao Paulo	state	SP	São Paulo	Sudeste	\N	24
947	Sergipe	\N	state	SE	Aracaju	Nordeste	\N	24
948	Tocantins	\N	state	TO	Palmas	Norte	\N	24
949	Amazonas	\N	state	AM	Puerto Ayacucho	Guayana	\N	25
950	Anzoátegui	\N	state	AN	Barcelona	Nor-oriental	\N	25
951	Apure	\N	state	AP	San Fernando de Apure	Los Llanos	\N	25
952	Aragua	\N	state	AR	Maracay	Central	\N	25
953	Barinas	\N	state	BA	Barinas	Los Andes	\N	25
954	Bolívar	\N	state	BO	Ciudad Bolívar	Guayana	\N	25
955	Carabobo	\N	state	CA	Valencia	Central	\N	25
956	Cojedes	\N	state	CO	San Carlos	Central	\N	25
957	Delta Amacuro	\N	state	DA	Tucupita	Guayana	\N	25
958	Dependencias Federales	\N	federal dependencies	DF	\N	Insular	\N	25
959	Distrito Capital	\N	capital district	DF	Caracas	Capital	\N	25
960	Falcón	\N	state	FA	Coro	Centro-occidental	\N	25
961	Guárico	\N	state	GU	San Juan De Los Morros	Llanos	\N	25
962	Lara	\N	state	LA	Barquisimeto	Centro-occidental	\N	25
963	Mérida	\N	state	ME	Mérida	Los Andes	\N	25
964	Miranda	\N	state	MI	Los Teques	Capital	\N	25
965	Monagas	\N	state	MO	Maturín	Nor-oriental	\N	25
966	Nueva Esparta	\N	state	NE	La Asunción	Insular	\N	25
967	Portuguesa	\N	state	PO	Guanare	Centro-occidental	\N	25
968	Sucre	\N	state	SU	Cumaná	Nor-oriental	\N	25
969	Táchira	\N	state	TA	San Cristóbal	Los Andes	\N	25
970	Trujillo	\N	state	TR	Trujillo	Los Andes	\N	25
971	Vargas	\N	state	VA	La Güaira	Capital	\N	25
972	Yaracuy	\N	state	YA	San Felipe	Centro-occidental	\N	25
973	Zulia	\N	state	ZU	Maracaibo	Zuliana	\N	25
\.


--
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier (supplierkey, companyname, address, postalcode, citykey) FROM stdin;
1	Exotic Liquids	49 Gilbert St.	EC1 4SD	109
2	New Orleans Cajun Delights	P.O. Box 78934	70117	116
3	Grandma Kelly's Homestead	707 Oxford Rd.	48104	76
4	Tokyo Traders	9-8 Sekimai Musashino-shi	100	52
5	Cooperativa de Quesos 'Las Cabras'	Calle del Rosal 4	33007	34
6	Mayumi's	92 Setsuko Chuo-ku	545	32
7	Pavlova, Ltd.	74 Rose St. Moonie Ponds	3058	27
8	Specialty Biscuits, Ltd.	29 King's Way	M14 GSD	111
9	PB Knäckebröd AB	Kaloadagatan 13	S-345 67	16
10	Refrescos Americanas LTDA	Av. das Americanas 12.890	5442	72
11	Heli Süßwaren GmbH & Co. KG	Tiergartenstraße 5	10785	6
12	Plutzer Lebensmittelgroßmärkte AG	Bogenallee 51	60439	14
13	Nord-Ost-Fisch Handelsgesellschaft mbH	Frahmredder 112a	27478	63
14	Formaggi Fortini s.r.l.	Viale Dante, 75	48100	36
15	Norske Meierier	Hatlevegen 5	1320	44
16	Bigfoot Breweries	3400 - 8th Avenue Suite 210	97101	82
17	Svensk Sjöföda AB	Brovallavägen 231	S-123 45	48
18	Aux joyeux ecclésiastiques	203, Rue des Francs-Bourgeois	75004	35
19	New England Seafood Cannery	Order Processing Dept. 2100 Paul Revere Blvd.	02134	86
20	Leka Trading	471 Serangoon Loop, Suite #402	0512	142
21	Lyngbysild	Lyngbysild Fiskebakken 10	2800	22
22	Zaanse Snoepfabriek	Verkoop Rijnweg 22	9999 ZZ	73
23	Karkki Oy	Valtakatu 12	53120	68
24	G'day, Mate	170 Prince Edward Parade Hunter's Hill	2042	51
25	Ma Maison	2960 Rue St. Laurent	H1J 1C3	30
26	Pasta Buttini s.r.l.	Via dei Gelsomini, 153	84100	41
27	Escargots Nouveaux	22, rue H. Voiron	71300	29
28	Gai pâturage	Bat. B 3, rue des Alpes	74000	1
29	Forêts d'érables	148 rue Chasseur	J2S 7S8	47
\.


--
-- Data for Name: tempcities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tempcities (city, state, country) FROM stdin;
\.


--
-- Data for Name: territories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.territories (employeekey, citykey) FROM stdin;
1	141
2	80
2	86
2	87
2	89
2	110
2	140
3	77
3	119
3	133
3	137
4	91
4	104
4	127
5	98
5	101
5	115
5	117
5	124
6	81
6	121
6	126
6	134
6	135
7	90
7	92
7	93
7	97
7	105
7	113
7	129
7	130
7	131
7	132
8	79
8	102
8	120
8	125
9	84
9	106
9	114
9	123
9	128
9	136
9	138
\.


--
-- Data for Name: date; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."date" (datekey, date, daynbweek, daynameweek, daynbmonth, daynbyear, weeknbyear, monthnumber, monthname, quarter, semester, year) FROM stdin;
1	1996-07-01	2	Monday	1	182	27	7	July	3	2	1996
2	1996-07-02	3	Tuesday	2	183	27	7	July	3	2	1996
3	1996-07-03	4	Wednesday	3	184	27	7	July	3	2	1996
4	1996-07-04	5	Thursday	4	185	27	7	July	3	2	1996
5	1996-07-05	6	Friday	5	186	27	7	July	3	2	1996
6	1996-07-06	7	Saturday	6	187	27	7	July	3	2	1996
7	1996-07-07	1	Sunday	7	188	28	7	July	3	2	1996
8	1996-07-08	2	Monday	8	189	28	7	July	3	2	1996
9	1996-07-09	3	Tuesday	9	190	28	7	July	3	2	1996
10	1996-07-10	4	Wednesday	10	191	28	7	July	3	2	1996
11	1996-07-11	5	Thursday	11	192	28	7	July	3	2	1996
12	1996-07-12	6	Friday	12	193	28	7	July	3	2	1996
13	1996-07-13	7	Saturday	13	194	28	7	July	3	2	1996
14	1996-07-14	1	Sunday	14	195	29	7	July	3	2	1996
15	1996-07-15	2	Monday	15	196	29	7	July	3	2	1996
16	1996-07-16	3	Tuesday	16	197	29	7	July	3	2	1996
17	1996-07-17	4	Wednesday	17	198	29	7	July	3	2	1996
18	1996-07-18	5	Thursday	18	199	29	7	July	3	2	1996
19	1996-07-19	6	Friday	19	200	29	7	July	3	2	1996
20	1996-07-20	7	Saturday	20	201	29	7	July	3	2	1996
21	1996-07-21	1	Sunday	21	202	30	7	July	3	2	1996
22	1996-07-22	2	Monday	22	203	30	7	July	3	2	1996
23	1996-07-23	3	Tuesday	23	204	30	7	July	3	2	1996
24	1996-07-24	4	Wednesday	24	205	30	7	July	3	2	1996
25	1996-07-25	5	Thursday	25	206	30	7	July	3	2	1996
26	1996-07-26	6	Friday	26	207	30	7	July	3	2	1996
27	1996-07-27	7	Saturday	27	208	30	7	July	3	2	1996
28	1996-07-28	1	Sunday	28	209	31	7	July	3	2	1996
29	1996-07-29	2	Monday	29	210	31	7	July	3	2	1996
30	1996-07-30	3	Tuesday	30	211	31	7	July	3	2	1996
31	1996-07-31	4	Wednesday	31	212	31	7	July	3	2	1996
32	1996-08-01	5	Thursday	1	213	31	8	August	3	2	1996
33	1996-08-02	6	Friday	2	214	31	8	August	3	2	1996
34	1996-08-03	7	Saturday	3	215	31	8	August	3	2	1996
35	1996-08-04	1	Sunday	4	216	32	8	August	3	2	1996
36	1996-08-05	2	Monday	5	217	32	8	August	3	2	1996
37	1996-08-06	3	Tuesday	6	218	32	8	August	3	2	1996
38	1996-08-07	4	Wednesday	7	219	32	8	August	3	2	1996
39	1996-08-08	5	Thursday	8	220	32	8	August	3	2	1996
40	1996-08-09	6	Friday	9	221	32	8	August	3	2	1996
41	1996-08-10	7	Saturday	10	222	32	8	August	3	2	1996
42	1996-08-11	1	Sunday	11	223	33	8	August	3	2	1996
43	1996-08-12	2	Monday	12	224	33	8	August	3	2	1996
44	1996-08-13	3	Tuesday	13	225	33	8	August	3	2	1996
45	1996-08-14	4	Wednesday	14	226	33	8	August	3	2	1996
46	1996-08-15	5	Thursday	15	227	33	8	August	3	2	1996
47	1996-08-16	6	Friday	16	228	33	8	August	3	2	1996
48	1996-08-17	7	Saturday	17	229	33	8	August	3	2	1996
49	1996-08-18	1	Sunday	18	230	34	8	August	3	2	1996
50	1996-08-19	2	Monday	19	231	34	8	August	3	2	1996
51	1996-08-20	3	Tuesday	20	232	34	8	August	3	2	1996
52	1996-08-21	4	Wednesday	21	233	34	8	August	3	2	1996
53	1996-08-22	5	Thursday	22	234	34	8	August	3	2	1996
54	1996-08-23	6	Friday	23	235	34	8	August	3	2	1996
55	1996-08-24	7	Saturday	24	236	34	8	August	3	2	1996
56	1996-08-25	1	Sunday	25	237	35	8	August	3	2	1996
57	1996-08-26	2	Monday	26	238	35	8	August	3	2	1996
58	1996-08-27	3	Tuesday	27	239	35	8	August	3	2	1996
59	1996-08-28	4	Wednesday	28	240	35	8	August	3	2	1996
60	1996-08-29	5	Thursday	29	241	35	8	August	3	2	1996
61	1996-08-30	6	Friday	30	242	35	8	August	3	2	1996
62	1996-08-31	7	Saturday	31	243	35	8	August	3	2	1996
63	1996-09-01	1	Sunday	1	244	36	9	September	3	2	1996
64	1996-09-02	2	Monday	2	245	36	9	September	3	2	1996
65	1996-09-03	3	Tuesday	3	246	36	9	September	3	2	1996
66	1996-09-04	4	Wednesday	4	247	36	9	September	3	2	1996
67	1996-09-05	5	Thursday	5	248	36	9	September	3	2	1996
68	1996-09-06	6	Friday	6	249	36	9	September	3	2	1996
69	1996-09-07	7	Saturday	7	250	36	9	September	3	2	1996
70	1996-09-08	1	Sunday	8	251	37	9	September	3	2	1996
71	1996-09-09	2	Monday	9	252	37	9	September	3	2	1996
72	1996-09-10	3	Tuesday	10	253	37	9	September	3	2	1996
73	1996-09-11	4	Wednesday	11	254	37	9	September	3	2	1996
74	1996-09-12	5	Thursday	12	255	37	9	September	3	2	1996
75	1996-09-13	6	Friday	13	256	37	9	September	3	2	1996
76	1996-09-14	7	Saturday	14	257	37	9	September	3	2	1996
77	1996-09-15	1	Sunday	15	258	38	9	September	3	2	1996
78	1996-09-16	2	Monday	16	259	38	9	September	3	2	1996
79	1996-09-17	3	Tuesday	17	260	38	9	September	3	2	1996
80	1996-09-18	4	Wednesday	18	261	38	9	September	3	2	1996
81	1996-09-19	5	Thursday	19	262	38	9	September	3	2	1996
82	1996-09-20	6	Friday	20	263	38	9	September	3	2	1996
83	1996-09-21	7	Saturday	21	264	38	9	September	3	2	1996
84	1996-09-22	1	Sunday	22	265	39	9	September	3	2	1996
85	1996-09-23	2	Monday	23	266	39	9	September	3	2	1996
86	1996-09-24	3	Tuesday	24	267	39	9	September	3	2	1996
87	1996-09-25	4	Wednesday	25	268	39	9	September	3	2	1996
88	1996-09-26	5	Thursday	26	269	39	9	September	3	2	1996
89	1996-09-27	6	Friday	27	270	39	9	September	3	2	1996
90	1996-09-28	7	Saturday	28	271	39	9	September	3	2	1996
91	1996-09-29	1	Sunday	29	272	40	9	September	3	2	1996
92	1996-09-30	2	Monday	30	273	40	9	September	3	2	1996
93	1996-10-01	3	Tuesday	1	274	40	10	October	4	2	1996
94	1996-10-02	4	Wednesday	2	275	40	10	October	4	2	1996
95	1996-10-03	5	Thursday	3	276	40	10	October	4	2	1996
96	1996-10-04	6	Friday	4	277	40	10	October	4	2	1996
97	1996-10-05	7	Saturday	5	278	40	10	October	4	2	1996
98	1996-10-06	1	Sunday	6	279	41	10	October	4	2	1996
99	1996-10-07	2	Monday	7	280	41	10	October	4	2	1996
100	1996-10-08	3	Tuesday	8	281	41	10	October	4	2	1996
101	1996-10-09	4	Wednesday	9	282	41	10	October	4	2	1996
102	1996-10-10	5	Thursday	10	283	41	10	October	4	2	1996
103	1996-10-11	6	Friday	11	284	41	10	October	4	2	1996
104	1996-10-12	7	Saturday	12	285	41	10	October	4	2	1996
105	1996-10-13	1	Sunday	13	286	42	10	October	4	2	1996
106	1996-10-14	2	Monday	14	287	42	10	October	4	2	1996
107	1996-10-15	3	Tuesday	15	288	42	10	October	4	2	1996
108	1996-10-16	4	Wednesday	16	289	42	10	October	4	2	1996
109	1996-10-17	5	Thursday	17	290	42	10	October	4	2	1996
110	1996-10-18	6	Friday	18	291	42	10	October	4	2	1996
111	1996-10-19	7	Saturday	19	292	42	10	October	4	2	1996
112	1996-10-20	1	Sunday	20	293	43	10	October	4	2	1996
113	1996-10-21	2	Monday	21	294	43	10	October	4	2	1996
114	1996-10-22	3	Tuesday	22	295	43	10	October	4	2	1996
115	1996-10-23	4	Wednesday	23	296	43	10	October	4	2	1996
116	1996-10-24	5	Thursday	24	297	43	10	October	4	2	1996
117	1996-10-25	6	Friday	25	298	43	10	October	4	2	1996
118	1996-10-26	7	Saturday	26	299	43	10	October	4	2	1996
119	1996-10-27	1	Sunday	27	300	44	10	October	4	2	1996
120	1996-10-28	2	Monday	28	301	44	10	October	4	2	1996
121	1996-10-29	3	Tuesday	29	302	44	10	October	4	2	1996
122	1996-10-30	4	Wednesday	30	303	44	10	October	4	2	1996
123	1996-10-31	5	Thursday	31	304	44	10	October	4	2	1996
124	1996-11-01	6	Friday	1	305	44	11	November	4	2	1996
125	1996-11-02	7	Saturday	2	306	44	11	November	4	2	1996
126	1996-11-03	1	Sunday	3	307	45	11	November	4	2	1996
127	1996-11-04	2	Monday	4	308	45	11	November	4	2	1996
128	1996-11-05	3	Tuesday	5	309	45	11	November	4	2	1996
129	1996-11-06	4	Wednesday	6	310	45	11	November	4	2	1996
130	1996-11-07	5	Thursday	7	311	45	11	November	4	2	1996
131	1996-11-08	6	Friday	8	312	45	11	November	4	2	1996
132	1996-11-09	7	Saturday	9	313	45	11	November	4	2	1996
133	1996-11-10	1	Sunday	10	314	46	11	November	4	2	1996
134	1996-11-11	2	Monday	11	315	46	11	November	4	2	1996
135	1996-11-12	3	Tuesday	12	316	46	11	November	4	2	1996
136	1996-11-13	4	Wednesday	13	317	46	11	November	4	2	1996
137	1996-11-14	5	Thursday	14	318	46	11	November	4	2	1996
138	1996-11-15	6	Friday	15	319	46	11	November	4	2	1996
139	1996-11-16	7	Saturday	16	320	46	11	November	4	2	1996
140	1996-11-17	1	Sunday	17	321	47	11	November	4	2	1996
141	1996-11-18	2	Monday	18	322	47	11	November	4	2	1996
142	1996-11-19	3	Tuesday	19	323	47	11	November	4	2	1996
143	1996-11-20	4	Wednesday	20	324	47	11	November	4	2	1996
144	1996-11-21	5	Thursday	21	325	47	11	November	4	2	1996
145	1996-11-22	6	Friday	22	326	47	11	November	4	2	1996
146	1996-11-23	7	Saturday	23	327	47	11	November	4	2	1996
147	1996-11-24	1	Sunday	24	328	48	11	November	4	2	1996
148	1996-11-25	2	Monday	25	329	48	11	November	4	2	1996
149	1996-11-26	3	Tuesday	26	330	48	11	November	4	2	1996
150	1996-11-27	4	Wednesday	27	331	48	11	November	4	2	1996
151	1996-11-28	5	Thursday	28	332	48	11	November	4	2	1996
152	1996-11-29	6	Friday	29	333	48	11	November	4	2	1996
153	1996-11-30	7	Saturday	30	334	48	11	November	4	2	1996
154	1996-12-01	1	Sunday	1	335	49	12	December	4	2	1996
155	1996-12-02	2	Monday	2	336	49	12	December	4	2	1996
156	1996-12-03	3	Tuesday	3	337	49	12	December	4	2	1996
157	1996-12-04	4	Wednesday	4	338	49	12	December	4	2	1996
158	1996-12-05	5	Thursday	5	339	49	12	December	4	2	1996
159	1996-12-06	6	Friday	6	340	49	12	December	4	2	1996
160	1996-12-07	7	Saturday	7	341	49	12	December	4	2	1996
161	1996-12-08	1	Sunday	8	342	50	12	December	4	2	1996
162	1996-12-09	2	Monday	9	343	50	12	December	4	2	1996
163	1996-12-10	3	Tuesday	10	344	50	12	December	4	2	1996
164	1996-12-11	4	Wednesday	11	345	50	12	December	4	2	1996
165	1996-12-12	5	Thursday	12	346	50	12	December	4	2	1996
166	1996-12-13	6	Friday	13	347	50	12	December	4	2	1996
167	1996-12-14	7	Saturday	14	348	50	12	December	4	2	1996
168	1996-12-15	1	Sunday	15	349	51	12	December	4	2	1996
169	1996-12-16	2	Monday	16	350	51	12	December	4	2	1996
170	1996-12-17	3	Tuesday	17	351	51	12	December	4	2	1996
171	1996-12-18	4	Wednesday	18	352	51	12	December	4	2	1996
172	1996-12-19	5	Thursday	19	353	51	12	December	4	2	1996
173	1996-12-20	6	Friday	20	354	51	12	December	4	2	1996
174	1996-12-21	7	Saturday	21	355	51	12	December	4	2	1996
175	1996-12-22	1	Sunday	22	356	52	12	December	4	2	1996
176	1996-12-23	2	Monday	23	357	52	12	December	4	2	1996
177	1996-12-24	3	Tuesday	24	358	52	12	December	4	2	1996
178	1996-12-25	4	Wednesday	25	359	52	12	December	4	2	1996
179	1996-12-26	5	Thursday	26	360	52	12	December	4	2	1996
180	1996-12-27	6	Friday	27	361	52	12	December	4	2	1996
181	1996-12-28	7	Saturday	28	362	52	12	December	4	2	1996
182	1996-12-29	1	Sunday	29	363	53	12	December	4	2	1996
183	1996-12-30	2	Monday	30	364	53	12	December	4	2	1996
184	1996-12-31	3	Tuesday	31	365	53	12	December	4	2	1996
185	1997-01-01	4	Wednesday	1	1	1	1	February	1	1	1997
186	1997-01-02	5	Thursday	2	2	1	1	February	1	1	1997
187	1997-01-03	6	Friday	3	3	1	1	February	1	1	1997
188	1997-01-04	7	Saturday	4	4	1	1	February	1	1	1997
189	1997-01-05	1	Sunday	5	5	2	1	February	1	1	1997
190	1997-01-06	2	Monday	6	6	2	1	February	1	1	1997
191	1997-01-07	3	Tuesday	7	7	2	1	February	1	1	1997
192	1997-01-08	4	Wednesday	8	8	2	1	February	1	1	1997
193	1997-01-09	5	Thursday	9	9	2	1	February	1	1	1997
194	1997-01-10	6	Friday	10	10	2	1	February	1	1	1997
195	1997-01-11	7	Saturday	11	11	2	1	February	1	1	1997
196	1997-01-12	1	Sunday	12	12	3	1	February	1	1	1997
197	1997-01-13	2	Monday	13	13	3	1	February	1	1	1997
198	1997-01-14	3	Tuesday	14	14	3	1	February	1	1	1997
199	1997-01-15	4	Wednesday	15	15	3	1	February	1	1	1997
200	1997-01-16	5	Thursday	16	16	3	1	February	1	1	1997
201	1997-01-17	6	Friday	17	17	3	1	February	1	1	1997
202	1997-01-18	7	Saturday	18	18	3	1	February	1	1	1997
203	1997-01-19	1	Sunday	19	19	4	1	February	1	1	1997
204	1997-01-20	2	Monday	20	20	4	1	February	1	1	1997
205	1997-01-21	3	Tuesday	21	21	4	1	February	1	1	1997
206	1997-01-22	4	Wednesday	22	22	4	1	February	1	1	1997
207	1997-01-23	5	Thursday	23	23	4	1	February	1	1	1997
208	1997-01-24	6	Friday	24	24	4	1	February	1	1	1997
209	1997-01-25	7	Saturday	25	25	4	1	February	1	1	1997
210	1997-01-26	1	Sunday	26	26	5	1	February	1	1	1997
211	1997-01-27	2	Monday	27	27	5	1	February	1	1	1997
212	1997-01-28	3	Tuesday	28	28	5	1	February	1	1	1997
213	1997-01-29	4	Wednesday	29	29	5	1	February	1	1	1997
214	1997-01-30	5	Thursday	30	30	5	1	February	1	1	1997
215	1997-01-31	6	Friday	31	31	5	1	February	1	1	1997
216	1997-02-01	7	Saturday	1	32	5	2	February	1	1	1997
217	1997-02-02	1	Sunday	2	33	6	2	February	1	1	1997
218	1997-02-03	2	Monday	3	34	6	2	February	1	1	1997
219	1997-02-04	3	Tuesday	4	35	6	2	February	1	1	1997
220	1997-02-05	4	Wednesday	5	36	6	2	February	1	1	1997
221	1997-02-06	5	Thursday	6	37	6	2	February	1	1	1997
222	1997-02-07	6	Friday	7	38	6	2	February	1	1	1997
223	1997-02-08	7	Saturday	8	39	6	2	February	1	1	1997
224	1997-02-09	1	Sunday	9	40	7	2	February	1	1	1997
225	1997-02-10	2	Monday	10	41	7	2	February	1	1	1997
226	1997-02-11	3	Tuesday	11	42	7	2	February	1	1	1997
227	1997-02-12	4	Wednesday	12	43	7	2	February	1	1	1997
228	1997-02-13	5	Thursday	13	44	7	2	February	1	1	1997
229	1997-02-14	6	Friday	14	45	7	2	February	1	1	1997
230	1997-02-15	7	Saturday	15	46	7	2	February	1	1	1997
231	1997-02-16	1	Sunday	16	47	8	2	February	1	1	1997
232	1997-02-17	2	Monday	17	48	8	2	February	1	1	1997
233	1997-02-18	3	Tuesday	18	49	8	2	February	1	1	1997
234	1997-02-19	4	Wednesday	19	50	8	2	February	1	1	1997
235	1997-02-20	5	Thursday	20	51	8	2	February	1	1	1997
236	1997-02-21	6	Friday	21	52	8	2	February	1	1	1997
237	1997-02-22	7	Saturday	22	53	8	2	February	1	1	1997
238	1997-02-23	1	Sunday	23	54	9	2	February	1	1	1997
239	1997-02-24	2	Monday	24	55	9	2	February	1	1	1997
240	1997-02-25	3	Tuesday	25	56	9	2	February	1	1	1997
241	1997-02-26	4	Wednesday	26	57	9	2	February	1	1	1997
242	1997-02-27	5	Thursday	27	58	9	2	February	1	1	1997
243	1997-02-28	6	Friday	28	59	9	2	February	1	1	1997
244	1997-03-01	7	Saturday	1	60	9	3	March	1	1	1997
245	1997-03-02	1	Sunday	2	61	10	3	March	1	1	1997
246	1997-03-03	2	Monday	3	62	10	3	March	1	1	1997
247	1997-03-04	3	Tuesday	4	63	10	3	March	1	1	1997
248	1997-03-05	4	Wednesday	5	64	10	3	March	1	1	1997
249	1997-03-06	5	Thursday	6	65	10	3	March	1	1	1997
250	1997-03-07	6	Friday	7	66	10	3	March	1	1	1997
251	1997-03-08	7	Saturday	8	67	10	3	March	1	1	1997
252	1997-03-09	1	Sunday	9	68	11	3	March	1	1	1997
253	1997-03-10	2	Monday	10	69	11	3	March	1	1	1997
254	1997-03-11	3	Tuesday	11	70	11	3	March	1	1	1997
255	1997-03-12	4	Wednesday	12	71	11	3	March	1	1	1997
256	1997-03-13	5	Thursday	13	72	11	3	March	1	1	1997
257	1997-03-14	6	Friday	14	73	11	3	March	1	1	1997
258	1997-03-15	7	Saturday	15	74	11	3	March	1	1	1997
259	1997-03-16	1	Sunday	16	75	12	3	March	1	1	1997
260	1997-03-17	2	Monday	17	76	12	3	March	1	1	1997
261	1997-03-18	3	Tuesday	18	77	12	3	March	1	1	1997
262	1997-03-19	4	Wednesday	19	78	12	3	March	1	1	1997
263	1997-03-20	5	Thursday	20	79	12	3	March	1	1	1997
264	1997-03-21	6	Friday	21	80	12	3	March	1	1	1997
265	1997-03-22	7	Saturday	22	81	12	3	March	1	1	1997
266	1997-03-23	1	Sunday	23	82	13	3	March	1	1	1997
267	1997-03-24	2	Monday	24	83	13	3	March	1	1	1997
268	1997-03-25	3	Tuesday	25	84	13	3	March	1	1	1997
269	1997-03-26	4	Wednesday	26	85	13	3	March	1	1	1997
270	1997-03-27	5	Thursday	27	86	13	3	March	1	1	1997
271	1997-03-28	6	Friday	28	87	13	3	March	1	1	1997
272	1997-03-29	7	Saturday	29	88	13	3	March	1	1	1997
273	1997-03-30	1	Sunday	30	89	14	3	March	1	1	1997
274	1997-03-31	2	Monday	31	90	14	3	March	1	1	1997
275	1997-04-01	3	Tuesday	1	91	14	4	April	2	1	1997
276	1997-04-02	4	Wednesday	2	92	14	4	April	2	1	1997
277	1997-04-03	5	Thursday	3	93	14	4	April	2	1	1997
278	1997-04-04	6	Friday	4	94	14	4	April	2	1	1997
279	1997-04-05	7	Saturday	5	95	14	4	April	2	1	1997
280	1997-04-06	1	Sunday	6	96	15	4	April	2	1	1997
281	1997-04-07	2	Monday	7	97	15	4	April	2	1	1997
282	1997-04-08	3	Tuesday	8	98	15	4	April	2	1	1997
283	1997-04-09	4	Wednesday	9	99	15	4	April	2	1	1997
284	1997-04-10	5	Thursday	10	100	15	4	April	2	1	1997
285	1997-04-11	6	Friday	11	101	15	4	April	2	1	1997
286	1997-04-12	7	Saturday	12	102	15	4	April	2	1	1997
287	1997-04-13	1	Sunday	13	103	16	4	April	2	1	1997
288	1997-04-14	2	Monday	14	104	16	4	April	2	1	1997
289	1997-04-15	3	Tuesday	15	105	16	4	April	2	1	1997
290	1997-04-16	4	Wednesday	16	106	16	4	April	2	1	1997
291	1997-04-17	5	Thursday	17	107	16	4	April	2	1	1997
292	1997-04-18	6	Friday	18	108	16	4	April	2	1	1997
293	1997-04-19	7	Saturday	19	109	16	4	April	2	1	1997
294	1997-04-20	1	Sunday	20	110	17	4	April	2	1	1997
295	1997-04-21	2	Monday	21	111	17	4	April	2	1	1997
296	1997-04-22	3	Tuesday	22	112	17	4	April	2	1	1997
297	1997-04-23	4	Wednesday	23	113	17	4	April	2	1	1997
298	1997-04-24	5	Thursday	24	114	17	4	April	2	1	1997
299	1997-04-25	6	Friday	25	115	17	4	April	2	1	1997
300	1997-04-26	7	Saturday	26	116	17	4	April	2	1	1997
301	1997-04-27	1	Sunday	27	117	18	4	April	2	1	1997
302	1997-04-28	2	Monday	28	118	18	4	April	2	1	1997
303	1997-04-29	3	Tuesday	29	119	18	4	April	2	1	1997
304	1997-04-30	4	Wednesday	30	120	18	4	April	2	1	1997
305	1997-05-01	5	Thursday	1	121	18	5	May	2	1	1997
306	1997-05-02	6	Friday	2	122	18	5	May	2	1	1997
307	1997-05-03	7	Saturday	3	123	18	5	May	2	1	1997
308	1997-05-04	1	Sunday	4	124	19	5	May	2	1	1997
309	1997-05-05	2	Monday	5	125	19	5	May	2	1	1997
310	1997-05-06	3	Tuesday	6	126	19	5	May	2	1	1997
311	1997-05-07	4	Wednesday	7	127	19	5	May	2	1	1997
312	1997-05-08	5	Thursday	8	128	19	5	May	2	1	1997
313	1997-05-09	6	Friday	9	129	19	5	May	2	1	1997
314	1997-05-10	7	Saturday	10	130	19	5	May	2	1	1997
315	1997-05-11	1	Sunday	11	131	20	5	May	2	1	1997
316	1997-05-12	2	Monday	12	132	20	5	May	2	1	1997
317	1997-05-13	3	Tuesday	13	133	20	5	May	2	1	1997
318	1997-05-14	4	Wednesday	14	134	20	5	May	2	1	1997
319	1997-05-15	5	Thursday	15	135	20	5	May	2	1	1997
320	1997-05-16	6	Friday	16	136	20	5	May	2	1	1997
321	1997-05-17	7	Saturday	17	137	20	5	May	2	1	1997
322	1997-05-18	1	Sunday	18	138	21	5	May	2	1	1997
323	1997-05-19	2	Monday	19	139	21	5	May	2	1	1997
324	1997-05-20	3	Tuesday	20	140	21	5	May	2	1	1997
325	1997-05-21	4	Wednesday	21	141	21	5	May	2	1	1997
326	1997-05-22	5	Thursday	22	142	21	5	May	2	1	1997
327	1997-05-23	6	Friday	23	143	21	5	May	2	1	1997
328	1997-05-24	7	Saturday	24	144	21	5	May	2	1	1997
329	1997-05-25	1	Sunday	25	145	22	5	May	2	1	1997
330	1997-05-26	2	Monday	26	146	22	5	May	2	1	1997
331	1997-05-27	3	Tuesday	27	147	22	5	May	2	1	1997
332	1997-05-28	4	Wednesday	28	148	22	5	May	2	1	1997
333	1997-05-29	5	Thursday	29	149	22	5	May	2	1	1997
334	1997-05-30	6	Friday	30	150	22	5	May	2	1	1997
335	1997-05-31	7	Saturday	31	151	22	5	May	2	1	1997
336	1997-06-01	1	Sunday	1	152	23	6	June	2	1	1997
337	1997-06-02	2	Monday	2	153	23	6	June	2	1	1997
338	1997-06-03	3	Tuesday	3	154	23	6	June	2	1	1997
339	1997-06-04	4	Wednesday	4	155	23	6	June	2	1	1997
340	1997-06-05	5	Thursday	5	156	23	6	June	2	1	1997
341	1997-06-06	6	Friday	6	157	23	6	June	2	1	1997
342	1997-06-07	7	Saturday	7	158	23	6	June	2	1	1997
343	1997-06-08	1	Sunday	8	159	24	6	June	2	1	1997
344	1997-06-09	2	Monday	9	160	24	6	June	2	1	1997
345	1997-06-10	3	Tuesday	10	161	24	6	June	2	1	1997
346	1997-06-11	4	Wednesday	11	162	24	6	June	2	1	1997
347	1997-06-12	5	Thursday	12	163	24	6	June	2	1	1997
348	1997-06-13	6	Friday	13	164	24	6	June	2	1	1997
349	1997-06-14	7	Saturday	14	165	24	6	June	2	1	1997
350	1997-06-15	1	Sunday	15	166	25	6	June	2	1	1997
351	1997-06-16	2	Monday	16	167	25	6	June	2	1	1997
352	1997-06-17	3	Tuesday	17	168	25	6	June	2	1	1997
353	1997-06-18	4	Wednesday	18	169	25	6	June	2	1	1997
354	1997-06-19	5	Thursday	19	170	25	6	June	2	1	1997
355	1997-06-20	6	Friday	20	171	25	6	June	2	1	1997
356	1997-06-21	7	Saturday	21	172	25	6	June	2	1	1997
357	1997-06-22	1	Sunday	22	173	26	6	June	2	1	1997
358	1997-06-23	2	Monday	23	174	26	6	June	2	1	1997
359	1997-06-24	3	Tuesday	24	175	26	6	June	2	1	1997
360	1997-06-25	4	Wednesday	25	176	26	6	June	2	1	1997
361	1997-06-26	5	Thursday	26	177	26	6	June	2	1	1997
362	1997-06-27	6	Friday	27	178	26	6	June	2	1	1997
363	1997-06-28	7	Saturday	28	179	26	6	June	2	1	1997
364	1997-06-29	1	Sunday	29	180	27	6	June	2	1	1997
365	1997-06-30	2	Monday	30	181	27	6	June	2	1	1997
366	1997-07-01	3	Tuesday	1	182	27	7	July	3	2	1997
367	1997-07-02	4	Wednesday	2	183	27	7	July	3	2	1997
368	1997-07-03	5	Thursday	3	184	27	7	July	3	2	1997
369	1997-07-04	6	Friday	4	185	27	7	July	3	2	1997
370	1997-07-05	7	Saturday	5	186	27	7	July	3	2	1997
371	1997-07-06	1	Sunday	6	187	28	7	July	3	2	1997
372	1997-07-07	2	Monday	7	188	28	7	July	3	2	1997
373	1997-07-08	3	Tuesday	8	189	28	7	July	3	2	1997
374	1997-07-09	4	Wednesday	9	190	28	7	July	3	2	1997
375	1997-07-10	5	Thursday	10	191	28	7	July	3	2	1997
376	1997-07-11	6	Friday	11	192	28	7	July	3	2	1997
377	1997-07-12	7	Saturday	12	193	28	7	July	3	2	1997
378	1997-07-13	1	Sunday	13	194	29	7	July	3	2	1997
379	1997-07-14	2	Monday	14	195	29	7	July	3	2	1997
380	1997-07-15	3	Tuesday	15	196	29	7	July	3	2	1997
381	1997-07-16	4	Wednesday	16	197	29	7	July	3	2	1997
382	1997-07-17	5	Thursday	17	198	29	7	July	3	2	1997
383	1997-07-18	6	Friday	18	199	29	7	July	3	2	1997
384	1997-07-19	7	Saturday	19	200	29	7	July	3	2	1997
385	1997-07-20	1	Sunday	20	201	30	7	July	3	2	1997
386	1997-07-21	2	Monday	21	202	30	7	July	3	2	1997
387	1997-07-22	3	Tuesday	22	203	30	7	July	3	2	1997
388	1997-07-23	4	Wednesday	23	204	30	7	July	3	2	1997
389	1997-07-24	5	Thursday	24	205	30	7	July	3	2	1997
390	1997-07-25	6	Friday	25	206	30	7	July	3	2	1997
391	1997-07-26	7	Saturday	26	207	30	7	July	3	2	1997
392	1997-07-27	1	Sunday	27	208	31	7	July	3	2	1997
393	1997-07-28	2	Monday	28	209	31	7	July	3	2	1997
394	1997-07-29	3	Tuesday	29	210	31	7	July	3	2	1997
395	1997-07-30	4	Wednesday	30	211	31	7	July	3	2	1997
396	1997-07-31	5	Thursday	31	212	31	7	July	3	2	1997
397	1997-08-01	6	Friday	1	213	31	8	August	3	2	1997
398	1997-08-02	7	Saturday	2	214	31	8	August	3	2	1997
399	1997-08-03	1	Sunday	3	215	32	8	August	3	2	1997
400	1997-08-04	2	Monday	4	216	32	8	August	3	2	1997
401	1997-08-05	3	Tuesday	5	217	32	8	August	3	2	1997
402	1997-08-06	4	Wednesday	6	218	32	8	August	3	2	1997
403	1997-08-07	5	Thursday	7	219	32	8	August	3	2	1997
404	1997-08-08	6	Friday	8	220	32	8	August	3	2	1997
405	1997-08-09	7	Saturday	9	221	32	8	August	3	2	1997
406	1997-08-10	1	Sunday	10	222	33	8	August	3	2	1997
407	1997-08-11	2	Monday	11	223	33	8	August	3	2	1997
408	1997-08-12	3	Tuesday	12	224	33	8	August	3	2	1997
409	1997-08-13	4	Wednesday	13	225	33	8	August	3	2	1997
410	1997-08-14	5	Thursday	14	226	33	8	August	3	2	1997
411	1997-08-15	6	Friday	15	227	33	8	August	3	2	1997
412	1997-08-16	7	Saturday	16	228	33	8	August	3	2	1997
413	1997-08-17	1	Sunday	17	229	34	8	August	3	2	1997
414	1997-08-18	2	Monday	18	230	34	8	August	3	2	1997
415	1997-08-19	3	Tuesday	19	231	34	8	August	3	2	1997
416	1997-08-20	4	Wednesday	20	232	34	8	August	3	2	1997
417	1997-08-21	5	Thursday	21	233	34	8	August	3	2	1997
418	1997-08-22	6	Friday	22	234	34	8	August	3	2	1997
419	1997-08-23	7	Saturday	23	235	34	8	August	3	2	1997
420	1997-08-24	1	Sunday	24	236	35	8	August	3	2	1997
421	1997-08-25	2	Monday	25	237	35	8	August	3	2	1997
422	1997-08-26	3	Tuesday	26	238	35	8	August	3	2	1997
423	1997-08-27	4	Wednesday	27	239	35	8	August	3	2	1997
424	1997-08-28	5	Thursday	28	240	35	8	August	3	2	1997
425	1997-08-29	6	Friday	29	241	35	8	August	3	2	1997
426	1997-08-30	7	Saturday	30	242	35	8	August	3	2	1997
427	1997-08-31	1	Sunday	31	243	36	8	August	3	2	1997
428	1997-09-01	2	Monday	1	244	36	9	September	3	2	1997
429	1997-09-02	3	Tuesday	2	245	36	9	September	3	2	1997
430	1997-09-03	4	Wednesday	3	246	36	9	September	3	2	1997
431	1997-09-04	5	Thursday	4	247	36	9	September	3	2	1997
432	1997-09-05	6	Friday	5	248	36	9	September	3	2	1997
433	1997-09-06	7	Saturday	6	249	36	9	September	3	2	1997
434	1997-09-07	1	Sunday	7	250	37	9	September	3	2	1997
435	1997-09-08	2	Monday	8	251	37	9	September	3	2	1997
436	1997-09-09	3	Tuesday	9	252	37	9	September	3	2	1997
437	1997-09-10	4	Wednesday	10	253	37	9	September	3	2	1997
438	1997-09-11	5	Thursday	11	254	37	9	September	3	2	1997
439	1997-09-12	6	Friday	12	255	37	9	September	3	2	1997
440	1997-09-13	7	Saturday	13	256	37	9	September	3	2	1997
441	1997-09-14	1	Sunday	14	257	38	9	September	3	2	1997
442	1997-09-15	2	Monday	15	258	38	9	September	3	2	1997
443	1997-09-16	3	Tuesday	16	259	38	9	September	3	2	1997
444	1997-09-17	4	Wednesday	17	260	38	9	September	3	2	1997
445	1997-09-18	5	Thursday	18	261	38	9	September	3	2	1997
446	1997-09-19	6	Friday	19	262	38	9	September	3	2	1997
447	1997-09-20	7	Saturday	20	263	38	9	September	3	2	1997
448	1997-09-21	1	Sunday	21	264	39	9	September	3	2	1997
449	1997-09-22	2	Monday	22	265	39	9	September	3	2	1997
450	1997-09-23	3	Tuesday	23	266	39	9	September	3	2	1997
451	1997-09-24	4	Wednesday	24	267	39	9	September	3	2	1997
452	1997-09-25	5	Thursday	25	268	39	9	September	3	2	1997
453	1997-09-26	6	Friday	26	269	39	9	September	3	2	1997
454	1997-09-27	7	Saturday	27	270	39	9	September	3	2	1997
455	1997-09-28	1	Sunday	28	271	40	9	September	3	2	1997
456	1997-09-29	2	Monday	29	272	40	9	September	3	2	1997
457	1997-09-30	3	Tuesday	30	273	40	9	September	3	2	1997
458	1997-10-01	4	Wednesday	1	274	40	10	October	4	2	1997
459	1997-10-02	5	Thursday	2	275	40	10	October	4	2	1997
460	1997-10-03	6	Friday	3	276	40	10	October	4	2	1997
461	1997-10-04	7	Saturday	4	277	40	10	October	4	2	1997
462	1997-10-05	1	Sunday	5	278	41	10	October	4	2	1997
463	1997-10-06	2	Monday	6	279	41	10	October	4	2	1997
464	1997-10-07	3	Tuesday	7	280	41	10	October	4	2	1997
465	1997-10-08	4	Wednesday	8	281	41	10	October	4	2	1997
466	1997-10-09	5	Thursday	9	282	41	10	October	4	2	1997
467	1997-10-10	6	Friday	10	283	41	10	October	4	2	1997
468	1997-10-11	7	Saturday	11	284	41	10	October	4	2	1997
469	1997-10-12	1	Sunday	12	285	42	10	October	4	2	1997
470	1997-10-13	2	Monday	13	286	42	10	October	4	2	1997
471	1997-10-14	3	Tuesday	14	287	42	10	October	4	2	1997
472	1997-10-15	4	Wednesday	15	288	42	10	October	4	2	1997
473	1997-10-16	5	Thursday	16	289	42	10	October	4	2	1997
474	1997-10-17	6	Friday	17	290	42	10	October	4	2	1997
475	1997-10-18	7	Saturday	18	291	42	10	October	4	2	1997
476	1997-10-19	1	Sunday	19	292	43	10	October	4	2	1997
477	1997-10-20	2	Monday	20	293	43	10	October	4	2	1997
478	1997-10-21	3	Tuesday	21	294	43	10	October	4	2	1997
479	1997-10-22	4	Wednesday	22	295	43	10	October	4	2	1997
480	1997-10-23	5	Thursday	23	296	43	10	October	4	2	1997
481	1997-10-24	6	Friday	24	297	43	10	October	4	2	1997
482	1997-10-25	7	Saturday	25	298	43	10	October	4	2	1997
483	1997-10-26	1	Sunday	26	299	44	10	October	4	2	1997
484	1997-10-27	2	Monday	27	300	44	10	October	4	2	1997
485	1997-10-28	3	Tuesday	28	301	44	10	October	4	2	1997
486	1997-10-29	4	Wednesday	29	302	44	10	October	4	2	1997
487	1997-10-30	5	Thursday	30	303	44	10	October	4	2	1997
488	1997-10-31	6	Friday	31	304	44	10	October	4	2	1997
489	1997-11-01	7	Saturday	1	305	44	11	November	4	2	1997
490	1997-11-02	1	Sunday	2	306	45	11	November	4	2	1997
491	1997-11-03	2	Monday	3	307	45	11	November	4	2	1997
492	1997-11-04	3	Tuesday	4	308	45	11	November	4	2	1997
493	1997-11-05	4	Wednesday	5	309	45	11	November	4	2	1997
494	1997-11-06	5	Thursday	6	310	45	11	November	4	2	1997
495	1997-11-07	6	Friday	7	311	45	11	November	4	2	1997
496	1997-11-08	7	Saturday	8	312	45	11	November	4	2	1997
497	1997-11-09	1	Sunday	9	313	46	11	November	4	2	1997
498	1997-11-10	2	Monday	10	314	46	11	November	4	2	1997
499	1997-11-11	3	Tuesday	11	315	46	11	November	4	2	1997
500	1997-11-12	4	Wednesday	12	316	46	11	November	4	2	1997
501	1997-11-13	5	Thursday	13	317	46	11	November	4	2	1997
502	1997-11-14	6	Friday	14	318	46	11	November	4	2	1997
503	1997-11-15	7	Saturday	15	319	46	11	November	4	2	1997
504	1997-11-16	1	Sunday	16	320	47	11	November	4	2	1997
505	1997-11-17	2	Monday	17	321	47	11	November	4	2	1997
506	1997-11-18	3	Tuesday	18	322	47	11	November	4	2	1997
507	1997-11-19	4	Wednesday	19	323	47	11	November	4	2	1997
508	1997-11-20	5	Thursday	20	324	47	11	November	4	2	1997
509	1997-11-21	6	Friday	21	325	47	11	November	4	2	1997
510	1997-11-22	7	Saturday	22	326	47	11	November	4	2	1997
511	1997-11-23	1	Sunday	23	327	48	11	November	4	2	1997
512	1997-11-24	2	Monday	24	328	48	11	November	4	2	1997
513	1997-11-25	3	Tuesday	25	329	48	11	November	4	2	1997
514	1997-11-26	4	Wednesday	26	330	48	11	November	4	2	1997
515	1997-11-27	5	Thursday	27	331	48	11	November	4	2	1997
516	1997-11-28	6	Friday	28	332	48	11	November	4	2	1997
517	1997-11-29	7	Saturday	29	333	48	11	November	4	2	1997
518	1997-11-30	1	Sunday	30	334	49	11	November	4	2	1997
519	1997-12-01	2	Monday	1	335	49	12	December	4	2	1997
520	1997-12-02	3	Tuesday	2	336	49	12	December	4	2	1997
521	1997-12-03	4	Wednesday	3	337	49	12	December	4	2	1997
522	1997-12-04	5	Thursday	4	338	49	12	December	4	2	1997
523	1997-12-05	6	Friday	5	339	49	12	December	4	2	1997
524	1997-12-06	7	Saturday	6	340	49	12	December	4	2	1997
525	1997-12-07	1	Sunday	7	341	50	12	December	4	2	1997
526	1997-12-08	2	Monday	8	342	50	12	December	4	2	1997
527	1997-12-09	3	Tuesday	9	343	50	12	December	4	2	1997
528	1997-12-10	4	Wednesday	10	344	50	12	December	4	2	1997
529	1997-12-11	5	Thursday	11	345	50	12	December	4	2	1997
530	1997-12-12	6	Friday	12	346	50	12	December	4	2	1997
531	1997-12-13	7	Saturday	13	347	50	12	December	4	2	1997
532	1997-12-14	1	Sunday	14	348	51	12	December	4	2	1997
533	1997-12-15	2	Monday	15	349	51	12	December	4	2	1997
534	1997-12-16	3	Tuesday	16	350	51	12	December	4	2	1997
535	1997-12-17	4	Wednesday	17	351	51	12	December	4	2	1997
536	1997-12-18	5	Thursday	18	352	51	12	December	4	2	1997
537	1997-12-19	6	Friday	19	353	51	12	December	4	2	1997
538	1997-12-20	7	Saturday	20	354	51	12	December	4	2	1997
539	1997-12-21	1	Sunday	21	355	52	12	December	4	2	1997
540	1997-12-22	2	Monday	22	356	52	12	December	4	2	1997
541	1997-12-23	3	Tuesday	23	357	52	12	December	4	2	1997
542	1997-12-24	4	Wednesday	24	358	52	12	December	4	2	1997
543	1997-12-25	5	Thursday	25	359	52	12	December	4	2	1997
544	1997-12-26	6	Friday	26	360	52	12	December	4	2	1997
545	1997-12-27	7	Saturday	27	361	52	12	December	4	2	1997
546	1997-12-28	1	Sunday	28	362	53	12	December	4	2	1997
547	1997-12-29	2	Monday	29	363	53	12	December	4	2	1997
548	1997-12-30	3	Tuesday	30	364	53	12	December	4	2	1997
549	1997-12-31	4	Wednesday	31	365	53	12	December	4	2	1997
550	1998-01-01	5	Thursday	1	1	1	1	February	1	1	1998
551	1998-01-02	6	Friday	2	2	1	1	February	1	1	1998
552	1998-01-03	7	Saturday	3	3	1	1	February	1	1	1998
553	1998-01-04	1	Sunday	4	4	2	1	February	1	1	1998
554	1998-01-05	2	Monday	5	5	2	1	February	1	1	1998
555	1998-01-06	3	Tuesday	6	6	2	1	February	1	1	1998
556	1998-01-07	4	Wednesday	7	7	2	1	February	1	1	1998
557	1998-01-08	5	Thursday	8	8	2	1	February	1	1	1998
558	1998-01-09	6	Friday	9	9	2	1	February	1	1	1998
559	1998-01-10	7	Saturday	10	10	2	1	February	1	1	1998
560	1998-01-11	1	Sunday	11	11	3	1	February	1	1	1998
561	1998-01-12	2	Monday	12	12	3	1	February	1	1	1998
562	1998-01-13	3	Tuesday	13	13	3	1	February	1	1	1998
563	1998-01-14	4	Wednesday	14	14	3	1	February	1	1	1998
564	1998-01-15	5	Thursday	15	15	3	1	February	1	1	1998
565	1998-01-16	6	Friday	16	16	3	1	February	1	1	1998
566	1998-01-17	7	Saturday	17	17	3	1	February	1	1	1998
567	1998-01-18	1	Sunday	18	18	4	1	February	1	1	1998
568	1998-01-19	2	Monday	19	19	4	1	February	1	1	1998
569	1998-01-20	3	Tuesday	20	20	4	1	February	1	1	1998
570	1998-01-21	4	Wednesday	21	21	4	1	February	1	1	1998
571	1998-01-22	5	Thursday	22	22	4	1	February	1	1	1998
572	1998-01-23	6	Friday	23	23	4	1	February	1	1	1998
573	1998-01-24	7	Saturday	24	24	4	1	February	1	1	1998
574	1998-01-25	1	Sunday	25	25	5	1	February	1	1	1998
575	1998-01-26	2	Monday	26	26	5	1	February	1	1	1998
576	1998-01-27	3	Tuesday	27	27	5	1	February	1	1	1998
577	1998-01-28	4	Wednesday	28	28	5	1	February	1	1	1998
578	1998-01-29	5	Thursday	29	29	5	1	February	1	1	1998
579	1998-01-30	6	Friday	30	30	5	1	February	1	1	1998
580	1998-01-31	7	Saturday	31	31	5	1	February	1	1	1998
581	1998-02-01	1	Sunday	1	32	6	2	February	1	1	1998
582	1998-02-02	2	Monday	2	33	6	2	February	1	1	1998
583	1998-02-03	3	Tuesday	3	34	6	2	February	1	1	1998
584	1998-02-04	4	Wednesday	4	35	6	2	February	1	1	1998
585	1998-02-05	5	Thursday	5	36	6	2	February	1	1	1998
586	1998-02-06	6	Friday	6	37	6	2	February	1	1	1998
587	1998-02-07	7	Saturday	7	38	6	2	February	1	1	1998
588	1998-02-08	1	Sunday	8	39	7	2	February	1	1	1998
589	1998-02-09	2	Monday	9	40	7	2	February	1	1	1998
590	1998-02-10	3	Tuesday	10	41	7	2	February	1	1	1998
591	1998-02-11	4	Wednesday	11	42	7	2	February	1	1	1998
592	1998-02-12	5	Thursday	12	43	7	2	February	1	1	1998
593	1998-02-13	6	Friday	13	44	7	2	February	1	1	1998
594	1998-02-14	7	Saturday	14	45	7	2	February	1	1	1998
595	1998-02-15	1	Sunday	15	46	8	2	February	1	1	1998
596	1998-02-16	2	Monday	16	47	8	2	February	1	1	1998
597	1998-02-17	3	Tuesday	17	48	8	2	February	1	1	1998
598	1998-02-18	4	Wednesday	18	49	8	2	February	1	1	1998
599	1998-02-19	5	Thursday	19	50	8	2	February	1	1	1998
600	1998-02-20	6	Friday	20	51	8	2	February	1	1	1998
601	1998-02-21	7	Saturday	21	52	8	2	February	1	1	1998
602	1998-02-22	1	Sunday	22	53	9	2	February	1	1	1998
603	1998-02-23	2	Monday	23	54	9	2	February	1	1	1998
604	1998-02-24	3	Tuesday	24	55	9	2	February	1	1	1998
605	1998-02-25	4	Wednesday	25	56	9	2	February	1	1	1998
606	1998-02-26	5	Thursday	26	57	9	2	February	1	1	1998
607	1998-02-27	6	Friday	27	58	9	2	February	1	1	1998
608	1998-02-28	7	Saturday	28	59	9	2	February	1	1	1998
609	1998-03-01	1	Sunday	1	60	10	3	March	1	1	1998
610	1998-03-02	2	Monday	2	61	10	3	March	1	1	1998
611	1998-03-03	3	Tuesday	3	62	10	3	March	1	1	1998
612	1998-03-04	4	Wednesday	4	63	10	3	March	1	1	1998
613	1998-03-05	5	Thursday	5	64	10	3	March	1	1	1998
614	1998-03-06	6	Friday	6	65	10	3	March	1	1	1998
615	1998-03-07	7	Saturday	7	66	10	3	March	1	1	1998
616	1998-03-08	1	Sunday	8	67	11	3	March	1	1	1998
617	1998-03-09	2	Monday	9	68	11	3	March	1	1	1998
618	1998-03-10	3	Tuesday	10	69	11	3	March	1	1	1998
619	1998-03-11	4	Wednesday	11	70	11	3	March	1	1	1998
620	1998-03-12	5	Thursday	12	71	11	3	March	1	1	1998
621	1998-03-13	6	Friday	13	72	11	3	March	1	1	1998
622	1998-03-14	7	Saturday	14	73	11	3	March	1	1	1998
623	1998-03-15	1	Sunday	15	74	12	3	March	1	1	1998
624	1998-03-16	2	Monday	16	75	12	3	March	1	1	1998
625	1998-03-17	3	Tuesday	17	76	12	3	March	1	1	1998
626	1998-03-18	4	Wednesday	18	77	12	3	March	1	1	1998
627	1998-03-19	5	Thursday	19	78	12	3	March	1	1	1998
628	1998-03-20	6	Friday	20	79	12	3	March	1	1	1998
629	1998-03-21	7	Saturday	21	80	12	3	March	1	1	1998
630	1998-03-22	1	Sunday	22	81	13	3	March	1	1	1998
631	1998-03-23	2	Monday	23	82	13	3	March	1	1	1998
632	1998-03-24	3	Tuesday	24	83	13	3	March	1	1	1998
633	1998-03-25	4	Wednesday	25	84	13	3	March	1	1	1998
634	1998-03-26	5	Thursday	26	85	13	3	March	1	1	1998
635	1998-03-27	6	Friday	27	86	13	3	March	1	1	1998
636	1998-03-28	7	Saturday	28	87	13	3	March	1	1	1998
637	1998-03-29	1	Sunday	29	88	14	3	March	1	1	1998
638	1998-03-30	2	Monday	30	89	14	3	March	1	1	1998
639	1998-03-31	3	Tuesday	31	90	14	3	March	1	1	1998
640	1998-04-01	4	Wednesday	1	91	14	4	April	2	1	1998
641	1998-04-02	5	Thursday	2	92	14	4	April	2	1	1998
642	1998-04-03	6	Friday	3	93	14	4	April	2	1	1998
643	1998-04-04	7	Saturday	4	94	14	4	April	2	1	1998
644	1998-04-05	1	Sunday	5	95	15	4	April	2	1	1998
645	1998-04-06	2	Monday	6	96	15	4	April	2	1	1998
646	1998-04-07	3	Tuesday	7	97	15	4	April	2	1	1998
647	1998-04-08	4	Wednesday	8	98	15	4	April	2	1	1998
648	1998-04-09	5	Thursday	9	99	15	4	April	2	1	1998
649	1998-04-10	6	Friday	10	100	15	4	April	2	1	1998
650	1998-04-11	7	Saturday	11	101	15	4	April	2	1	1998
651	1998-04-12	1	Sunday	12	102	16	4	April	2	1	1998
652	1998-04-13	2	Monday	13	103	16	4	April	2	1	1998
653	1998-04-14	3	Tuesday	14	104	16	4	April	2	1	1998
654	1998-04-15	4	Wednesday	15	105	16	4	April	2	1	1998
655	1998-04-16	5	Thursday	16	106	16	4	April	2	1	1998
656	1998-04-17	6	Friday	17	107	16	4	April	2	1	1998
657	1998-04-18	7	Saturday	18	108	16	4	April	2	1	1998
658	1998-04-19	1	Sunday	19	109	17	4	April	2	1	1998
659	1998-04-20	2	Monday	20	110	17	4	April	2	1	1998
660	1998-04-21	3	Tuesday	21	111	17	4	April	2	1	1998
661	1998-04-22	4	Wednesday	22	112	17	4	April	2	1	1998
662	1998-04-23	5	Thursday	23	113	17	4	April	2	1	1998
663	1998-04-24	6	Friday	24	114	17	4	April	2	1	1998
664	1998-04-25	7	Saturday	25	115	17	4	April	2	1	1998
665	1998-04-26	1	Sunday	26	116	18	4	April	2	1	1998
666	1998-04-27	2	Monday	27	117	18	4	April	2	1	1998
667	1998-04-28	3	Tuesday	28	118	18	4	April	2	1	1998
668	1998-04-29	4	Wednesday	29	119	18	4	April	2	1	1998
669	1998-04-30	5	Thursday	30	120	18	4	April	2	1	1998
670	1998-05-01	6	Friday	1	121	18	5	May	2	1	1998
671	1998-05-02	7	Saturday	2	122	18	5	May	2	1	1998
672	1998-05-03	1	Sunday	3	123	19	5	May	2	1	1998
673	1998-05-04	2	Monday	4	124	19	5	May	2	1	1998
674	1998-05-05	3	Tuesday	5	125	19	5	May	2	1	1998
675	1998-05-06	4	Wednesday	6	126	19	5	May	2	1	1998
676	1998-05-07	5	Thursday	7	127	19	5	May	2	1	1998
677	1998-05-08	6	Friday	8	128	19	5	May	2	1	1998
678	1998-05-09	7	Sunday	9	129	19	5	May	2	1	1998
679	1998-05-10	1	Monday	10	130	20	5	May	2	1	1998
680	1998-05-11	2	Tuesday	11	131	20	5	May	2	1	1998
681	1998-05-12	3	Wednesday	12	132	20	5	May	2	1	1998
682	1998-05-13	4	Thursday	13	133	20	5	May	2	1	1998
683	1998-05-14	5	Friday	14	134	20	5	May	2	1	1998
684	1998-05-15	6	Saturday	15	135	20	5	May	2	1	1998
685	1998-05-16	7	Sunday	16	136	20	5	May	2	1	1998
686	1998-05-17	1	Monday	17	137	21	5	May	2	1	1998
687	1998-05-18	2	Tuesday	18	138	21	5	May	2	1	1998
688	1998-05-19	3	Wednesday	19	139	21	5	May	2	1	1998
689	1998-05-20	4	Thursday	20	140	21	5	May	2	1	1998
690	1998-05-21	5	Friday	21	141	21	5	May	2	1	1998
691	1998-05-22	6	Saturday	22	142	21	5	May	2	1	1998
692	1998-05-23	7	Sunday	23	143	21	5	May	2	1	1998
693	1998-05-24	1	Monday	24	144	22	5	May	2	1	1998
694	1998-05-25	2	Tuesday	25	145	22	5	May	2	1	1998
695	1998-05-26	3	Wednesday	26	146	22	5	May	2	1	1998
696	1998-05-27	4	Thursday	27	147	22	5	May	2	1	1998
697	1998-05-28	5	Friday	28	148	22	5	May	2	1	1998
698	1998-05-29	6	Saturday	29	149	22	5	May	2	1	1998
699	1998-05-30	7	Sunday	30	150	22	5	May	2	1	1998
700	1998-05-31	1	Monday	31	151	23	5	May	2	1	1998
701	1998-06-01	2	Tuesday	1	152	23	6	June	2	1	1998
702	1998-06-02	3	Wednesday	2	153	23	6	June	2	1	1998
703	1998-06-03	4	Thursday	3	154	23	6	June	2	1	1998
704	1998-06-04	5	Friday	4	155	23	6	June	2	1	1998
705	1998-06-05	6	Saturday	5	156	23	6	June	2	1	1998
706	1998-06-06	7	Sunday	6	157	23	6	June	2	1	1998
707	1998-06-07	1	Monday	7	158	24	6	June	2	1	1998
708	1998-06-08	2	Tuesday	8	159	24	6	June	2	1	1998
709	1998-06-09	3	Wednesday	9	160	24	6	June	2	1	1998
710	1998-06-10	4	Thursday	10	161	24	6	June	2	1	1998
711	1998-06-11	5	Friday	11	162	24	6	June	2	1	1998
712	1998-06-12	6	Saturday	12	163	24	6	June	2	1	1998
713	1998-06-13	7	Sunday	13	164	24	6	June	2	1	1998
714	1998-06-14	1	Monday	14	165	25	6	June	2	1	1998
715	1998-06-15	2	Tuesday	15	166	25	6	June	2	1	1998
716	1998-06-16	3	Wednesday	16	167	25	6	June	2	1	1998
717	1998-06-17	4	Thursday	17	168	25	6	June	2	1	1998
718	1998-06-18	5	Friday	18	169	25	6	June	2	1	1998
719	1998-06-19	6	Saturday	19	170	25	6	June	2	1	1998
720	1998-06-20	7	Sunday	20	171	25	6	June	2	1	1998
721	1998-06-21	1	Monday	21	172	26	6	June	2	1	1998
722	1998-06-22	2	Tuesday	22	173	26	6	June	2	1	1998
723	1998-06-23	3	Wednesday	23	174	26	6	June	2	1	1998
724	1998-06-24	4	Thursday	24	175	26	6	June	2	1	1998
725	1998-06-25	5	Friday	25	176	26	6	June	2	1	1998
726	1998-06-26	6	Saturday	26	177	26	6	June	2	1	1998
727	1998-06-27	7	Sunday	27	178	26	6	June	2	1	1998
728	1998-06-28	1	Monday	28	179	27	6	June	2	1	1998
729	1998-06-29	2	Tuesday	29	180	27	6	June	2	1	1998
730	1998-06-30	3	Wednesday	30	181	27	6	June	2	1	1998
\.


--
-- Name: city_citykey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.city_citykey_seq', 1, false);


--
-- Name: continent_continentkey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.continent_continentkey_seq', 1, false);


--
-- Name: country_countrykey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_countrykey_seq', 1, false);


--
-- Name: customer_customerkey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_customerkey_seq', 1, false);


--
-- Name: state_statekey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.state_statekey_seq', 1, false);


--
-- Name: date_datekey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.date_datekey_seq', 1, false);


--
-- Name: customer ak_customer_customerid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT ak_customer_customerid UNIQUE (customerid);


--
-- Name: sales ak_sales_orderno_orderlineno; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT ak_sales_orderno_orderlineno UNIQUE (orderno, orderlineno);


--
-- Name: date ak_date_date; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."date"
    ADD CONSTRAINT ak_date_date UNIQUE (date);


--
-- Name: category pk_category_categorykey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT pk_category_categorykey PRIMARY KEY (categorykey);


--
-- Name: city pk_city_citykey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT pk_city_citykey PRIMARY KEY (citykey);


--
-- Name: continent pk_continent_continentkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.continent
    ADD CONSTRAINT pk_continent_continentkey PRIMARY KEY (continentkey);


--
-- Name: country pk_country_countrykey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT pk_country_countrykey PRIMARY KEY (countrykey);


--
-- Name: customer pk_customer_customerkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT pk_customer_customerkey PRIMARY KEY (customerkey);


--
-- Name: employee pk_employee_employeekey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT pk_employee_employeekey PRIMARY KEY (employeekey);


--
-- Name: employeeclosure pk_employeeclosure_supervisorkey_employeekey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employeeclosure
    ADD CONSTRAINT pk_employeeclosure_supervisorkey_employeekey PRIMARY KEY (supervisorkey, employeekey);


--
-- Name: product pk_product_productkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT pk_product_productkey PRIMARY KEY (productkey);


--
-- Name: shipper pk_shipper_shipperkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipper
    ADD CONSTRAINT pk_shipper_shipperkey PRIMARY KEY (shipperkey);


--
-- Name: state pk_state_statekey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.state
    ADD CONSTRAINT pk_state_statekey PRIMARY KEY (statekey);


--
-- Name: supplier pk_supplier_supplierkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT pk_supplier_supplierkey PRIMARY KEY (supplierkey);


--
-- Name: territories pk_territories_employeekey_citykey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.territories
    ADD CONSTRAINT pk_territories_employeekey_citykey PRIMARY KEY (employeekey, citykey);


--
-- Name: date pk_date_datekey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."date"
    ADD CONSTRAINT pk_date_datekey PRIMARY KEY (datekey);


--
-- Name: city fk_city_country; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT fk_city_country FOREIGN KEY (countrykey) REFERENCES public.country(countrykey);


--
-- Name: city fk_city_state; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT fk_city_state FOREIGN KEY (statekey) REFERENCES public.state(statekey);


--
-- Name: country fk_country_continent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT fk_country_continent FOREIGN KEY (continentkey) REFERENCES public.continent(continentkey);


--
-- Name: customer fk_customer_city; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT fk_customer_city FOREIGN KEY (citykey) REFERENCES public.city(citykey);


--
-- Name: employee fk_employee_employee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT fk_employee_employee FOREIGN KEY (supervisorkey) REFERENCES public.employee(employeekey);


--
-- Name: employeeclosure fk_employeeclosure_employee1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employeeclosure
    ADD CONSTRAINT fk_employeeclosure_employee1 FOREIGN KEY (supervisorkey) REFERENCES public.employee(employeekey);


--
-- Name: employeeclosure fk_employeeclosure_employee2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employeeclosure
    ADD CONSTRAINT fk_employeeclosure_employee2 FOREIGN KEY (employeekey) REFERENCES public.employee(employeekey);


--
-- Name: product fk_product_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk_product_category FOREIGN KEY (categorykey) REFERENCES public.category(categorykey);


--
-- Name: sales fk_sales_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT fk_sales_customer FOREIGN KEY (customerkey) REFERENCES public.customer(customerkey);


--
-- Name: sales fk_sales_employee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT fk_sales_employee FOREIGN KEY (employeekey) REFERENCES public.employee(employeekey);


--
-- Name: sales fk_sales_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT fk_sales_product FOREIGN KEY (productkey) REFERENCES public.product(productkey);


--
-- Name: sales fk_sales_shipper; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT fk_sales_shipper FOREIGN KEY (shipperkey) REFERENCES public.shipper(shipperkey);


--
-- Name: sales fk_sales_supplier; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT fk_sales_supplier FOREIGN KEY (supplierkey) REFERENCES public.supplier(supplierkey);


--
-- Name: sales fk_sales_date1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT fk_sales_date1 FOREIGN KEY (orderdatekey) REFERENCES public."date"(datekey);


--
-- Name: sales fk_sales_date2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT fk_sales_date2 FOREIGN KEY (duedatekey) REFERENCES public."date"(datekey);


--
-- Name: sales fk_sales_date3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT fk_sales_date3 FOREIGN KEY (shippeddatekey) REFERENCES public."date"(datekey);


--
-- Name: state fk_state_country; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.state
    ADD CONSTRAINT fk_state_country FOREIGN KEY (countrykey) REFERENCES public.country(countrykey);


--
-- Name: supplier fk_supplier_city; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT fk_supplier_city FOREIGN KEY (citykey) REFERENCES public.city(citykey);


--
-- Name: territories fk_territories_city; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.territories
    ADD CONSTRAINT fk_territories_city FOREIGN KEY (citykey) REFERENCES public.city(citykey);


--
-- Name: territories fk_territories_employee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.territories
    ADD CONSTRAINT fk_territories_employee FOREIGN KEY (employeekey) REFERENCES public.employee(employeekey);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM esteban;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

