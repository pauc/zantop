--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ckeditor_assets; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ckeditor_assets (
    id integer NOT NULL,
    data_file_name character varying(255) NOT NULL,
    data_content_type character varying(255),
    data_file_size integer,
    assetable_id integer,
    assetable_type character varying(30),
    type character varying(30),
    width integer,
    height integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ckeditor_assets OWNER TO postgres;

--
-- Name: ckeditor_assets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ckeditor_assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ckeditor_assets_id_seq OWNER TO postgres;

--
-- Name: ckeditor_assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ckeditor_assets_id_seq OWNED BY ckeditor_assets.id;


--
-- Name: friendly_id_slugs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE friendly_id_slugs (
    id integer NOT NULL,
    slug character varying(255) NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(40),
    created_at timestamp without time zone
);


ALTER TABLE public.friendly_id_slugs OWNER TO postgres;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendly_id_slugs_id_seq OWNER TO postgres;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE friendly_id_slugs_id_seq OWNED BY friendly_id_slugs.id;


--
-- Name: image_translations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE image_translations (
    id integer NOT NULL,
    image_id integer,
    locale character varying(255),
    credits text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.image_translations OWNER TO postgres;

--
-- Name: image_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE image_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.image_translations_id_seq OWNER TO postgres;

--
-- Name: image_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE image_translations_id_seq OWNED BY image_translations.id;


--
-- Name: images; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE images (
    id integer NOT NULL,
    image character varying(255),
    illustrated_id integer,
    illustrated_type character varying(255),
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    video character varying(255)
);


ALTER TABLE public.images OWNER TO postgres;

--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.images_id_seq OWNER TO postgres;

--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE images_id_seq OWNED BY images.id;


--
-- Name: page_translations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE page_translations (
    id integer NOT NULL,
    page_id integer,
    locale character varying(255),
    title character varying(255),
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.page_translations OWNER TO postgres;

--
-- Name: page_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE page_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_translations_id_seq OWNER TO postgres;

--
-- Name: page_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE page_translations_id_seq OWNED BY page_translations.id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pages (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.pages OWNER TO postgres;

--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_id_seq OWNER TO postgres;

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pages_id_seq OWNED BY pages.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: section_translations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE section_translations (
    id integer NOT NULL,
    section_id integer,
    locale character varying(255),
    title character varying(255),
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.section_translations OWNER TO postgres;

--
-- Name: section_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE section_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.section_translations_id_seq OWNER TO postgres;

--
-- Name: section_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE section_translations_id_seq OWNED BY section_translations.id;


--
-- Name: sections; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sections (
    id integer NOT NULL,
    content_id integer,
    content_type integer,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.sections OWNER TO postgres;

--
-- Name: sections_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sections_id_seq OWNER TO postgres;

--
-- Name: sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sections_id_seq OWNED BY sections.id;


--
-- Name: tag_translations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tag_translations (
    id integer NOT NULL,
    tag_id integer,
    locale character varying(255),
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.tag_translations OWNER TO postgres;

--
-- Name: tag_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tag_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_translations_id_seq OWNER TO postgres;

--
-- Name: tag_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tag_translations_id_seq OWNED BY tag_translations.id;


--
-- Name: taggings; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE taggings (
    id integer NOT NULL,
    tag_id integer,
    taggable_type character varying(255),
    taggable_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.taggings OWNER TO postgres;

--
-- Name: taggings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE taggings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggings_id_seq OWNER TO postgres;

--
-- Name: taggings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE taggings_id_seq OWNED BY taggings.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tags (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    slug_en character varying(255),
    slug_es character varying(255),
    slug_ca character varying(255),
    taggings_count integer DEFAULT 0
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    admin boolean DEFAULT false,
    password_digest character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: work_translations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE work_translations (
    id integer NOT NULL,
    work_id integer,
    locale character varying(255),
    title character varying(255),
    description text,
    techniques character varying(255),
    place character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.work_translations OWNER TO postgres;

--
-- Name: work_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE work_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.work_translations_id_seq OWNER TO postgres;

--
-- Name: work_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE work_translations_id_seq OWNED BY work_translations.id;


--
-- Name: works; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE works (
    id integer NOT NULL,
    slug_en character varying(255),
    slug_es character varying(255),
    slug_ca character varying(255),
    realization_date date,
    dimensions character varying(255),
    "position" integer,
    type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    published boolean DEFAULT false,
    images_count integer DEFAULT 0
);


ALTER TABLE public.works OWNER TO postgres;

--
-- Name: works_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE works_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.works_id_seq OWNER TO postgres;

--
-- Name: works_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE works_id_seq OWNED BY works.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ckeditor_assets ALTER COLUMN id SET DEFAULT nextval('ckeditor_assets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('friendly_id_slugs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY image_translations ALTER COLUMN id SET DEFAULT nextval('image_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY images ALTER COLUMN id SET DEFAULT nextval('images_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY page_translations ALTER COLUMN id SET DEFAULT nextval('page_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pages ALTER COLUMN id SET DEFAULT nextval('pages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY section_translations ALTER COLUMN id SET DEFAULT nextval('section_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sections ALTER COLUMN id SET DEFAULT nextval('sections_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tag_translations ALTER COLUMN id SET DEFAULT nextval('tag_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY taggings ALTER COLUMN id SET DEFAULT nextval('taggings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY work_translations ALTER COLUMN id SET DEFAULT nextval('work_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY works ALTER COLUMN id SET DEFAULT nextval('works_id_seq'::regclass);


--
-- Data for Name: ckeditor_assets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ckeditor_assets (id, data_file_name, data_content_type, data_file_size, assetable_id, assetable_type, type, width, height, created_at, updated_at) FROM stdin;
\.


--
-- Name: ckeditor_assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ckeditor_assets_id_seq', 1, false);


--
-- Data for Name: friendly_id_slugs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY friendly_id_slugs (id, slug, sluggable_id, sluggable_type, created_at) FROM stdin;
277	group-process	32	Tag	2021-09-26 16:49:29.329393
16	corpologia	5	Tag	2013-01-04 20:22:42.080227
18	zenits-1	6	Work	2013-01-04 20:32:20.781848
21	live-drawing	7	Tag	2013-01-04 20:49:45.169516
22	possibles-impossibles	7	Work	2013-01-04 20:49:50.058707
24	dues-veus-nues	8	Work	2013-01-04 20:55:14.033332
25	instal-laci	9	Tag	2013-01-04 21:08:26.942934
30	instal-lation	9	Tag	2013-01-04 21:11:42.491167
37	e-qui-libri-s-ii	9	Work	2013-01-04 22:53:54.309538
38	anima-l-u	10	Work	2013-01-05 00:35:49.845803
39	dinergia-i-ii-iii	11	Work	2013-01-05 00:51:53.5636
42	musical-ment	12	Work	2013-01-05 01:21:09.076696
44	constelaccions	13	Work	2013-01-05 01:30:15.499152
46	aflora	14	Work	2013-01-05 01:36:10.283705
47	improvisar	15	Work	2013-01-05 01:58:06.695745
280	proces-col-lectiu	32	Tag	2021-09-26 16:54:23.549571
281	group-process--4	32	Tag	2021-09-26 16:54:23.563309
282	proceso-colectivo	32	Tag	2021-09-26 16:54:23.576575
54	paintings	6	Tag	2013-01-05 01:59:24.504772
55	pintura	6	Tag	2013-01-05 01:59:24.523608
57	obra-sobre-paper	8	Tag	2013-01-05 01:59:30.848381
61	poetry	10	Tag	2013-01-05 01:59:34.008002
69	prints	14	Tag	2013-01-05 01:59:49.094415
70	obra-grafica-original	14	Tag	2013-01-05 01:59:49.122038
71	impro	15	Work	2013-01-20 00:30:45.097375
72	ouroboros-veus	16	Work	2013-01-20 00:53:58.84628
73	uters	17	Work	2013-01-20 01:01:02.256225
74	itaca-pas-a-dos	18	Work	2013-01-20 02:15:46.419908
77	taboo-ser-res-cos-soc	19	Work	2013-01-20 02:38:43.5135
85	6-senses--7	23	Work	2013-03-22 00:11:07.047606
86	6-senses-consentidosinsentido	23	Work	2013-03-27 21:32:24.085653
87	s-t-sin-titulo	24	Work	2013-03-27 21:35:26.196542
89	el-celler-i--2	26	Work	2013-03-28 00:59:08.763383
101	work-on-paper	8	Tag	2013-03-30 20:34:49.755064
102	obra-sobre-papel	8	Tag	2013-03-30 20:34:49.783355
104	si-lent-si-silenci	27	Work	2013-04-05 15:05:10.580186
108	grafies-d-una-mirada-a-sarria	29	Work	2013-04-05 18:53:18.984708
109	s-t-sense-titol	24	Work	2013-04-05 19:00:00.78391
111	axis-salus-homenaje-al-buen-medico-premio-separ	30	Work	2013-08-20 12:53:55.078103
112	axis-salus-hommage-to-the-good-doctor	30	Work	2013-08-20 12:58:58.405243
113	a-z-5-5-f-acts	31	Work	2013-09-05 14:59:31.694005
114	fent-volar-coloms	33	Work	2013-12-06 12:49:29.150227
115	sum-us	34	Work	2013-12-06 13:04:41.830294
116	quina-es-la-pregunta	35	Work	2013-12-06 13:07:21.05641
117	despunxar	36	Work	2013-12-06 13:20:59.631277
118	n-ombrares	37	Work	2014-05-17 12:35:52.164693
119	ad-hoc-al-lloc	38	Work	2014-05-17 12:58:04.90134
120	polissons	39	Work	2014-05-17 12:59:00.773155
121	birds-ocells-al-cap	40	Work	2014-05-17 13:01:15.511937
122	present-o-saltal-ara	41	Work	2014-05-17 13:20:04.167981
123	els-polissons	39	Work	2014-07-17 22:28:58.050178
124	axis-salus-homenatge-al-bon-metge	30	Work	2014-10-09 17:19:07.935541
125	ad-hoc	38	Work	2015-01-04 21:41:51.492076
126	d-accions-i-diccions	42	Work	2015-01-04 22:05:21.220762
128	esclau	43	Work	2015-01-04 23:00:44.753569
132	estona	44	Work	2015-01-05 00:13:38.843641
133	free-will-x-veure	46	Work	2015-07-03 00:07:38.042621
151	elgrandtour	47	Work	2015-09-27 22:40:27.716354
152	pes-pressio	48	Work	2016-08-01 15:36:44.514509
153	sonet-i-tes-yeux-aux-bleux-aigus-d-acier-et-de-cristal	49	Work	2016-08-01 15:46:04.570841
155	aux-bleux-aigus-d-acier-et-de-cristal--2	49	Work	2016-08-01 15:48:05.409903
156	pomps-of-the-subsoil	51	Work	2016-08-01 16:18:35.364208
157	eventuall	52	Work	2016-08-01 16:58:26.661855
158	fluxus	53	Work	2016-08-01 17:43:57.132116
159	donar-veu-al-desig	54	Work	2016-08-01 17:50:44.231874
160	donar-veu-fer-un-pas	55	Work	2016-08-01 17:54:00.865555
161	cromosomx	56	Work	2016-10-19 22:54:30.29125
162	tot-fluxus	57	Work	2016-10-19 22:59:40.444079
163	flux-us	57	Work	2017-02-19 23:10:21.263902
165	idenditat	59	Work	2017-06-01 22:46:09.195209
168	we-were-waiting-for-you--2	61	Work	2017-06-01 23:01:04.883158
169	donar-veu-i-veure-mes	62	Work	2017-06-01 23:33:01.207476
170	flux-u	63	Work	2017-06-02 00:01:33.89065
171	fluxus--2	64	Work	2017-06-02 00:41:14.383949
172	flux	63	Work	2018-08-22 14:36:16.887405
174	desig-per-z-ones	65	Work	2018-08-22 15:06:01.778152
175	per-se	66	Work	2018-08-22 15:12:28.308362
177	ip-sum-id-est	67	Work	2018-08-22 15:22:59.142841
179	quid-de-la-questio	68	Work	2018-08-22 15:29:30.567705
182	ipse-ipsa-ipsum-em	69	Work	2019-01-18 23:45:26.10968
183	proces-in-solid	70	Work	2019-01-28 21:07:00.410046
184	entrar-sortint-sortir-entrant	71	Work	2019-03-07 22:44:50.245614
284	gravats	92	Work	2021-11-19 20:17:29.246789
186	cap-cap	72	Work	2019-04-10 23:03:30.958381
187	trans-form-morf-i-vii	73	Work	2019-04-15 11:41:07.669373
188	accio	21	Tag	2019-06-10 20:05:38.53404
285	prints	92	Work	2021-11-20 13:37:15.609501
286	obra-grafica	92	Work	2021-11-20 13:40:05.743944
191	paisatge-liquid	74	Work	2019-06-10 20:41:51.289634
192	enclaudebes	75	Work	2019-06-10 21:35:33.87648
287	constelacciones	13	Work	2022-01-05 20:10:05.556017
194	gravat9	76	Work	2019-06-10 21:53:37.34139
288	entrar-saliendo-salir-entrando	71	Work	2022-01-05 20:21:12.678863
289	paisaje-liquido	74	Work	2022-01-05 20:50:40.917296
197	donar-veu-i-fer-un-pas	55	Work	2019-06-10 21:56:47.210592
198	de-veu-en-veu	77	Work	2019-06-10 22:08:30.894399
199	gravat-9	76	Work	2020-02-14 20:56:02.883574
200	petraperta	70	Work	2020-02-14 21:04:33.105898
201	thyllandsias	78	Work	2020-02-14 21:53:45.811803
202	s-o-gota-a-gota	81	Work	2020-02-19 17:54:40.933021
203	gota-gota	81	Work	2020-02-19 18:01:52.472334
291	obra-original-sobre-paper	35	Tag	2022-01-05 21:21:36.340074
206	accio-artistica-i-social	23	Tag	2020-06-15 15:31:19.5223
292	original-work-on-paper	35	Tag	2022-01-05 21:21:36.355226
293	obra-original-sobre-papel	35	Tag	2022-01-05 21:21:36.36721
294	enclavedebes-os	75	Work	2022-01-10 11:45:29.824039
214	phoscenes	82	Work	2020-09-21 08:55:36.149383
218	des-cuidar	83	Work	2021-01-04 20:46:08.884519
219	entrelinies-8ple8buit	84	Work	2021-01-04 20:54:14.354195
220	entre-linies-8ple8buit-veure	84	Work	2021-01-04 20:55:21.787664
221	i-o-torno-i-no-torno	85	Work	2021-04-08 21:04:23.004487
223	si-i-o-no-torno-i-no-torno	85	Work	2021-04-08 21:31:03.896342
227	wild-swans	87	Work	2021-08-31 23:10:08.83917
228	over-and-over-again-and-again	87	Work	2021-09-13 17:22:20.925913
229	art-efimer	31	Tag	2021-09-20 19:33:22.477462
230	ull-agulles	88	Work	2021-09-20 19:33:22.594526
231	accio-artistica-social	23	Tag	2021-09-20 19:36:53.841147
232	social-art-performance	23	Tag	2021-09-20 19:36:53.855784
233	accion-artistica-social	23	Tag	2021-09-20 19:36:53.869026
234	accio-col-lectiva	19	Tag	2021-09-20 19:36:55.658244
235	collective-performance	19	Tag	2021-09-20 19:36:55.671384
236	accion-colectiva	19	Tag	2021-09-20 19:36:55.686552
237	accio-poetica	18	Tag	2021-09-20 19:36:57.265862
238	poetry--2	18	Tag	2021-09-20 19:36:57.278927
239	accion-poetica	18	Tag	2021-09-20 19:36:57.29333
240	accio-sonora	17	Tag	2021-09-20 19:36:59.17633
241	sound-action	17	Tag	2021-09-20 19:36:59.193611
242	accion-sonora	17	Tag	2021-09-20 19:36:59.209679
243	ephemeral-art	31	Tag	2021-09-20 19:37:01.111925
244	arte-efimero	31	Tag	2021-09-20 19:37:01.125897
245	art-participatiu	28	Tag	2021-09-20 19:37:03.213451
246	participatory-art	28	Tag	2021-09-20 19:37:03.230092
247	arte-participativo	28	Tag	2021-09-20 19:37:03.245504
248	dansa	1	Tag	2021-09-20 19:37:06.319359
249	dance	1	Tag	2021-09-20 19:37:06.334841
250	danza	1	Tag	2021-09-20 19:37:06.349234
251	dibuix	13	Tag	2021-09-20 19:37:07.723576
252	drawing	13	Tag	2021-09-20 19:37:07.748149
253	dibujo	13	Tag	2021-09-20 19:37:07.761374
254	sculpture	11	Tag	2021-09-20 19:37:08.964353
255	escultura	11	Tag	2021-09-20 19:37:08.976701
256	il-lustracio	15	Tag	2021-09-20 19:37:11.211667
257	illustration	15	Tag	2021-09-20 19:37:11.22489
258	ilustracion	15	Tag	2021-09-20 19:37:11.237544
259	instal-lacio	9	Tag	2021-09-20 19:37:13.025223
260	instalation	9	Tag	2021-09-20 19:37:13.037116
261	instalacion	9	Tag	2021-09-20 19:37:13.048885
262	land-art-o-art-natura	26	Tag	2021-09-20 19:37:15.640688
263	land-art	26	Tag	2021-09-20 19:37:15.652926
264	llibre	16	Tag	2021-09-20 19:37:20.001252
265	book	16	Tag	2021-09-20 19:37:20.013448
266	libro	16	Tag	2021-09-20 19:37:20.026703
267	performance	21	Tag	2021-09-20 19:37:23.48247
268	performance--2	21	Tag	2021-09-20 19:37:23.493662
269	accion	21	Tag	2021-09-20 19:37:23.505331
270	poetry--3	10	Tag	2021-09-20 19:37:25.218974
271	poesia	10	Tag	2021-09-20 19:37:25.232987
272	visual-poetry	27	Tag	2021-09-20 19:37:26.765614
273	poesia-visual	27	Tag	2021-09-20 19:37:26.780888
274	video-accio	30	Tag	2021-09-20 19:37:28.393461
275	video-performance	30	Tag	2021-09-20 19:37:28.405798
276	video-accion	30	Tag	2021-09-20 19:37:28.418593
\.


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('friendly_id_slugs_id_seq', 294, true);


--
-- Data for Name: image_translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY image_translations (id, image_id, locale, credits, created_at, updated_at) FROM stdin;
3	55	ca		2013-03-22 00:11:06.540112	2013-03-22 00:11:06.540112
4	56	ca		2013-03-27 21:32:21.839954	2013-03-27 21:32:21.839954
5	57	ca		2013-03-27 21:32:22.733564	2013-03-27 21:32:22.733564
6	58	ca		2013-03-27 21:32:23.189162	2013-03-27 21:32:23.189162
7	59	ca		2013-03-27 21:32:23.645671	2013-03-27 21:32:23.645671
8	60	es		2013-03-27 23:34:07.511615	2013-03-27 23:34:07.511615
9	61	es		2013-03-27 23:34:08.440857	2013-03-27 23:34:08.440857
10	62	es		2013-03-27 23:34:08.852655	2013-03-27 23:34:08.852655
11	63	es		2013-03-27 23:34:09.267109	2013-03-27 23:34:09.267109
12	64	es		2013-03-27 23:34:09.756988	2013-03-27 23:34:09.756988
13	65	es		2013-03-27 23:34:10.144464	2013-03-27 23:34:10.144464
14	66	es		2013-03-27 23:34:10.603487	2013-03-27 23:34:10.603487
16	68	es		2013-03-27 23:34:11.506522	2013-03-27 23:34:11.506522
17	69	es		2013-03-27 23:34:12.078094	2013-03-27 23:34:12.078094
18	70	es		2013-03-27 23:34:12.53479	2013-03-27 23:34:12.53479
19	13	es		2013-03-27 23:42:26.387736	2013-03-27 23:42:26.392488
20	71	es		2013-03-27 23:42:26.406401	2013-03-27 23:42:26.406401
21	72	es		2013-03-27 23:42:26.861009	2013-03-27 23:42:26.861009
22	73	es		2013-03-27 23:42:27.262821	2013-03-27 23:42:27.262821
24	13	ca		2013-03-27 23:48:29.765442	2013-03-27 23:48:29.783226
25	75	ca		2013-03-27 23:48:29.799667	2013-03-27 23:48:29.799667
26	76	ca		2013-03-27 23:48:30.298911	2013-03-27 23:48:30.298911
27	77	ca		2013-03-27 23:48:30.710828	2013-03-27 23:48:30.710828
28	78	ca		2013-03-27 23:48:31.103852	2013-03-27 23:48:31.103852
29	79	ca		2013-03-27 23:48:31.488909	2013-03-27 23:48:31.488909
30	80	ca		2013-03-27 23:48:31.892413	2013-03-27 23:48:31.892413
31	40	ca	<p>\r\n\tL&#39;a muse</p>\r\n	2013-03-28 00:07:10.394093	2013-03-28 00:07:10.397956
32	41	ca	<p>\r\n\tImpostura</p>\r\n	2013-03-28 00:07:10.405479	2013-03-28 00:07:10.409061
33	42	ca	<p>\r\n\t&uacute;ter</p>\r\n	2013-03-28 00:07:10.416625	2013-03-28 00:07:10.420059
38	85	ca		2013-03-28 00:59:06.363294	2013-03-28 00:59:06.363294
39	86	ca		2013-03-28 00:59:06.830378	2013-03-28 00:59:06.830378
42	89	ca		2013-03-28 00:59:07.965667	2013-03-28 00:59:07.965667
44	91	ca		2013-03-28 01:29:42.962659	2013-03-28 01:29:42.962659
53	3	ca	<p>\r\n\tYa no hay horizonte.<br />\r\n\tAlguien camina<br />\r\n\tsin dejar huella ni sombra.</p>\r\n	2013-03-28 01:44:05.440918	2013-03-28 01:44:05.444243
45	92	ca	<p>\r\n\tEl viento despeina<br />\r\n\tlas hierbas. Piedras<br />\r\n\ten el camino del agua.</p>\r\n	2013-03-28 01:34:59.565378	2013-03-28 01:44:05.452648
46	93	ca	<p>\r\n\tLa hoja, a punto<br />\r\n\tde caer, tiembla.<br />\r\n\tSopla el viento.</p>\r\n	2013-03-28 01:35:00.110513	2013-03-28 01:44:05.460051
47	94	ca	<p>\r\n\tCien hormigas<br />\r\n\tresiguen el crep&uacute;sculo<br />\r\n\tque nadie camina.</p>\r\n	2013-03-28 01:35:00.656409	2013-03-28 01:44:05.467717
48	95	ca	<p>\r\n\tBaile de paraguas.<br />\r\n\tRamblas abajo.<br />\r\n\tUn gato se moja.</p>\r\n	2013-03-28 01:35:01.236097	2013-03-28 01:44:05.475085
49	96	ca	<p>\r\n\tLa risa rompe<br />\r\n\tla pesadez de la tarde.<br />\r\n\tSonr&iacute;e una nube.</p>\r\n	2013-03-28 01:35:01.748521	2013-03-28 01:44:05.48332
50	97	ca	<p>\r\n\tFa sostenido.<br />\r\n\tUnos dedos acarician.<br />\r\n\tLa piel de la tecla.</p>\r\n	2013-03-28 01:35:02.35206	2013-03-28 01:44:05.492004
51	98	ca	<p>\r\n\tPalabras como humo<br />\r\n\tcorretean por la cama.<br />\r\n\tLa noche escucha y calla.</p>\r\n	2013-03-28 01:35:02.864505	2013-03-28 01:44:05.499519
52	99	ca	<p>\r\n\tCae la gota.<br />\r\n\tC&iacute;rculos conc&eacute;ntricos.<br />\r\n\tLa luna danza.</p>\r\n	2013-03-28 01:35:03.380843	2013-03-28 01:44:05.507413
56	102	ca		2013-04-05 18:53:13.967487	2013-04-05 18:53:13.967487
57	103	ca		2013-04-05 18:53:14.965796	2013-04-05 18:53:14.965796
58	104	ca		2013-04-05 18:53:15.441805	2013-04-05 18:53:15.441805
59	105	ca		2013-04-05 18:53:16.033262	2013-04-05 18:53:16.033262
60	106	ca		2013-04-05 18:53:16.547989	2013-04-05 18:53:16.547989
61	107	ca		2013-04-05 18:53:17.161278	2013-04-05 18:53:17.161278
62	108	ca		2013-04-05 18:53:17.660573	2013-04-05 18:53:17.660573
63	109	ca		2013-04-05 18:53:18.288205	2013-04-05 18:53:18.288205
64	60	ca		2013-04-05 19:00:00.59727	2013-04-05 19:00:00.603675
65	61	ca		2013-04-05 19:00:00.615755	2013-04-05 19:00:00.621572
66	62	ca		2013-04-05 19:00:00.633942	2013-04-05 19:00:00.63886
67	63	ca		2013-04-05 19:00:00.649863	2013-04-05 19:00:00.654656
68	64	ca		2013-04-05 19:00:00.665156	2013-04-05 19:00:00.670108
69	65	ca		2013-04-05 19:00:00.680682	2013-04-05 19:00:00.685759
70	66	ca		2013-04-05 19:00:00.697105	2013-04-05 19:00:00.702356
71	68	ca		2013-04-05 19:00:00.71339	2013-04-05 19:00:00.718496
72	69	ca		2013-04-05 19:00:00.729647	2013-04-05 19:00:00.734447
73	70	ca		2013-04-05 19:00:00.744889	2013-04-05 19:00:00.75005
74	12	ca		2013-04-05 19:05:21.846347	2013-04-05 19:05:21.851412
75	71	ca		2013-04-05 19:05:21.874111	2013-04-05 19:05:21.878902
76	72	ca		2013-04-05 19:05:21.908947	2013-04-05 19:05:21.913981
77	73	ca		2013-04-05 19:05:21.927624	2013-04-05 19:05:21.932644
78	7	ca		2013-04-05 19:27:48.538638	2013-04-05 19:27:48.544059
80	10	ca		2013-04-05 19:27:48.570916	2013-04-05 19:27:48.575773
83	111	ca	<p>foto: joanseculi.com</p>\r\n	2013-09-05 14:59:30.622685	2013-09-05 14:59:30.622685
98	126	ca		2013-12-06 12:49:22.472573	2013-12-06 12:49:22.472573
99	127	ca	<p>Foto: Clara Bes</p>\r\n	2013-12-06 12:49:23.338676	2013-12-06 12:49:23.338676
100	128	ca	<p>Foto: Alessia Bombaci/Antic Teatre</p>\r\n	2013-12-06 12:49:23.925633	2013-12-06 12:49:23.925633
101	129	ca	<p>Foto: Clara Bes</p>\r\n	2013-12-06 12:49:25.116646	2013-12-06 12:49:25.116646
102	130	ca	<p>Foto: Clara Bes</p>\r\n	2013-12-06 12:49:25.74365	2013-12-06 12:49:25.74365
103	131	ca	<p>Foto: Alessia Bombaci/Antic Teatre</p>\r\n	2013-12-06 12:49:26.404582	2013-12-06 12:49:26.404582
104	132	ca	<p>Foto: Alessia Bombaci/Antic Teatre</p>\r\n	2013-12-06 12:49:27.244018	2013-12-06 12:49:27.244018
105	133	ca		2013-12-06 13:07:19.849116	2013-12-06 13:07:19.849116
106	134	ca		2013-12-06 13:20:53.597357	2013-12-06 13:20:53.597357
107	135	ca		2013-12-06 13:20:54.378139	2013-12-06 13:20:54.378139
108	136	ca		2013-12-06 13:20:55.184772	2013-12-06 13:20:55.184772
109	137	ca		2013-12-06 13:20:55.937511	2013-12-06 13:20:55.937511
110	138	ca		2013-12-06 13:20:56.970833	2013-12-06 13:20:56.970833
111	139	ca	<p>Obra d&#39;Al&egrave;xia Lleonart</p>\r\n	2013-12-06 13:20:58.334266	2013-12-06 13:20:58.334266
112	140	en	<p>Foto: Denys Blacker</p>\r\n	2014-05-17 12:13:07.545548	2014-05-17 12:13:07.545548
113	141	en		2014-05-17 12:13:08.50649	2014-05-17 12:13:08.50649
114	142	en		2014-05-17 12:13:09.277266	2014-05-17 12:13:09.277266
115	143	en		2014-05-17 12:13:10.114932	2014-05-17 12:13:10.114932
116	144	en		2014-05-17 12:13:10.925149	2014-05-17 12:13:10.925149
117	145	en		2014-05-17 12:13:11.911141	2014-05-17 12:13:11.911141
118	146	en		2014-05-17 12:13:11.936151	2014-05-17 12:13:11.936151
119	134	en		2014-05-17 12:17:29.356949	2014-05-17 12:17:29.364292
120	135	en		2014-05-17 12:17:29.37948	2014-05-17 12:17:29.385582
121	136	en		2014-05-17 12:17:29.398772	2014-05-17 12:17:29.404773
122	137	en		2014-05-17 12:17:29.419569	2014-05-17 12:17:29.425961
123	138	en		2014-05-17 12:17:29.440159	2014-05-17 12:17:29.44618
124	139	en	<p>Obra d&#39;Al&egrave;xia Lleonart</p>\r\n	2014-05-17 12:17:29.460916	2014-05-17 12:17:29.467502
125	126	en		2014-05-17 12:23:53.945801	2014-05-17 12:23:53.949501
126	127	en	<p>Foto: Clara Bes</p>\r\n	2014-05-17 12:23:53.957268	2014-05-17 12:23:53.960853
127	128	en	<p>Foto: Alessia Bombaci/Antic Teatre</p>\r\n	2014-05-17 12:23:53.968594	2014-05-17 12:23:53.972016
128	129	en	<p>Foto: Clara Bes</p>\r\n	2014-05-17 12:23:53.979935	2014-05-17 12:23:53.983667
129	130	en	<p>Foto: Clara Bes</p>\r\n	2014-05-17 12:23:53.991611	2014-05-17 12:23:53.995199
130	131	en	<p>Foto: Alessia Bombaci/Antic Teatre</p>\r\n	2014-05-17 12:23:54.003199	2014-05-17 12:23:54.006784
131	132	en	<p>Foto: Alessia Bombaci/Antic Teatre</p>\r\n	2014-05-17 12:23:54.014716	2014-05-17 12:23:54.018469
132	147	ca	<p>Foto Denys Blacker</p>\r\n	2014-05-17 12:35:47.252457	2014-05-17 12:35:47.252457
133	148	ca		2014-05-17 12:35:48.051235	2014-05-17 12:35:48.051235
134	149	ca		2014-05-17 12:35:48.92786	2014-05-17 12:35:48.92786
135	150	ca		2014-05-17 12:35:49.767656	2014-05-17 12:35:49.767656
136	151	ca		2014-05-17 12:35:50.624654	2014-05-17 12:35:50.624654
137	152	ca		2014-05-17 12:35:51.294653	2014-05-17 12:35:51.294653
141	156	ca		2014-07-17 22:28:50.922947	2014-07-17 22:28:50.922947
142	157	ca		2014-07-17 22:28:51.985195	2014-07-17 22:28:51.985195
143	158	ca		2014-07-17 22:28:53.203591	2014-07-17 22:28:53.203591
144	159	ca		2014-07-17 22:28:54.328467	2014-07-17 22:28:54.328467
145	160	ca		2014-07-17 22:28:55.482629	2014-07-17 22:28:55.482629
146	161	ca		2014-07-17 22:28:56.862482	2014-07-17 22:28:56.862482
147	162	ca		2014-07-17 22:55:51.038902	2014-07-17 22:55:51.038902
148	163	ca		2014-07-17 22:55:51.989218	2014-07-17 22:55:51.989218
149	164	ca		2014-07-17 22:55:52.968738	2014-07-17 22:55:52.968738
150	165	ca		2014-07-17 22:55:53.949513	2014-07-17 22:55:53.949513
152	167	ca		2014-10-09 17:19:05.707861	2014-10-09 17:19:05.707861
153	168	ca		2014-10-09 17:19:06.915328	2014-10-09 17:19:06.915328
154	169	ca	<p>fotos: Denys Blacker</p>\r\n	2014-11-03 23:21:44.13056	2014-11-03 23:26:01.578464
155	170	ca		2014-11-03 23:26:02.796285	2014-11-03 23:26:02.796285
156	171	ca		2014-11-03 23:26:03.627676	2014-11-03 23:26:03.627676
157	172	ca		2014-11-03 23:26:04.409901	2014-11-03 23:26:04.409901
158	173	ca		2014-11-03 23:26:05.258961	2014-11-03 23:26:05.258961
159	174	ca		2014-11-03 23:26:06.012967	2014-11-03 23:26:06.012967
160	175	ca		2014-11-03 23:26:06.685567	2014-11-03 23:26:06.685567
161	176	ca		2014-11-03 23:26:07.308865	2014-11-03 23:26:07.308865
162	177	ca		2014-11-03 23:26:07.939509	2014-11-03 23:26:07.939509
163	178	ca	<p>Fotos: Ester Xargay</p>\r\n	2015-01-04 22:05:04.77481	2015-01-04 22:05:04.77481
164	179	ca		2015-01-04 22:05:10.608461	2015-01-04 22:05:10.608461
165	180	ca		2015-01-04 22:05:11.551306	2015-01-04 22:05:11.551306
166	181	ca		2015-01-04 22:05:12.497044	2015-01-04 22:05:12.497044
167	182	ca		2015-01-04 22:05:18.46191	2015-01-04 22:05:18.46191
169	184	ca		2015-01-04 22:05:20.255541	2015-01-04 22:05:20.255541
168	183	ca	<p>Foto: Ester Xargay</p>\r\n\r\n<p>Daniel Ruiz Trillo llegint els seus poemes</p>\r\n	2015-01-04 22:05:19.532489	2015-01-04 22:13:33.93083
170	185	ca	<p>Foto: Denys Blacker</p>\r\n	2015-01-04 23:00:32.88948	2015-01-04 23:00:32.88948
171	186	ca	<p>Foto: Denys Blacker</p>\r\n	2015-01-04 23:00:33.727122	2015-01-04 23:00:33.727122
172	187	ca	<p>Foto: Denys Blacker</p>\r\n	2015-01-04 23:00:34.431416	2015-01-04 23:00:34.431416
173	188	ca	<p>Foto: Denys Blacker</p>\r\n	2015-01-04 23:00:35.09108	2015-01-04 23:00:35.09108
174	189	ca	<p>Foto: Denys Blacker</p>\r\n	2015-01-04 23:00:35.774428	2015-01-04 23:00:35.774428
175	190	ca	<p>Foto: Denys Blacker</p>\r\n	2015-01-04 23:00:41.444479	2015-01-04 23:00:41.444479
176	191	ca		2015-01-04 23:00:42.024554	2015-01-04 23:00:42.024554
177	192	ca	<p>Foto: Denys Blacker</p>\r\n	2015-01-04 23:00:42.660426	2015-01-04 23:00:42.660426
178	193	ca	<p>Foto: Denys Blacker</p>\r\n	2015-01-04 23:00:43.305073	2015-01-04 23:00:43.305073
179	194	ca	<p>Foto: Denys Blacker</p>\r\n	2015-01-04 23:00:44.054188	2015-01-04 23:00:44.054188
180	195	ca		2015-01-04 23:21:24.472063	2015-01-04 23:21:24.472063
181	196	ca	<p>Disseny: Gresolart</p>\r\n	2015-01-04 23:23:54.79231	2015-01-04 23:23:54.79231
182	197	ca		2015-01-05 00:13:34.149345	2015-01-05 00:13:34.149345
183	198	ca		2015-01-05 00:13:35.084723	2015-01-05 00:13:35.084723
184	199	ca		2015-01-05 00:13:36.051611	2015-01-05 00:13:36.051611
185	200	ca		2015-01-05 00:13:36.910533	2015-01-05 00:13:36.910533
186	201	ca		2015-01-05 00:13:38.005427	2015-01-05 00:13:38.005427
189	204	ca	<p>Foto: Denys Blacker</p>\r\n	2015-07-03 00:07:34.09844	2015-07-03 00:07:34.09844
190	205	ca	<p>Foto: Denys Blacker</p>\r\n	2015-07-03 00:07:34.96651	2015-07-03 00:07:34.96651
191	206	ca	<p>Foto: Denys Blacker</p>\r\n	2015-07-03 00:07:35.577034	2015-07-03 00:07:35.577034
192	207	ca		2015-07-03 00:07:36.111749	2015-07-03 00:07:36.111749
193	208	ca	<p>Foto: Denys Blacker</p>\r\n	2015-07-03 00:07:36.740027	2015-07-03 00:07:36.740027
195	210	ca		2015-07-03 00:10:52.880635	2015-07-03 00:10:52.880635
196	211	ca		2015-09-25 01:15:08.359711	2015-09-25 01:15:08.359711
197	212	ca	<p>Photo: Uma Bunnag</p>\r\n	2015-09-27 22:40:21.952505	2015-09-27 22:40:21.952505
198	213	ca	<p>Photo: Uma Bunnag</p>\r\n	2015-09-27 22:40:22.51113	2015-09-27 22:40:22.51113
199	214	ca	<p>Photo: Uma Bunnag</p>\r\n	2015-09-27 22:40:23.067588	2015-09-27 22:40:23.067588
200	215	ca	<p>Photo: Uma Bunnag</p>\r\n	2015-09-27 22:40:23.600871	2015-09-27 22:40:23.600871
201	216	ca	<p>Photo: Uma Bunnag</p>\r\n	2015-09-27 22:40:24.16094	2015-09-27 22:40:24.16094
202	217	ca	<p>Photo: Uma Bunnag</p>\r\n	2015-09-27 22:40:24.778186	2015-09-27 22:40:24.778186
203	218	ca	<p>Photo: Uma Bunnag</p>\r\n	2015-09-27 22:40:25.313501	2015-09-27 22:40:25.313501
204	219	ca	<p>Photo: Uma Bunnag</p>\r\n	2015-09-27 22:40:25.959638	2015-09-27 22:40:25.959638
205	220	ca	<p>Photo: Uma Bunnag</p>\r\n	2015-09-27 22:40:26.52988	2015-09-27 22:40:26.52988
206	221	ca	<p>Photo: Uma Bunnag</p>\r\n	2015-09-27 22:40:27.14124	2015-09-27 22:40:27.14124
207	222	ca		2015-09-27 23:03:08.950145	2015-09-27 23:03:08.950145
208	223	ca		2015-09-27 23:03:09.721873	2015-09-27 23:03:09.721873
209	224	ca		2015-09-27 23:03:10.288396	2015-09-27 23:03:10.288396
210	225	ca		2015-09-27 23:03:10.9719	2015-09-27 23:03:10.9719
211	226	ca		2015-09-27 23:03:11.704206	2015-09-27 23:03:11.704206
212	227	ca		2015-09-27 23:03:12.58407	2015-09-27 23:03:12.58407
213	228	ca		2015-09-27 23:03:13.351594	2015-09-27 23:03:13.351594
214	28	ca		2015-09-27 23:08:19.097038	2015-09-27 23:08:19.10365
215	229	ca		2015-09-27 23:08:19.121659	2015-09-27 23:08:19.121659
216	230	ca		2015-09-27 23:08:19.737243	2015-09-27 23:08:19.737243
217	231	ca		2015-09-27 23:08:20.457516	2015-09-27 23:08:20.457516
218	232	ca		2015-09-27 23:08:21.145515	2015-09-27 23:08:21.145515
219	233	ca	<p>Foto: Denys Blacker</p>\r\n	2016-08-01 15:36:37.820027	2016-08-01 15:36:37.820027
220	234	ca	<p>Foto: Denys Blacker</p>\r\n	2016-08-01 15:36:38.500456	2016-08-01 15:36:38.500456
221	235	ca		2016-08-01 15:36:39.119765	2016-08-01 15:36:39.119765
222	236	ca	<p>Foto: Denys Blacker</p>\r\n	2016-08-01 15:36:39.728025	2016-08-01 15:36:39.728025
223	237	ca	<p>Foto: Denys Blacker</p>\r\n	2016-08-01 15:36:40.46312	2016-08-01 15:36:40.46312
224	238	ca	<p>Foto: Denys Blacker</p>\r\n	2016-08-01 15:36:41.16031	2016-08-01 15:36:41.16031
225	239	ca	<p>Foto: Denys Blacker</p>\r\n	2016-08-01 15:36:41.764567	2016-08-01 15:36:41.764567
226	240	ca	<p>Foto: Denys Blacker</p>\r\n	2016-08-01 15:36:42.530957	2016-08-01 15:36:42.530957
227	241	ca	<p>Foto: Denys Blacker</p>\r\n	2016-08-01 15:36:43.078989	2016-08-01 15:36:43.078989
228	242	ca		2016-08-01 15:36:43.619063	2016-08-01 15:36:43.619063
229	243	ca	<p>Foto: Mar Seriny&agrave;</p>\r\n	2016-08-01 15:46:03.265936	2016-08-01 15:46:03.265936
230	244	ca	<p>Foto: Mar Seriny&agrave;</p>\r\n	2016-08-01 15:46:03.951746	2016-08-01 15:46:03.951746
241	255	ca	<p>Foto Denys Blacker</p>\r\n	2016-08-01 16:58:23.612242	2016-08-01 16:58:23.612242
242	256	ca	<p>Foto Denys Blacker</p>\r\n	2016-08-01 16:58:24.300187	2016-08-01 16:58:24.300187
243	257	ca	<p>Foto Ferran Blancafort</p>\r\n	2016-08-01 16:58:24.847781	2016-08-01 16:58:24.847781
244	258	ca	<p>Foto Denys Blacker</p>\r\n	2016-08-01 16:58:25.438521	2016-08-01 16:58:25.438521
245	259	ca	<p>Foto Denys Blacker</p>\r\n	2016-08-01 16:58:26.040634	2016-08-01 16:58:26.040634
246	260	ca	<p>Foto Joan Casellas</p>\r\n	2016-08-01 17:43:51.79637	2016-08-01 17:43:51.79637
247	261	ca	<p>Foto: Sachiyo Kaneko</p>\r\n	2016-08-01 17:43:52.572589	2016-08-01 17:43:52.572589
248	262	ca	<p>Foto Joan Casellas</p>\r\n	2016-08-01 17:43:53.105058	2016-08-01 17:43:53.105058
249	263	ca	<p>Foto Joan Casellas</p>\r\n	2016-08-01 17:43:53.876661	2016-08-01 17:43:53.876661
250	264	ca	<p>Foto: Sachiyo Kaneko</p>\r\n	2016-08-01 17:43:54.799879	2016-08-01 17:43:54.799879
251	265	ca	<p>Foto: Sachiyo Kaneko</p>\r\n	2016-08-01 17:43:55.422266	2016-08-01 17:43:55.422266
252	266	ca	<p>Foto: Sachiyo Kaneko</p>\r\n	2016-08-01 17:43:55.971456	2016-08-01 17:43:55.971456
253	267	ca		2016-08-01 17:43:56.517073	2016-08-01 17:43:56.517073
231	245	ca	<p>Foto: Cl&agrave;udia Serrahima</p>\r\n	2016-08-01 16:18:28.234163	2016-08-05 11:37:54.952968
232	246	ca	<p>Foto: Cl&agrave;udia Serrahima</p>\r\n	2016-08-01 16:18:29.25837	2016-08-05 11:37:54.965763
233	247	ca	<p>Foto: Cl&agrave;udia Serrahima</p>\r\n	2016-08-01 16:18:29.986679	2016-08-05 11:37:54.974984
234	248	ca	<p>Foto: Cl&agrave;udia Serrahima</p>\r\n	2016-08-01 16:18:30.591014	2016-08-05 11:37:54.984078
365	376	ca		2019-06-10 21:35:30.442716	2019-06-10 21:35:30.442716
366	377	ca		2019-06-10 21:35:31.163044	2019-06-10 21:35:31.163044
367	378	ca		2019-06-10 21:35:31.885154	2019-06-10 21:35:31.885154
368	379	ca		2019-06-10 21:35:32.532903	2019-06-10 21:35:32.532903
369	380	ca		2019-06-10 21:35:33.136901	2019-06-10 21:35:33.136901
370	381	ca		2019-06-10 21:53:33.131838	2019-06-10 21:53:33.131838
371	382	ca		2019-06-10 21:53:33.600858	2019-06-10 21:53:33.600858
372	383	ca		2019-06-10 21:53:34.247034	2019-06-10 21:53:34.247034
373	384	ca		2019-06-10 21:53:34.73458	2019-06-10 21:53:34.73458
375	386	ca		2019-06-10 21:53:35.79109	2019-06-10 21:53:35.79109
376	387	ca		2019-06-10 21:53:36.324155	2019-06-10 21:53:36.324155
377	388	ca		2019-06-10 21:53:36.82542	2019-06-10 21:53:36.82542
378	389	ca		2019-06-10 22:14:22.915555	2019-06-10 22:14:22.915555
379	390	ca		2019-06-10 22:14:23.399172	2019-06-10 22:14:23.399172
380	391	ca		2019-06-10 22:14:23.880505	2019-06-10 22:14:23.880505
235	249	ca	<p>Foto: Cl&agrave;udia Serrahima</p>\r\n	2016-08-01 16:18:31.278186	2016-08-05 11:37:54.993016
236	250	ca	<p>Foto: Cl&agrave;udia Serrahima</p>\r\n	2016-08-01 16:18:31.872979	2016-08-05 11:37:55.007692
237	251	ca	<p>Foto: Cl&agrave;udia Serrahima</p>\r\n	2016-08-01 16:18:32.506156	2016-08-05 11:37:55.017241
238	252	ca	<p>Foto: Cl&agrave;udia Serrahima</p>\r\n	2016-08-01 16:18:33.397761	2016-08-05 11:37:55.026378
239	253	ca	<p>Foto: Cl&agrave;udia Serrahima</p>\r\n	2016-08-01 16:18:33.955117	2016-08-05 11:37:55.035282
240	254	ca	<p>Foto: Cl&agrave;udia Serrahima</p>\r\n	2016-08-01 16:18:34.712323	2016-08-05 11:37:55.044761
254	268	ca	<p>Foto: Mireia Prat</p>\r\n	2016-08-05 11:55:25.390893	2016-08-05 11:55:25.390893
255	269	ca	<p>Foto: Mireia Prat</p>\r\n	2016-08-05 11:55:25.980632	2016-08-05 11:55:25.980632
256	270	ca		2016-08-05 11:55:26.733293	2016-08-05 11:55:26.733293
257	271	ca		2016-08-05 11:55:27.479787	2016-08-05 11:55:27.479787
258	272	ca		2016-08-05 11:55:28.187479	2016-08-05 11:55:28.187479
259	273	ca		2016-08-05 11:55:28.915152	2016-08-05 11:55:28.915152
260	274	ca	<p>Foto: Denys Blacker</p>\r\n	2016-10-19 22:54:27.458484	2016-10-19 22:54:27.458484
261	275	ca	<p>Foto: Denys Blacker</p>\r\n	2016-10-19 22:54:28.291439	2016-10-19 22:54:28.291439
262	276	ca	<p>Foto: Denys Blacker</p>\r\n	2016-10-19 22:54:28.991294	2016-10-19 22:54:28.991294
263	277	ca	<p>Foto: Denys Blacker</p>\r\n	2016-10-19 22:54:29.556653	2016-10-19 22:54:29.556653
264	278	ca		2017-02-19 20:39:16.158617	2017-02-19 20:39:16.158617
265	279	ca		2017-02-19 20:39:17.18229	2017-02-19 20:39:17.18229
266	280	ca		2017-02-19 20:39:17.862599	2017-02-19 20:39:17.862599
267	281	ca		2017-02-19 20:39:18.699521	2017-02-19 20:39:18.699521
268	282	ca	<p>Foto: Paco Justicia</p>\r\n\r\n<p>&nbsp;</p>\r\n	2017-02-19 23:46:47.270032	2017-02-19 23:46:47.270032
269	283	ca	<p>foto: Rosa Ballarin</p>\r\n	2017-06-01 22:46:00.459755	2017-06-01 22:46:00.459755
270	284	ca	<p>foto: Rosa Ballarin</p>\r\n	2017-06-01 22:46:01.701325	2017-06-01 22:46:01.701325
271	285	ca	<p>foto: Rosa Ballarin</p>\r\n	2017-06-01 22:46:02.799746	2017-06-01 22:46:02.799746
272	286	ca	<p>foto: Rosa Ballarin</p>\r\n	2017-06-01 22:46:03.495576	2017-06-01 22:46:03.495576
273	287	ca	<p>foto: Rosa Ballarin</p>\r\n	2017-06-01 22:46:04.369825	2017-06-01 22:46:04.369825
274	288	ca	<p>foto: Rosa Ballarin</p>\r\n	2017-06-01 22:46:05.069345	2017-06-01 22:46:05.069345
275	289	ca	<p>foto: Rosa Ballarin</p>\r\n	2017-06-01 22:46:05.861139	2017-06-01 22:46:05.861139
276	290	ca	<p>foto: Rosa Ballarin</p>\r\n	2017-06-01 22:46:06.743032	2017-06-01 22:46:06.743032
277	291	ca	<p>foto: Rosa Ballarin</p>\r\n	2017-06-01 22:46:07.457008	2017-06-01 22:46:07.457008
278	292	ca	<p>foto: Rosa Ballarin</p>\r\n	2017-06-01 22:46:08.301127	2017-06-01 22:46:08.301127
279	293	ca	<p>Foto: Arto Polus</p>\r\n	2017-06-01 23:00:44.575379	2017-06-01 23:00:44.575379
280	294	ca	<p>Foto: Vanessa Massons</p>\r\n	2017-06-01 23:32:59.023229	2017-06-01 23:32:59.023229
281	295	ca		2017-06-01 23:32:59.705635	2017-06-01 23:32:59.705635
282	296	ca		2017-06-01 23:33:00.465759	2017-06-01 23:33:00.465759
283	297	ca	<p>Foto: Paco Justicia</p>\r\n	2017-06-02 00:01:30.344031	2017-06-02 00:01:30.344031
284	298	ca	<p>Foto: Josep Sou</p>\r\n	2017-06-02 00:01:31.267357	2017-06-02 00:01:31.267357
285	299	ca	<p>Foto: Paco Justicia</p>\r\n	2017-06-02 00:01:31.940296	2017-06-02 00:01:31.940296
286	300	ca	<p>Foto: Paco Justicia</p>\r\n	2017-06-02 00:01:32.579708	2017-06-02 00:01:32.579708
287	301	ca		2017-06-02 00:01:33.326173	2017-06-02 00:01:33.326173
288	302	ca		2017-06-02 00:41:09.713163	2017-06-02 00:41:09.713163
289	303	ca		2017-06-02 00:41:10.567958	2017-06-02 00:41:10.567958
290	304	ca		2017-06-02 00:41:11.321952	2017-06-02 00:41:11.321952
291	305	ca		2017-06-02 00:41:12.094887	2017-06-02 00:41:12.094887
292	306	ca		2017-06-02 00:41:12.834172	2017-06-02 00:41:12.834172
293	307	ca		2017-06-02 00:41:13.641721	2017-06-02 00:41:13.641721
294	308	ca	<p>Foto: Paco Justicia</p>\r\n	2017-06-02 00:58:05.5543	2017-06-02 00:58:05.5543
295	309	ca	<p>Foto: Paco Justicia</p>\r\n	2017-06-02 00:58:06.37942	2017-06-02 00:58:06.37942
296	310	ca	<p>Foto: Paco Justicia</p>\r\n	2017-06-02 00:58:07.237012	2017-06-02 00:58:07.237012
297	311	ca	<p>Foto: Paco Justicia</p>\r\n	2017-06-02 00:58:08.001468	2017-06-02 00:58:08.001468
298	312	ca	<p>Foto: Bel&eacute;n Herrero</p>\r\n	2017-06-02 01:10:47.013615	2017-06-02 01:10:47.013615
299	313	ca		2018-08-22 21:50:17.054423	2018-08-22 21:50:17.054423
300	314	ca	<p>Foto Sara Ruiz</p>\r\n	2018-12-21 20:09:56.211471	2018-12-21 20:09:56.211471
301	315	ca	<p>Foto: Sara Ruiz</p>\r\n	2018-12-21 20:09:56.744737	2018-12-21 20:09:56.744737
302	316	ca	<p>Foto: Sara Ruiz</p>\r\n	2018-12-21 20:09:57.984677	2018-12-21 20:09:57.984677
303	317	ca		2018-12-21 20:15:06.245606	2018-12-21 20:15:06.245606
305	319	ca		2018-12-21 20:19:42.213103	2018-12-21 20:19:42.213103
306	320	ca		2018-12-21 20:24:03.748832	2018-12-21 20:24:03.748832
307	321	ca		2018-12-21 20:56:13.148355	2018-12-21 20:56:13.148355
308	322	ca		2018-12-21 20:56:13.660639	2018-12-21 20:56:13.660639
309	323	ca		2018-12-21 20:56:14.162865	2018-12-21 20:56:14.162865
310	324	ca		2018-12-21 20:56:14.736708	2018-12-21 20:56:14.736708
311	325	ca		2018-12-21 20:56:15.468794	2018-12-21 20:56:15.468794
312	326	ca	<p>Photo Denys Blacker</p>\r\n	2018-12-21 21:13:42.529081	2019-01-15 23:24:34.254446
313	327	ca	<p>Photo Denys Blacker</p>\r\n	2018-12-21 21:13:43.256473	2019-01-15 23:24:34.263182
314	328	ca	<p>Photo Denys Blacker</p>\r\n	2018-12-21 21:13:44.00409	2019-01-15 23:24:34.271021
341	355	ca	<p>cos cosit (despr&eacute;s de despreniment)</p>\r\n	2019-04-15 11:41:05.206609	2019-04-15 11:50:28.492195
316	330	ca	<p>Photo Denys Blacker</p>\r\n	2018-12-21 21:13:45.588724	2019-01-15 23:24:34.286766
320	334	ca	<p>Foto: Carme Ors</p>\r\n	2019-01-28 19:08:01.458934	2019-01-28 19:08:01.458934
321	335	ca		2019-01-28 20:12:16.010087	2019-01-28 20:12:16.010087
322	336	ca		2019-01-28 20:12:16.591677	2019-01-28 20:12:16.591677
323	337	ca		2019-01-28 20:12:17.057617	2019-01-28 20:12:17.057617
324	338	ca		2019-01-28 20:12:17.618237	2019-01-28 20:12:17.618237
325	339	ca		2019-01-28 20:12:18.116561	2019-01-28 20:12:18.116561
326	340	ca		2019-01-28 20:12:18.599796	2019-01-28 20:12:18.599796
327	341	ca		2019-01-28 20:12:19.203677	2019-01-28 20:12:19.203677
328	342	ca	<p>Foto: Aleix Vallverd&uacute;</p>\r\n	2019-01-28 20:29:58.219751	2019-01-28 20:29:58.219751
329	343	ca	<p>Foto: Aleix Vallverd&uacute;</p>\r\n	2019-01-28 20:29:58.693834	2019-01-28 20:29:58.693834
330	344	ca	<p>Foto: Aleix Vallverd&uacute;</p>\r\n	2019-01-28 20:29:59.210019	2019-01-28 20:29:59.210019
331	345	ca		2019-01-28 20:29:59.712509	2019-01-28 20:29:59.712509
332	346	ca	<p>Photo Denys Blacker</p>\r\n	2019-03-07 22:05:14.182424	2019-03-07 22:05:14.182424
334	348	ca		2019-04-15 10:49:23.945896	2019-04-15 10:49:23.945896
335	349	ca		2019-04-15 10:49:24.57954	2019-04-15 10:49:24.57954
336	350	ca		2019-04-15 10:49:25.121083	2019-04-15 10:49:25.121083
337	351	ca		2019-04-15 10:49:25.794009	2019-04-15 10:49:25.794009
338	352	ca	<p>riualles</p>\r\n	2019-04-15 11:41:03.242984	2019-04-15 11:50:28.467171
339	353	ca	<p>vimet(era)</p>\r\n	2019-04-15 11:41:03.913227	2019-04-15 11:50:28.475765
340	354	ca	<p>common</p>\r\n	2019-04-15 11:41:04.577711	2019-04-15 11:50:28.48404
342	356	ca	<p>sec(q)ualles</p>\r\n	2019-04-15 11:41:05.707814	2019-04-15 11:50:28.499995
343	357	ca	<p>funamb&ograve;lia</p>\r\n	2019-04-15 11:41:06.393635	2019-04-15 11:50:28.507906
344	358	ca	<p>cordada</p>\r\n	2019-04-15 11:41:07.001642	2019-04-15 11:50:28.515933
333	347	ca	<p>Exposici&oacute; col&middot;lectiva d&#39;escultures en pedra a la Biblioteca de Tei&agrave;</p>\r\n	2019-03-07 22:44:49.716905	2019-04-15 12:26:32.171035
345	359	ca		2019-04-15 12:26:32.184707	2019-04-15 12:26:32.184707
346	360	ca		2019-04-15 12:26:32.729244	2019-04-15 12:26:32.729244
347	4	ca		2019-06-10 20:19:22.406901	2019-06-10 20:19:22.411138
348	5	ca		2019-06-10 20:19:22.419072	2019-06-10 20:19:22.422962
349	6	ca		2019-06-10 20:19:22.430648	2019-06-10 20:19:22.434803
350	361	ca		2019-06-10 20:41:47.12282	2019-06-10 20:41:47.12282
351	362	ca		2019-06-10 20:41:47.583684	2019-06-10 20:41:47.583684
352	363	ca		2019-06-10 20:41:48.222389	2019-06-10 20:41:48.222389
353	364	ca		2019-06-10 20:41:48.747892	2019-06-10 20:41:48.747892
354	365	ca		2019-06-10 20:41:49.284754	2019-06-10 20:41:49.284754
355	366	ca		2019-06-10 20:41:50.067191	2019-06-10 20:41:50.067191
356	367	ca	<p>obra de Lesley Yendell</p>\r\n	2019-06-10 20:41:50.655737	2019-06-10 20:41:50.655737
357	368	ca		2019-06-10 21:02:37.539829	2019-06-10 21:02:37.539829
358	369	ca		2019-06-10 21:02:38.177322	2019-06-10 21:02:38.177322
359	370	ca		2019-06-10 21:02:38.649351	2019-06-10 21:02:38.649351
360	371	ca	<p>Foto: Marta Carret&eacute;</p>\r\n	2019-06-10 21:35:27.180994	2019-06-10 21:35:27.180994
361	372	ca		2019-06-10 21:35:27.866121	2019-06-10 21:35:27.866121
362	373	ca		2019-06-10 21:35:28.542191	2019-06-10 21:35:28.542191
363	374	ca		2019-06-10 21:35:29.181255	2019-06-10 21:35:29.181255
364	375	ca	<p>Foto Marta Carret&eacute;</p>\r\n	2019-06-10 21:35:29.834767	2019-06-10 21:35:29.834767
381	392	ca		2019-06-10 22:26:49.599318	2019-06-10 22:26:49.599318
383	394	ca		2019-06-10 22:26:51.033515	2019-06-10 22:26:51.033515
384	395	ca		2019-06-10 22:26:51.820519	2019-06-10 22:26:51.820519
385	396	ca		2019-06-10 22:26:52.468495	2019-06-10 22:26:52.468495
386	397	ca		2019-06-10 22:26:59.327431	2019-06-10 22:26:59.327431
387	398	ca		2019-06-10 22:27:00.131066	2019-06-10 22:27:00.131066
388	399	ca		2019-06-10 22:27:00.879744	2019-06-10 22:27:00.879744
389	400	ca		2019-06-10 22:27:01.580744	2019-06-10 22:27:01.580744
390	401	ca		2019-06-10 22:27:02.118461	2019-06-10 22:27:02.118461
397	46	ca		2020-06-15 15:36:58.160298	2020-06-15 15:36:58.164829
398	47	ca		2020-06-15 15:36:58.172601	2020-06-15 15:36:58.176649
399	48	ca		2020-06-15 15:36:58.184168	2020-06-15 15:36:58.188926
400	49	ca		2020-06-15 15:36:58.197373	2020-06-15 15:36:58.201216
401	50	ca		2020-06-15 15:36:58.20914	2020-06-15 15:36:58.213194
402	51	ca		2020-06-15 15:36:58.220875	2020-06-15 15:36:58.225056
403	52	ca		2020-06-15 15:36:58.234374	2020-06-15 15:36:58.238575
412	416	ca		2020-10-14 22:48:42.560953	2020-10-14 22:48:42.560953
413	417	ca		2020-10-14 22:48:43.208685	2020-10-14 22:48:43.208685
414	418	ca		2020-10-14 22:48:43.807353	2020-10-14 22:48:43.807353
415	419	ca		2020-10-14 22:48:44.425075	2020-10-14 22:48:44.425075
416	420	ca		2020-10-14 22:48:45.023792	2020-10-14 22:48:45.023792
417	421	ca		2020-10-14 22:48:45.668882	2020-10-14 22:48:45.668882
418	422	ca		2020-10-14 22:48:46.137182	2020-10-14 22:48:46.137182
419	423	ca		2020-10-14 22:48:46.761108	2020-10-14 22:48:46.761108
420	424	ca		2020-10-14 23:00:12.409923	2020-10-14 23:00:12.409923
421	425	ca		2020-10-14 23:00:13.012617	2020-10-14 23:00:13.012617
422	426	ca		2020-10-14 23:00:13.692617	2020-10-14 23:00:13.692617
423	427	ca		2020-10-14 23:00:14.387215	2020-10-14 23:00:14.387215
424	428	ca		2021-01-04 20:46:03.91017	2021-01-04 20:46:03.91017
425	429	ca		2021-01-04 20:46:04.677588	2021-01-04 20:46:04.677588
426	430	ca		2021-01-04 20:46:05.237659	2021-01-04 20:46:05.237659
427	431	ca		2021-01-04 20:46:05.983006	2021-01-04 20:46:05.983006
428	432	ca		2021-01-04 20:46:06.630703	2021-01-04 20:46:06.630703
429	433	ca		2021-01-04 20:46:07.427481	2021-01-04 20:46:07.427481
430	434	ca		2021-01-04 20:46:08.228776	2021-01-04 20:46:08.228776
431	435	ca	<p>Foto: Adolf Alca&ntilde;iz</p>\r\n	2021-04-08 21:31:00.124273	2021-04-08 21:31:00.124273
432	436	ca	<p>Foto: Adolf Alca&ntilde;iz</p>\r\n	2021-04-08 21:31:00.775496	2021-04-08 21:31:00.775496
433	437	ca	<p>Foto: Goretti Estengre</p>\r\n	2021-04-08 21:31:01.486446	2021-04-08 21:31:01.486446
434	438	ca	<p>Foto: Adolf Alca&ntilde;iz</p>\r\n	2021-04-08 21:31:02.112839	2021-04-08 21:31:02.112839
435	439	ca	<p>Foto: Goretti Estengre</p>\r\n	2021-04-08 21:31:02.746529	2021-04-08 21:31:02.746529
436	440	ca		2021-04-08 21:31:03.300897	2021-04-08 21:31:03.300897
437	441	ca	<p>Foto Joana de Querol</p>\r\n	2021-08-31 23:06:53.612968	2021-08-31 23:06:53.612968
438	442	ca	<p>Foto: Joana de Querol</p>\r\n	2021-08-31 23:06:54.504348	2021-08-31 23:06:54.504348
439	443	ca		2021-08-31 23:06:55.459595	2021-08-31 23:06:55.459595
440	444	ca		2021-08-31 23:06:56.222977	2021-08-31 23:06:56.222977
441	445	es	<p>foto: Isa Fontbona</p>\r\n	2021-09-13 17:24:30.667981	2021-09-13 17:24:30.667981
442	446	es		2021-09-13 17:24:31.596343	2021-09-13 17:24:31.596343
443	447	es		2021-09-13 17:24:32.501255	2021-09-13 17:24:32.501255
444	448	es		2021-09-13 17:24:33.389151	2021-09-13 17:24:33.389151
445	449	ca		2021-09-20 20:07:20.2924	2021-09-20 20:07:20.2924
446	450	ca		2021-09-20 20:07:21.242877	2021-09-20 20:07:21.242877
447	451	ca		2021-09-20 20:07:22.113679	2021-09-20 20:07:22.113679
448	452	ca		2021-09-20 20:07:23.0003	2021-09-20 20:07:23.0003
449	453	ca		2021-09-20 20:07:23.816535	2021-09-20 20:07:23.816535
450	454	ca		2021-09-20 20:07:24.771148	2021-09-20 20:07:24.771148
451	455	ca		2021-09-20 20:07:25.721668	2021-09-20 20:07:25.721668
452	456	ca		2021-09-20 20:07:26.609899	2021-09-20 20:07:26.609899
457	449	en		2021-09-20 20:36:36.302366	2021-09-20 20:36:36.305016
458	450	en		2021-09-20 20:36:36.310557	2021-09-20 20:36:36.313082
459	451	en		2021-09-20 20:36:36.318373	2021-09-20 20:36:36.320831
460	452	en		2021-09-20 20:36:36.326187	2021-09-20 20:36:36.328582
461	453	en		2021-09-20 20:36:36.33406	2021-09-20 20:36:36.3366
462	454	en		2021-09-20 20:36:36.342143	2021-09-20 20:36:36.344787
463	455	en		2021-09-20 20:36:36.350133	2021-09-20 20:36:36.352642
464	456	en		2021-09-20 20:36:36.358641	2021-09-20 20:36:36.414064
468	445	en	<p>Foto: Isa Fontbona</p>\r\n	2021-09-26 16:57:03.727569	2021-09-26 16:57:03.730491
469	446	en	<p>Foto: Isa Fontbona</p>\r\n	2021-09-26 16:57:03.736926	2021-09-26 16:57:03.739363
470	447	en	<p>Foto: Isa Fontbona</p>\r\n	2021-09-26 16:57:03.74578	2021-09-26 16:57:03.748472
471	448	en	<p>Foto: Isa Fontbona</p>\r\n	2021-09-26 16:57:03.754825	2021-09-26 16:57:03.75745
477	465	es		2021-09-26 20:13:56.486011	2021-09-26 20:13:56.486011
478	435	es	<p>Foto: Adolf Alca&ntilde;iz</p>\r\n	2021-09-26 20:50:13.218702	2021-09-26 20:50:13.221277
479	436	es	<p>Foto: Adolf Alca&ntilde;iz</p>\r\n	2021-09-26 20:50:13.226534	2021-09-26 20:50:13.228843
480	437	es	<p>Foto: Goretti Estengre</p>\r\n	2021-09-26 20:50:13.234183	2021-09-26 20:50:13.236402
481	438	es	<p>Foto: Adolf Alca&ntilde;iz</p>\r\n	2021-09-26 20:50:13.241298	2021-09-26 20:50:13.243488
482	439	es	<p>Foto: Goretti Estengre</p>\r\n	2021-09-26 20:50:13.248492	2021-09-26 20:50:13.250808
483	440	es		2021-09-26 20:50:13.255732	2021-09-26 20:50:13.257983
484	466	ca	<p>Mireia Zantop</p>\r\n	2021-11-19 20:17:25.454033	2021-11-19 20:22:18.074148
485	467	ca	<p>Mireia Zantop</p>\r\n	2021-11-19 20:17:26.074459	2021-11-19 20:22:18.079845
486	468	ca	<p>Mireia Zantop</p>\r\n	2021-11-19 20:17:26.516549	2021-11-19 20:22:18.085277
487	469	ca	<p>Mireia Zantop</p>\r\n\r\n<p><strong>Atadalasalas</strong></p>\r\n	2021-11-19 20:17:27.050408	2021-11-19 20:22:18.090596
488	470	ca	<p>Mireia Zantop</p>\r\n	2021-11-19 20:17:27.629663	2021-11-19 20:22:18.095956
489	471	ca	<p>Mireia Zantop</p>\r\n	2021-11-19 20:17:28.163345	2021-11-19 20:22:18.101395
490	472	ca	<p>Mireia Zantop</p>\r\n	2021-11-19 20:17:28.736207	2021-11-19 20:22:18.106649
491	456	es		2021-11-19 21:41:37.061825	2021-11-19 21:41:37.064418
492	450	es		2021-11-19 21:41:37.070934	2021-11-19 21:41:37.073318
493	449	es		2021-11-19 21:41:37.078994	2021-11-19 21:41:37.08134
494	452	es		2021-11-19 21:41:37.087615	2021-11-19 21:41:37.089893
495	451	es		2021-11-19 21:41:37.095653	2021-11-19 21:41:37.098037
496	453	es		2021-11-19 21:41:37.104133	2021-11-19 21:41:37.106465
497	454	es		2021-11-19 21:41:37.112247	2021-11-19 21:41:37.114618
498	455	es		2021-11-19 21:41:37.120331	2021-11-19 21:41:37.122705
499	465	en		2021-11-19 22:01:54.676131	2021-11-19 22:01:54.678764
500	466	en	<p>O.dumonde</p>\r\n	2021-11-20 13:37:15.547602	2021-11-20 13:37:15.550153
501	467	en	<p>(des)equilibris</p>\r\n	2021-11-20 13:37:15.555451	2021-11-20 13:37:15.557849
502	468	en	<p>(s)omni</p>\r\n	2021-11-20 13:37:15.563016	2021-11-20 13:37:15.565394
503	469	en	<p>&nbsp;</p>\r\n\r\n<p><strong>Atadalasalas</strong></p>\r\n	2021-11-20 13:37:15.57063	2021-11-20 13:37:15.573115
504	470	en	<p>Acord</p>\r\n	2021-11-20 13:37:15.578398	2021-11-20 13:37:15.580837
505	471	en	<p>piet&agrave;</p>\r\n	2021-11-20 13:37:15.586266	2021-11-20 13:37:15.588625
506	472	en	<p>coeurage</p>\r\n	2021-11-20 13:37:15.593913	2021-11-20 13:37:15.596232
507	466	es	<p>O.dumonde</p>\r\n	2021-11-20 13:40:05.673763	2021-11-20 13:40:05.677113
508	467	es	<p>(des)equilibrio</p>\r\n	2021-11-20 13:40:05.684365	2021-11-20 13:40:05.687319
509	468	es	<p>sue&ntilde;o, senza tempo</p>\r\n	2021-11-20 13:40:05.69437	2021-11-20 13:40:05.697238
514	416	es		2022-01-05 20:06:46.188026	2022-01-05 20:06:46.190922
512	471	es	<p>piet&aacute;</p>\r\n	2021-11-20 13:40:05.719224	2021-11-20 13:40:05.721576
513	472	es	<p>coeurage</p>\r\n	2021-11-20 13:40:05.727438	2021-11-20 13:40:05.729795
510	469	es	<p>Atadalasalas</p>\r\n	2021-11-20 13:40:05.703171	2022-01-05 20:02:40.452642
511	470	es	<p>acuerdo</p>\r\n	2021-11-20 13:40:05.711137	2022-01-05 20:02:40.460228
515	417	es		2022-01-05 20:06:46.19643	2022-01-05 20:06:46.198951
516	422	es		2022-01-05 20:06:46.204415	2022-01-05 20:06:46.207016
517	419	es		2022-01-05 20:06:46.212479	2022-01-05 20:06:46.215405
453	445	ca	<p>Foto: Isa Fontbona</p>\r\n	2021-09-20 20:29:33.760246	2022-01-13 20:54:16.097923
454	446	ca	<p>Foto: Isa Fontbona</p>\r\n	2021-09-20 20:29:33.769738	2022-01-13 20:54:16.105076
518	418	es		2022-01-05 20:06:46.220995	2022-01-05 20:06:46.223913
519	420	es		2022-01-05 20:06:46.229424	2022-01-05 20:06:46.231897
520	423	es		2022-01-05 20:06:46.237731	2022-01-05 20:06:46.240282
521	421	es		2022-01-05 20:06:46.245909	2022-01-05 20:06:46.248338
522	27	es		2022-01-05 20:10:05.539924	2022-01-05 20:10:05.54259
523	347	es	<p>Exposici&oacute;n colectiva de escultura en piedra en la Biblioteca de Tei&agrave;</p>\r\n	2022-01-05 20:21:12.646895	2022-01-05 20:21:12.649501
524	359	es		2022-01-05 20:21:12.654907	2022-01-05 20:21:12.657387
525	360	es		2022-01-05 20:21:12.66281	2022-01-05 20:21:12.665308
526	381	es		2022-01-05 20:25:20.118371	2022-01-05 20:25:20.120746
527	384	es		2022-01-05 20:25:20.125917	2022-01-05 20:25:20.128229
528	386	es		2022-01-05 20:25:20.133599	2022-01-05 20:25:20.135961
529	383	es		2022-01-05 20:25:20.141262	2022-01-05 20:25:20.143641
530	387	es		2022-01-05 20:25:20.149012	2022-01-05 20:25:20.151508
531	388	es		2022-01-05 20:25:20.15673	2022-01-05 20:25:20.1591
532	382	es		2022-01-05 20:25:20.164499	2022-01-05 20:25:20.167113
533	361	es		2022-01-05 20:33:12.92409	2022-01-05 20:33:12.926651
534	368	es	<p>zarzAmores</p>\r\n	2022-01-05 20:33:12.932027	2022-01-05 20:33:12.934431
536	364	es		2022-01-05 20:33:12.947359	2022-01-05 20:33:12.949771
537	362	es		2022-01-05 20:33:12.954922	2022-01-05 20:33:12.957269
538	369	es	<p>Orchid&eacute;e (instalaci&oacute;n y serie Orgasmo)<br />\r\n&nbsp;</p>\r\n	2022-01-05 20:33:12.962424	2022-01-05 20:33:12.964823
539	370	es	<p>Ave del para&iacute;so (instalaci&oacute;n y serie Orgasmo)<br />\r\n&nbsp;</p>\r\n	2022-01-05 20:33:12.970106	2022-01-05 20:33:12.972389
540	365	es		2022-01-05 20:33:12.977534	2022-01-05 20:33:12.979924
541	367	es	<p>obra de Lesley Yendell</p>\r\n	2022-01-05 20:33:12.985111	2022-01-05 20:33:12.987432
542	366	es		2022-01-05 20:33:12.992635	2022-01-05 20:33:12.99497
535	363	es	<p>funambulista</p>\r\n	2022-01-05 20:33:12.939812	2022-01-05 20:50:40.827581
543	348	es		2022-01-05 21:06:26.048477	2022-01-05 21:06:26.051428
544	349	es		2022-01-05 21:06:26.058464	2022-01-05 21:06:26.061208
545	350	es		2022-01-05 21:06:26.067748	2022-01-05 21:06:26.070485
546	351	es		2022-01-05 21:06:26.07815	2022-01-05 21:06:26.081669
547	313	es		2022-01-05 21:12:29.902855	2022-01-05 21:12:29.905435
548	320	es		2022-01-05 21:12:29.910697	2022-01-05 21:12:29.912957
549	321	es		2022-01-05 21:12:29.918063	2022-01-05 21:12:29.920247
550	322	es		2022-01-05 21:12:29.925307	2022-01-05 21:12:29.927565
551	323	es		2022-01-05 21:12:29.93246	2022-01-05 21:12:29.934783
552	324	es		2022-01-05 21:12:29.939741	2022-01-05 21:12:29.942122
553	325	es		2022-01-05 21:12:29.947206	2022-01-05 21:12:29.949551
554	302	es		2022-01-05 21:18:23.140844	2022-01-05 21:18:23.143509
555	303	es		2022-01-05 21:18:23.149207	2022-01-05 21:18:23.151652
556	304	es		2022-01-05 21:18:23.157304	2022-01-05 21:18:23.159773
557	305	es		2022-01-05 21:18:23.165285	2022-01-05 21:18:23.167828
558	306	es		2022-01-05 21:18:23.173316	2022-01-05 21:18:23.175775
559	307	es		2022-01-05 21:18:23.181134	2022-01-05 21:18:23.183648
560	197	es		2022-01-05 21:31:18.902416	2022-01-05 21:31:18.904992
561	198	es		2022-01-05 21:31:18.910277	2022-01-05 21:31:18.912582
562	199	es		2022-01-05 21:31:18.917636	2022-01-05 21:31:18.91995
563	200	es		2022-01-05 21:31:18.927071	2022-01-05 21:31:18.929481
564	201	es		2022-01-05 21:31:18.935256	2022-01-05 21:31:18.938487
565	352	es	<p>riualles</p>\r\n	2022-01-05 21:43:08.610592	2022-01-05 21:43:08.613104
566	353	es	<p>vimet(era)</p>\r\n	2022-01-05 21:43:08.618158	2022-01-05 21:43:08.620502
567	354	es	<p>common</p>\r\n	2022-01-05 21:43:08.625528	2022-01-05 21:43:08.62776
568	355	es	<p>cos cosit (despr&eacute;s de despreniment)</p>\r\n	2022-01-05 21:43:08.632929	2022-01-05 21:43:08.635311
569	356	es	<p>sec(q)ualles</p>\r\n	2022-01-05 21:43:08.640372	2022-01-05 21:43:08.642695
570	357	es	<p>funamb&ograve;lia</p>\r\n	2022-01-05 21:43:08.647628	2022-01-05 21:43:08.649999
571	358	es	<p>cordada</p>\r\n	2022-01-05 21:43:08.655081	2022-01-05 21:43:08.657392
572	28	es		2022-01-05 21:50:21.083781	2022-01-05 21:50:21.086437
573	229	es		2022-01-05 21:50:21.092172	2022-01-05 21:50:21.09462
574	230	es		2022-01-05 21:50:21.099885	2022-01-05 21:50:21.102351
575	231	es		2022-01-05 21:50:21.107605	2022-01-05 21:50:21.110167
576	232	es		2022-01-05 21:50:21.115518	2022-01-05 21:50:21.118
577	373	es		2022-01-10 11:45:29.730879	2022-01-10 11:45:29.733597
578	371	es	<p>Foto: Marta Carret&eacute;</p>\r\n	2022-01-10 11:45:29.739264	2022-01-10 11:45:29.741773
579	372	es		2022-01-10 11:45:29.746952	2022-01-10 11:45:29.749334
580	374	es		2022-01-10 11:45:29.754502	2022-01-10 11:45:29.756898
581	375	es	<p>Foto Marta Carret&eacute;</p>\r\n	2022-01-10 11:45:29.762156	2022-01-10 11:45:29.76447
582	376	es		2022-01-10 11:45:29.769649	2022-01-10 11:45:29.771935
583	377	es		2022-01-10 11:45:29.777035	2022-01-10 11:45:29.779349
584	378	es		2022-01-10 11:45:29.784444	2022-01-10 11:45:29.786746
585	379	es		2022-01-10 11:45:29.791775	2022-01-10 11:45:29.794123
586	380	es		2022-01-10 11:45:29.799243	2022-01-10 11:45:29.801592
587	222	es		2022-01-10 11:49:05.974823	2022-01-10 11:49:05.977767
588	223	es		2022-01-10 11:49:05.983625	2022-01-10 11:49:05.986378
589	224	es		2022-01-10 11:49:05.992248	2022-01-10 11:49:05.994884
590	225	es		2022-01-10 11:49:06.00062	2022-01-10 11:49:06.003232
591	226	es		2022-01-10 11:49:06.009655	2022-01-10 11:49:06.012234
592	227	es		2022-01-10 11:49:06.017926	2022-01-10 11:49:06.020448
593	228	es		2022-01-10 11:49:06.026206	2022-01-10 11:49:06.028853
455	447	ca	<p>Foto: Isa Fontbona</p>\r\n	2021-09-20 20:29:33.7782	2022-01-13 20:54:16.112025
456	448	ca	<p>Foto: Isa Fontbona</p>\r\n	2021-09-20 20:29:33.786852	2022-01-13 20:54:16.11917
594	465	ca	<p>Foto: Isa Fontbona</p>\r\n	2022-01-13 20:54:16.125583	2022-01-13 20:54:16.128236
\.


--
-- Name: image_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('image_translations_id_seq', 594, true);


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY images (id, image, illustrated_id, illustrated_type, "position", created_at, updated_at, video) FROM stdin;
14	ANA_RITA_RODRIGUES_FEM_2011_PAR_8663.jpg	10	Work	1	2013-01-05 00:35:47.142951	2013-01-05 00:35:47.142951	
15	ANA_RITA_RODRIGUES_FEM_2011_PAR_8672.jpg	10	Work	2	2013-01-05 00:35:48.064251	2013-01-05 00:35:48.064251	
16	ANA_RITA_RODRIGUES_FEM_2011_PAR_8711.jpg	10	Work	3	2013-01-05 00:35:48.681777	2013-01-05 00:35:48.681777	
17	ANA_RITA_RODRIGUES_FEM_2011_PAR_8749.jpg	10	Work	4	2013-01-05 00:35:49.187735	2013-01-05 00:35:49.187735	
18	DSC03862.JPG	11	Work	1	2013-01-05 00:51:50.455758	2013-01-05 00:51:50.455758	
19	DINERGIA_I-Armonia_Diatessaron.JPG	11	Work	2	2013-01-05 00:51:51.344015	2013-01-05 00:51:51.344015	
20	DINERGIA_I-Llavors.JPG	11	Work	3	2013-01-05 00:51:51.988754	2013-01-05 00:51:51.988754	
21	DINERGIAIII-Armonia_ad_infinitum.JPG	11	Work	4	2013-01-05 00:51:52.437608	2013-01-05 00:51:52.437608	
22	DSC03863.JPG	11	Work	5	2013-01-05 00:51:52.871227	2013-01-05 00:51:52.871227	
23	DSC05616bona.JPG	12	Work	1	2013-01-05 01:21:06.684687	2013-01-05 01:21:06.684687	
24	100_0602.JPG	12	Work	2	2013-01-05 01:21:07.409764	2013-01-05 01:21:07.409764	
25	100_0591.JPG	12	Work	3	2013-01-05 01:21:07.933597	2013-01-05 01:21:07.933597	
26	DSC05840.JPG	12	Work	4	2013-01-05 01:21:08.405276	2013-01-05 01:21:08.405276	
29	IMGP1552.JPG	15	Work	1	2013-01-05 01:58:04.875843	2013-01-05 01:58:04.875843	
30	invitaci_n_performance_ateneu.jpg	15	Work	2	2013-01-05 01:58:05.546197	2013-01-05 01:58:05.546197	
31	ATENEU_ph.jpg	15	Work	3	2013-01-05 01:58:06.208474	2013-01-05 01:58:06.208474	
32	inici.JPG	16	Work	1	2013-01-20 00:53:54.415123	2013-01-20 00:53:54.415123	
33	Performance_mireia__1_.JPG	16	Work	2	2013-01-20 00:53:55.463728	2013-01-20 00:53:55.463728	
34	DSC06520.JPG	16	Work	3	2013-01-20 00:53:56.067475	2013-01-20 00:53:56.067475	
35	Performance_mireia__2_.JPG	16	Work	4	2013-01-20 00:53:56.586686	2013-01-20 00:53:56.586686	
36	5_canvi_enquadr..JPG	16	Work	5	2013-01-20 00:53:57.168344	2013-01-20 00:53:57.168344	
37	Performance_mireia__6_.JPG	16	Work	6	2013-01-20 00:53:57.624964	2013-01-20 00:53:57.624964	
38	Performance_mireia__4_.JPG	16	Work	7	2013-01-20 00:53:58.209417	2013-01-20 00:53:58.209417	
39	\N	16	Work	8	2013-01-20 00:53:58.799125	2013-01-20 01:03:16.222161	http://www.youtube.com/watch?v=AAvuvEJFgx8
43	Mireia.JPG	18	Work	1	2013-01-20 02:15:44.637816	2013-01-20 02:15:44.637816	
44	Juntas.JPG	18	Work	2	2013-01-20 02:15:45.293899	2013-01-20 02:15:45.293899	
45	Eva.JPG	18	Work	3	2013-01-20 02:15:45.925373	2013-01-20 02:15:45.925373	
55	DSCF1204.JPG	23	Work	1	2013-03-22 00:11:06.530617	2013-03-22 00:11:06.530617	
56	DSCF1197.JPG	23	Work	2	2013-03-27 21:32:21.804513	2013-03-27 21:32:21.804513	
57	DSCF1203.JPG	23	Work	3	2013-03-27 21:32:22.726841	2013-03-27 21:32:22.726841	
58	DSCF1208.JPG	23	Work	4	2013-03-27 21:32:23.182231	2013-03-27 21:32:23.182231	
59	DSCF1214.JPG	23	Work	5	2013-03-27 21:32:23.638224	2013-03-27 21:32:23.638224	
42	uters3.jpg	17	Work	3	2013-01-20 01:52:34.332986	2013-03-28 00:07:10.413976	
40	sala_ruinas2.2.JPG	17	Work	1	2013-01-20 01:01:01.484063	2013-03-28 00:07:10.391367	
41	obra_s._paper__ter.jpg	17	Work	2	2013-01-20 01:52:33.550087	2013-03-28 00:07:10.402939	
3	1_Alguien_camina...JPG	6	Work	2	2013-01-04 20:32:19.49924	2013-03-28 01:44:05.43781	
85	09-La_Bodega_Rustica.jpg	26	Work	1	2013-03-28 00:59:06.353876	2013-03-28 00:59:06.353876	
86	LA_DOCTORA_COLE__Noah_Gordon_.jpg	26	Work	2	2013-03-28 00:59:06.821734	2013-03-28 00:59:06.821734	
89	imagesNoah_presentaci_n.jpg	26	Work	3	2013-03-28 00:59:07.958679	2013-03-28 00:59:07.958679	
91	1_Alguien_camina.sense_marc.JPG	6	Work	1	2013-03-28 01:29:42.952631	2013-03-28 01:29:42.952631	
92	2_El_viento_despeina...JPG	6	Work	3	2013-03-28 01:34:59.55755	2013-03-28 01:44:05.449351	
93	6_La_hoja_tiembla...JPG	6	Work	4	2013-03-28 01:35:00.10358	2013-03-28 01:44:05.45686	
94	5_Cien_hormigas...JPG	6	Work	5	2013-03-28 01:35:00.649683	2013-03-28 01:44:05.463948	
95	9_Baile_de_paraguas...JPG	6	Work	6	2013-03-28 01:35:01.228049	2013-03-28 01:44:05.471771	
96	7_La_risa_rompe...JPG	6	Work	7	2013-03-28 01:35:01.740548	2013-03-28 01:44:05.479513	
97	4_Mi_sostenido...JPG	6	Work	8	2013-03-28 01:35:02.330805	2013-03-28 01:44:05.488069	
98	8_Palabras_como_humo...JPG	6	Work	9	2013-03-28 01:35:02.85449	2013-03-28 01:44:05.496036	
99	3_La_luna_danza...JPG	6	Work	10	2013-03-28 01:35:03.373662	2013-03-28 01:44:05.503628	
60	DSC_0250.jpeg	24	Work	1	2013-03-27 23:34:07.471372	2013-04-05 19:00:00.593354	
61	DSC_0248.jpeg	24	Work	2	2013-03-27 23:34:08.434289	2013-04-05 19:00:00.611956	
62	DSC_0261.jpeg	24	Work	3	2013-03-27 23:34:08.845453	2013-04-05 19:00:00.630106	
63	DSC_0266.jpeg	24	Work	4	2013-03-27 23:34:09.259986	2013-04-05 19:00:00.64634	
64	DSC_0278.jpeg	24	Work	5	2013-03-27 23:34:09.750427	2013-04-05 19:00:00.661749	
65	DSC_0288.jpeg	24	Work	6	2013-03-27 23:34:10.13677	2013-04-05 19:00:00.677245	
27	constelacciones_2008.JPG	13	Work	1	2013-01-05 01:30:14.338425	2022-01-05 20:10:05.538151	
28	Mireia_Zantop__sin_rgia.jpg	14	Work	1	2013-01-05 01:36:09.63012	2022-01-10 11:21:20.691281	
102	portada.sarria.jpg	29	Work	3	2013-04-05 18:53:13.922329	2013-04-05 18:56:47.177478	
103	contraportada.jpg	29	Work	4	2013-04-05 18:53:14.954064	2013-04-05 18:56:47.188265	
104	vila-cecilia-1.jpg	29	Work	5	2013-04-05 18:53:15.430279	2013-04-05 18:56:47.198105	
105	orlandai-1.jpg	29	Work	6	2013-04-05 18:53:16.02135	2013-04-05 18:56:47.208313	
106	orlandai.jpg	29	Work	7	2013-04-05 18:53:16.536748	2013-04-05 18:56:47.218302	
107	can-caralleu-3.jpg	29	Work	8	2013-04-05 18:53:17.149893	2013-04-05 18:56:47.227964	
108	torto-la-valencia.jpg	29	Work	9	2013-04-05 18:53:17.649576	2013-04-05 18:56:47.237816	
109	pino.jpg	29	Work	10	2013-04-05 18:53:18.276834	2013-04-05 18:56:47.247297	
66	DSC_0292.jpeg	24	Work	7	2013-03-27 23:34:10.59682	2013-04-05 19:00:00.693285	
68	DSC_0260.jpeg	24	Work	8	2013-03-27 23:34:11.498207	2013-04-05 19:00:00.709964	
69	DSC_0298.jpeg	24	Work	9	2013-03-27 23:34:11.894663	2013-04-05 19:00:00.726079	
70	DSC_0301.jpeg	24	Work	10	2013-03-27 23:34:12.526364	2013-04-05 19:00:00.741467	
80	DSC_0069GUT.jpeg	9	Work	1	2013-03-27 23:48:31.885727	2013-04-05 19:05:21.831631	
12	DSC_0062GUT.jpeg	9	Work	2	2013-01-04 22:53:52.694505	2013-04-05 19:05:21.842774	
13	\N	9	Work	3	2013-01-04 22:56:20.429668	2013-04-05 19:05:21.858828	https://vimeo.com/53101599
71	DSC_0037.jpeg	9	Work	4	2013-03-27 23:42:26.398666	2013-04-05 19:05:21.870588	
72	DSC_0043GUT.jpeg	9	Work	5	2013-03-27 23:42:26.852704	2013-04-05 19:05:21.905004	
73	DSC_0052GUT.jpeg	9	Work	6	2013-03-27 23:42:27.255255	2013-04-05 19:05:21.923674	
75	DSC_0058.jpeg	9	Work	7	2013-03-27 23:48:29.790516	2013-04-05 19:05:21.941096	
76	DSC_0060.jpeg	9	Work	8	2013-03-27 23:48:30.29204	2013-04-05 19:05:21.951925	
78	DSC_0065.jpeg	9	Work	11	2013-03-27 23:48:31.096866	2013-04-05 19:05:21.972404	
4	Possible_Foto.jpg	7	Work	1	2013-01-04 20:49:48.478672	2019-06-10 20:19:22.40395	
5	Survival27.jpeg	7	Work	2	2013-01-04 20:49:49.126706	2019-06-10 20:19:22.416388	
6	Survival29.jpeg	7	Work	3	2013-01-04 20:49:49.544329	2019-06-10 20:19:22.427902	
46	DSC02215.JPG	19	Work	1	2013-01-20 02:38:39.844998	2020-06-15 15:36:58.157106	
47	dsc3697.jpg	19	Work	2	2013-01-20 02:38:40.653374	2020-06-15 15:36:58.170066	
48	DSC02225.JPG	19	Work	3	2013-01-20 02:38:41.050996	2020-06-15 15:36:58.181578	
49	DSC02239.JPG	19	Work	4	2013-01-20 02:38:41.521906	2020-06-15 15:36:58.194747	
77	DSC_0063.jpeg	9	Work	9	2013-03-27 23:48:30.704229	2013-04-05 19:05:21.962202	
79	DSC_0067GUT.jpeg	9	Work	12	2013-03-27 23:48:31.482008	2013-04-05 19:05:21.982553	
142	sum_us_2.jpeg	34	Work	3	2014-05-17 12:13:09.261653	2014-05-17 12:19:36.777841	
465	DSC_0106-004.jpg	87	Work	6	2021-09-26 20:13:56.480034	2022-01-13 20:54:16.123605	
197	20140706_164949.jpg	44	Work	1	2015-01-05 00:13:34.13966	2022-01-05 21:38:07.42288	
198	20140706_164949.jpg	44	Work	2	2015-01-05 00:13:35.07326	2022-01-05 21:38:07.428365	
199	20140706_165129.jpg	44	Work	3	2015-01-05 00:13:36.036211	2022-01-05 21:38:07.433549	
200	20140706_164738.jpg	44	Work	4	2015-01-05 00:13:36.897578	2022-01-05 21:38:07.438725	
201	20140706_165245.jpg	44	Work	5	2015-01-05 00:13:37.994038	2022-01-05 21:38:07.444217	
143	sum_us_3.jpeg	34	Work	4	2014-05-17 12:13:10.103452	2014-05-17 12:19:36.787299	
144	DSC_0621.jpeg	34	Work	5	2014-05-17 12:13:10.913218	2014-05-17 12:19:36.79681	
145	\N	34	Work	6	2014-05-17 12:13:11.895863	2014-05-17 12:19:36.806395	https://vimeo.com/83686197
146	CORPOLOGIA_13.jpeg	34	Work	7	2014-05-17 12:13:11.921266	2014-05-17 12:19:36.815986	
126	fent_volar_coloms.jpg	33	Work	2	2013-12-06 12:49:22.440575	2014-05-17 12:23:53.943212	
127	Coloms_Laminas1_ClaraBes.jpg	33	Work	3	2013-12-06 12:49:23.33067	2014-05-17 12:23:53.954681	
128	Coloms_circuit1_A.Bombaci.jpg	33	Work	4	2013-12-06 12:49:23.917396	2014-05-17 12:23:53.966097	
129	Coloms_Cordes1_ClaraBes.jpg	33	Work	5	2013-12-06 12:49:25.10811	2014-05-17 12:23:53.977365	
130	Coloms_Globos_ClaraBes.jpg	33	Work	6	2013-12-06 12:49:25.735747	2014-05-17 12:23:53.989034	
131	Coloms_amaralarama1_A.Bombaci.jpg	33	Work	7	2013-12-06 12:49:26.396816	2014-05-17 12:23:54.000458	
132	Coloms_Murmuradores_A.Bombaci.jpg	33	Work	8	2013-12-06 12:49:27.235642	2014-05-17 12:23:54.012019	
147	DSC_0037.jpeg	37	Work	1	2014-05-17 12:35:47.239267	2014-05-17 12:35:47.239267	
148	DSC_0038retoc.jpeg	37	Work	2	2014-05-17 12:35:48.040542	2014-05-17 12:35:48.040542	
149	DSC_0044_copia.jpeg	37	Work	3	2014-05-17 12:35:48.913866	2014-05-17 12:35:48.913866	
150	DSC_0047_copia.jpeg	37	Work	4	2014-05-17 12:35:49.755477	2014-05-17 12:35:49.755477	
151	DSC_0048_copiaretocada.jpeg	37	Work	5	2014-05-17 12:35:50.614842	2014-05-17 12:35:50.614842	
152	DSC_0051_copia.jpeg	37	Work	6	2014-05-17 12:35:51.284079	2014-05-17 12:35:51.284079	
169	IMG_2095.jpeg	41	Work	1	2014-11-03 23:21:44.115417	2014-11-03 23:30:04.64656	
170	IMG_2104.jpeg	41	Work	2	2014-11-03 23:26:02.782895	2014-11-03 23:30:04.658116	
171	IMG_2108.jpeg	41	Work	3	2014-11-03 23:26:03.616212	2014-11-03 23:30:04.670586	
172	IMG_2116.jpeg	41	Work	4	2014-11-03 23:26:04.397945	2014-11-03 23:30:04.684101	
134	despunxa1.JPG	36	Work	1	2013-12-06 13:20:53.588822	2014-05-17 12:17:29.352143	
135	despunxa2.JPG	36	Work	2	2013-12-06 13:20:54.370403	2014-05-17 12:17:29.37483	
136	despunxa3.JPG	36	Work	3	2013-12-06 13:20:55.176573	2014-05-17 12:17:29.39423	
137	despunxa4.JPG	36	Work	4	2013-12-06 13:20:55.929314	2014-05-17 12:17:29.414369	
138	despunxaFi.JPG	36	Work	5	2013-12-06 13:20:56.96195	2014-05-17 12:17:29.435686	
139	esbarzer_obrAl_xia1.JPG	36	Work	6	2013-12-06 13:20:58.326664	2014-05-17 12:17:29.455967	
173	IMG_2117.jpeg	41	Work	5	2014-11-03 23:26:05.244875	2014-11-03 23:30:04.696864	
174	IMG_2127.jpeg	41	Work	6	2014-11-03 23:26:06.004775	2014-11-03 23:30:04.709862	
175	IMG_2131.jpeg	41	Work	7	2014-11-03 23:26:06.6773	2014-11-03 23:30:04.723037	
176	IMG_2132.jpeg	41	Work	8	2014-11-03 23:26:07.299663	2014-11-03 23:30:04.73815	
177	IMG_2134.jpeg	41	Work	9	2014-11-03 23:26:07.928066	2014-11-03 23:30:04.750449	
162	P1130261.JPG	35	Work	1	2014-07-17 22:55:51.029461	2015-01-04 21:35:15.061168	
133	generart25nov.jpg	35	Work	2	2013-12-06 13:07:19.838038	2015-01-04 21:35:15.073346	
140	DSC_0583.jpeg	34	Work	1	2014-05-17 12:13:07.524387	2014-05-17 12:19:36.758508	
141	sum_us_1.jpeg	34	Work	2	2014-05-17 12:13:08.49483	2014-05-17 12:19:36.768148	
111	_MG_3737.jpg	31	Work	2	2013-09-05 14:59:30.592008	2015-09-20 18:04:25.9855	
163	P1130264.JPG	35	Work	3	2014-07-17 22:55:51.976218	2015-01-04 21:35:15.083977	
167	separ_2014.4sala_AUDITORIO.jpg	30	Work	2	2014-10-09 17:19:05.601242	2014-10-09 17:19:05.601242	
168	Separ_20143Sala_AUDITORIO.jpg	30	Work	3	2014-10-09 17:19:06.903811	2014-10-09 17:19:06.903811	
157	140531-XIV_Perpetracions-Antologia_Animal-487.jpg	39	Work	1	2014-07-17 22:28:51.970185	2015-01-04 21:39:23.5612	
158	140531-XIV_Perpetracions-Antologia_Animal-500.jpg	39	Work	2	2014-07-17 22:28:53.187017	2015-01-04 21:39:23.571493	
156	Programa_Perpetraci_ns_Interior.jpg	39	Work	3	2014-07-17 22:28:50.898452	2015-01-04 21:39:23.581667	
159	140531-XIV_Perpetracions-Antologia_Animal-504.jpg	39	Work	4	2014-07-17 22:28:54.317382	2015-01-04 21:39:23.59258	
160	140531-XIV_Perpetracions-Antologia_Animal-506.jpg	39	Work	5	2014-07-17 22:28:55.469747	2015-01-04 21:39:23.603478	
164	P1130300.JPG	35	Work	4	2014-07-17 22:55:52.957072	2015-01-04 21:35:15.09428	
165	P1130321.JPG	35	Work	5	2014-07-17 22:55:53.937621	2015-01-04 21:35:15.105657	
161	140531-XIV_Perpetracions-Antologia_Animal-496.jpg	39	Work	6	2014-07-17 22:28:56.851237	2015-01-04 21:39:23.614231	
204	IMG_1468.jpeg	46	Work	1	2015-07-03 00:07:34.082814	2016-08-01 15:23:05.690642	
178	Mireia_Zantop_Accio_.JPG	42	Work	2	2015-01-04 22:05:04.762646	2015-01-04 22:13:33.868509	
179	Fulls_Accio__Mireia.JPG	42	Work	3	2015-01-04 22:05:10.596075	2015-01-04 22:13:33.880486	
180	Pu_blic02.JPG	42	Work	4	2015-01-04 22:05:11.538994	2015-01-04 22:13:33.891816	
181	Mireia_Zantop_01.JPG	42	Work	5	2015-01-04 22:05:12.485475	2015-01-04 22:13:33.903424	
182	PanorGUILLERIES_accio_.jpg	42	Work	6	2015-01-04 22:05:18.447944	2015-01-04 22:13:33.914513	
183	Daniel_Ruiz-_Trillo_02.JPG	42	Work	7	2015-01-04 22:05:19.521168	2015-01-04 22:13:33.925348	
184	Mireia_i_Blai_en_accio_.JPG	42	Work	8	2015-01-04 22:05:20.243222	2015-01-04 22:13:33.938292	
185	IMG_6760.jpeg	43	Work	2	2015-01-04 23:00:32.874014	2015-01-04 23:21:24.337153	
186	IMG_6764.jpeg	43	Work	3	2015-01-04 23:00:33.717678	2015-01-04 23:21:24.351299	
187	IMG_6767.jpeg	43	Work	4	2015-01-04 23:00:34.42342	2015-01-04 23:21:24.362934	
188	IMG_6772.jpeg	43	Work	5	2015-01-04 23:00:35.082099	2015-01-04 23:21:24.374889	
189	IMG_6775.jpeg	43	Work	6	2015-01-04 23:00:35.765695	2015-01-04 23:21:24.386838	
190	IMG_6798.jpeg	43	Work	7	2015-01-04 23:00:41.430322	2015-01-04 23:21:24.397748	
191	IMG_6812.jpeg	43	Work	8	2015-01-04 23:00:42.015798	2015-01-04 23:21:24.408664	
192	IMG_6819.jpeg	43	Work	9	2015-01-04 23:00:42.650881	2015-01-04 23:21:24.419597	
193	IMG_6827.jpeg	43	Work	10	2015-01-04 23:00:43.296168	2015-01-04 23:21:24.430463	
194	IMG_6834.jpeg	43	Work	11	2015-01-04 23:00:44.045373	2015-01-04 23:21:24.445681	
195	tarja_antic_c18_captura.jpg	43	Work	12	2015-01-04 23:21:24.45957	2015-01-04 23:21:24.45957	
196	tarja_birds.jpeg	40	Work	1	2015-01-04 23:23:54.778561	2016-08-05 12:02:03.830029	
250	CanFelipa_17.jpg	51	Work	6	2016-08-01 16:18:31.863956	2016-08-05 11:39:07.628164	
251	AdobeBridgeBatchRenameTemp2CanFelipa_02.jpg	51	Work	7	2016-08-01 16:18:32.497636	2016-08-05 11:39:07.635823	
252	CanFelipa_39.jpg	51	Work	8	2016-08-01 16:18:33.389819	2016-08-05 11:39:07.643053	
7	Instal.laci__monos_labos.JPG	8	Work	2	2013-01-04 21:08:33.070994	2015-09-25 01:15:08.332032	
253	CanFelipa_26.jpg	51	Work	9	2016-08-01 16:18:33.944432	2016-08-05 11:39:07.650248	
254	CanFelipa_09.jpg	51	Work	10	2016-08-01 16:18:34.704063	2016-08-05 11:39:07.657667	
10	Vil.la_Florida_venus.JPG	8	Work	3	2013-01-04 21:08:34.695465	2015-09-25 01:15:08.341366	
211	P1000490.jpg	8	Work	4	2015-09-25 01:15:08.350715	2015-09-25 01:15:08.350715	
212	IMG_2324.jpeg	47	Work	1	2015-09-27 22:40:21.943151	2015-09-27 22:42:43.688077	
213	IMG_2334.jpeg	47	Work	2	2015-09-27 22:40:22.503104	2015-09-27 22:42:43.696169	
214	IMG_2423.jpeg	47	Work	3	2015-09-27 22:40:23.059602	2015-09-27 22:42:43.703653	
215	IMG_2411.jpeg	47	Work	4	2015-09-27 22:40:23.590348	2015-09-27 22:42:43.71151	
216	IMG_2450.jpeg	47	Work	5	2015-09-27 22:40:24.149661	2015-09-27 22:42:43.718804	
217	IMG_2464.jpeg	47	Work	6	2015-09-27 22:40:24.767326	2015-09-27 22:42:43.726481	
218	IMG_2489.jpeg	47	Work	7	2015-09-27 22:40:25.303337	2015-09-27 22:42:43.738039	
219	IMG_2539.jpeg	47	Work	8	2015-09-27 22:40:25.950144	2015-09-27 22:42:43.745875	
220	IMG_2533.jpeg	47	Work	9	2015-09-27 22:40:26.521271	2015-09-27 22:42:43.753914	
221	IMG_2574.jpeg	47	Work	10	2015-09-27 22:40:27.133208	2015-09-27 22:42:43.761835	
451	DSCF5849torre_lluvi_.JPG	88	Work	6	2021-09-20 20:07:22.107389	2022-01-05 20:16:55.116017	
229	poesie.JPG	14	Work	2	2015-09-27 23:08:19.111853	2022-01-10 11:21:20.696835	
270	DSCF2762.JPG	55	Work	3	2016-08-05 11:55:26.72496	2020-06-15 15:43:34.353521	
271	DSCF2792.JPG	55	Work	4	2016-08-05 11:55:27.471995	2020-06-15 15:43:34.361136	
272	DSCF2813.JPG	55	Work	5	2016-08-05 11:55:28.179231	2020-06-15 15:43:34.369067	
273	DSCF2805.JPG	55	Work	6	2016-08-05 11:55:28.906122	2020-06-15 15:43:34.377078	
230	Strelitzia_Delitzia.JPG	14	Work	3	2015-09-27 23:08:19.725425	2022-01-10 11:21:20.702232	
231	AromaMagn_lia.JPG	14	Work	4	2015-09-27 23:08:20.445711	2022-01-10 11:21:20.707511	
260	Cartell_ME_expo_cartells_2016.jpg	53	Work	1	2016-08-01 17:43:51.787056	2020-02-19 17:17:17.199745	
205	IMG_1475.jpeg	46	Work	2	2015-07-03 00:07:34.957377	2016-08-01 15:23:05.704427	
206	IMG_1491.jpeg	46	Work	3	2015-07-03 00:07:35.567417	2016-08-01 15:23:05.711299	
207	IMG_1492.jpeg	46	Work	4	2015-07-03 00:07:36.100125	2016-08-01 15:23:05.718411	
208	IMG_1499.jpeg	46	Work	5	2015-07-03 00:07:36.731664	2016-08-01 15:23:05.725063	
210	IMG_1513.jpeg	46	Work	6	2015-07-03 00:10:52.871909	2016-08-01 15:23:05.731716	
233	IMG_6061.jpeg	48	Work	1	2016-08-01 15:36:37.806751	2016-08-01 15:36:37.806751	
234	IMG_6068.jpeg	48	Work	2	2016-08-01 15:36:38.491222	2016-08-01 15:36:38.491222	
235	IMG_6073.jpeg	48	Work	3	2016-08-01 15:36:39.109254	2016-08-01 15:36:39.109254	
236	IMG_6090.jpeg	48	Work	4	2016-08-01 15:36:39.720092	2016-08-01 15:36:39.720092	
237	IMG_6096.jpeg	48	Work	5	2016-08-01 15:36:40.455173	2016-08-01 15:36:40.455173	
238	IMG_6103.jpeg	48	Work	6	2016-08-01 15:36:41.15213	2016-08-01 15:36:41.15213	
239	IMG_6108.jpeg	48	Work	7	2016-08-01 15:36:41.756187	2016-08-01 15:36:41.756187	
240	IMG_6111.jpeg	48	Work	8	2016-08-01 15:36:42.522787	2016-08-01 15:36:42.522787	
241	IMG_6112.jpeg	48	Work	9	2016-08-01 15:36:43.071126	2016-08-01 15:36:43.071126	
242	Corpologia_21_.jpg	48	Work	11	2016-08-01 15:36:43.611145	2016-08-01 15:36:43.611145	
278	Performance__Donar_veu_al_desig__Tona_2015__6_.jpg	54	Work	1	2017-02-19 20:39:16.13435	2020-06-15 15:27:55.884133	
281	DONAR_VEU_AL_DESIG_.jpg	54	Work	3	2017-02-19 20:39:18.691339	2020-06-15 15:27:55.899568	
255	eventuall0.jpeg	52	Work	1	2016-08-01 16:58:23.602299	2016-08-01 16:59:31.500941	
256	eventuall2.jpeg	52	Work	2	2016-08-01 16:58:24.28788	2016-08-01 16:59:31.508	
257	foto_eventuall_ferran_blancafort.jpeg	52	Work	3	2016-08-01 16:58:24.83924	2016-08-01 16:59:31.514675	
258	eventuall3.jpeg	52	Work	4	2016-08-01 16:58:25.430252	2016-08-01 16:59:31.521611	
259	eventuall4.jpeg	52	Work	5	2016-08-01 16:58:26.030722	2016-08-01 16:59:31.528989	
243	IMG-20150128-WA0000.jpg	49	Work	1	2016-08-01 15:46:03.253903	2016-08-01 17:00:18.675773	
244	IMG-20150128-WA0001.jpg	49	Work	2	2016-08-01 15:46:03.943581	2016-08-01 17:00:18.685173	
279	VIC2.jpg	54	Work	5	2017-02-19 20:39:17.166702	2020-06-15 15:27:55.914858	
232	Rosaflordepell.JPG	14	Work	5	2015-09-27 23:08:21.133874	2022-01-10 11:21:20.71265	
466	ZANTOP_-_4._Odumonde.JPG	92	Work	1	2021-11-19 20:17:25.438748	2022-01-05 20:02:40.42988	
262	DSCF0447_MIREIA_ZANTOP_foto_Joan_Casellas_Arxiu_Aire.JPG	53	Work	3	2016-08-01 17:43:53.096192	2020-02-19 17:17:17.215131	
263	DSCF0459_MIREIA_ZANTOP_foto_Joan_Casellas_Arxiu_Aire.JPG	53	Work	4	2016-08-01 17:43:53.868735	2020-02-19 17:17:17.222703	
264	RIMG0087.jpg	53	Work	5	2016-08-01 17:43:54.791985	2020-02-19 17:17:17.230134	
265	RIMG0082.jpg	53	Work	6	2016-08-01 17:43:55.413798	2020-02-19 17:17:17.23757	
266	RIMG0084.jpg	53	Work	7	2016-08-01 17:43:55.963678	2020-02-19 17:17:17.244917	
267	ZANTOP_A_BEN1_amb_dibuix_fotos_Joan_Casellas_Arxiu_Aire.jpg	53	Work	8	2016-08-01 17:43:56.508431	2020-02-19 17:17:17.252907	
245	AdobeBridgeBatchRenameTemp7CanFelipa_15.jpg	51	Work	1	2016-08-01 16:18:28.223363	2016-08-05 11:39:07.590705	
246	AdobeBridgeBatchRenameTemp12CanFelipa_31.jpg	51	Work	2	2016-08-01 16:18:29.249618	2016-08-05 11:39:07.598402	
247	CanFelipa_67.jpg	51	Work	3	2016-08-01 16:18:29.973361	2016-08-05 11:39:07.605902	
248	CanFelipa_62.jpg	51	Work	4	2016-08-01 16:18:30.582471	2016-08-05 11:39:07.613852	
249	CanFelipa_28.jpg	51	Work	5	2016-08-01 16:18:31.269166	2016-08-05 11:39:07.621028	
467	ZANTOP_-_EQUILIBRIS.jpg	92	Work	2	2021-11-19 20:17:26.068301	2022-01-05 20:02:40.436737	
261	RIMG0068.jpg	53	Work	2	2016-08-01 17:43:52.564463	2020-02-19 17:17:17.20742	
268	DSCF2590.JPG	55	Work	1	2016-08-05 11:55:25.381222	2020-06-15 15:43:34.334081	
468	ZANTOP_-_ESSENSETEMPO.jpg	92	Work	3	2021-11-19 20:17:26.510295	2022-01-05 20:02:40.443209	
469	ZANTOP_-_1._ATADALASALAS.jpg	92	Work	4	2021-11-19 20:17:27.044482	2022-01-05 20:02:40.449871	
269	DSCF2682.JPG	55	Work	2	2016-08-05 11:55:25.971894	2020-06-15 15:43:34.345566	
470	ZANTOP_-_acord.jpg	92	Work	5	2021-11-19 20:17:27.623496	2022-01-05 20:02:40.457456	
282	MIREIAZANTOP6.png	57	Work	1	2017-02-19 23:46:47.237139	2017-06-02 00:58:05.503473	
471	ZANTOP_-_2._piet_.jpg	92	Work	6	2021-11-19 20:17:28.155184	2022-01-05 20:02:40.464917	
472	zantop_-_coeurage_.jpg	92	Work	7	2021-11-19 20:17:28.730148	2022-01-05 20:02:40.471387	
275	IMG_9780.jpeg	56	Work	2	2016-10-19 22:54:28.283388	2017-06-02 00:09:34.231703	
274	IMG_9772.jpeg	56	Work	3	2016-10-19 22:54:27.438028	2017-06-02 00:09:34.250043	
276	IMG_9786.jpeg	56	Work	4	2016-10-19 22:54:28.983146	2017-06-02 00:09:34.266528	
277	IMG_9790.jpeg	56	Work	5	2016-10-19 22:54:29.548586	2017-06-02 00:09:34.282751	
352	Escultura_sadernes_ONA.jpg	73	Work	1	2019-04-15 11:41:03.231274	2022-01-05 21:43:08.608896	
343	P1110555_aleix_vallverd__baixa.jpg	69	Work	2	2019-01-28 20:29:58.684495	2019-01-28 20:33:59.992447	
423	M.ZANTOP_phoscenes__AIGUAda__A4.jpg	82	Work	7	2020-10-14 22:48:46.750917	2022-01-05 20:07:42.779954	
312	donar_veu..._desig_Manlleu_2016.jpg	54	Work	2	2017-06-02 01:10:47.004524	2020-06-15 15:27:55.891775	
280	Performance__Donar_veu_al_desig__Tona_2015__1_.jpg	54	Work	4	2017-02-19 20:39:17.854188	2020-06-15 15:27:55.907144	
335	DSCF4982baixa.jpg	65	Work	1	2019-01-28 20:12:16.001142	2020-06-15 15:34:09.279257	
284	DSCF4634.JPG	59	Work	4	2017-06-01 22:46:01.688096	2019-03-07 22:10:16.043792	
285	DSCF4650.JPG	59	Work	5	2017-06-01 22:46:02.788109	2019-03-07 22:10:16.05111	
286	DSCF4658.JPG	59	Work	6	2017-06-01 22:46:03.486229	2019-03-07 22:10:16.058319	
287	DSCF4653.JPG	59	Work	7	2017-06-01 22:46:04.360941	2019-03-07 22:10:16.06596	
288	DSCF4659.JPG	59	Work	8	2017-06-01 22:46:05.059504	2019-03-07 22:10:16.073084	
290	DSCF4662.JPG	59	Work	9	2017-06-01 22:46:06.732934	2019-03-07 22:10:16.080152	
308	MIREIAZANTOP8.jpg	57	Work	4	2017-06-02 00:58:05.531724	2017-06-02 00:58:05.531724	
309	MIREIAZANTOP15.jpg	57	Work	7	2017-06-02 00:58:06.343089	2017-06-02 00:58:06.343089	
310	MIREIAZANTOP22.jpg	57	Work	8	2017-06-02 00:58:07.212784	2017-06-02 00:58:07.212784	
311	MIREIAZANTOP23.jpg	57	Work	9	2017-06-02 00:58:07.992327	2017-06-02 00:58:07.992327	
344	P1110558baixa.jpg	69	Work	3	2019-01-28 20:29:59.198321	2019-01-28 20:33:59.999286	
421	M.ZANTOP_phoscenes_aiguada_A4.jpg	82	Work	8	2020-10-14 22:48:45.660183	2022-01-05 20:07:42.785293	
347	almost_finished.jpg	71	Work	1	2019-03-07 22:44:49.708459	2022-01-05 20:21:12.645101	
359	IMG_20190125_162217.jpg	71	Work	2	2019-04-15 12:26:32.177041	2022-01-05 20:21:12.653172	
314	corpologia_25_5_Girona_2_retocada.jpeg	66	Work	2	2018-12-21 20:09:56.202489	2018-12-21 20:19:42.172333	
315	corpologia_25_5_Girona_3_retocada.jpeg	66	Work	3	2018-12-21 20:09:56.734044	2018-12-21 20:19:42.181034	
316	corpologia_25_5_Girona_4_retocada.jpeg	66	Work	4	2018-12-21 20:09:57.972727	2018-12-21 20:19:42.188538	
317	be___IMG-3930.JPG	66	Work	5	2018-12-21 20:15:06.236806	2018-12-21 20:19:42.195869	
319	be__IMG-3931.JPG	66	Work	7	2018-12-21 20:19:42.204608	2018-12-21 20:19:42.204608	
353	IMG-20150907-WA0003.jpg	73	Work	2	2019-04-15 11:41:03.904461	2022-01-05 21:43:08.616558	
348	cap_2_IMG_20190405_174933_504.jpg	72	Work	2	2019-04-15 10:49:23.935701	2022-01-05 21:06:26.046471	
366	IMG_20190518_124322_433.jpg	74	Work	11	2019-06-10 20:41:50.057323	2022-01-10 11:24:54.449676	
297	MIREIAZANTOP42.png	63	Work	1	2017-06-02 00:01:30.333086	2018-12-22 17:28:38.250543	
298	Josep_Sou_IMG_4360.JPG	63	Work	2	2017-06-02 00:01:31.258369	2018-12-22 17:28:38.257233	
299	MIREIAZANTOP51.jpg	63	Work	3	2017-06-02 00:01:31.926976	2018-12-22 17:28:38.264054	
300	MIREIAZANTOP59.jpg	63	Work	4	2017-06-02 00:01:32.570647	2018-12-22 17:28:38.271066	
301	IMG-20161002-WA0002.jpg	63	Work	5	2017-06-02 00:01:33.317075	2018-12-22 17:28:38.277884	
293	DSC01109-102.jpeg	61	Work	1	2017-06-01 23:00:44.565565	2018-12-22 17:31:52.281198	
294	IMG_20170519_184422.jpg	62	Work	1	2017-06-01 23:32:58.907326	2019-06-10 22:28:06.247884	
295	Puig-Reig_2017.JPG	62	Work	2	2017-06-01 23:32:59.696835	2019-06-10 22:28:06.255411	
296	matar_1_2017.JPG	62	Work	3	2017-06-01 23:33:00.456423	2019-06-10 22:28:06.263134	
313	inundart_ph_72ppi.jpg	67	Work	2	2018-08-22 21:50:17.041856	2022-01-05 21:12:29.901187	
320	72ppi_rocs_de_lluna.jpg	67	Work	3	2018-12-21 20:24:03.738858	2022-01-05 21:12:29.909097	
321	P1050649_redimensionat_amb_gwenvi_i_1024_.jpg	67	Work	4	2018-12-21 20:56:13.139631	2022-01-05 21:12:29.91641	
291	DSCF4665.JPG	59	Work	10	2017-06-01 22:46:07.448056	2019-03-07 22:10:16.086911	
292	DSCF4671.JPG	59	Work	11	2017-06-01 22:46:08.290143	2019-03-07 22:10:16.093708	
360	IMG-20190225-WA0007.jpeg	71	Work	3	2019-04-15 12:26:32.71858	2022-01-05 20:21:12.661137	
322	P1050656_redimensionat.jpg	67	Work	5	2018-12-21 20:56:13.647604	2022-01-05 21:12:29.923692	
323	ph_72_ppi_peus_redimensionat.jpg	67	Work	6	2018-12-21 20:56:14.15072	2022-01-05 21:12:29.930961	
349	capcap_2.jpg	72	Work	3	2019-04-15 10:49:24.570936	2022-01-05 21:06:26.05637	
345	IMG_20190112_132919baixaMZ.jpg	69	Work	4	2019-01-28 20:29:59.700083	2019-01-28 20:34:00.006136	
324	P1050670.jpg	67	Work	7	2018-12-21 20:56:14.726737	2022-01-05 21:12:29.93823	
302	DSCF3668.JPG	64	Work	1	2017-06-02 00:41:09.692566	2022-01-05 21:20:49.965156	
303	DSCF3662.JPG	64	Work	2	2017-06-02 00:41:10.548581	2022-01-05 21:20:49.970221	
304	DSCF3670.JPG	64	Work	3	2017-06-02 00:41:11.311246	2022-01-05 21:20:49.97533	
305	DSCF3683.JPG	64	Work	4	2017-06-02 00:41:12.07919	2022-01-05 21:20:49.980764	
306	DSCF3681.JPG	64	Work	5	2017-06-02 00:41:12.821488	2022-01-05 21:20:49.985901	
307	DSCF3656.JPG	64	Work	6	2017-06-02 00:41:13.630177	2022-01-05 21:20:49.991015	
326	IMG_6115.JPG	68	Work	1	2018-12-21 21:13:42.52006	2019-03-07 22:05:14.147243	
327	IMG_6129.JPG	68	Work	2	2018-12-21 21:13:43.243946	2019-03-07 22:05:14.155993	
328	IMG_6130.JPG	68	Work	3	2018-12-21 21:13:43.994911	2019-03-07 22:05:14.164096	
350	cap1_IMG_20190405_181244_013.jpg	72	Work	4	2019-04-15 10:49:25.108785	2022-01-05 21:06:26.06586	
354	SOM.Escultura_equilibri_ONA.JPG	73	Work	3	2019-04-15 11:41:04.569538	2022-01-05 21:43:08.623939	
355	cos_cosit_IMG_20171101_155853.jpg	73	Work	4	2019-04-15 11:41:05.195215	2022-01-05 21:43:08.631319	
342	P1110547baixa.jpg	69	Work	1	2019-01-28 20:29:58.211152	2019-01-28 20:33:59.985004	
222	DSCF1045.JPG	38	Work	2	2015-09-27 23:03:08.941238	2022-01-10 11:49:05.9725	
330	IMG_6183.JPG	68	Work	5	2018-12-21 21:13:45.579316	2019-03-07 22:05:14.810704	
346	IMG_6180.JPG	68	Work	4	2019-03-07 22:05:14.173587	2019-03-07 22:05:14.173587	
289	DSCF4661.JPG	59	Work	2	2017-06-01 22:46:05.850788	2019-03-07 22:10:16.027698	
283	DSCF4623.JPG	59	Work	3	2017-06-01 22:46:00.447742	2019-03-07 22:10:16.036366	
334	P1060009baixant_qualitatjpg.jpg	65	Work	2	2019-01-28 19:08:01.449546	2020-06-15 15:34:09.28773	
336	DSCF5039baixa.jpg	65	Work	3	2019-01-28 20:12:16.582016	2020-06-15 15:34:09.295853	
337	P1060026baixa.jpg	65	Work	4	2019-01-28 20:12:17.046974	2020-06-15 15:34:09.303638	
338	DSCF5004.JPG	65	Work	5	2019-01-28 20:12:17.606523	2020-06-15 15:34:09.312117	
223	DSCF1058.JPG	38	Work	3	2015-09-27 23:03:09.713415	2022-01-10 11:49:05.98181	
224	20130623_164338.jpg	38	Work	4	2015-09-27 23:03:10.280082	2022-01-10 11:49:05.990409	
225	20140706_171308.jpg	38	Work	5	2015-09-27 23:03:10.960936	2022-01-10 11:49:05.998828	
226	DSCF1265.JPG	38	Work	6	2015-09-27 23:03:11.692762	2022-01-10 11:49:06.007736	
227	DSCF1556.JPG	38	Work	7	2015-09-27 23:03:12.575381	2022-01-10 11:49:06.016108	
228	DSCF1525.JPG	38	Work	8	2015-09-27 23:03:13.339641	2022-01-10 11:49:06.024301	
339	IMG-20180716-WA0015baixa.jpg	65	Work	6	2019-01-28 20:12:18.105904	2020-06-15 15:34:09.320861	
340	IMG-20180115-WA0028baixa.jpg	65	Work	7	2019-01-28 20:12:18.586861	2020-06-15 15:34:09.329313	
450	DSCF5843_clavant.JPG	88	Work	3	2021-09-20 20:07:21.236949	2022-01-05 20:16:55.09776	
449	DSCF5838_cavar.JPG	88	Work	4	2021-09-20 20:07:20.285475	2022-01-05 20:16:55.104164	
351	cap_1_contrallumIMG_20190405_174610_478.jpg	72	Work	5	2019-04-15 10:49:25.782141	2022-01-05 21:06:26.075641	
325	P1050683_redimensionat.jpg	67	Work	8	2018-12-21 20:56:15.458615	2022-01-05 21:12:29.945624	
424	_20191228_100620.JPG	78	Work	1	2020-10-14 23:00:12.399023	2020-10-14 23:00:12.399023	
425	IMG_20191225_133646_151.jpg	78	Work	2	2020-10-14 23:00:13.002663	2020-10-14 23:00:13.002663	
373	2014-08-05_11-44-56.jpg	75	Work	2	2019-06-10 21:35:28.533335	2022-01-10 11:45:58.722232	
356	20150118_131247.jpg	73	Work	5	2019-04-15 11:41:05.696436	2022-01-05 21:43:08.638811	
426	IMG_20190831_132411_157.jpg	78	Work	3	2020-10-14 23:00:13.677558	2020-10-14 23:00:13.677558	
371	DSCN1209_2.jpg	75	Work	3	2019-06-10 21:35:27.171697	2022-01-10 11:45:58.727682	
372	2014-08-05_11-33-00.jpg	75	Work	4	2019-06-10 21:35:27.857342	2022-01-10 11:45:58.733148	
374	2014-08-05_12-09-46.jpg	75	Work	5	2019-06-10 21:35:29.172985	2022-01-10 11:45:58.738507	
375	DSCN1288.JPG	75	Work	6	2019-06-10 21:35:29.826105	2022-01-10 11:45:58.743949	
376	2014-08-05_11-39-24.jpg	75	Work	7	2019-06-10 21:35:30.433734	2022-01-10 11:45:58.749208	
377	2014-08-05_11-40-12.jpg	75	Work	8	2019-06-10 21:35:31.143949	2022-01-10 11:45:58.754498	
378	2014-08-05_12-20-18.jpg	75	Work	9	2019-06-10 21:35:31.876559	2022-01-10 11:45:58.75965	
379	2014-08-05_11-37-52.jpg	75	Work	10	2019-06-10 21:35:32.523608	2022-01-10 11:45:58.764627	
361	MZantop_4.jpg	74	Work	2	2019-06-10 20:41:47.113692	2022-01-10 11:24:54.402272	
357	funambuliaIMG_20171104_161244.jpg	73	Work	6	2019-04-15 11:41:06.382746	2022-01-05 21:43:08.646158	
368	MZantop_2_girat_a_dreta.jpg	74	Work	3	2019-06-10 21:02:37.531284	2022-01-10 11:24:54.40774	
358	cordada_IMG_20171101_162351.jpg	73	Work	7	2019-04-15 11:41:06.993407	2022-01-05 21:43:08.653575	
363	MZantop.JPG	74	Work	4	2019-06-10 20:41:48.213093	2022-01-10 11:24:54.413008	
427	IMG_20191225_132357_968.jpg	78	Work	4	2020-10-14 23:00:14.377944	2020-10-14 23:00:14.377944	
364	mzantop_3.JPG	74	Work	5	2019-06-10 20:41:48.737315	2022-01-10 11:24:54.418402	
435	IMG-20210315-WA0017.jpg	85	Work	2	2021-04-08 21:31:00.11372	2021-09-26 20:50:13.217025	
436	IMG-20210315-WA0016.jpg	85	Work	3	2021-04-08 21:31:00.766945	2021-09-26 20:50:13.224921	
437	IMG-20210313-WA0009.jpg	85	Work	4	2021-04-08 21:31:01.477819	2021-09-26 20:50:13.23258	
438	IMG-20210315-WA0011.jpg	85	Work	5	2021-04-08 21:31:02.10316	2021-09-26 20:50:13.239717	
439	IMG-20210313-WA0004.jpg	85	Work	6	2021-04-08 21:31:02.73683	2021-09-26 20:50:13.246896	
341	IMG-20180115-WA0024baixa.jpg	65	Work	8	2019-01-28 20:12:19.193854	2020-06-15 15:34:09.337388	
50	DSC02327.JPG	19	Work	5	2013-01-20 02:38:42.018621	2020-06-15 15:36:58.206256	
51	DSC02347.JPG	19	Work	6	2013-01-20 02:38:42.463264	2020-06-15 15:36:58.218124	
397	DSCF4797.JPG	62	Work	4	2019-06-10 22:26:59.31811	2019-06-10 22:28:06.270612	
398	DSCF4408.JPG	62	Work	5	2019-06-10 22:27:00.122651	2019-06-10 22:28:06.277868	
399	nav_s_2016.JPG	62	Work	6	2019-06-10 22:27:00.871318	2019-06-10 22:28:06.285202	
400	IMG_9343.argentona.JPG	62	Work	7	2019-06-10 22:27:01.572114	2019-06-10 22:28:06.292523	
401	cardedeu2_2013.JPG	62	Work	8	2019-06-10 22:27:02.109431	2019-06-10 22:28:06.299801	
392	DSCF4797.JPG	62	Work	9	2019-06-10 22:26:49.589438	2019-06-10 22:28:06.307009	
381	IMG_20180928_164827.jpg	76	Work	1	2019-06-10 21:53:33.123029	2022-01-05 20:26:16.306386	
384	IMG_20180928_164531.jpg	76	Work	2	2019-06-10 21:53:34.726339	2022-01-05 20:26:16.31195	
52	DSC02355.JPG	19	Work	7	2013-01-20 02:38:42.961502	2020-06-15 15:36:58.23095	
394	nav_s_2016.JPG	62	Work	10	2019-06-10 22:26:51.016655	2019-06-10 22:28:06.314251	
395	IMG_9343.argentona.JPG	62	Work	11	2019-06-10 22:26:51.79918	2019-06-10 22:28:06.321623	
396	cardedeu2_2013.JPG	62	Work	12	2019-06-10 22:26:52.460067	2019-06-10 22:28:06.32934	
362	_20190412_193903.JPG	74	Work	6	2019-06-10 20:41:47.574948	2022-01-10 11:24:54.423528	
369	MZantop_O.JPG	74	Work	7	2019-06-10 21:02:38.167094	2022-01-10 11:24:54.428621	
440	IMG-20210313-WA0010.jpg	85	Work	7	2021-04-08 21:31:03.285654	2021-09-26 20:50:13.254234	
370	MZantop_S.JPG	74	Work	8	2019-06-10 21:02:38.640197	2022-01-10 11:24:54.433762	
416	M.ZANTOP_phoscenes_TINTA_a4.jpg	82	Work	1	2020-10-14 22:48:42.546855	2022-01-05 20:07:42.747839	
417	M.ZANTOP_phoscenes_PHOSPHORESCENT_A5.jpg	82	Work	2	2020-10-14 22:48:43.199496	2022-01-05 20:07:42.75346	
422	M.ZANTOP_phoscenes_P_TALS_A4.jpg	82	Work	3	2020-10-14 22:48:46.128891	2022-01-05 20:07:42.75881	
386	IMG_20180928_165940.jpg	76	Work	3	2019-06-10 21:53:35.78219	2022-01-05 20:26:16.317621	
383	IMG_20180928_165542.jpg	76	Work	4	2019-06-10 21:53:34.237062	2022-01-05 20:26:16.323083	
387	IMG_20180928_170858.jpg	76	Work	5	2019-06-10 21:53:36.315178	2022-01-05 20:26:16.328518	
388	IMG_20180928_170923.jpg	76	Work	6	2019-06-10 21:53:36.81654	2022-01-05 20:26:16.333861	
382	Gravat-Nou-cuadrado.jpg	76	Work	7	2019-06-10 21:53:33.591413	2022-01-05 20:26:16.33936	
419	M.ZANTOP_phoscenes._tinta_a4.jpg	82	Work	4	2020-10-14 22:48:44.416543	2022-01-05 20:07:42.764119	
418	M.ZANTOP_phoscenes_a4_NUS_3D.jpg	82	Work	5	2020-10-14 22:48:43.798913	2022-01-05 20:07:42.769596	
420	M.ZANTOP_phoscenes_mute_a5_.jpg	82	Work	6	2020-10-14 22:48:45.015193	2022-01-05 20:07:42.774738	
365	cartell_i_info_de_taller.jpg	74	Work	9	2019-06-10 20:41:49.27616	2022-01-10 11:24:54.438928	
428	IMG-20200924-WA0012.jpg	83	Work	3	2021-01-04 20:46:03.875771	2021-01-04 20:49:41.640438	
434	IMG-20200308-WA0039.jpg	83	Work	4	2021-01-04 20:46:08.219791	2021-01-04 20:49:41.647801	
429	IMG-20200924-WA0005.jpg	83	Work	1	2021-01-04 20:46:04.668456	2021-01-04 20:49:41.622531	
432	__retocat.jpg	83	Work	2	2021-01-04 20:46:06.621335	2021-01-04 20:49:41.632111	
430	IMG_20201016_172309.jpg	83	Work	5	2021-01-04 20:46:05.229157	2021-01-04 20:49:41.655893	
431	IMG_20200308_180723_115.jpg	83	Work	6	2021-01-04 20:46:05.97429	2021-01-04 20:49:41.663624	
433	des_cuidar_accionant_IMG-20200308-WA0020.jpg	83	Work	7	2021-01-04 20:46:07.418947	2021-01-04 20:49:41.671036	
441	Captura_de_pantalla_de_2021-09-01_01-17-09.png	84	Work	1	2021-08-31 23:06:53.606217	2021-08-31 23:06:53.606217	
442	arts_entre_lletres_foto_joana_querol.png	84	Work	2	2021-08-31 23:06:54.498915	2021-08-31 23:06:54.498915	
443	IMG-20201116-WA0010.jpg	84	Work	3	2021-08-31 23:06:55.454014	2021-08-31 23:06:55.454014	
444	IMG-20201116-WA0013.jpg	84	Work	4	2021-08-31 23:06:56.217747	2021-08-31 23:06:56.217747	
389	IMG-20190307-WA0001.jpg	77	Work	1	2019-06-10 22:14:22.905657	2021-08-31 23:07:42.43449	
390	IMG-20190307-WA0002.jpg	77	Work	2	2019-06-10 22:14:23.390512	2021-08-31 23:07:42.439585	
391	IMG-20190304-WA0006.jpg	77	Work	3	2019-06-10 22:14:23.870381	2021-08-31 23:07:42.444448	
380	2014-08-05_11-30-34.jpg	75	Work	11	2019-06-10 21:35:33.12261	2022-01-10 11:45:58.769838	
445	DSC_0037__copia_.JPG	87	Work	2	2021-09-13 17:24:30.658413	2022-01-13 20:54:16.095152	
446	Copy_of_DSC_0046-001.jpg	87	Work	3	2021-09-13 17:24:31.590234	2022-01-13 20:54:16.102412	
447	DSC_0079-004.jpg	87	Work	4	2021-09-13 17:24:32.495359	2022-01-13 20:54:16.1095	
448	DSC_0083-001.jpg	87	Work	5	2021-09-13 17:24:33.382089	2022-01-13 20:54:16.116513	
456	IMG_20210829_084622_1encaix.jpg	88	Work	2	2021-09-20 20:07:26.604314	2022-01-05 20:16:55.091473	
452	IMG_20210827_195621_103agulles_al_pal.jpg	88	Work	5	2021-09-20 20:07:22.99403	2022-01-05 20:16:55.110145	
453	P9650800_grup_estaques_i_estaques_fons.JPG	88	Work	7	2021-09-20 20:07:23.810454	2022-01-05 20:16:55.12197	
454	IMG_20210829_084447_1amb_cam__.jpg	88	Work	8	2021-09-20 20:07:24.763822	2022-01-05 20:16:55.127954	
455	P9650824_caminet_i_pal_agulles.JPG	88	Work	9	2021-09-20 20:07:25.716215	2022-01-05 20:16:55.134052	
367	IMG_20190518_124507_084.jpg	74	Work	10	2019-06-10 20:41:50.63583	2022-01-10 11:24:54.444266	
\.


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('images_id_seq', 472, true);


--
-- Data for Name: page_translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY page_translations (id, page_id, locale, title, body, created_at, updated_at) FROM stdin;
2	2	ca	Contact	The contact-page	2012-10-29 18:37:00.457137	2012-10-29 18:37:00.459652
1	1	ca	About	<p>mireia zantop zigzageja en l&#39;u,<br />\r\ntreballa amb els llenguatges visuals i del cos,</p>\r\n\r\n<p>en l&#39;art d&#39;acci&oacute;, relaciona identitats en l&#39;espai/temps de conflu&egrave;ncia de mirades i intencions</p>\r\n\r\n<p>performance participativa a l&#39;espai p&uacute;blic: <a href="http://www.lesmireies.com">http://www.lesmireies.com</a></p>\r\n\r\n<p>+ info: hola@mireiazantop.com</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n	2012-10-29 18:37:00.444265	2021-12-10 15:37:26.956474
4	1	es	About	<p><strong>Mireia Zantop</strong> zigzaguea en la unidad poli&eacute;drica, trabaja con los lenguajes visuales y del cuerpo.</p>\r\n\r\n<p>en el arte de acci&oacute;n, ese caj&oacute;n transdisciplinario, conjuga identidades y las relaciona con la poes&iacute;a del espacio/tiempo.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Para una mayor confluencia de miradas e intenciones, para dar voz y presencia a aquello que solemos silenciar de forma individual y colectiva, surgieron</p>\r\n\r\n<p><strong>les mireies,</strong> un proyecto de performance participativa en el espacio p&uacute;blico <a href="http://www.lesmireies.com">http://www.lesmireies.com</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>+ info: hola@mireiazantop.com</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n	2021-11-19 21:55:25.520084	2022-02-11 10:51:02.050197
3	1	en	About	<p>Mireia Zantop zigzags in the polyhedral unit, and works both with visual and presential body languages.</p>\r\n\r\n<p>In performance art she works with identities&#39; crossovers and immaterial questions that affect us in presential space/time poems.</p>\r\n\r\n<p>She is member of OCELLS AL CAP collective&nbsp;<a href="https://ocellsalcap.com/">https://ocellsalcap.com/</a> and CORPOLOGIA <a href="https://corpologialiveart.blogspot.com/">https://corpologialiveart.blogspot.com/</a></p>\r\n\r\n<p>LES MIREIES&nbsp;<a href="http://www.lesmireies.com">http://www.lesmireies.com</a> is a participatory performance project in the public space created with the intention to give voice to what we usually silence both individually and collectively<br />\r\n&nbsp;</p>\r\n\r\n<p>more info: <strong>hola@mireiazantop.com</strong></p>\r\n	2013-09-17 00:13:54.622783	2022-02-11 11:18:01.356398
\.


--
-- Name: page_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('page_translations_id_seq', 4, true);


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pages (id, created_at, updated_at) FROM stdin;
2	2012-10-29 18:37:00.455895	2012-10-29 18:37:00.455895
1	2012-10-29 18:37:00.367104	2022-02-11 11:18:01.353326
\.


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pages_id_seq', 2, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_migrations (version) FROM stdin;
20120627134352
20120628125628
20120629184830
20120630202152
20120702202339
20120702234540
20120703192045
20120828014115
20120828020950
20121013062746
20121016161659
20121017030057
20121017031358
20121028134612
20130107110701
20130108020610
20130115034721
20130120041118
20130120165112
20130122013922
20130321135950
20130402185036
\.


--
-- Data for Name: section_translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY section_translations (id, section_id, locale, title, body, created_at, updated_at) FROM stdin;
2	2	ca	agraïments 	<p>(f&egrave; d&#39;errata)a la p&agrave;gina dels cr&egrave;dits hauria de figurar, escrit a m&agrave;:</p>\r\n\r\n<p>Agra&Iuml;da</p>\r\n\r\n<p>a les saurines de idees,<br />\r\nal pare Jordi i als meus,<br />\r\nals amables del cam&iacute;<br />\r\ni a tot all&ograve; que m&#39;atrau i em permet veure m&eacute;s enll&agrave; de la forma. &nbsp;<br />\r\nA tu.</p>\r\n	2013-04-05 18:53:18.947731	2013-04-05 18:53:18.947731
1	1	ca	CANON de SINEQUANONS	<p>veure per crear<br />\r\ncrear per veure<br />\r\nviure per veure<br />\r\n(i da capo)</p>\r\n	2013-04-05 18:53:18.922375	2013-04-05 18:56:47.263267
3	3	ca		<p>Equilibri, de aequilibrium: aequus = igual i libra=balan&ccedil;a, pes i aqu&iacute;. i a qui? libris: dels llibres o dels lliures. libertas: tornar a la mare</p>\r\n\r\n<p>Fragment del proc&eacute;s d&#39;equilibri de lectures obertes i creuades del pes propi i l&#39;exterior, del cos &iacute;ntim davant del cos p&uacute;blic dels factors intencionats o involuntaris, de l&#39;acci&oacute; de forces que implico o s&#39;impliquen i contrarresten m&uacute;tuament, dels vincles de la paraula-veu i la paraula-paper, paper del lligam, de la (con)fusi&oacute; dels estrats de percepci&oacute; i mem&ograve;ria en l&#39;harmonia de la unitat.</p>\r\n\r\n<p>Els factors (sempre) canviants neguen un estat d&#39;equilibri estable, un resultat, i evidencien un proc&eacute;s pur d&#39;infinit moviment tendint a la justesa i l&#39;harmonia en la unitat.</p>\r\n\r\n<p>...Et qui est libre?</p>\r\n	2013-04-05 19:05:21.9985	2013-04-05 19:05:21.9985
4	4	ca		<p>Fruit d&#39;un proc&eacute;s d&#39;anada i tornada de creaci&oacute; po&egrave;tica que s&#39;endinsa en els llenguatges de la paraula, el tra&ccedil; pict&ograve;ric i l&#39;expressi&oacute; corporal, dues artistes presenten aquesta exposici&oacute; i una performance.</p>\r\n	2013-04-05 19:27:48.604621	2013-04-05 19:27:48.604621
5	5	ca	EXPERIMENTAL ROOM FESTIVAL	<p>EXPERIMENTAL ROOM FESTIVAL<br />\r\nExperiencias esc&eacute;nicas &iacute;ntimas y personales en espacios no convencionales1&ordf; edici&oacute;n Performance, Teatro Experimental, Nuevas Dramaturgias, Arte Vivo, Arte de Acci&oacute;n&hellip;<br />\r\nConcepto y direcci&oacute;n: Mar&iacute;a Stoyanova Organiza:&nbsp;Atelier Esc&egrave;nic Stoyanova, La Ch&aacute;chara Espai d&rsquo;art i ideas y Colectivo Irimi<br />\r\nEXPERIMENTAL ROOM FESTIVAL PROGRAMA de las PERFORMANCES d&iacute;as&nbsp;12, 13 y 14 de julio&nbsp;del 2013<br />\r\nViernes, 12<br />\r\n19:00h Apertura oficial del festival 19:30h Performance/Acci&oacute;n a cargo de Mireia Zantop (Performer y artista pl&aacute;stica) &ndash; Artista invitada 20:30h &ldquo;Alquimia para los que todav&iacute;a no encontraron su lugar&rdquo; de Beatriz L&oacute;pez 21:30h &ldquo;1&rsquo;40&times;2&rsquo;00&rdquo; de Bea Gonz&aacute;lez 23:00h &ldquo;M&aacute;s all&aacute; de mi rinc&oacute;n&rdquo; de Ana Laura L&oacute;pez *** Instalaci&oacute;n &ndash; performance de larga duraci&oacute;n &ndash; &ldquo;Cartas a Lars Von Trier&rdquo; de Gemma Ingl&eacute;s *** DJ SergiOh<br />\r\nS&aacute;bado, 13<br />\r\n17:00h &ldquo;Ra&iacute;ces &ndash; memorias para no olvidar&rdquo; de Carmen Sillero 18:30h &ldquo;Alquimia para los que todav&iacute;a no encontraron su lugar&rdquo; de Beatriz L&oacute;pez 20:00h Nick Prescott (concierto) &ndash; Artista invitado 21:30h &ldquo;Soy m&aacute;s fea de lo que parezco&rdquo; de Sonia Ezquerra *** Instalaci&oacute;n &ndash; performance de larga duraci&oacute;n &ndash; &ldquo;Los rostros del silencio&rdquo; de Carmina P&eacute;rez *** DJ SergiOh<br />\r\nDomingo, 14<br />\r\n17:00h Acciones Colectivo IRIMI 18:00h &ldquo;Desaparecer&rdquo; de Graciela Contreras 19:30h &ldquo;M&aacute;s all&aacute; de mi rinc&oacute;n&rdquo; de Ana Laura L&oacute;pez 20:30h &ldquo;L&iacute;nea y Nudo &ndash; mitolog&iacute;a griega contempor&aacute;nea&rdquo; de Alkyoni Bouchalaki *** Instalaci&oacute;n &ndash; performance de larga duraci&oacute;n &ndash; &ldquo;Sin colorantes ni az&uacute;cares a&ntilde;adidos&rdquo; de Konstantina Titkova 22:00h Cierre del festival<br />\r\nArtistas invitados: Mireia Zantop, SergiOh! dj y Nick Prescott (m&uacute;sica) entre otros.<br />\r\nProducci&oacute;n ejecutiva: Karel Mena Dise&ntilde;o de iluminaci&oacute;n: Toni Alonso Audiovisuales: EAST SIDE CONNECTION Servicio de catering: &ldquo;El nieto de la yaya&rdquo;<br />\r\n**Todas las performances, excepto las de los artistas invitados, son fruto del trabajo realizado dentro del #Laboratorio de solos del Atelier Esc&eacute;nic Stoyanova<br />\r\nTeasers de las performances:&nbsp;https://vimeo.com/channels/experimentalroom<br />\r\nBono contribuci&oacute;n: 10&euro; por d&iacute;a<br />\r\nPLAZAS LIMITADAS Reservas al mail: atelierescenic@gmail.com<br />\r\nLUGAR: La Ch&aacute;chara espai d&rsquo;art i ideas, carrer d&rsquo;n Blanco, 15 &ndash; Pl. de Sants, Barcelona<br />\r\nM&aacute;s informaci&oacute;n:<br />\r\nwww.atelierescenic.com www.lachachara.info www.mariastoyanova.com</p>\r\n\r\n<p>&nbsp;</p>\r\n	2013-09-05 14:59:31.659478	2013-09-05 14:59:31.659478
6	6	ca		<p>Accions:</p>\r\n\r\n<p>1.Sols cal&ccedil;ats i Skip</p>\r\n\r\n<p>2. Homenatge a l&#39;operari, Niu</p>\r\n\r\n<p>3. La bolsa, la vida</p>\r\n\r\n<p>4. trio de cordes</p>\r\n\r\n<p>5. trio global</p>\r\n\r\n<p>6. Circuit cons</p>\r\n\r\n<p>7. Atac al cor</p>\r\n\r\n<p>8. Composici&oacute; aleat&ograve;ria en equilibri</p>\r\n\r\n<p>9. los murmuradores</p>\r\n\r\n<p>10. Psicomantra</p>\r\n\r\n<p>11. Amar a la ramA</p>\r\n\r\n<p>Video-accions:</p>\r\n\r\n<p>1. trampA (Homenatge a B)</p>\r\n\r\n<p>2. Fluxus</p>\r\n\r\n<p>3. unOu</p>\r\n\r\n<p>4.tacones sobre ruedas</p>\r\n\r\n<p>5. Ritme mut</p>\r\n\r\n<p>6.Escletxa de censura</p>\r\n\r\n<p>7. S&oacute;c soc</p>\r\n\r\n<p>8.Faldilles al vent</p>\r\n\r\n<p>9. Hombres fritos</p>\r\n\r\n<p>10.GlobOus</p>\r\n\r\n<p>11. Tres al plat</p>\r\n	2013-12-06 12:49:29.115728	2013-12-06 13:33:49.832649
7	6	en		<p>Accions:</p>\r\n\r\n<p>1.Sols cal&ccedil;ats i Skip</p>\r\n\r\n<p>2. Homenatge a l&#39;operari, Niu</p>\r\n\r\n<p>3. La bolsa, la vida</p>\r\n\r\n<p>4. trio de cordes</p>\r\n\r\n<p>5. trio global</p>\r\n\r\n<p>6. Circuit cons</p>\r\n\r\n<p>7. Atac al cor</p>\r\n\r\n<p>8. Composici&oacute; aleat&ograve;ria en equilibri</p>\r\n\r\n<p>9. los murmuradores</p>\r\n\r\n<p>10. Psicomantra</p>\r\n\r\n<p>11. Amar a la ramA</p>\r\n\r\n<p>Video-accions:</p>\r\n\r\n<p>1. trampA (Homenatge a B)</p>\r\n\r\n<p>2. Fluxus</p>\r\n\r\n<p>3. unOu</p>\r\n\r\n<p>4.tacones sobre ruedas</p>\r\n\r\n<p>5. Ritme mut</p>\r\n\r\n<p>6.Escletxa de censura</p>\r\n\r\n<p>7. S&oacute;c soc</p>\r\n\r\n<p>8.Faldilles al vent</p>\r\n\r\n<p>9. Hombres fritos</p>\r\n\r\n<p>10.GlobOus</p>\r\n\r\n<p>11. Tres al plat</p>\r\n	2014-05-17 12:23:54.028142	2014-05-17 12:23:54.036694
8	7	ca	Informe de Carles H. Mor	<p>POESIA ALS PARCS 2014</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>ESPAI NATURAL DE LES GUILLERIES-SAVASSONA<br />\r\nDATA: diumenge 12 d&#39;octubre.</p>\r\n\r\n<p>MUNICIPI: Tav&egrave;rnoles.</p>\r\n\r\n<p>HORA: 12 h.</p>\r\n\r\n<p>ACTES: Recital de poesia.</p>\r\n\r\n<p>LLOC: Ermita de Sant Feliuet de Savassona.</p>\r\n\r\n<p>Temps meteorol&ograve;gic: bo.</p>\r\n\r\n<p>Puntualitat de l&#39;acte: el quart d&rsquo;hora acad&egrave;mic.</p>\r\n\r\n<p>Puntualitat del p&uacute;blic: el quart d&rsquo;hora acad&egrave;mic.</p>\r\n\r\n<p>Presentaci&oacute; de l&#39;acte: Carles Hac Mor i Ester Xargay.</p>\r\n\r\n<p>Autoria de l&#39;acte: Daniel Ruiz-Trillo i Mireia Zantop.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Cadires: pedrissos, un banc i un parell de cadires.</p>\r\n\r\n<p>Assist&egrave;ncia: unes trenta persones.</p>\r\n\r\n<p>Acceptaci&oacute; del p&uacute;blic: molt bona, i amb una gran participaci&oacute;.<br />\r\nDifusi&oacute;: la pr&ograve;pia de Poesia als Parcs.</p>\r\n\r\n<p>Observacions: A difer&egrave;ncia de l&#39;any passat, enguany al recital no hi va acudir cap gos, i aquesta manca sobtada d&#39;inter&egrave;s can&iacute; per la poesia va ser comentada per tothom. En canvi, la pres&egrave;ncia de formigues va ser notable, fins al punt que una de les corrues d&#39;aquests insectes va traspassar l&#39;entrep&agrave; d&#39;un nen que aix&iacute; es va quedar sense esmorzar, mentre una dona ja gran era atacada per una mena de mosquit que va sortir furiosament de la porta de l&#39;ermita, tal vegada impulsat per un rampell l&iacute;ric de Sant Feliuet. I el m&eacute;s curi&oacute;s de tot &eacute;s que tant els poemes del poeta com els de la poetessa van fer joc amb aquelles manifestacions insect&iacute;voles. En efecte, hi van predominar els poemes molt breus, alguns de min&uacute;sculs, i tots d&#39;una gran qualitat subtil, enginyosa i personal, amb un humor tothora delicat que va captivar els espectadors. El recital pr&ograve;piament dit va acabar amb una acci&oacute; po&egrave;tica, proposada per Mireia Zantop i que va consistir en la confecci&oacute; i el llan&ccedil;ament d&#39;avions de paper des de les grans pedres que fan de mirador sobre el riu Ter. Per acabar, hi va haver dos espontanis: l&#39;ermit&agrave; i c&egrave;lebre folklorista Xavier Rovir&oacute; va recitar de mem&ograve;ria un poema llarg de Moss&egrave;n Cinto Verdaguer que versava sobre la vida sexual de dos rius d&#39;aquella comarca; i una noia, que llu&iuml;a una samarreta verda que s&#39;adeia amb tots els colors del verd d&#39;aquell paratge, va expressar en silenci, subliminalment, unes emocions tan &iacute;ntimes i excelses que nom&eacute;s van ser captades pels espectadors m&eacute;s atents.</p>\r\n	2015-01-04 22:05:21.186616	2015-01-04 22:05:21.186616
9	8	ca	Descripció/Notes	<p>En entrar a la sala, cada persona que vol, obt&eacute; un(a) clau. Ning&uacute; el rebutja.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Inici: estirada al terra sota una escala de pintor obertA. En cada esgla&oacute; hi ha clavats claus que impedeixen pujar-hi. Amb la mobilitat limitada, allibero les mans. Un clau en la m&agrave; esquerra, trec del cor una clau amb la dreta (estava calenta). A l&#39;inrev&eacute;s, observo el p&uacute;blic, a trav&eacute;s de l&#39;ull de la clau i amb la punta del clau dirigida a la mirada.</p>\r\n\r\n<p>Observo l&#39;escala des del terra. Decisi&oacute;: inici d&#39;acci&oacute;. Surto de sota, m&#39;aixeco. Dic: cap esclau!</p>\r\n\r\n<p>Amb un martell pico un a un els claus dels travessers de fusta, que cauen al terra.</p>\r\n\r\n<p>Recito articulant, en silenci, el poema ...cau l&#39;esclau, i l&#39;esclau de l&#39;esclau...</p>\r\n\r\n<p>Silenci.</p>\r\n\r\n<p>Comen&ccedil;o a recollir els claus del terra clavant-los en una bossa teixida que duc sobre el cor. Quan ja no hi ha claus al terra, cau un clau del p&uacute;blic.</p>\r\n\r\n<p>I un altre.</p>\r\n\r\n<p>I comencen a ploure claus a l&#39;escenari.</p>\r\n\r\n<p>Algunes persones baixen i els porten en m&agrave;. Accelero, m&#39;emociono, recullo fins a l&#39;&uacute;ltim clau que tira en Carles H. El convido a apropar-se. ?. Denys recull el clau i me&#39;l posa a la bossa.</p>\r\n\r\n<p>Pujo a l&#39;escala. En el pen&uacute;ltim esgla&oacute;, em despenjo la bossa, i, amb les punxes de tots els claus mirant enfora, me la poso al cap:</p>\r\n\r\n<p>cap &eacute;s clau.</p>\r\n\r\n<p>M&agrave; al cor.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>En passejar per la ciutat amb l&#39;escala sota el bra&ccedil;, li enviava somriures a en Joan Brossa.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Era acci&oacute; oberta a uns quants fins. Podia avan&ccedil;ar de diferents maneres, sola, amb participaci&oacute; o pres&egrave;ncia dels presents. O no. La certesa es revela durant.</strong></p>\r\n\r\n<p><strong>A partir del moment en que l&#39;acci&oacute; esdev&eacute;, pren la seva forma imaginable.</strong></p>\r\n	2015-01-04 23:00:44.736057	2015-01-04 23:00:44.736057
10	9	ca		<p><br />\r\nad hoc<br />\r\n<br />\r\ncreated or done for a particular purpose as necessary<br />\r\n&nbsp;</p>\r\n	2015-09-20 18:10:41.196442	2015-09-20 18:10:41.196442
11	10	ca	Corpologia 24	<p><a href="http://corpologialiveart.blogspot.com.es">http://corpologialiveart.blogspot.com.es</a></p>\r\n\r\n<p>CORPOLOGIA&nbsp;es una trobada independent y lliure d&#39;un grup d&#39;artistes y persones amb ganes d&#39;investigar el present a trav&eacute;s de l&#39;acci&oacute;. El format de las obres &eacute;s lliure y d&#39;una m&agrave;xima duraci&oacute; de 10 minuts cada una.</p>\r\n	2016-10-19 22:54:30.223207	2017-02-19 20:55:04.320584
12	11	ca		<p>S&oacute;c a</p>\r\n\r\n<p>amb</p>\r\n\r\n<p>de</p>\r\n\r\n<p>en</p>\r\n\r\n<p>S&oacute;c entre</p>\r\n\r\n<p>per</p>\r\n\r\n<p>contra</p>\r\n\r\n<p>S&oacute;c segons</p>\r\n\r\n<p>sense</p>\r\n\r\n<p>cap</p>\r\n\r\n<p>a for&ccedil;a de</p>\r\n\r\n<p>cos</p>\r\n\r\n<p>S&oacute;c en part</p>\r\n\r\n<p>des de</p>\r\n\r\n<p>fins a</p>\r\n\r\n<p>vers</p>\r\n\r\n<p>S&oacute;c tamb&eacute;</p>\r\n\r\n<p>igual a</p>\r\n\r\n<p>diferent de</p>\r\n\r\n<p>S&oacute;c , a m&eacute;s,</p>\r\n\r\n<p>a causa de</p>\r\n\r\n<p>al costat de</p>\r\n\r\n<p>front a (tu)</p>\r\n\r\n<p>en proc&eacute;s.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>S&oacute;c qui viu, veu, veus, vols veure?</p>\r\n\r\n<p>Mireia Zantop</p>\r\n	2017-06-01 22:46:09.178191	2017-06-01 22:46:09.178191
13	12	ca	Per se	<p>(by itself, in itself, of itself, through itself, itself as such, in essence, by bit&#39;s very nature, essentially)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Una persona, un objecte &ndash; &eacute;s ... per s&iacute; mateix?</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>O es defineix a trav&eacute;s de l&#39;acci&oacute;?</p>\r\n\r\n<p>La intenci&oacute;?</p>\r\n\r\n<p>La interpretaci&oacute;?</p>\r\n	2018-08-22 15:12:28.290697	2018-08-22 15:12:28.290697
14	13	ca		<p><strong>Acci&oacute;</strong> a amb de entre per contra segons sense com fins a en part a for&ccedil;a de vers des de a causa de igual a diferent de d&#39;acord amb en relaci&oacute; a en proc&eacute;s</p>\r\n\r\n<p><strong>de rastres i creences d&#39;identitats estimades.</strong></p>\r\n	2018-08-22 15:22:59.124479	2018-08-22 15:22:59.124479
15	14	ca		<p>En aquesta acci&oacute;/instal.laci&oacute;&nbsp; es relacionen aspectes dels llenguatges del cos alhora subtils i essencials en la nostra comunicaci&oacute; quotidiana. En ser ef&iacute;mers, el sentit del seu rastre canvia en tota lectura posterior.</p>\r\n\r\n<p>L&#39;articulaci&oacute; d&#39;alguns alfabets naturals i culturals a trav&eacute;s del cos tindr&agrave; lloc en l&#39;acci&oacute; de llarga durada creada espec&iacute;ficament in situ, en interacci&oacute; amb l&#39;entorn per fer i desfer poesia sonora. Cada moviment, cada tra&ccedil;, cada fonema besar&agrave; l&#39;ara. El que queda, s&oacute;n formes per reviure o reinterpretar, arqueologies de la mem&ograve;ria.</p>\r\n	2019-06-10 21:35:33.861986	2019-06-10 21:35:33.861986
16	15	ca	estimat paisatge interior i exterior	<p>Estimat paisatge, temple que contemplo mentre em contempla. Sobre el paper et dilueixes; es desdibuixa aquella definici&oacute; de &laquo;la porci&oacute; de territori que l&#39;ull pot recon&egrave;ixer i representar des d&#39;un punt de vista&raquo;. Flueixes cos endins per tots els meus &ograve;rgans de percepci&oacute;, que inclouen el sis&egrave; sentit. Com l&#39;humus inconscient que nodreix i acompanya en el ritual de pas pel propi panorama, tan &iacute;ntim i tan com&uacute;, que aflora en forma d&#39;obra.</p>\r\n\r\n<p>La mirada, serena i salvatge, balla per aquests paratges interiors i exteriors perqu&egrave; vol veure m&eacute;s, i genera interrogants. Sorgeixen imatges que em guien pel bosc intu&iuml;tiu on les seves formes es tornen significants.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>El paisatge l&iacute;quid beu de moltes fonts i s&#39;expressa de moltes maneres. Associa conceptes, creences i formes. L&#39;articulen llenguatges familiars conjuntament amb altres interpretacions subjectives. Una visi&oacute; que s&#39;expressa per ser compartida, per&ograve; fluctua per diferents nivells de lectura. Com una persona, com una poesia, com una acci&oacute;.</p>\r\n	2020-02-19 17:23:07.100032	2020-02-19 17:23:07.100032
17	16	ca		<p><strong>acci&oacute;-homenatge</strong> al silenci propi</p>\r\n\r\n<p>del flu&iuml;r en el pas del temps</p>\r\n\r\n<p>gota a gota</p>\r\n\r\n<p>ress&ograve; del proc&eacute;s en trans-formaci&oacute; amb la mat&egrave;ria (pr&ograve;pia)</p>\r\n\r\n<p>rastre de l&#39;escolta en obrir-se pas endins</p>\r\n	2020-02-19 18:07:36.347754	2020-02-19 18:09:01.872951
18	17	ca		<p>Obrint-se cam&iacute; a partir de la resson&agrave;ncia interna sentida en apropar-me a l&rsquo;obra de la F.F., l&rsquo;acci&oacute; &eacute;s el boc&iacute; d&rsquo;un moment de pas cap a all&ograve; inestable i immaterial. Vol honrar-lo amb la pres&egrave;ncia i convidar tant els lligams com els llindars entre la l&iacute;rica del so de sorra i/o seda , i la intuici&oacute; que es desperta de la m&agrave; del ritme impr&egrave;s en blanc sense negre, en el si del tant s&iacute; com no, en l&rsquo;I/O. Una proposta del mo(vi)ment visible com a vas comunicant i/o acord i/o simbiosi i/o vaiv&eacute; entre buits i plens. Per veure i viure la forma. L&rsquo;acci&oacute; comen&ccedil;a i acaba, i alhora desitja tra&ccedil;ar el brot d&rsquo;un par&egrave;ntesi dins de POESIA, sense article. &Eacute;s la teva i la meva, la del n&uacute;vol i la de la Fel&iacute;cia.</p>\r\n	2021-04-08 21:31:03.869212	2021-04-08 21:31:03.869212
19	18	ca	Ull viu! agulles	<p>Responent al repte microscopista de fer visible l&rsquo;invisible, retorcem el llenguatge. Plantats davant la majestuositat tel&middot;l&uacute;rica del Montserrat, aquest indret qu&agrave;ntic que &eacute;s lleuger i pesat, lluny&agrave; i proper i tou i dur, i alguns ant&ograve;nims simultanis m&eacute;s, des dels plans de la Torre Lluvi&agrave; posem fil a l&rsquo;agulla i parem compte, ull viu! Seguint el fil de les agulles plantem una composici&oacute; ressonant, una perspectiva significativa que conviu amb les altres, po&egrave;tiques, est&egrave;tiques, presents.</p>\r\n\r\n<p>Observem el fet petit (des d&rsquo;aqu&iacute;). Construint, com dibuixant, mirem, coneixem i potser reconeixem. Reconeixem la pulsi&oacute; ancestral per la connexi&oacute; vertical terra-cel; el menhir, el xiprer, les agulles de Montserrat...</p>\r\n\r\n<p>Ens agrada fer torres de cagarrines a la platja i ens magnetitza el mass&iacute;s petri i aqu&iacute; juguem, perqu&egrave; art i joc s&oacute;n matisos, s&oacute;n llu&iuml;ssors d&rsquo;un mateix ser.</p>\r\n\r\n<p>Juguem amb els elements agr&iacute;coles i la seva tecnologia, el paisatge ind&ograve;mit i el domesticat.</p>\r\n\r\n<p>Juguem amb l&rsquo;escala, la mida i la mesura, la posici&oacute; de l&rsquo;espectador, l&rsquo;hum&agrave; que veu el m&oacute;n, el fons, la figura i una ambig&uuml;itat meton&iacute;mica manifesta en la seva cohabitaci&oacute;.</p>\r\n\r\n<p>Juguem amb els ingredients transrealistes i amb els codis propis dels llenguatges en joc.</p>\r\n\r\n<p>Conjuguem.</p>\r\n\r\n<p>Aleix Antillach i Mireia Zantop : Col&middot;laboren intermitentment,</p>\r\n\r\n<p>mesclant els seus mons, fets de disciplines i indisciplines</p>\r\n\r\n<p>diverses. L&rsquo;arquitectura, la dansa, la performance, les arts</p>\r\n\r\n<p>visuals i les lletres. Inquiets tastaolletes, de gra i de palla.</p>\r\n	2021-09-20 19:33:22.583899	2021-09-20 20:07:27.515731
21	18	en	Ull viu! agulles	<p>Responent al repte microscopista de fer visible l&rsquo;invisible, retorcem el llenguatge. Plantats davant la majestuositat tel&middot;l&uacute;rica del Montserrat, aquest indret qu&agrave;ntic que &eacute;s lleuger i pesat, lluny&agrave; i proper i tou i dur, i alguns ant&ograve;nims simultanis m&eacute;s, des dels plans de la Torre Lluvi&agrave; posem fil a l&rsquo;agulla i parem compte, ull viu! Seguint el fil de les agulles plantem una composici&oacute; ressonant, una perspectiva significativa que conviu amb les altres, po&egrave;tiques, est&egrave;tiques, presents.</p>\r\n\r\n<p>Observem el fet petit (des d&rsquo;aqu&iacute;). Construint, com dibuixant, mirem, coneixem i potser reconeixem. Reconeixem la pulsi&oacute; ancestral per la connexi&oacute; vertical terra-cel; el menhir, el xiprer, les agulles de Montserrat...</p>\r\n\r\n<p>Ens agrada fer torres de cagarrines a la platja i ens magnetitza el mass&iacute;s petri i aqu&iacute; juguem, perqu&egrave; art i joc s&oacute;n matisos, s&oacute;n llu&iuml;ssors d&rsquo;un mateix ser.</p>\r\n\r\n<p>Juguem amb els elements agr&iacute;coles i la seva tecnologia, el paisatge ind&ograve;mit i el domesticat.</p>\r\n\r\n<p>Juguem amb l&rsquo;escala, la mida i la mesura, la posici&oacute; de l&rsquo;espectador, l&rsquo;hum&agrave; que veu el m&oacute;n, el fons, la figura i una ambig&uuml;itat meton&iacute;mica manifesta en la seva cohabitaci&oacute;.</p>\r\n\r\n<p>Juguem amb els ingredients transrealistes i amb els codis propis dels llenguatges en joc.</p>\r\n\r\n<p>Conjuguem.</p>\r\n\r\n<p>Aleix Antillach i Mireia Zantop : Col&middot;laboren intermitentment,</p>\r\n\r\n<p>mesclant els seus mons, fets de disciplines i indisciplines</p>\r\n\r\n<p>diverses. L&rsquo;arquitectura, la dansa, la performance, les arts</p>\r\n\r\n<p>visuals i les lletres. Inquiets tastaolletes, de gra i de palla.</p>\r\n	2021-09-20 20:36:36.420693	2021-09-20 20:36:36.423914
27	20	es		<p>* cap cap, t&iacute;tulo intraducible</p>\r\n\r\n<p>cap, del catal&aacute;n: cabeza, cabo, ning&uacute;n, ninguna, cabe</p>\r\n	2022-01-05 21:06:26.091128	2022-01-05 21:06:26.091128
23	19	es	(Questions) about going to and going away from	<p>The fortune&rsquo;s roulette turns the wheel and it&rsquo;s cycles of repetition, range and power. I hear ancestral<br />\r\nvoices and dream where the bird will nest best. An inner dissociation when moving: Which parts<br />\r\nleave, which parts do not leave?<br />\r\nDiaspora of the genome, not just my own, perhaps an appropriated, adopted one. How long is the<br />\r\nwhile I&rsquo;m neither/nor or still/not yet?<br />\r\nIs the present self a place of permanence, an axis? Do migratory birds flight to or flight from? A<br />\r\ngeneration later, do you go to or come back to? Progress-process idea. What pulls or pushes the<br />\r\ndirection and intention of a step: motivation or fear? Do I move or am I being displaced?<br />\r\nMoving from a safe place like going beyond the known. The horizon, as a nonexisting place, a<br />\r\nvisual illusion, a utopian dartboard, moves as we approach. What vision do you need to start<br />\r\nwalking?</p>\r\n	2021-09-26 20:13:57.516416	2021-09-26 20:13:57.525946
24	17	es		<p><br />\r\nLa acci&oacute;n se abre camino a partir de la resonancia interna sentida al acercarme a la obra de F.F., es el pedazo de un momento hacia aquello inestable e inmaterial. Quiere honrarlo con la presencia e invitar tanto los v&iacute;nculos como los umbrales entre la l&iacute;rica del sonido de arena y/o seda, y la intuici&oacute;n que se despierta de la mano del ritmo impreso y presente en blanco sin negro, en el seno del tanto s&iacute; como no, en el I/O. Una propuesta de lo visible como vaso comunicante y/o acuerdo y/o simbiosis y/o vaiv&eacute;n entre vac&iacute;os y llenos. Para ver y vivir la forma. La acci&oacute;n empieza y acaba, y a la vez desea trazar, como un brote, un par&eacute;ntesis dentro de POES&Iacute;A, sin art&iacute;culo. Es la tuya y es la m&iacute;a, la de la nube y la de la Fel&iacute;cia.<br />\r\n&nbsp;</p>\r\n	2021-09-26 20:50:13.263036	2021-09-26 20:50:13.265396
28	13	es		<p><strong>Acci&oacute;n</strong> a con de entre por para contra seg&uacute;n sin como hasta en parte a fuerza de hacia desde a causa de igual a diferente de de acuerdo con en relaci&oacute;n a en proceso</p>\r\n\r\n<p><strong>de rastros y creencias de identitades estimadas.</strong></p>\r\n	2022-01-05 21:12:29.954599	2022-01-05 21:12:29.95691
25	18	es	Ull viu! agulles	<p>Responent al repte microscopista de fer visible l&rsquo;invisible, retorcem el llenguatge. Plantats davant la majestuositat tel&middot;l&uacute;rica del Montserrat, aquest indret qu&agrave;ntic que &eacute;s lleuger i pesat, lluny&agrave; i proper i tou i dur, i alguns ant&ograve;nims simultanis m&eacute;s, des dels plans de la Torre Lluvi&agrave; posem fil a l&rsquo;agulla i parem compte, ull viu! Seguint el fil de les agulles plantem una composici&oacute; ressonant, una perspectiva significativa que conviu amb les altres, po&egrave;tiques, est&egrave;tiques, presents.</p>\r\n\r\n<p>Observem el fet petit (des d&rsquo;aqu&iacute;). Construint, com dibuixant, mirem, coneixem i potser reconeixem. Reconeixem la pulsi&oacute; ancestral per la connexi&oacute; vertical terra-cel; el menhir, el xiprer, les agulles de Montserrat...</p>\r\n\r\n<p>Ens agrada fer torres de cagarrines a la platja i ens magnetitza el mass&iacute;s petri i aqu&iacute; juguem, perqu&egrave; art i joc s&oacute;n matisos, s&oacute;n llu&iuml;ssors d&rsquo;un mateix ser.</p>\r\n\r\n<p>Juguem amb els elements agr&iacute;coles i la seva tecnologia, el paisatge ind&ograve;mit i el domesticat.</p>\r\n\r\n<p>Juguem amb l&rsquo;escala, la mida i la mesura, la posici&oacute; de l&rsquo;espectador, l&rsquo;hum&agrave; que veu el m&oacute;n, el fons, la figura i una ambig&uuml;itat meton&iacute;mica manifesta en la seva cohabitaci&oacute;.</p>\r\n\r\n<p>Juguem amb els ingredients transrealistes i amb els codis propis dels llenguatges en joc.</p>\r\n\r\n<p>Conjuguem.</p>\r\n\r\n<p>Aleix Antillach i Mireia Zantop : Col&middot;laboren intermitentment,</p>\r\n\r\n<p>mesclant els seus mons, fets de disciplines i indisciplines</p>\r\n\r\n<p>diverses. L&rsquo;arquitectura, la dansa, la performance, les arts</p>\r\n\r\n<p>visuals i les lletres. Inquiets tastaolletes, de gra i de palla.</p>\r\n	2021-11-19 21:41:37.129367	2021-11-19 21:41:37.13267
22	19	en	(Preguntas) sobre ir a y alejarse de	<p><strong>Migraci&oacute;n: (Preguntas) sobre ir a y alejarse de</strong></p>\r\n\r\n<p>Gira la rueda de la fortuna con sus ciclos de repetici&oacute;n, rango y poder. Escucho</p>\r\n\r\n<p>voces ancestrales, sue&ntilde;o sobre d&oacute;nde anidar&aacute; mejor el p&aacute;jaro. Percibo una disociaci&oacute;n interna al moverme: qu&eacute; partes se van, &iquest;qu&eacute; partes se quedan?</p>\r\n\r\n<p>Di&aacute;spora del genoma, no solo el m&iacute;o, tal vez uno apropiado, adoptado. &iquest;Cu&aacute;nto dura el lapso del &ldquo;no soy ni de aqu&iacute; ni de all&iacute;&rdquo;, o del &ldquo;soy todav&iacute;a y a&uacute;n no soy&rdquo;.</p>\r\n\r\n<p>&iquest;Es el yo presente un lugar de permanencia, un eje? &iquest;Las aves migratorias vuelan hacia o se van de un lugar? Una generaci&oacute;n despu&eacute;s, &iquest;vas o vuelves? Idea de progreso-proceso. Lo que estira o empuja la direcci&oacute;n y la intenci&oacute;n de un paso es motivaci&oacute;n? O es miedo? &iquest;Me mudo o estoy siendo desplazada?</p>\r\n\r\n<p>Salir de un lugar seguro es como ir m&aacute;s all&aacute; de lo conocido. El horizonte, como lugar inexistente, es una ilusi&oacute;n visual, una diana ut&oacute;pica, que se aleja a medida que nos acercamos.</p>\r\n\r\n<p><strong>&iquest;Qu&eacute; visi&oacute;n necesitas para empezar a caminar?</strong></p>\r\n	2021-09-26 16:57:03.763881	2021-11-20 13:33:41.376534
26	15	es	estimado paisaje interior y exterior	<p>Estimado paisaje, templo que contemplo mientras me contempla. Sobre el papel te diluyes; se desdibuja aquella definici&oacute;n de &laquo;la porci&oacute;n de territorio que el ojo puede reconocer y representar des de un punto de vista&raquo;. Fluyes cuerpo adentro por todos mis &oacute;rganos de percepci&oacute;n, que inclyen el sexto sentido. Como el humus del inconsciente que nutre y acompa&ntilde;a en el ritual de paso por el propio panorama, un lugar tan &iacute;ntimo i tan com&uacute;n, que aflora y toma forma de obra.</p>\r\n\r\n<p>La mirada, serena y salvaje, baila por estos parajes interiores y exteriores porque quiere ver m&aacute;s, y sigue el ritmo que generan los interrogantes. Surgen im&aacute;genes que me gu&iacute;an por el bosque intuitivo all&iacute; donde sus formas se vuelven significativas.</p>\r\n\r\n<p>El paisatge l&iacute;quido bebe de muchas fuentes y se materializa de muchas maneras. Asocia conceptos, creencias y formas. Lo articulan lenguajes familiares conjuntamente con otras interpretaciones subjectivas. Una visi&oacute;n que se expresa para ser compartida, pero fluct&uacute;a por diferentes niveles de lectura. Como una persona, como una poes&iacute;a, como una acci&oacute;n.</p>\r\n	2022-01-05 20:33:13.000204	2022-01-10 11:24:54.457683
29	14	es		<p>En esta acci&oacute;n/instalaci&oacute;n se relacionan diferentes aspectos&nbsp;tan sutiles como esenciales de los lenguajes corporales que usamos en nuestra comunicaci&oacute;n cotidiana. Al ser ef&iacute;meros, el sentido de su rastro cambia en tota lectura posterior.</p>\r\n\r\n<p>La articulaci&oacute;n de algunos alfabetos naturales y culturales a trav&eacute;s del cuerpo tiene lugar en la acci&oacute;n de larga durada creada espec&iacute;ficamente in situ, en interacci&oacute;n con el entorno para hacer y deshacer poes&iacute;a sonora. Cada movimiento, cada trazo, cada fonema besar&aacute; el ahora. Lo que queda, son formas para ser reinterpretadas: arqueolog&iacute;as de la memoria.</p>\r\n	2022-01-10 11:45:29.806785	2022-01-10 11:45:29.809207
30	9	es		<p><br />\r\nad hoc<br />\r\n<br />\r\ncreated or done for a particular purpose as necessary<br />\r\n&nbsp;</p>\r\n	2022-01-10 11:49:06.034632	2022-01-10 11:49:06.037286
20	19	ca	(Preguntes) sobre l'anar cap a o l'anar-se'n de	<p>La ruleta de la fortuna gira la seva roda en cicles de repetici&oacute;, rang i pot&egrave;ncia. Escolto&nbsp;veus ancestrals<br />\r\n&nbsp;i somnio on l&#39;ocell nia millor. Una dissociaci&oacute; interna mentre ens movem: Quines parts marxen, quines parts es resisteixen a marxar?<br />\r\nDi&agrave;spora del genoma, no nom&eacute;s la meva, potser una altra, apropiada perqu&egrave; l&#39;hem adoptat. Quant de temps hi ha<br />\r\nmentre no soc ni d&#39;aqu&iacute;/ni d&#39;all&agrave; o encara no he marxat del tot / encara no he arribat?<br />\r\nL&#39;un mateix, present, &eacute;s un lloc de perman&egrave;ncia, un eix? Els ocells migradors van o venen de? Una<br />\r\ngeneraci&oacute; m&eacute;s tard, els fills van a o tornen a? La idea del proc&eacute;s en progr&eacute;s. Qu&egrave; &eacute;s el que estira o empeny, marcant la<br />\r\ndirecci&oacute; i la intenci&oacute; d&#39;un pas: motivaci&oacute; o por? Em moc o estic sent despla&ccedil;at?<br />\r\nMarxar d&#39;un lloc segur &eacute;s com anar m&eacute;s enll&agrave; del que coneixem. L&#39;horitz&oacute;, com a lloc inexistent, una il&middot;lusi&oacute; visual, un quadre d&#39;art ut&ograve;pic, es mou a mesura que ens apropem. Quina visi&oacute; necessites per comen&ccedil;ar a caminar?</p>\r\n	2021-09-20 20:29:33.796924	2022-01-13 20:54:16.135356
\.


--
-- Name: section_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('section_translations_id_seq', 30, true);


--
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sections (id, content_id, content_type, "position", created_at, updated_at) FROM stdin;
1	29	0	1	2013-04-05 18:53:18.872714	2013-04-05 18:56:47.25782
2	29	0	2	2013-04-05 18:53:18.942055	2013-04-05 18:56:47.269763
3	9	0	1	2013-04-05 19:05:21.993125	2013-04-05 19:05:21.993125
15	74	0	1	2020-02-19 17:23:07.09484	2022-01-10 11:24:54.455101
14	75	0	1	2019-06-10 21:35:33.857657	2022-01-10 11:45:58.774972
6	33	0	1	2013-12-06 12:49:29.105921	2014-05-17 12:23:54.024482
9	38	0	1	2015-09-20 18:10:41.186507	2022-01-10 11:49:06.032702
19	87	0	1	2021-09-20 20:29:33.793828	2022-01-13 20:54:16.132685
7	42	0	1	2015-01-04 22:05:21.141442	2015-01-04 22:13:33.949414
8	43	0	1	2015-01-04 23:00:44.731254	2015-01-04 23:21:25.201969
5	31	0	1	2013-09-05 14:59:31.645367	2015-09-20 18:04:25.996863
4	8	0	1	2013-04-05 19:27:48.599027	2015-09-25 01:15:09.45399
10	56	0	1	2016-10-19 22:54:30.208476	2017-06-02 00:09:34.299605
12	66	0	1	2018-08-22 15:12:28.282722	2018-12-21 20:19:42.844153
11	59	0	1	2017-06-01 22:46:09.171663	2019-03-07 22:10:16.100687
16	81	0	1	2020-02-19 18:07:36.343326	2020-02-19 18:09:01.869408
17	85	0	1	2021-04-08 21:31:03.854723	2021-09-26 20:50:13.261414
18	88	0	1	2021-09-20 19:33:22.580133	2022-01-05 20:16:55.139998
20	72	0	1	2022-01-05 21:06:26.087117	2022-01-05 21:06:26.087117
13	67	0	1	2018-08-22 15:22:59.119266	2022-01-05 21:12:29.953006
\.


--
-- Name: sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sections_id_seq', 20, true);


--
-- Data for Name: tag_translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tag_translations (id, tag_id, locale, name, created_at, updated_at) FROM stdin;
1	1	ca	dansa	2012-10-29 18:42:31.571497	2012-10-29 18:42:31.577401
5	1	en	dance	2012-10-29 18:55:28.185695	2012-10-29 18:55:28.188629
6	1	es	danza	2012-10-29 18:55:28.203152	2012-10-29 18:55:28.206018
11	5	ca	corpologia	2013-01-04 20:22:42.068527	2013-01-04 20:22:42.072901
12	5	en	corpologia	2013-01-04 20:23:53.86588	2013-01-04 20:23:53.871008
13	5	es	corpologia	2013-01-04 20:23:53.887166	2013-01-04 20:23:53.891467
16	6	ca	pintura	2013-01-04 20:32:18.181964	2013-01-04 20:32:18.185506
17	6	en	paintings	2013-01-04 20:33:26.64173	2013-01-04 20:33:26.645905
18	6	es	pintura	2013-01-04 20:33:26.665072	2013-01-04 20:33:26.669174
19	7	ca	live-drawing	2013-01-04 20:49:45.14581	2013-01-04 20:49:45.160126
20	7	en	live-drawing	2013-01-04 20:50:30.286029	2013-01-04 20:50:30.290435
21	7	es	live-drawing	2013-01-04 20:50:30.303891	2013-01-04 20:50:30.307886
22	8	ca	obra sobre paper	2013-01-04 20:55:13.937664	2013-01-04 20:55:13.956217
24	10	ca	poesia	2013-01-04 21:08:26.95914	2013-01-04 21:08:26.963895
25	10	en	poetry	2013-01-04 21:11:24.221859	2013-01-04 21:11:24.227959
26	10	es	poesía	2013-01-04 21:11:24.255258	2013-01-04 21:11:24.260365
28	9	es	instalación	2013-01-04 21:11:42.508379	2013-01-04 21:11:42.513237
27	9	en	instalation	2013-01-04 21:11:42.472711	2013-01-04 21:11:51.336207
29	8	en	work on paper	2013-01-04 21:12:17.156945	2013-01-04 21:12:17.161399
31	11	ca	escultura	2013-01-05 00:55:50.504379	2013-01-05 00:55:50.509123
33	13	ca	dibuix	2013-01-05 01:30:12.283621	2013-01-05 01:30:12.288096
34	14	ca	obra gràfica original	2013-01-05 01:36:08.808897	2013-01-05 01:36:08.812854
35	11	en	sculpture	2013-01-05 01:59:37.246614	2013-01-05 01:59:37.250715
36	11	es	escultura	2013-01-05 01:59:37.269881	2013-01-05 01:59:37.273848
39	13	en	drawing	2013-01-05 01:59:46.100143	2013-01-05 01:59:46.103757
40	13	es	dibujo	2013-01-05 01:59:46.124759	2013-01-05 01:59:46.128962
41	14	en	prints	2013-01-05 01:59:49.082537	2013-01-05 01:59:49.086088
42	14	es	obra gráfica original	2013-01-05 01:59:49.105874	2013-01-05 01:59:49.110642
44	16	ca	llibre	2013-01-20 02:25:58.699001	2013-01-20 02:25:58.703181
45	16	en	book	2013-01-20 02:42:09.328749	2013-01-20 02:42:09.353698
46	16	es	libro	2013-01-20 02:42:09.380637	2013-01-20 02:42:09.386213
47	15	es	ilustración	2013-01-20 02:42:24.649838	2013-01-20 02:42:24.657849
48	15	en	illustration	2013-01-20 02:42:24.654556	2013-03-30 20:33:55.160105
30	8	es	obra sobre papel	2013-01-04 21:12:17.185276	2013-03-30 20:34:49.77027
49	17	ca	acció sonora	2013-04-05 15:02:44.212836	2013-04-05 15:02:44.212836
50	17	en	sound action	2013-04-05 15:05:57.103622	2013-04-05 15:05:57.109032
51	17	es	acción sonora	2013-04-05 15:05:57.131685	2013-04-05 15:05:57.136927
52	18	ca	acció poètica	2015-01-04 23:00:30.014269	2015-01-04 23:00:30.014269
53	19	ca	acció col.lectiva	2015-01-04 23:23:54.266821	2015-01-04 23:23:54.266821
72	26	es	land art	2019-06-10 20:06:02.696456	2021-09-20 19:37:15.657863
58	19	en	collective performance	2015-09-27 22:20:59.858286	2015-09-27 22:20:59.86496
59	19	es	acción colectiva	2015-09-27 22:20:59.894902	2015-09-27 22:20:59.901361
60	18	es	acción poética	2015-09-27 22:21:24.12161	2015-09-27 22:21:24.125633
61	21	en	performance	2015-09-27 22:22:41.625433	2015-09-27 22:22:41.629312
86	32	ca	procés col·lectiu	2021-09-26 16:49:29.317474	2021-09-26 16:54:23.544648
43	15	ca	il·lustració	2013-01-20 02:25:58.671586	2015-09-27 22:23:39.93387
23	9	ca	instal·lació	2013-01-04 21:08:26.90975	2015-09-27 22:23:41.159891
63	18	en	poetry	2015-09-27 22:24:47.425436	2015-09-27 22:24:47.431558
68	23	en	social art performance	2018-12-21 20:08:10.895393	2018-12-21 20:08:10.899257
69	23	es	acción artística social	2018-12-21 20:08:10.916252	2018-12-21 20:08:10.920072
62	21	es	performance	2015-09-27 22:22:41.646011	2019-06-10 20:05:38.566569
71	26	en	land-art	2019-06-10 20:06:02.680525	2019-06-10 20:06:02.685113
73	27	ca	poesia visual	2019-06-10 21:53:24.912377	2019-06-10 21:53:24.912377
74	27	en	visual poetry	2019-06-10 21:55:00.776565	2019-06-10 21:55:00.780318
75	27	es	poesía visual	2019-06-10 21:55:00.796799	2019-06-10 21:55:00.800596
76	28	ca	art participatiu	2020-06-15 15:27:55.71982	2020-06-15 15:27:55.71982
65	23	ca	acció artística social	2018-08-22 15:06:01.714501	2020-06-15 15:31:25.877684
78	28	en	participatory art	2020-06-15 15:33:25.599312	2020-06-15 15:33:25.603774
79	28	es	arte participativo	2020-06-15 15:33:25.623532	2020-06-15 15:33:25.627565
55	21	ca	performance	2015-01-05 00:13:25.84741	2020-09-21 12:34:56.352634
80	30	ca	video-acció	2021-04-08 21:30:55.593413	2021-04-08 21:30:55.593413
81	30	en	video performance	2021-04-08 21:31:43.373141	2021-04-08 21:31:43.377127
82	30	es	video-acción	2021-04-08 21:31:43.394487	2021-04-08 21:31:43.398584
83	31	ca	art efímer	2021-09-20 19:33:22.469007	2021-09-20 19:33:22.469007
84	31	en	ephemeral art	2021-09-20 19:37:01.103655	2021-09-20 19:37:01.106298
85	31	es	arte efímero	2021-09-20 19:37:01.117442	2021-09-20 19:37:01.119797
70	26	ca	land-art o art natura	2019-04-10 23:03:30.913316	2021-09-20 19:37:15.633959
89	32	en	group process	2021-09-26 16:54:23.555986	2021-09-26 16:54:23.558283
90	32	es	proceso colectivo	2021-09-26 16:54:23.568773	2021-09-26 16:54:23.571053
91	35	es	obra original sobre papel	2022-01-05 21:20:49.915559	2022-01-05 21:20:49.915559
92	35	ca	obra original sobre paper	2022-01-05 21:21:36.331446	2022-01-05 21:21:36.334137
93	35	en	original work on paper	2022-01-05 21:21:36.346476	2022-01-05 21:21:36.348953
\.


--
-- Name: tag_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tag_translations_id_seq', 93, true);


--
-- Data for Name: taggings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY taggings (id, tag_id, taggable_type, taggable_id, created_at, updated_at) FROM stdin;
681	10	Work	75	2022-01-10 11:45:58.677547	2022-01-10 11:45:58.677547
517	11	Work	70	2020-09-20 21:15:52.22018	2020-09-20 21:15:52.22018
682	9	Work	75	2022-01-10 11:45:58.682215	2022-01-10 11:45:58.682215
519	17	Work	81	2020-09-20 21:21:00.623163	2020-09-20 21:21:00.623163
15	9	Work	11	2013-01-05 00:51:53.529397	2013-01-05 00:51:53.529397
16	11	Work	11	2013-01-05 00:55:50.527103	2013-01-05 00:55:50.527103
683	8	Work	75	2022-01-10 11:45:58.68652	2022-01-10 11:45:58.68652
520	9	Work	81	2020-09-20 21:21:00.633545	2020-09-20 21:21:00.633545
521	11	Work	81	2020-09-20 21:21:00.642112	2020-09-20 21:21:00.642112
684	18	Work	75	2022-01-10 11:45:58.690684	2022-01-10 11:45:58.690684
685	21	Work	38	2022-01-10 11:49:05.929309	2022-01-10 11:49:05.929309
25	1	Work	15	2013-01-20 00:30:44.912037	2013-01-20 00:30:44.912037
26	10	Work	15	2013-01-20 00:30:44.938692	2013-01-20 00:30:44.938692
686	9	Work	38	2022-01-10 11:49:05.934758	2022-01-10 11:49:05.934758
687	11	Work	38	2022-01-10 11:49:05.939635	2022-01-10 11:49:05.939635
33	9	Work	16	2013-01-20 01:03:16.197571	2013-01-20 01:03:16.197571
688	32	Work	87	2022-01-13 20:54:16.058058	2022-01-13 20:54:16.058058
689	30	Work	87	2022-01-13 20:54:16.063706	2022-01-13 20:54:16.063706
46	1	Work	18	2013-01-22 03:07:57.13106	2013-01-22 03:07:57.13106
690	21	Work	87	2022-01-13 20:54:16.068721	2022-01-13 20:54:16.068721
49	9	Work	23	2013-03-27 21:32:17.812245	2013-03-27 21:32:17.812245
50	10	Work	23	2013-03-27 21:32:17.814903	2013-03-27 21:32:17.814903
59	8	Work	17	2013-03-28 00:07:10.370251	2013-03-28 00:07:10.370251
63	15	Work	26	2013-03-28 01:20:39.590467	2013-03-28 01:20:39.590467
64	8	Work	26	2013-03-28 01:20:39.593428	2013-03-28 01:20:39.593428
65	16	Work	26	2013-03-28 01:20:39.59595	2013-03-28 01:20:39.59595
68	6	Work	6	2013-03-28 01:44:05.391596	2013-03-28 01:44:05.391596
69	10	Work	6	2013-03-28 01:44:05.394322	2013-03-28 01:44:05.394322
79	7	Work	27	2013-04-05 16:13:48.323069	2013-04-05 16:13:48.323069
80	9	Work	27	2013-04-05 16:13:48.332029	2013-04-05 16:13:48.332029
81	17	Work	27	2013-04-05 16:13:48.341013	2013-04-05 16:13:48.341013
85	15	Work	29	2013-04-05 18:56:47.086945	2013-04-05 18:56:47.086945
86	8	Work	29	2013-04-05 18:56:47.097459	2013-04-05 18:56:47.097459
87	16	Work	29	2013-04-05 18:56:47.107504	2013-04-05 18:56:47.107504
90	5	Work	9	2013-04-05 19:05:21.752616	2013-04-05 19:05:21.752616
534	11	Work	78	2020-10-14 23:00:07.666433	2020-10-14 23:00:07.666433
549	18	Work	84	2021-08-31 23:06:52.002281	2021-08-31 23:06:52.002281
550	21	Work	84	2021-08-31 23:06:52.009598	2021-08-31 23:06:52.009598
100	5	Work	24	2013-06-19 15:49:35.481969	2013-06-19 15:49:35.481969
551	16	Work	84	2021-08-31 23:06:52.015541	2021-08-31 23:06:52.015541
552	23	Work	77	2021-08-31 23:07:42.363915	2021-08-31 23:07:42.363915
294	5	Work	56	2017-06-02 00:09:34.11498	2017-06-02 00:09:34.11498
295	21	Work	56	2017-06-02 00:09:34.136691	2017-06-02 00:09:34.136691
203	9	Work	31	2015-09-20 18:04:25.9152	2015-09-20 18:04:25.9152
204	10	Work	31	2015-09-20 18:04:25.932719	2015-09-20 18:04:25.932719
653	23	Work	72	2022-01-05 21:06:26.013642	2022-01-05 21:06:26.013642
654	26	Work	72	2022-01-05 21:06:26.019027	2022-01-05 21:06:26.019027
655	11	Work	72	2022-01-05 21:06:26.02362	2022-01-05 21:06:26.02362
656	21	Work	67	2022-01-05 21:12:29.868347	2022-01-05 21:12:29.868347
299	21	Work	57	2017-06-02 00:57:42.76304	2017-06-02 00:57:42.76304
657	7	Work	67	2022-01-05 21:12:29.873864	2022-01-05 21:12:29.873864
301	7	Work	57	2017-06-02 00:57:42.802979	2017-06-02 00:57:42.802979
659	9	Work	64	2022-01-05 21:20:49.940297	2022-01-05 21:20:49.940297
660	35	Work	64	2022-01-05 21:20:49.944781	2022-01-05 21:20:49.944781
217	8	Work	8	2015-09-25 01:15:04.503367	2015-09-25 01:15:04.503367
219	9	Work	8	2015-09-25 01:15:04.518094	2015-09-25 01:15:04.518094
220	10	Work	8	2015-09-25 01:15:04.525023	2015-09-25 01:15:04.525023
222	19	Work	47	2015-09-27 22:42:43.638605	2015-09-27 22:42:43.638605
600	21	Work	85	2021-09-26 20:50:13.185813	2021-09-26 20:50:13.185813
601	30	Work	85	2021-09-26 20:50:13.190631	2021-09-26 20:50:13.190631
228	5	Work	46	2016-08-01 15:23:05.650402	2016-08-01 15:23:05.650402
229	5	Work	48	2016-08-01 15:36:44.480106	2016-08-01 15:36:44.480106
139	9	Work	36	2014-05-17 12:17:29.290198	2014-05-17 12:17:29.290198
388	21	Work	69	2019-01-28 20:33:59.945633	2019-01-28 20:33:59.945633
142	5	Work	34	2014-05-17 12:19:36.699762	2014-05-17 12:19:36.699762
667	26	Work	44	2022-01-05 21:38:07.39756	2022-01-05 21:38:07.39756
668	21	Work	44	2022-01-05 21:38:07.402577	2022-01-05 21:38:07.402577
145	17	Work	33	2014-05-17 12:23:53.885253	2014-05-17 12:23:53.885253
146	10	Work	33	2014-05-17 12:23:53.891807	2014-05-17 12:23:53.891807
147	1	Work	33	2014-05-17 12:23:53.898598	2014-05-17 12:23:53.898598
669	26	Work	73	2022-01-05 21:43:08.585293	2022-01-05 21:43:08.585293
149	5	Work	37	2014-05-17 12:35:52.122448	2014-05-17 12:35:52.122448
150	8	Work	37	2014-05-17 12:35:52.133956	2014-05-17 12:35:52.133956
672	14	Work	14	2022-01-10 11:21:20.67074	2022-01-10 11:21:20.67074
393	19	Work	68	2019-03-07 22:05:12.34874	2019-03-07 22:05:12.34874
394	21	Work	59	2019-03-07 22:10:15.958474	2019-03-07 22:10:15.958474
237	18	Work	52	2016-08-01 16:59:31.463289	2016-08-01 16:59:31.463289
238	5	Work	52	2016-08-01 16:59:31.470255	2016-08-01 16:59:31.470255
239	18	Work	49	2016-08-01 17:00:18.628472	2016-08-01 17:00:18.628472
162	11	Work	30	2014-10-09 17:18:44.728089	2014-10-09 17:18:44.728089
675	14	Work	74	2022-01-10 11:24:54.36432	2022-01-10 11:24:54.36432
676	8	Work	74	2022-01-10 11:24:54.369086	2022-01-10 11:24:54.369086
247	19	Work	51	2016-08-05 11:39:07.542653	2016-08-05 11:39:07.542653
169	5	Work	41	2014-11-03 23:30:04.558152	2014-11-03 23:30:04.558152
172	9	Work	35	2015-01-04 21:35:15.002672	2015-01-04 21:35:15.002672
175	17	Work	39	2015-01-04 21:39:23.484924	2015-01-04 21:39:23.484924
250	19	Work	40	2016-08-05 12:02:03.811572	2016-08-05 12:02:03.811572
181	10	Work	42	2015-01-04 22:13:33.793967	2015-01-04 22:13:33.793967
184	18	Work	43	2015-01-04 23:21:23.556368	2015-01-04 23:21:23.556368
185	5	Work	43	2015-01-04 23:21:23.567593	2015-01-04 23:21:23.567593
410	7	Work	7	2019-06-10 20:19:22.354383	2019-06-10 20:19:22.354383
412	1	Work	7	2019-06-10 20:19:22.37285	2019-06-10 20:19:22.37285
338	21	Work	66	2018-12-21 20:19:40.548503	2018-12-21 20:19:40.548503
339	5	Work	66	2018-12-21 20:19:40.555481	2018-12-21 20:19:40.555481
537	21	Work	83	2021-01-04 20:49:41.57467	2021-01-04 20:49:41.57467
538	28	Work	83	2021-01-04 20:49:41.582213	2021-01-04 20:49:41.582213
445	21	Work	62	2019-06-10 22:28:06.185876	2019-06-10 22:28:06.185876
632	14	Work	92	2022-01-05 20:02:40.402393	2022-01-05 20:02:40.402393
493	28	Work	54	2020-06-15 15:27:55.779648	2020-06-15 15:27:55.779648
634	13	Work	82	2022-01-05 20:07:42.721888	2022-01-05 20:07:42.721888
495	23	Work	65	2020-06-15 15:34:09.215624	2020-06-15 15:34:09.215624
635	13	Work	13	2022-01-05 20:10:05.519543	2022-01-05 20:10:05.519543
497	28	Work	65	2020-06-15 15:34:09.234324	2020-06-15 15:34:09.234324
636	21	Work	13	2022-01-05 20:10:05.524248	2022-01-05 20:10:05.524248
637	31	Work	88	2022-01-05 20:16:55.050659	2022-01-05 20:16:55.050659
638	9	Work	88	2022-01-05 20:16:55.055614	2022-01-05 20:16:55.055614
639	26	Work	88	2022-01-05 20:16:55.060266	2022-01-05 20:16:55.060266
640	11	Work	71	2022-01-05 20:21:12.626426	2022-01-05 20:21:12.626426
462	17	Work	53	2020-02-19 17:17:17.1457	2020-02-19 17:17:17.1457
499	9	Work	19	2020-06-15 15:36:58.096735	2020-06-15 15:36:58.096735
500	28	Work	19	2020-06-15 15:36:58.105762	2020-06-15 15:36:58.105762
501	23	Work	19	2020-06-15 15:36:58.115241	2020-06-15 15:36:58.115241
644	21	Work	76	2022-01-05 20:26:16.273078	2022-01-05 20:26:16.273078
645	27	Work	76	2022-01-05 20:26:16.277981	2022-01-05 20:26:16.277981
646	14	Work	76	2022-01-05 20:26:16.282367	2022-01-05 20:26:16.282367
514	28	Work	55	2020-06-15 15:43:34.279057	2020-06-15 15:43:34.279057
515	23	Work	55	2020-06-15 15:43:34.287067	2020-06-15 15:43:34.287067
\.


--
-- Name: taggings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('taggings_id_seq', 690, true);


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tags (id, created_at, updated_at, slug_en, slug_es, slug_ca, taggings_count) FROM stdin;
13	2013-01-05 01:30:12.281032	2022-01-05 20:10:05.551677	drawing	dibujo	dibuix	2
32	2021-09-26 16:49:29.307532	2022-01-13 20:54:16.145591	group-process--4	proceso-colectivo	proces-col-lectiu	1
30	2021-04-08 21:30:55.578699	2022-01-13 20:54:16.146657	video-performance	video-accion	video-accio	2
21	2015-01-05 00:13:25.83929	2022-01-13 20:54:16.147283	performance--2	accion	performance	15
26	2019-04-10 23:03:30.908422	2022-01-05 21:43:08.666358	land-art	land-art	land-art-o-art-natura	4
35	2022-01-05 21:20:49.910361	2022-01-05 21:21:36.35917	original-work-on-paper	obra-original-sobre-papel	obra-original-sobre-paper	1
31	2021-09-20 19:33:22.462251	2022-01-05 20:16:55.151516	ephemeral-art	arte-efimero	art-efimer	1
19	2015-01-04 23:23:54.260462	2021-09-20 19:36:55.676141	collective-performance	accion-colectiva	accio-col-lectiva	4
17	2013-04-05 15:02:44.11078	2021-09-20 19:36:59.199289	sound-action	accion-sonora	accio-sonora	5
28	2020-06-15 15:27:55.712575	2021-09-20 19:37:03.235076	participatory-art	arte-participativo	art-participatiu	5
10	2013-01-04 21:08:26.956849	2022-01-10 11:45:58.784477	poetry--3	poesia	poesia	8
5	2013-01-04 20:22:42.066845	2021-09-20 19:37:04.749941	corpologia	corpologia	corpologia	11
8	2013-01-04 20:55:13.933435	2022-01-10 11:45:58.785941	work-on-paper	obra-sobre-papel	obra-sobre-paper	7
18	2015-01-04 23:00:30.003142	2022-01-10 11:45:58.786469	poetry--2	accion-poetica	accio-poetica	5
1	2012-10-29 18:42:31.567016	2021-09-20 19:37:06.339597	dance	danza	dansa	4
6	2013-01-04 20:32:18.180271	2019-06-10 21:02:35.326056	paintings	pintura	pintura	1
23	2018-08-22 15:06:01.704448	2022-01-05 21:06:26.100184	social-art-performance	accion-artistica-social	accio-artistica-social	5
14	2013-01-05 01:36:08.807148	2022-01-10 11:24:54.46517	prints	obra-grafica-original	obra-grafica-original	4
15	2013-01-20 02:25:58.66069	2021-09-20 19:37:11.22905	illustration	ilustracion	il-lustracio	2
7	2013-01-04 20:49:45.143651	2022-01-05 21:12:29.966798	live-drawing	live-drawing	live-drawing	4
9	2013-01-04 21:08:26.907543	2022-01-10 11:49:06.048257	instalation	instalacion	instal-lacio	14
27	2019-06-10 21:53:24.906665	2022-01-05 20:26:16.350061	visual-poetry	poesia-visual	poesia-visual	1
11	2013-01-05 00:55:50.500097	2022-01-10 11:49:06.048927	sculpture	escultura	escultura	8
16	2013-01-20 02:25:58.696969	2021-09-20 19:37:20.017604	book	libro	llibre	3
\.


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tags_id_seq', 35, true);


--
-- Data for Name: work_translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY work_translations (id, work_id, locale, title, description, techniques, place, created_at, updated_at) FROM stdin;
10	9	es	E qui libri (s) II	<p>\r\n\tCORPOLOGIA 9</p>\r\n<p>\r\n\tEquilibri, de aequilibrium: aequus = igual y libra=balanza, peso He (a)qu&iacute; He a qui&eacute;n libris: de los libros o de los libres de libertas: volver a la madre</p>\r\n<p>\r\n\tFragmento del proceso del equilibrio de lecturas abiertas y cruzadas del peso propio i el exterior, del cuerpo &iacute;ntimo delante del cuerpo p&uacute;blico de factores intencionados o involuntarios, de la acci&oacute;n de fuerzas que implico o se implican y contrarestan m&uacute;tuamente, de los v&iacute;nculos de la palabra-voz y la palabra-papel, el papel de la relaci&oacute;n, de la (con)fusi&oacute;n de estratos de percepci&oacute;n i memoria en la armon&iacute;a del conjunto.</p>\r\n<p>\r\n\tLos factores (siempre) cambiantes niegan un estado de equilibrio estable, un resultado, y evidencian un proceso puro de incesante movimento que tiende a la justeza y la armon&iacute;a en la unidad.</p>\r\n<p>\r\n\t...et qui est libre?</p>\r\n	\N	Antic Teatre, Barcelona	2013-01-04 23:01:43.390395	2013-03-27 23:42:28.181869
6	6	ca	ZeNits / 1	<p>\r\n\tPoemes d&#39;Eva Puig. Exposici&oacute; CTN La Floresta</p>\r\n	tècnica mixta sobre fusta	\N	2013-01-04 20:32:20.744798	2013-03-28 01:44:05.514606
11	10	ca	anima(l), U	<p>\r\n\tAlma mater. Coto vedado. Caza y captura de interrogantes abiertos, pero encadenados en espiral, sobre la identidad en desequilibrio entre consciencia espiritual y cuerpo de especie animal capaz de olvidar que lo es, era y ser&aacute;. Memoria embrionaria de origen que niega, domestica, objetualiza y crea imaginarios</p>\r\n<p>\r\n\t&iquest;para entender o redimirse? &iquest;Por casualidad? &iquest;Por curiosidad?</p>\r\n<p>\r\n\tDesvelar la condici&oacute;n b&aacute;sica de nuestra animalidad subraya la condici&oacute;n humana. U. In secula seculorum...</p>\r\n<p>\r\n\t&nbsp;</p>\r\n<p>\r\n\thttp://www.avui.cat/noticia/article/5-cultura/19-cultura/378596-el-fem11-ja-bull.html</p>\r\n	\N	FEM / Centre Cultural La Mercè / Girona	2013-01-05 00:35:49.828799	2013-01-05 00:38:00.877773
12	11	ca	Dinergia I,II,III	<p>\r\n\tDinergia I - Llavors... Dinergia II - Armonia Diat&eacute;ssaron&nbsp; Dinergia III - Auria ad infinitum &nbsp;Materials: Dinergia I: Llavor natural, Fil de coure, paper, pedra, respecte&nbsp; Dinergia II: Llavor natural, Fil de coure, paper i tinta, vidre, agra&iuml;ment&nbsp; Dinergia III: Petxina natural, Fil de coure, pedra de lava, mirall, amor &nbsp;</p>\r\n<p>\r\n\t&quot;Dinergia: Els processos i patrons b&agrave;s&igrave;cs de formaci&oacute; i creaci&oacute;, amb els seus l&iacute;mits estrictes i les proporcions &agrave;uries omnipresents, ens reflecteixen en petit format la perfecci&oacute; infinita de l&#39;armonia i pres&egrave;ncia del tot etern, il.limitat, aix&iacute; com l&#39;abs&egrave;ncia de fronteres entre ci&egrave;ncia, art, filosofia i misticisme.&quot;</p>\r\n<p>\r\n\tFESTIVAL MaMa d&#39;Art Contemporani, Madremanya, Girona</p>\r\n		\N	2013-01-05 00:51:53.536201	2013-01-05 00:55:50.542169
13	12	ca	musical ment	<p>\r\n\tL&#39;obra &eacute;s una instal.laci&oacute;/performance col.lectiva on conflueixen l&rsquo;escultura, el so i el moviment, creant un di&agrave;leg interdisciplinar entre la mat&egrave;ria, el silenci i l&rsquo;expressi&oacute; corporal.&nbsp;&nbsp;&nbsp;\r\n\t&nbsp;\r\n\tUna escultura sonora &eacute;s l&rsquo;element central i fil conductor de la composici&oacute; musical i ; a trav&eacute;s del silenci i el so s&#39;experimenta amb l&rsquo;efecte que el ritme i la m&uacute;sica tenen sobre la ment, el cos i els sentiments.&nbsp; El moviment del cos dibuixa l&#39;espai i acciona, tra&ccedil;a camins paral.lels.\r\n\tL&#39;escultura de ferro i fusta, de 3m d&#39;al&ccedil;ada i di&agrave;metre, estructura l&#39;espai del moviment; l&#39;espectador es pot moure al voltant de l&#39;acci&oacute; i percebre el conjunt des de diverses perspectives visuals i sonores.</p>\r\n<p>\r\n\tEscultura i direcci&oacute;: Yago Del&agrave;s\r\n\tFotografia: Mireia Tor\r\n\tM&uacute;sics i artistes: Yago Del&agrave;s, X&egrave;nia Gassull, Adri&agrave; L&oacute;pez, N&uacute;ria Mad&iacute;, Simon Saura, Ruth Soler, Jordi Vinyoles, Mireia Zantop</p>\r\n	\N	Casa de Cultura de Girona / Plaça de la Vila,Viladrau / Festival de percussió, Centelles	2013-01-05 01:21:09.043867	2013-01-05 01:21:09.064496
14	13	ca	constelaccions	<p>\r\n\tAcci&oacute; in&egrave;dita realitzada amb Elisabetta Balasso.</p>\r\n	dibuix sobre pell	\N	2013-01-05 01:30:15.252021	2013-01-05 01:30:15.48331
15	14	ca	AflorA		calcografia i serigrafia	\N	2013-01-05 01:36:10.271251	2013-01-05 01:36:10.275731
16	15	ca	impro	<p>\r\n\tRosa Abuchaibe, Hanneke Ilse, Mireia Zantop (23 Marzo.2012, 18h, Laberinto de Ariadna)</p>\r\n<p>\r\n\tRosa Abuchaibe, poeta, escribe relatos y versos.</p>\r\n<p>\r\n\tHanneke Ilse, trompetista, toca en varios grupos y cultiva desde hace a&ntilde;os diversos estilos musicales.</p>\r\n<p>\r\n\tMireia Zantop, pintora, grabadora y performer, trabaja sobre los lenguajes del cuerpo en su obra pl&aacute;stica y esc&eacute;nica.</p>\r\n<p>\r\n\tEn esta pieza se reencuentran tres lenguajes art&iacute;sticos. La m&uacute;sica, la palabra y el movimiento se complementan en un todo fruto de la conexi&oacute;n entre las personas, el aqu&iacute; y el ahora. Es el arte ef&iacute;mero de la improvisaci&oacute;n.</p>\r\n<p>\r\n\tImparte: Anna Rossell</p>\r\n	\N	Ateneu Barcelonès, Barcelona	2013-01-05 01:58:06.680323	2013-01-20 00:30:45.073577
9	9	ca	E qui libri (s) II	<p>performance a CORPOLOGIA 9</p>\r\n	\N	Antic Teatre, Barcelona	2013-01-04 22:53:54.222335	2013-04-05 19:05:22.008013
17	16	ca	OUROBOROS (veus?)	<p>\r\n\tInsaciable, Ouroboros, el monstre que es menja a s&iacute; mateix.<br />\r\n\tCicle infinit?<br />\r\n\tEl m&eacute;s contradictori del proc&eacute;s &eacute;s que l&#39;acusat de provocar-lo i la v&iacute;ctima de les seves conseq&uuml;&egrave;ncies &eacute;s la mateixa: el monstre, tu, jo.</p>\r\n	\N	Brossa, caos i art | Exposició a Casa Elizalde | Barcelona	2013-01-20 00:53:58.813752	2013-01-20 00:55:10.001451
40	34	en	sum(us)	<p>CORPOLOGIA 13 en el marc de l&#39;exposici&oacute; <strong>Cargol treu banya</strong>.</p>\r\n\r\n<p>sum(us)</p>\r\n\r\n<p>I<br />\r\nsum (lat.): s&oacute;c (cat.), soy (es.)<br />\r\nsumus (lat.): som (cat.), somos (es.)</p>\r\n\r\n<p>s&oacute;c<br />\r\n(s)i som<br />\r\nsi hi som</p>\r\n\r\n<p>II<br />\r\nsum (eng.): suma<br />\r\nus (eng.): nosaltres (cat.), nosotros (es.)<br />\r\nus (cat.): os, a vosotros, to you</p>\r\n\r\n<p>sumant-nos&nbsp; som.<br />\r\nSumeu-nos<br />\r\nsumeu-vos<br />\r\nsomieu-vos</p>\r\n\r\n<p>&quot;...que tots els espectadors passin a l&#39;acci&oacute;.&quot;</p>\r\n\r\n<p>Nos habebat, nos habebit humus.</p>\r\n\r\n<p>Entretant:<br />\r\ntemps de consci&egrave;ncia.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href="https://vimeo.com/83686197">https://vimeo.com/83686197</a></p>\r\n\r\n<p><a href="https://vimeo.com/user14560762">https://vimeo.com/user14560762</a></p>\r\n	\N	Casa Elizalde, Barcelona	2014-05-17 12:13:12.6868	2014-05-17 12:19:18.303007
26	24	es	S/T: sin título	<p>\r\n\tCorpologia 10</p>\r\n<p>\r\n\tPuerta de entrada: portada en blanco.<br />\r\n\tEntre m&iacute; y todos, tiempo com&uacute;n i dos libros sin un solo t&iacute;tulo.<br />\r\n\tPuerta dos, portadores.<br />\r\n\tSe unen, p&aacute;gina a p&aacute;gina, en un cuerpo que no quiere dividirse. Se diferencian por palabra y pensamiento propio, se encuentran entre l&iacute;neas.<br />\r\n\tPuerta tres, al p&uacute;blico.<br />\r\n\tEje de equilibrio. Cruce de enlace mientras act&uacute;a la fuerza del roce y la tensi&oacute;n, atenci&oacute;n.<br />\r\n\tV&iacute;nculo fr&aacute;gil pero contundente arn&eacute;s m&uacute;tuo que aguanta el instante, el tiempo justo. Pueden ser horas, segundos, seg&uacute;n.</p>\r\n<p>\r\n\t<br />\r\n\t&quot;por favor, con calma, os pido que pens&eacute;is un t&iacute;tulo para esta acci&oacute;n. Cuando lo teng&aacute;is, levantad la mano derecha.&quot;<br />\r\n\t...<br />\r\n\tdigo ssss/t.<br />\r\n\tescribo S/T</p>\r\n<p>\r\n\t&quot;Gracias. Yo tambi&eacute;n prometo no decirlo nunca a nadie.&quot;</p>\r\n<p>\r\n\t(y no dud&eacute;is que me muero de ganas de saberlos)</p>\r\n<p>\r\n\tSujeto subjetivo sujetado a dos bandas. Reflejo-reflexi&oacute;n de experiencia.<br />\r\n\tCada uno es titular.</p>\r\n	\N	La Plaça, Celrà	2013-03-27 23:34:12.941673	2013-03-27 23:34:13.0084
18	17	ca	úters |	<p>\r\n\tArts i lletres de la m&agrave;. Exposici&oacute; amb Rosa Abuchaibe, Gloria Andrade, Pedro Blanco i Javier Quintanilla. Pati Llimona, Barcelona</p>\r\n	tècnica mixta sobre paper	\N	2013-01-20 01:01:02.209471	2013-03-28 00:07:10.428195
28	26	ca	El celler i +	<p>\r\n\tportades de t&iacute;tols de Noah Gordon per a Editorial Roca</p>\r\n		\N	2013-03-28 00:59:08.741807	2013-03-28 00:59:08.741807
19	18	ca	Itaca | pas a dos	<p>\r\n\tPerformance amb Eva Puig<br />\r\n\t<br />\r\n\t&Iacute;TACA<br />\r\n\t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\r\n\tQuan surts per fer el viatge cap a &Iacute;taca,<br />\r\n\thas de pregar que el cam&iacute; sigui llarg,<br />\r\n\tple d&#39;aventures, ple de coneixen&ccedil;a.<br />\r\n\tEls Lestr&iacute;gons i els C&iacute;clops,<br />\r\n\tl&#39;a&iuml;rat Posid&oacute;, no te n&#39;esfereixis:<br />\r\n\ts&oacute;n coses que en el teu cam&iacute; no trobar&agrave;s,<br />\r\n\tno, mai, si el pensament se&#39;t mant&eacute; alt, si una emoci&oacute; escollida<br />\r\n\tet toca l&#39;esperit i el cos alhora.<br />\r\n\tEls Lestr&iacute;gons i els C&iacute;clops,<br />\r\n\tel fero&ccedil; Posid&oacute;, mai no ser&agrave; que els topis<br />\r\n\tsi no els portes amb tu dins la teva &agrave;nima,<br />\r\n\tsi no &eacute;s la teva &agrave;nima que els dre&ccedil;a davant teu.<br />\r\n\t&nbsp;&nbsp;<br />\r\n\tHas de pregar que el cam&iacute; sigui llarg.<br />\r\n\tQue siguin moltes les matinades d&#39;estiu<br />\r\n\tque, amb quina delectan&ccedil;a, amb quina joia!<br />\r\n\tentrar&agrave;s en un port que els teus ulls ignoraven;<br />\r\n\tque et puguis aturar en mercats fenicis<br />\r\n\ti comprar-hi les bones coses que s&#39;hi exhibeixen,<br />\r\n\tcoral i nacres, ambres i banussos<br />\r\n\ti delicats perfums de tota mena:<br />\r\n\ttanta abundor com puguis de perfums delicats;<br />\r\n\tque vagis a ciutats d&#39;Egipte, a moltes,<br />\r\n\tper aprendre i aprendre dels que saben.<br />\r\n\t&nbsp;&nbsp;<br />\r\n\tSempre tingues al cor la idea d&#39;&Iacute;taca.<br />\r\n\tHas d&#39;arribar-hi, &eacute;s el teu dest&iacute;.<br />\r\n\tPer&ograve; no forcis gens la travessia.<br />\r\n\t&Eacute;s preferible que duri molts anys<br />\r\n\ti que ja siguis vell quan fondegis a l&#39;illa,<br />\r\n\tric de tot el que haur&agrave;s guanyat fent cam&iacute;,<br />\r\n\tsense esperar que t&#39;hagi de dar riqueses &Iacute;taca.<br />\r\n\t&nbsp;&nbsp;<br />\r\n\t&Iacute;taca t&#39;ha donat el bell viatge.<br />\r\n\tSense ella no hauries pas sortit cap a fer-lo.<br />\r\n\tRes m&eacute;s no t&eacute; que et pugui ja donar.<br />\r\n\t&nbsp;&nbsp;&nbsp;<br />\r\n\tI si la trobes pobra, no &eacute;s que &Iacute;taca t&#39;hagi enganyat.<br />\r\n\tSavi com b&eacute; t&#39;has fet, amb tanta experi&egrave;ncia,<br />\r\n\tja haur&agrave;s pogut comprendre qu&egrave; volen dir les &Iacute;taques.<br />\r\n\t&nbsp;&nbsp;<br />\r\n\tK.P.KAVAFIS, 1911<br />\r\n\tTrad. C. Riba</p>\r\n	\N	Teatre Sants i CCBesós, Barcelona	2013-01-20 02:15:46.404718	2013-01-22 03:07:57.16442
24	23	ca	6 senses (consentidOsinsentido)	<p>\r\n\tPerformance i instal.lacio a l&#39;exposicio Dones amb sentit&#39;s a carrec de Roser Girona</p>\r\n<p>\r\n\tDaU al sis sentits<br />\r\n\t(en clau de tu)</p>\r\n<p>\r\n\tSents?<br />\r\n\tSents cent ocells i l&#39;harmonia.<br />\r\n\tSents sons i suau son.<br />\r\n\tSents sol als ulls clucs, veus el que vols.<br />\r\n\tImagines la imatge, anotes el que notes:<br />\r\n\tCreus i crees imaginaccions.<br />\r\n\tSents la car&iacute;cia i la intenci&oacute;.<br />\r\n\tSents la mel i la seva llengua dol&ccedil;a.&nbsp;<br />\r\n\tSents l&#39;aroma del caf&egrave; i ensums el que sents.<br />\r\n\tT&#39;he sentit, t&eacute; sentit.<br />\r\n\tT&#39;afecta l&#39;afecte i l&#39;efecte del sent-i-ment.<br />\r\n\tI el sis&egrave; sentit m&eacute;s que el com&uacute;.</p>\r\n<p>\r\n\tAssents, dissents, consents i pressents en present.<br />\r\n\tHo sents: ergo ets<br />\r\n\tun tot sensible<br />\r\n\tamb sentit(s)</p>\r\n<p>\r\n\t&nbsp;</p>\r\n<p>\r\n\tTot i ser negat per irreprodu&iuml;ble i indemostrable, el sis&egrave; sentit t&eacute; nom propi. Segons Ramon Llull, els cinc sentits tradicionals proporcionen dades massa disperses per ser copsades per la ment. Defineix l&#39;afat, el sis&egrave; sentit com una facultat unificadora que atorga un concepte a les diferents sensacions que permet comunicar-lo mitjan&ccedil;ant la paraula.<br />\r\n\tLa neuroci&egrave;ncia ara explora el sis&egrave; sentit o la visi&oacute; mental premonit&ograve;ria dels canvis abans que es produeixin. El cervell crea patrons de mem&ograve;ria que s&oacute;n la font de la intuici&oacute;. Els mecanismes resten impredictibles, segurament, perque no els reconeixem prou com una forma complement&agrave;ria de la percepci&oacute;. Encara.</p>\r\n	\N	CCBarceloneta	2013-03-22 00:11:07.040939	2013-03-27 21:32:24.077723
29	27	ca	Sí, lent, sí, silenci		\N		2013-04-05 15:05:10.533417	2013-04-05 15:53:49.048616
31	29	ca	Grafies d'una mirada a Sarrià	<p>Quadern de viatge pel barri de Sarri&agrave; en una primavera. Llibre de la colecci&oacute; Carnet de Voyage editat per l&#39;Ajuntament de Barcelona.</p>\r\n	tècnica mixta sobre paper	\N	2013-04-05 18:53:18.958475	2013-04-05 18:56:47.283683
8	8	ca	dues Veus nues	<p>Exposici&oacute; i instal.laci&oacute; d&#39;obra sobre paper i poemes de Rosa Abuchaibe. Performance, improvisaci&oacute; d&#39;art i poesia amb Rosa Abuchaibe. Vil.la Florida, Barcelona</p>\r\n	mixta sobre paper 	\N	2013-01-04 20:55:14.000793	2013-04-05 19:27:48.627716
25	24	ca	S/T: sense títol	<p>Porta-1 d&#39;entrada: portada en blanc.<br />\r\nEntre mi i tots, temps com&uacute; i dos llibres sense un sol t&iacute;tol.<br />\r\nPorta-do(r)s.<br />\r\nS&#39;uneixen, p&agrave;gina a p&agrave;gina, en un cos que no vol dividir-se. Es diferencien per paraula i pensament propi, es troben entre l&iacute;nies.<br />\r\nPorta tres: em porta al p&uacute;blic.<br />\r\nEix d&#39;equilibri. Cru&iuml;lla d&#39;enlla&ccedil; mentre actua la for&ccedil;a del frec i la tensi&oacute;, atenci&oacute;.<br />\r\nLligam fr&agrave;gil per&ograve; contundent arn&eacute;s mutu que aguanta el instant, el temps just. Poden ser hores, segons.<br />\r\nPorta quatre mosquetons i corda que recorda: no estem nuats.</p>\r\n\r\n<p>&quot;Sisplau, amb la calma, us demano que penseu un t&iacute;tol per a aquesta acci&oacute;. Quan el tingueu, aixequeu la m&agrave; dreta.&quot;<br />\r\n...<br />\r\ndic: ssss/t.<br />\r\nescric S/T</p>\r\n\r\n<p>&quot;Gr&agrave;cies.<br />\r\nJo tamb&eacute; prometo no dir-ho mai a ning&uacute;.&quot;</p>\r\n\r\n<p>(i no dubteu que em moro de ganes de saber-los)</p>\r\n\r\n<p>Subjecte subjectat a dues bandes, reflexe-reflexi&oacute; d&#39;experi&egrave;ncia.<br />\r\nCadasc&uacute; n&#39;&eacute;s titular.</p>\r\n	\N	La Plaça, Celrà	2013-03-27 21:35:26.168316	2013-04-05 19:00:00.761269
32	30	ca	axis salus: homenatge al bon metge	<p>Premi al bon metge</p>\r\n\r\n<p>Paraules recollides en el proc&eacute;s de creaci&oacute; de l&#39;escultura -que acompanyaren el premi en composicions cal.ligr&agrave;fiques &uacute;niques- i que envolten l&#39;excel.l&egrave;ncia del bon metge. Valors i virtuts que van m&eacute;s enll&agrave; del coneixement cient&iacute;fic i l&#39;ex`peri&egrave;ncia fruit d&#39;estudis i praxis.&nbsp; Tenen m&eacute;s a veure amb la saviesa human&iacute;stica, el com usar el saber, com tractar el cos i l&#39;&agrave;nima de la persona. Nos&oacute;n mesurables, per&ograve; els reconeixem quan est&agrave;n presents.</p>\r\n\r\n<p>La pe&ccedil;a contempla la relaci&oacute; metge-pacient, tot i asim&egrave;trica, com un tot org&agrave;nic amb una base compartida, com un equillibri delicat, per&ograve; just, com un viatge profund a un centre com&uacute;, com una comunicaci&oacute; clara d&#39;escolta m&uacute;tua en la que parla el silenci.</p>\r\n\r\n<p>Tot el meu agra&iuml;ment i reconeixement a l&#39;equip de SEPAR i a tots els metges que dia a dia cultiven conscientment aquests valors que ens trascendeixen i fan m&eacute;s humans.</p>\r\n	escultura de bronze	\N	2013-08-20 12:50:53.349579	2013-08-20 12:50:53.349579
33	30	es	axis salus: homenaje al buen médico. Premio SEPAR	<p>Premio al Buen M&eacute;dico</p>\r\n\r\n<p>En el proceso de creaci&oacute;n de la escultura, recog&iacute; palabras&nbsp; -que acompa&ntilde;ar&aacute;n el premio- y que envuelven la excelencia del buen m&eacute;dico. Una larga lista de valores y virtudes que van m&aacute;s all&aacute; del conocimiento cient&iacute;fico y la experiencia fruto de estudios y praxis. Tienen m&aacute;s que ver con la sabidur&iacute;a humana de c&oacute;mo usar ese saber, de c&oacute;mo tratar el cuerpo y el alma de la persona. No se pueden medir, pero se reconocen cuando est&aacute;n presentes.<br />\r\nLa pieza contempla la relaci&oacute;n m&eacute;dico-paciente, aunque asim&eacute;trica, como un todo org&aacute;nico con una base compartida, como un equilibrio delicado, pero justo, como un viaje profundo, como una comunicaci&oacute;n clara y de escucha m&uacute;tua en la que tambi&eacute;n habla e lsilencio.</p>\r\n\r\n<p>Todo mi agradecimiento y reconocimiento al equipo de Separ y a todos los m&eacute;dicos que, d&iacute;a a d&iacute;a, cultivan conscientemente estos valores preciosos que nos trascienden y hacen m&aacute;s seres humanos.</p>\r\n	escultura de bronce	\N	2013-08-20 12:52:14.3328	2013-08-20 12:53:55.06822
34	30	en	axis salus: hommage to the good doctor	<p>Good Physician Award<br />\r\n<br />\r\nIn the process of creating the sculpture, picked words that accompany the award-and excellence involving good doctor. A long list of values ​​and virtues that go beyond scientific knowledge and experience result of research and practice. They have more to do with the wisdom of how to use this knowledge, how to treat the body and soul of the person. Can not be measured, but are recognized when present.<br />\r\nThe piece includes the doctor-patient relationship, although asymmetric, as an organic whole with a shared basis, as a delicate balance, but just as a trip deep, as clear communication and mutual listening which also silences speak.<br />\r\n<br />\r\nAll my thanks and appreciation to Separ team and all physicians who, day by day, consciously cultivate these precious values ​​transcend and make us more human.</p>\r\n	bronze sculpture	\N	2013-08-20 12:58:58.389429	2013-08-20 12:58:58.393426
36	33	ca	fent volar coloms	<p>Fent volar coloms s&#39;ha gestat durant el temps de conviv&egrave;ncia amb alguns materials i elements de treball entre les tres persones que operem amb ells i nosaltres. Del laboratori han sortit una s&egrave;rie de peces breus que incorporen tamb&eacute; elements sonors.</p>\r\n\r\n<p>Transitem tamb&eacute; per 11 v&iacute;deo-accions de curta durada.</p>\r\n\r\n<p>Som els responsables del producte final.</p>\r\n\r\n<p>Lucho Hermosilla, Ona Mestre, Mireia Zantop.</p>\r\n\r\n<p>Agra&iuml;ments a l&#39;equip de l&#39;Antic, Clara Bes, Pau Compte, Andr&eacute;s Acebes, Mar, Jordi Nebot, Lesley Yendell.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href="http://www.anticteatre.com">http://www.anticteatre.com</a></p>\r\n	\N	Antic Teatre, Barcelona	2013-12-06 12:49:29.127486	2013-12-06 12:57:36.416638
37	34	ca	sum(us)	<p>Corpologia 13 en el marc de l&#39;exposici&oacute; <strong>Cargol treu banya</strong></p>\r\n	\N	Casa Elizalde, Barcelona	2013-12-06 13:04:41.823364	2013-12-06 13:04:41.823364
39	36	ca	despunxar	<p>Acci&oacute; po&egrave;tica amb Al&egrave;xia Lleonart en el marc de l&#39;exposici&oacute; d&#39;obra original Esbarzers.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>http://blog.papasseit.cat/el-raco-de-lart/&nbsp;</p>\r\n	\N	Llibreria Papasseit, Manresa	2013-12-06 13:20:59.623252	2013-12-06 13:20:59.623252
56	51	ca	pomps of the subsoil	<p>Col&middot;lectiu d&#39;art d&#39;acci&oacute; OCELLS AL CAP:</p>\r\n\r\n<p>participen: Denys Blacker, Natalia Espinet, Juliette Murphy, Montse Ser&oacute;, Marta Vergony&oacute;s, Ada Vilar&oacute;, Lesley Yendell, Mireia Zantop</p>\r\n	\N	FESTIVAL ESCENA POBLENOU, Can Felipa, Barcelona	2016-08-01 16:18:35.356281	2016-08-05 11:37:55.053477
41	36	en	despunxar	<p><strong>Acci&oacute; po&egrave;tica amb Al&egrave;xia Lleonart</strong> en el marc de la seva exposici&oacute; d&#39;obra original <strong>Esbarzers.</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>http://blog.papasseit.cat/el-raco-de-lart/&nbsp;</p>\r\n	\N	Llibreria Papasseit, Manresa	2014-05-17 12:17:29.478349	2014-05-17 12:17:29.484756
38	35	ca	Quina és la pregunta?	<p>25 de novembre: Dia per a la eradicaci&oacute; de la viol&egrave;ncia de g&egrave;nere</p>\r\n\r\n<p>Acci&oacute; al carrer amb Mireia Chalamanc i instal.laci&oacute; a la Capella de Sant Corneli</p>\r\n\r\n<p>&ldquo;A poc a poc al endinsar-me a l&rsquo;ambient del mercat amb actitud de receptivitat van anar sorgint complicitats, mirades, apropaments, fins que em vaig sentir submergida a un flux de respostes i preguntes que anaven donant sentit a les nostres pres&egrave;ncies. Receptacles d&rsquo;emocions, pensaments, paraules, comentaris, intimitats, reaccions, necessitats&hellip; en el tap&iacute;s d&rsquo;aquesta Acci&oacute; vaig quedar impregnada de dolor, de veus callades, de veus silenciades, i al mateix temps, impregnada de possibilitats, d&rsquo;escletxes, de veus manifestades, de veus agra&iuml;des, de diversitat de veus i d&rsquo;experi&egrave;ncies.&rdquo;</p>\r\n\r\n<p>&ldquo;Una de les certeses que vaig sentir &eacute;s que durant la nostra acci&oacute; erem alhora subtils emissores i receptores, per&ograve;, sobre tot, canals a trav&eacute;s dels quals permetiem que afluessin, s&#39;expres&eacute;ssin i prengu&eacute;ssin forma verbal, -conscient o inconscientment- alguns pensaments, opinions i sentiments que solen restar soterrats.</p>\r\n\r\n<p>I parlo sempre del tot: nosaltres i els altres, l&#39;espai d d&#39;aquesta trobada &iacute;ntima en l&#39;espai p&uacute;blic nom&eacute;s podia sorgir de l&#39;escolta, la reflexi&oacute; i la sinceritat m&uacute;tua.</p>\r\n\r\n<p>Varem ser full en blanc per a paraules &ldquo;indici&rdquo;, que assenyalen t&iacute;midament moltes hist&ograve;ries que compartim poc i solen ser m&eacute;s silenciades que explicades. &Eacute;s tab&uacute; all&ograve; del que no se&#39;n parla. Em va sorprendre les visions i percepcions de la viol&egrave;ncia, i com alguns neguen ser capa&ccedil;os de sentir-la o recon&egrave;ixer-la, tant com a agents passius o actius. Em va alegrar veure que les persones, amb independ&egrave;ncia de g&egrave;nere, edat o condici&oacute; social, desitgen obrir el di&agrave;leg, cercar respostes i, amb clara determinaci&oacute;, aportar de la seva part per l&#39;eradicaci&oacute; de la viol&egrave;ncia.</p>\r\n	\N	Mercat i capella de Sant Corneli, Cardedeu	2013-12-06 13:07:21.047497	2015-01-04 21:35:15.140994
35	31	ca	A...Z 5/5 (f)acts	<p>(f)acts</p>\r\n\r\n<p>1/5: A&#39;s rain as poem as...</p>\r\n\r\n<p>2/5: pienso, luego... o no</p>\r\n\r\n<p>3/5: yo no he sido</p>\r\n\r\n<p>4/5: entrar saliendo o salir entrando</p>\r\n\r\n<p>5/5: a room, espai habitat</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n	\N	Experimental Room Festival, Barcelona	2013-09-05 14:59:31.67866	2015-09-20 18:03:57.753149
46	40	ca	BIRDS-ocells al cap	<p><br />\r\nActivitat vinculada a l&#39;exposici&oacute;<strong>&nbsp;Allan Kaprow. Altres maneres</strong>&nbsp;a la Fundaci&oacute; Antoni T&agrave;pies, Barcelona</p>\r\n\r\n<p><br />\r\nPerformance:&nbsp;Punt de trobada a Can Obert, Madremanya &nbsp;10h - 13h<br />\r\nPosta en com&uacute;:&nbsp;Can Obert, Madremanya 16h -18h</p>\r\n\r\n<p><br />\r\nDe&nbsp;Birds&nbsp;(Ocells) a&nbsp;Tenir ocells al cap&nbsp;<br />\r\nA partir de la proposta de treballar al voltant de l&rsquo;obra&nbsp;de Kaprow i en con&egrave;ixer el seu vincle amb la Womanhouse, decidim recrear la pe&ccedil;a&nbsp;Birds. En el proc&eacute;s de &ldquo;reinvenci&oacute;&rdquo; que proposa el mateix Kaprow ens interessa anar m&eacute;s enll&agrave; de la partitura proposada, i explorar, en aquesta intervenci&oacute; en plena natura, la locuci&oacute; &ldquo;tenir ocells al cap&rdquo;.</p>\r\n\r\n<p><br />\r\nCoordinadores de la reinvenci&oacute;:&nbsp;Denys Blacker i Marta Vergony&oacute;s<br />\r\nAmb la participaci&oacute; de:&nbsp;Montse Ser&oacute;,&nbsp;Ada Vilar&oacute;,&nbsp;Lesley Yendell,&nbsp;Paloma Orts,&nbsp;Nat&agrave;lia Espinet,&nbsp;N&uacute;ria Icl&egrave;sies,&nbsp;Mar Serinya,&nbsp;Clara Gar&iacute;,&nbsp;J&uacute;lia Falgas i Mireia Zantop.<br />\r\n<a href="http://www.fundaciotapies.org/site/spip.php?rubrique1274">http://www.fundaciotapies.org/site/spip.php?rubrique1274</a></p>\r\n	\N	Madremanya	2014-05-17 13:01:15.49841	2016-08-05 12:02:03.841509
42	33	en	fent volar coloms	<p>Fent volar coloms s&#39;ha gestat durant el temps de conviv&egrave;ncia amb alguns materials i elements de treball entre les tres persones que operem amb ells i nosaltres. Del laboratori han sortit una s&egrave;rie de peces breus que incorporen tamb&eacute; elements sonors.</p>\r\n\r\n<p>Transitem tamb&eacute; per 11 v&iacute;deo-accions de curta durada.</p>\r\n\r\n<p>Som els responsables del producte final.</p>\r\n\r\n<p>Lucho Hermosilla, Ona Mestre, Mireia Zantop.</p>\r\n\r\n<p>Agra&iuml;ments a l&#39;equip de l&#39;Antic, Clara Bes, Pau Compte, Andr&eacute;s Acebes, Mar, Jordi Nebot, Lesley Yendell.</p>\r\n\r\n<p><a href="http://vimeo.com/81280599">http://vimeo.com/81280599</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href="http://www.anticteatre.com">http://www.anticteatre.com</a></p>\r\n	\N	Antic Teatre, Barcelona	2014-05-17 12:23:54.04395	2014-05-17 12:23:54.048024
43	37	ca	(n)ombrares 	<p><strong>(n)ombrares</strong> es basa en la relaci&oacute; amb la pr&ograve;pia ombra en relaci&oacute; amb el nombre d&#39;ombres i el nombre d&#39;ares que percebem conscientment i podem nombrar</p>\r\n\r\n<p>(fent segments subjectius de la unitat flu&iuml;da del tot).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Anotacions marginals:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>La meva ombra m&#39;acompanya des del meu enllumenament.</p>\r\n\r\n<p>&Eacute;s variable - particular, privada (tamb&eacute; de llibertat) y p&uacute;blica, &uacute;nica y m&uacute;ltiple, impert&egrave;rrita i adaptable, singular o plural,</p>\r\n\r\n<p>i sempre sincr&ograve;nica.</p>\r\n\r\n<p>&Eacute;s tots els meus jos i nos. Tenim una bona relaci&oacute;.</p>\r\n\r\n<p>&Eacute;s la meva ombra de la guarda.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Relaci&oacute; d&#39;ares t&ograve;nics per preposicions &agrave;tones</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>a l&#39;ombra (parlo i beso)</p>\r\n\r\n<p>amb l&#39;ombra ( em defineixo i m&#39;abra&ccedil;o)</p>\r\n\r\n<p>de l&#39;ombra (neixo i s&oacute;c inseparable. S&eacute; que no la puc matar sense morir en</p>\r\n\r\n<p>l&#39;intent - o tu i jo o ni tu ni jo)</p>\r\n\r\n<p>en l&#39;ombra (que m&#39;acull, m&#39;esmunyo)</p>\r\n\r\n<p>per l&#39;ombra (interpreto forma i acci&oacute; segons la llum de la mirada)</p>\r\n\r\n<p>per a l&#39;ombra (un got de vi, que tra&ccedil;a i revela la seva ess&egrave;ncia incorp&ograve;ria)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>subtext, flash-acci&oacute; imagin&agrave;ria:</p>\r\n\r\n<p>En algun moment vaig pensar en proposar de reunir-nos tots els corpologistes abra&ccedil;ats i mirar uns instants l&#39;ombra com&uacute;, fer-li una foto amb flash com a evid&egrave;ncia absoluta de la seva pres&egrave;ncia ef&iacute;mera i la incapacitat de retenir-la. Per&ograve; ja havia descartat la opci&oacute; de matar l&#39;ombra... segueixo jaient amb ella.</p>\r\n	\N	Sant Hilari Sacalm	2014-05-17 12:35:52.148102	2014-05-17 12:35:52.148102
45	39	ca	els polissons	<p>Disturbanitats:</p>\r\n\r\n<p>Performance-Acci&oacute; sonora amb instruments tradicionals tocats instintivament, comprovant la hip&ograve;tesi harm&ograve;nica de la teoria del caos a la recerca de la biologia primordial.</p>\r\n\r\n<p>Els Polissons estan formats per artistes transdisciplinars que conreen tant la creaci&oacute; en directe com t&egrave;cniques m&eacute;s el&middot;laborades del m&oacute;n de les arts visuals, liter&agrave;ries, esc&egrave;niques i musicals. Aquest projecte beu de fonts dada&iacute;stes amb precedents de treball en grups d&#39;improvisaci&oacute; i investigaci&oacute; musical.</p>\r\n\r\n<p>Participen:</p>\r\n\r\n<p>Joan Vinuesa&nbsp;<a href="http://www.joanvinuesabaliu.info"> www.joanvinuesabaliu.info</a>&nbsp;&nbsp;&nbsp;</p>\r\n\r\n<p>Aleix Antillach <a href="http://www.leix.org">www.leix.org</a>&nbsp;</p>\r\n\r\n<p>Eva Puig <a href="http://www.estranhaformadevida.com">www.estranhaformadevida.com</a></p>\r\n\r\n<p>Col&middot;labora: Ona Mestre</p>\r\n\r\n<p>contacte: elspolissons@gmail.com</p>\r\n	\N	XIV Festival Perpetracions - Antologia Animal, Sant Martí, Barcelona	2014-05-17 12:59:00.763419	2014-07-17 22:28:58.029492
84	81	ca	gota · gota	<p>Artistes a cel obert</p>\r\n\r\n<p>Taller de Montse Ser&oacute;, a Rupi&agrave;, i exposici&oacute; al Museu de la Terrissa de Quart.</p>\r\n	Ceràmica i instal·lació amb aigua i objectes.	\N	2020-02-19 17:54:40.924657	2020-02-19 18:03:44.48378
44	38	ca	ad hoc	<p>s&egrave;rie de accions/intervencions improvisades ad hoc</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n	moviment i relació amb i entre els objets trouvés, acció i escultura efímera	\N	2014-05-17 12:58:04.890932	2015-01-04 21:41:51.477027
83	78	ca	Thyllandsias	<p>viure amb poc i d&#39;all&ograve; (aparentment) immaterial</p>\r\n	Escultura d'alabastre	\N	2020-02-14 21:53:45.80356	2020-09-21 12:36:37.639959
70	65	ca	Desig Per(z)ones	<p><strong>art participatiu a l&#39;espai p&uacute;blic. Pe&ccedil;a entorn de les relacions afectives i la sexualitat</strong></p>\r\n\r\n<p>Acci&oacute;-performance i instal&middot;laci&oacute; col&middot;lectiva fruit de la participaci&oacute; i la reflexi&oacute; individual generant un di&agrave;leg entre espai p&uacute;blic i espai &iacute;ntim, visibilitzant la diversitat de qualsevol forma de sentir per expressar tot all&ograve; silenciat, envoltat de prejudicis i tab&uacute;s.</p>\r\n\r\n<p><strong>Les Mireies</strong>, projecte art&iacute;stic i social,</p>\r\n\r\n<p>som Mireia Chalamanch i Mireia Zantop</p>\r\n	\N	Espai públic de 23 municipis del Barcelonès	2018-08-22 15:06:01.767606	2020-06-15 15:22:31.23499
82	77	ca	DE VEU · EN VEU	<p><strong>les Mireies, </strong>projecte art&iacute;stic i social</p>\r\n\r\n<p>Mireia Chalamanch i Mireia Zantop</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href="https://vimeo.com/337385523">https://vimeo.com/337385523 </a></p>\r\n\r\n<p><a href="https://vimeo.com/490838260">https://vimeo.com/490838260</a></p>\r\n\r\n<p>De VEU en VEU neix de la necessitat de fer-vos c&ograve;mplices d&rsquo;algunes de les m&eacute;s de 3.500 veus que hem recollit fent la performance DONAR VEU al llarg d&rsquo;aquests 5 anys.</p>\r\n\r\n<p>La pe&ccedil;a vol ser una invitaci&oacute; a l&rsquo;escolta, a la reflexi&oacute;, aix&iacute; com la presa de consci&egrave;ncia de la diversitat d&rsquo;experi&egrave;ncies entorn a temes com la viol&egrave;ncia masclista, la (des)igualtat i la diversitat sexual i de g&egrave;nere.</p>\r\n	\N	Can Manyé, Alella	2019-06-10 22:08:30.884277	2021-01-04 21:07:14.45751
47	41	ca	present% o saltAl'ara	<p>CORPOLOGIA 15</p>\r\n\r\n<p>16 accions de 4 minuts.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Em presenten, em presento amb la pres&egrave;ncia, presento el t&iacute;tol:</p>\r\n\r\n<p><strong>PRESENT%</strong>: t&iacute;tol I pensat anteriorment (del passat)</p>\r\n\r\n<p>salal&#39;ara: t&iacute;tol II pensat just abans de l&#39;acci&oacute; (en un salt a l&#39;ara)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Presento i ofereixo com a present</p>\r\n\r\n<p>els objectes que m&#39;acompanyen:</p>\r\n\r\n<p>un paper blanc rod&oacute; fet a m&agrave; que porta a sobre una bossa plena de sal i 2 vells despertadors negres -d&#39;aquells que fan tic-tac i riiing percutint les dues campanes-</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Volia preguntar -quina hora &eacute;s?, per&ograve; com, sigui quina sigui, ja no &eacute;s, no vaig posar els rellotges a l&#39;hora que &eacute;s/era, si no a l&#39;hora primera i &uacute;ltima de la nostra mesura del temps: 0.00</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Inici</p>\r\n\r\n<p>Sincronia = sense cronos? No cr&ograve;nic? Alhora? Tot</p>\r\n\r\n<p>A-sincronia de 2 rellotges:</p>\r\n\r\n<p>Una dimensi&oacute; del temps absoluta, mesurable. Tremolo mentre dono corda al rellotge</p>\r\n\r\n<p>L&#39;altra dimensi&oacute;, relativa, el temps percebut, l&#39;ara propi. Em calmo</p>\r\n\r\n<p>S&oacute;c a sobre del paper en blanc. Al meu eix i a l&#39;axis tempus 0:00</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Salalcor, salalgust, nusalasal, nusalcap.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Mossego la sal, la sento present en tota la boca en tot moment</p>\r\n\r\n<p>Tra&ccedil;o i salo un cercle/cicle en el sentit del rellotge. al ritme propi que l&#39;acci&oacute; em permet. Estic a les seves mans, s&oacute;c llapis d&#39;una voluntat invisible d&#39;aven&ccedil; imparable, fins a tancar el cercle, una acci&oacute; rodona</p>\r\n\r\n<p>Torno a l&#39;eix vertical, absurd i em desdibuixo canviant de dimensi&oacute;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ara sala&#39;m! Em salo i gaudeixo tot el temps immensurable del plaer</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Eix de balan&ccedil;a, amb un rellotge a cada m&agrave; -el que mesura el temps i el que no-, em concentro en la pres&egrave;ncia (present tense!), un ara buit i ple d&#39;acci&oacute; al que li queda poc temps, 30? 10? segons. Ara cent/sent per cent</p>\r\n\r\n<p>...ara riiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiing sincr&ograve;nic</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ara em sorpr&egrave;n que els aplaudiments cobreixin el so de les alarmes: un fi fos amb un altre</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ara d&#39;eixo d&#39;estar, esborro l&#39;eix de la mesura del temps i el seu contrari: marxo</p>\r\n\r\n<p>M&#39;emporto el paper rod&oacute;, la illa blanca de centre i cercle.</p>\r\n\r\n<p>Resta un espai negre sense sal: abs&egrave;ncia.</p>\r\n\r\n<p>&nbsp;</p>\r\n	\N	l'Ateneu, Celrà	2014-05-17 13:20:04.158385	2014-11-03 23:29:42.94207
48	42	ca	d'accions i diccions	<p>&nbsp;</p>\r\n\r\n<p>(en el marc de <strong>Poesia als parcs 2014)</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Acci&oacute; po&egrave;tica que allibera un accionari d&#39;un diccionari</p>\r\n\r\n<p>Acci&oacute; d&#39;aviacci&oacute; de reacci&oacute; a la dicci&oacute;</p>\r\n\r\n<p>Plegats, pleguem</p>\r\n\r\n<p>cadasc&uacute; un avi&oacute;, paraula de paper. Cadasc&uacute; en la direcci&oacute; del vol que vol</p>\r\n\r\n<p><strong>Dicci&oacute; al vent</strong></p>\r\n\r\n<p><strong>acci&oacute; al present</strong></p>\r\n\r\n<p><strong>text al context.</strong></p>\r\n\r\n<p><a href="https://www.facebook.com/poesiaalsparcs"><strong>https://www.facebook.com/poesiaalsparcs</strong></a></p>\r\n	\N	 Ermita de Sant Feliuet de Savassona	2015-01-04 22:05:21.205506	2015-01-04 22:13:33.965796
49	43	ca	esClau	<p>acci&oacute; que complementa un poema llegit als 4 vents unes setmanes abans a l&#39;ermita de Sant Feliu de Savassona (gr&agrave;cies, Ester i Carles):</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>CAP ESCLAU.</p>\r\n\r\n<p>t&eacute; la clau</p>\r\n\r\n<p>cau el cap,</p>\r\n\r\n<p>cau de cap</p>\r\n\r\n<p>cau l&#39;esclau del cap (esclau clau)</p>\r\n\r\n<p>i l&#39;esclau de l&#39;esclau</p>\r\n\r\n<p>i l&#39;esclau de l&#39;esclau de l&#39;esclau</p>\r\n\r\n<p>i l&#39;esclau de l&#39;esclau de l&#39;esclau de l&#39;esclau</p>\r\n\r\n<p>i l&#39;esclau de l&#39;esclau de l&#39;esclau de l&#39;esclau de l&#39;esclau</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>els claus cauen de cap per les escales</p>\r\n\r\n<p>&Eacute;s clau: tens la clau.</p>\r\n\r\n<p>La clau de sol.</p>\r\n\r\n<p>Cap &eacute;s clau.</p>\r\n\r\n<p><a href="http://corpologialiveart.blogspot.com.es/">http://corpologialiveart.blogspot.com.es/</a></p>\r\n	\N	Antic Teatre, Barcelona	2015-01-04 23:00:44.744179	2015-01-04 23:21:25.218318
50	44	ca	estOna		intervenció efímera	\N	2015-01-05 00:13:38.832743	2015-07-02 23:53:58.583162
51	46	ca	FRee WILL (x veure +) 	<p><strong>free will</strong> &ndash; lliure albir. Lit.: lliure voluntat</p>\r\n\r\n<p>t&iacute;tol i tema triats per incertesa metaf&iacute;sica.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>(x veure +)</strong></p>\r\n\r\n<p>acci&oacute; sense acci&oacute;</p>\r\n\r\n<p>i veure</p>\r\n\r\n<p>veure-us</p>\r\n\r\n<p>obrir el llibre a l&#39;albir.</p>\r\n\r\n<p>A trav&eacute;s del llibre,</p>\r\n\r\n<p>veure amb ulls que no veuen,</p>\r\n\r\n<p>veure +</p>\r\n\r\n<p>Coneixe-ment</p>\r\n\r\n<p>en un altre sentit.</p>\r\n\r\n<p>La informaci&oacute; embena els ulls</p>\r\n\r\n<p>x a veure +</p>\r\n\r\n<p>la imatge interior encertada,</p>\r\n\r\n<p>la intenci&oacute; certa</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>allibero els o/u(ll)s.</p>\r\n\r\n<p>o van on volen</p>\r\n\r\n<p>o van on vull</p>\r\n\r\n<p>o van on havien d&#39;anar</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>...dansa lliure a l&#39;albir.</p>\r\n	\N	Cicle d'Art d'Acció La Carbonera, Girona 	2015-07-03 00:07:38.029673	2015-07-03 00:12:11.465762
52	47	ca	elGrandTour	<p>Sin&egrave;rgies i elements trobats autour del proc&eacute;s creatiu basat en la intu&iuml;ci&oacute;.</p>\r\n\r\n<p>Acci&oacute; col&middot;lectiva amb Denys Blacker, Carlus Camps, Natalia Espinet, Rotnip, Lesley Yendell, Mireia Zantop.</p>\r\n\r\n<p>en el marc del Grand Tour:</p>\r\n\r\n<p>Del 26/08 al 13/09/2015, de la Nau C&ocirc;clea a St. Feliu de Gu&iacute;xols, 350km a peu en tres setmanes. Obra d&#39;artistes visuals, ballarins, poetes, m&uacute;sics i performers.</p>\r\n\r\n<p><a href="http://elgrandtour.net">http://elgrandtour.net</a></p>\r\n	\N	Madremanya, Girona	2015-09-27 22:40:27.703182	2015-09-27 22:42:43.772683
53	48	ca	pEs&pressió	<p>(EX-PRESSI&Oacute; &eacute;s-cultura?)</p>\r\n\r\n<p>c&agrave;rrega visible:</p>\r\n\r\n<p>- b&agrave;scula</p>\r\n\r\n<p>- 3 maletes de viatge carregades volunt&agrave;riament amb llibres de pes relatiu i involuntari</p>\r\n\r\n<p>- 5 kg de cadenes</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>pes del cap</p>\r\n\r\n<p>pes del cap en cadenes</p>\r\n\r\n<p>al cap, el pes del cap en cadenes (pressi&oacute;)</p>\r\n\r\n<p>pes del cos</p>\r\n\r\n<p>pes del cos en llibres</p>\r\n\r\n<p>construcci&oacute;; s&#39;aguanta per pressi&oacute; del cap</p>\r\n\r\n<p>a sobre, pes de les cadenes, s&#39;aguanta per pressi&oacute; del cos, agenollat</p>\r\n\r\n<p>cos de cap, cos de pes (equilibri per pressi&oacute;)</p>\r\n\r\n<p>pel propi pes de la pres(si)&oacute;</p>\r\n\r\n<p>la consci&egrave;ncia defineix el moment d&#39;alliberacci&oacute;</p>\r\n	\N	Antic Teatre, Barcelona	2016-08-01 15:36:44.498892	2016-08-01 15:36:44.498892
54	49	ca	aux bleux aigus d'acier et de cristal	<p>Festival Pepe Sales, Homenatge a Ren&eacute;e Vivien</p>\r\n\r\n<p>Marta Vergony&oacute;s i Mireia Zantop</p>\r\n	\N	Auditori de La Mercè, Girona	2016-08-01 15:46:04.562559	2016-08-01 15:48:05.399932
58	53	ca	FluxUs	<p>MUGA CAULA 2016.</p>\r\n\r\n<p>Performance en el Museu de l&#39;Empord&agrave;.</p>\r\n\r\n<p>Exposici&oacute; material gr&agrave;fic i audiovisual de la Muga Caula.</p>\r\n\r\n<p>Homenatge.</p>\r\n	\N	Museu de l'Empordà, Figueres	2016-08-01 17:43:57.124514	2020-02-19 17:17:17.26401
57	52	ca	eventuall	<p>Corpologia 20</p>\r\n\r\n<p>(tra&ccedil;os al vent eventual del ventall)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Preparacci&oacute;:</strong></p>\r\n\r\n<p>un llibre-poema a l&#39;aire lliure.</p>\r\n\r\n<p><strong>Inspiracci&oacute;:</strong></p>\r\n\r\n<p>inspiro i escric, sense fer correccions.</p>\r\n\r\n<p><strong>Ventilacci&oacute;:</strong></p>\r\n\r\n<p>el vent del ventall de possibilitats selecciona el que ha de ser sentit:</p>\r\n\r\n<p>Acci&oacute; eventual.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Nota visual: llibre i ventall, ess&egrave;ncies congruents.</p>\r\n\r\n<p>Nota musical: sis p&agrave;gines d&#39;ai -res muts.</p>\r\n\r\n<p>Nota de peu:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>(ai-)</p>\r\n\r\n<p>RES</p>\r\n\r\n<p>SO</p>\r\n\r\n<p>TO</p>\r\n\r\n<p>TOT</p>\r\n\r\n<p>O</p>\r\n\r\n<p>RES</p>\r\n\r\n<p>SO</p>\r\n\r\n<p>TO</p>\r\n\r\n<p>TOT</p>\r\n\r\n<p>O</p>\r\n\r\n<p>RES</p>\r\n\r\n<p>....</p>\r\n\r\n<p>RESS&Ograve;</p>\r\n	\N	La Fàbrica, Celrà	2016-08-01 16:58:26.654279	2016-08-01 16:58:26.654279
71	66	ca	per se	<p>N&ordm;5 CORPOLOGIA&gt;25</p>\r\n\r\n<p>Inauguraci&oacute; de l&#39;exposici&oacute; de Denys Blacker<strong> Mapes ef&iacute;mers, complicitats i sincronies</strong></p>\r\n\r\n<p>Instal&middot;laci&oacute; a l&#39;aparador de la sala d&#39;exposicions del 14 al 21 de juny per gentilesa de Denys Blacker.</p>\r\n	\N	Bòlit Centre D'Art Contemporani, Girona	2018-08-22 15:12:28.300594	2018-12-21 20:09:58.560882
62	57	ca	Flux(Us)	<p><strong>La Muga Caula</strong>, trobada Internacional de poesia d&#39;acci&oacute; i performance</p>\r\n\r\n<p>panta rei - tot unit en la difer&egrave;ncia</p>\r\n\r\n<p><a href="http://lamugacaula.cat">http://lamugacaula.cat</a></p>\r\n\r\n<p>fotografia: <a href="http://pacojusticia.com">http://pacojusticia.com</a></p>\r\n	\N	Les Escaules, Girona	2016-10-19 22:59:40.435486	2017-02-19 23:10:21.240546
67	62	ca	DONAR VEU...i veure més	<p>Acci&oacute; performativa a l&rsquo;espai p&uacute;blic per donar veu a all&ograve; que solem silenciar entorn de les (des)igualtats de g&egrave;nere.</p>\r\n\r\n<p>Creaci&oacute; i realitzaci&oacute;: <strong>Les Mireies - projecte art&iacute;stic i social</strong> ( Mireia Chalamanch i Mireia Zantop)</p>\r\n	\N	Espai públic de municipis de comarques de Barcelona	2017-06-01 23:33:01.197827	2019-06-10 22:20:51.268437
66	61	ca	we were waiting for you	<p>Festival FLARE 3</p>\r\n\r\n<p>col&middot;lectiu d&#39;investigaci&oacute; d&#39;art d&#39;acci&oacute; <strong>ocells al cap:</strong></p>\r\n\r\n<p>Denys Blacker, Nat&agrave;lia Espinet, Victoria Grey, Helena Hunter, Marta Vergony&oacute;s, Sabina Vilagut, Lesley Yendell, Mireia Zantop</p>\r\n\r\n<p><a href="https://flare707.wordpress.com/">https://flare707.wordpress.com/</a></p>\r\n	\N	Vane Gallery, Newcastle, GB	2017-06-01 23:01:04.874164	2017-06-01 23:09:35.10061
61	56	ca	cromoSomX	<p>Corpologia 24.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Reflexi&oacute; intuitiva</p>\r\n\r\n<p>que assenyala identitats,</p>\r\n\r\n<p>emmiralla all&ograve; propi i apropiat,</p>\r\n\r\n<p>com&uacute; i diferenciador.</p>\r\n\r\n<p>Relaci&oacute; de poder d&#39;oposats i equilibri</p>\r\n\r\n<p>entre desig i perm&iacute;s rec&iacute;proc</p>\r\n\r\n<p>entre forma i fons de la unitat dual.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>x (fem.) Present en refleXi&oacute;, seXe i eXpressi&oacute; de g&egrave;nere.</strong></p>\r\n\r\n<p>Lletra de l&#39;alfabet. Signe de multiplicaci&oacute;. Signe que representa la inc&ograve;gnita que no es vol o pot dir.</p>\r\n\r\n<p>Signe de creuament. Signe que defineix un punt en l&#39;espai. Cromosoma sexual present en mascles i femelles de l&#39;esp&egrave;cie humana.</p>\r\n	\N	Matèric Cuerpo/Objeto/Espacio. L'Hospitalet de Llobregat	2016-10-19 22:54:30.251459	2017-06-02 00:09:34.318544
68	63	ca	Flux (...)	<p>La Muga Caula, Trobada internacional de poesia d&#39;acci&oacute; i performance</p>\r\n	\N	Les Escaules, Girona.	2017-06-02 00:01:33.881666	2018-08-22 14:36:16.870776
72	67	ca	ip(sum), id(est)	<p>Acci&oacute; a la Fundaci&oacute; Valvi en el marc del festival Inundart, Girona</p>\r\n\r\n<p>1 de juliol de 2018</p>\r\n	Performance, dibuix amb el cos, carbó, saliva i aigua.	\N	2018-08-22 15:22:59.132785	2018-12-21 20:56:16.075856
73	68	ca	quid de la qüestió	<p>NIT DE PERFORMANCE&nbsp; 18 d&#39;agost, 2018. Continuum d&#39;accions paral&middot;leles a l&#39;esgl&eacute;sia de Sta Ll&uacute;cia i La Carbonera en el marc de l&#39;exposici&oacute; <strong>&quot;Mapes ef&iacute;mers, complicitats i sincronies&quot;</strong>, B&ograve;lit centre d&#39;Art Contemporani, Girona</p>\r\n\r\n<p>Ocells al Cap, col&middot;lectiu d&#39;art d&#39;acci&oacute;:</p>\r\n\r\n<p>Marina Barsy, Marcela Contreras, Hellen Collard, Nat&agrave;lia Espinet, Pir&ograve;mana d&#39;Arg&oacute;s, Anita Ponton, Sandra Johnston, Montse Ser&oacute;, Holly Slingsby, Martine Viale, Ada Vilar&oacute;, Lesley Yendell, Mireia Zantop</p>\r\n	\N	Església de Sta. Llúcia, Girona	2018-08-22 15:29:30.559934	2018-12-21 21:13:46.396649
74	69	ca	Ipse Ipsa Ipsum(em)	<p>2n cicle<strong> PARLEM CONTEMPORANI?</strong></p>\r\n\r\n<p>Ipse, ipsa, ipsum(em)</p>\r\n\r\n<p>[del llat&iacute;, ell mateix, ella mateixa, un mateix] + [del llat&iacute;, soc] + [del catal&agrave;, sumem]</p>\r\n\r\n<p>: acci&oacute; entre rastres d&#39;identitats estimades.</p>\r\n\r\n<p>Entre: cicles d&#39;entrar sortint, de definir desdibuixant, del flux de relacions interrogants.</p>\r\n	\N	Convent de les Arts, Alcover	2019-01-18 23:45:26.102019	2019-01-28 20:30:00.140779
69	64	ca	fluxus	<p>Festival La Muga Caula</p>\r\n\r\n<p><strong>Exposici&oacute; col&middot;lectiva homenatge a Ben Patterson. </strong></p>\r\n\r\n<p><strong>Galeria Dolors Vent&oacute;s, Figueres.</strong></p>\r\n\r\n<p>Obra-acci&oacute; iniciada abans de la inauguraci&oacute;, completant-se durant l&#39;exposici&oacute;.</p>\r\n	tinta i aigua sobre paper, bossa de suero i equip de perfusió, picarols	\N	2017-06-02 00:41:14.374509	2019-01-28 20:37:54.476589
64	59	ca	idenDitat	<p>Festival Flors i Violes.</p>\r\n\r\n<p>Introducci&oacute; i veu: Francesc Oui</p>\r\n\r\n<p><a href="http://francescoui.com">http://francescoui.com</a></p>\r\n\r\n<p>&nbsp;</p>\r\n	\N	Fundació Cuixart, Palafrugell	2017-06-01 22:46:09.186381	2019-03-07 22:10:16.110711
59	54	ca	DONAR VEU al desig	<p>Performance participativa a l&#39;espai p&uacute;blic per generar reflexi&oacute; i consci&egrave;ncia personal i social sobre all&ograve; que solem silenciar.</p>\r\n\r\n<p><strong>les Mireies</strong> som Mireia Chalamanc i Mireia Zantop</p>\r\n	\N	Espai públic de Manlleu, Torelló, Tona i Vic	2016-08-01 17:50:44.223621	2020-06-15 15:27:55.925838
79	74	ca	paisatge líquid	<p><strong>Exposici&oacute; col&middot;lectiva i taller &quot;La pell com a paisatge&quot;</strong></p>\r\n\r\n<p>de Tatiana Blanc, Eva Miquel, Victoria Raval, Lesley Yendell i Mireia Zantop</p>\r\n\r\n<p>a La Pedrera, Subirats.</p>\r\n\r\n<p>&nbsp;</p>\r\n	obra original sobre paper i obra gràfica	\N	2019-06-10 20:41:51.28195	2020-02-19 17:23:07.108279
78	73	ca	trans form/morf I-VII		manipulació de materials naturals	\N	2019-04-15 11:41:07.655355	2019-04-15 11:41:07.655355
75	70	ca	PetrAperta	<p>improvisacions en proc&eacute;s: di&agrave;leg amb la pedra</p>\r\n\r\n<p>des del 2018</p>\r\n		\N	2019-01-28 21:07:00.401383	2020-09-20 21:15:52.235421
7	7	ca	possibles IMpossibles	<p>un cos, dos cossos, una acci&oacute; sobre els propis l&iacute;mits i la cooperaci&oacute;</p>\r\n\r\n<p>Co-creaci&oacute; i realitzaci&oacute; amb Norma Ros</p>\r\n\r\n<p>&nbsp;</p>\r\n	\N	Sala Calassanç / Barcelona	2013-01-04 20:49:50.041175	2019-06-10 20:19:22.443508
80	75	ca	EnClauDeBes	<p>Instal.lacci&oacute; po&egrave;tica</p>\r\n\r\n<p><strong>Fisures</strong> I Trobada i Mostra d&#39;Art Multidisciplinari de Palafolls</p>\r\n\r\n<p>acci&oacute;: 12 de juliol de 2014</p>\r\n	escala de fusta, martell, claus, paper fet a mà, roba de lli, alfabets, branques de diferents arbres i arbustos, pintallavis marró	\N	2019-06-10 21:35:33.868726	2019-06-10 21:35:33.868726
81	76	ca	gravat 9	<p>Accions fotogravades i poesies visuals (s&egrave;ries continus-discontinus i rius de cel)</p>\r\n\r\n<p>Exposici&oacute; col&middot;lectiva a La Mirada expandida i Can Bast&eacute;, Barcelona</p>\r\n	fotogravat	\N	2019-06-10 21:53:37.333636	2020-02-14 20:58:34.799422
76	71	ca	entrar sortint, sortir entrant		Escultura d'alabastre	\N	2019-03-07 22:44:50.238451	2020-02-14 21:07:05.797199
60	55	ca	DONAR VEU... i fer un pas	<p>Performance participativa de llarga durada en l&#39;espai p&uacute;blic per donar veu a all&ograve; que solem silenciar</p>\r\n\r\n<p>entorn de la <strong>viol&egrave;ncia de g&egrave;nere</strong></p>\r\n\r\n<p><strong>Les Mireies</strong> som Mireia Chalamanch i Mireia Zantop</p>\r\n	\N	Igualada, Sta. Margarida de Montbui i Vilanova del Camí, Conca d'Òdena	2016-08-01 17:54:00.857897	2020-06-15 15:43:34.388645
20	19	ca	TABOo... Ser/reS. Cos/soC	<p>Performance participativa de llarga durada i instal.laci&oacute; a INUND&#39;ART 2010.</p>\r\n\r\n<p>Paraules del que es silencia.<br />\r\nQuant acceptem? Quant tolerem? Som tan lliures (de prejudicis) com creiem?</p>\r\n\r\n<p>Reflexi&oacute; sobre el concepte del tab&uacute;. Reflexe de la nostra mirada sobre el ser i el cos,&nbsp; relaci&oacute; amb la intenci&oacute; en la projecci&oacute; subjectiva i el prejudici socio-cultural implicat a l&#39;hora de identificar les seves subtils aparences simb&ograve;liques.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>La construcci&oacute; de la instal.laci&oacute; &eacute;s un work on progress al llarg de dues jornades d&#39;inundart. Eix de la primera jornada: RES versus SER; Eix de la segona part: S&Oacute;C versus COS.</p>\r\n	\N	Centre Cultural La Mercè, Girona	2013-01-20 02:38:43.499575	2020-06-15 15:36:58.247221
77	72	ca	cap cap	<p>&nbsp;</p>\r\n\r\n<p><strong>Festival de Land-art</strong> ArtiGavarres 2019</p>\r\n\r\n<p><a href="http://www.artigavarres.cat/galeria.php?idc=2#prettyPhoto">http://www.artigavarres.cat/galeria.php?idc=2#prettyPhoto</a></p>\r\n\r\n<p>Projecte de co-creaci&oacute; amb Aleix Antillach</p>\r\n\r\n<p><a href="http://leix.org">http://leix.org</a></p>\r\n\r\n<p>&nbsp;</p>\r\n	escultures efímeres de palla 	\N	2019-04-10 23:03:30.950809	2020-06-15 15:40:15.938341
85	82	ca	Phoscenes	<p>Dibuixos del Confinament, Exposici&oacute; del 18 de setembre al 30 d&#39;octubre 2020 a Lapek i Madremanya</p>\r\n	mixtes	\N	2020-09-21 08:55:36.139032	2020-10-14 22:53:13.951877
86	83	ca	(des)CUIDAR	<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href="https://lesmireies.com/descuidar">https://lesmireies.com/descuidar</a></p>\r\n	\N	Puig-reig, St.Joan de V., St.Antoni V. i Folgueroles, 	2021-01-04 20:46:08.768568	2021-01-04 20:49:41.681774
91	87	es	Over and over, again and again 	<p>Video-performance con Denys Blacker.</p>\r\n\r\n<p>Proceso creativo colectivo sobre migraciones con Marina Barsy, Denys Blacker, Aodan McCardle, Sandra Johnson, Bernadette Hopkins (curadora) e Isa Fontbona.</p>\r\n\r\n<p>Video: Mar Ximenis</p>\r\n\r\n<p>Presentado en Regional Cultural Centre Letterkenny Co.Donegal en oto&ntilde;o de 2021</p>\r\n\r\n<p>WILD SWANS: https://www.bernadettehopkins.com/wild-swans-performance-art.html</p>\r\n	\N	Madremanya, Girona/ Donegal, Ireland	2021-09-13 17:22:20.910774	2021-12-16 21:38:29.44898
88	85	ca	SI i/o NO, torno i no torno	<p>Video-acci&oacute; per a l&#39;Exposici&oacute; Plurivisions de Fel&iacute;cia Fuster</p>\r\n\r\n<p>Realitzaci&oacute; del v&iacute;deo: Adolf Alca&ntilde;iz</p>\r\n\r\n<p><a href="https://tempsarts.cat/felicia-fuster-plurivisions/">https://tempsarts.cat/felicia-fuster-plurivisions/</a></p>\r\n	\N	Arts Santa Mònica, Barcelona	2021-04-08 21:04:22.995001	2021-04-08 21:31:03.886253
87	84	ca	entre línies, 8ple8buit, veure +	<p>D&#39;ANADA I TORNADA Viatges d&#39;Arts entre Lletres a la Fundaci&oacute; Brossa de Barcelona. Cicle a cura d&#39;Ester Xargay.</p>\r\n\r\n<p>3 accions po&egrave;tiques i 1 video-acci&oacute;, i una presentaci&oacute; de l&#39;obra recent de poesia visual. Amb Ester Xargay i Jordi Aligu&eacute;.</p>\r\n\r\n<p><a href="https://www.fundaciojoanbrossa.cat/arts-entre-lletres/">https://www.fundaciojoanbrossa.cat/arts-entre-lletres/</a></p>\r\n\r\n<p><a href="https://www.nuvol.com/llibres/poesia/art-entre-lletres-lletres-entre-art-136898">https://www.nuvol.com/llibres/poesia/art-entre-lletres-lletres-entre-art-136898</a></p>\r\n	\N	Fundació Brossa, Barcelona	2021-01-04 20:54:14.346009	2021-08-31 23:06:56.970755
90	87	ca	over and over, again and again	<p>Madremanya, Girona/ Donegal, Ireland<br />\r\n<br />\r\n08/08/2021<br />\r\n<br />\r\nV&iacute;deo-performance amb Denys Blacker <a href="https://denysblacker.com">https://denysblacker.com</a><br />\r\nProc&eacute;s creatiu col&middot;lectiu sobre migracions amb Marina Barsy, Denys Blacker, Aodan McCardle, Sandra Johnson, Bernadette Hopkins (curadora) i Isa Fontbona.<br />\r\nV&iacute;deo: Mar Ximenis<br />\r\nPresentat en Regional Cultural Centri Letterkenny Co.Donegal a la tardor de 2021</p>\r\n\r\n<p>WILD SWANS: <a href="https://www.bernadettehopkins.com/wild-swans-performance-art.html">https://www.bernadettehopkins.com/wild-swans-performance-art.html</a></p>\r\n	\N	Madremanya (Spain), San Juan (Puerto Rico) and Donegal (Ireland)	2021-08-31 23:10:08.833939	2022-01-13 20:54:16.142262
94	87	en	over and over, again and again	<p>Video-performance with Denys Blacker&nbsp;</p>\r\n\r\n<p>Group Process on mygrations with Marina Barsy, Denys Blacker Aodan McCardle, Sandra Johnson, Bernmadette Hopkins (curator in charge) and Isa Fontbona.</p>\r\n\r\n<p>Video: Mar Ximenis</p>\r\n\r\n<p>To be exhibited, in the Regional Cultural Centre Letterkenny Co.Donegal in the Autumn 2021</p>\r\n\r\n<p>WILD SWANS: <a href="https://www.bernadettehopkins.com/wild-swans-performance-art.html">https://www.bernadettehopkins.com/wild-swans-performance-art.html</a></p>\r\n	\N	Madremanya (Spain), San Juan (Puerto Rico) and Donegal (Ireland)	2021-09-26 16:57:03.774287	2021-11-19 22:01:54.690653
93	88	en	ULL! agulles	<p>&nbsp;festival&nbsp; MICROSCOPIES 2021</p>\r\n\r\n<p>Cocreaci&oacute; i coproducci&oacute; d&#39;ALEIX ANTILLACH I MIREIA ZANTOP</p>\r\n\r\n<p>Construint, com dibuixant, mirem, coneixem i potser reconeixem. Juguem amb el paisatge ind&ograve;mit i domesticat. Juguem amb l&rsquo;escala, la mida i la mesura que la nostra mirada conjuga.</p>\r\n\r\n<p>Cat&agrave;leg virtual: <a href="https://meandremanresa.com/2021/08/20/propera-sortida/microscopies_2021/">https://meandremanresa.com/2021/08/20/propera-sortida/microscopies_2021/</a></p>\r\n\r\n<p>Premsa: <a href="https://www.naciodigital.cat/manresa/noticia/98872/segona-microscopies-es-fara-torre-lluvia-amb-obres-efimeres-permanent-angels-freixanet">https://www.naciodigital.cat/manresa/noticia/98872/segona-microscopies-es-fara-torre-lluvia-amb-obres-efimeres-permanent-angels-freixanet</a></p>\r\n	Instal·lació amb estaques.	\N	2021-09-20 20:36:36.429491	2021-09-20 20:36:36.432545
92	88	ca	ULL! agulles	<p>festival de Land Art MICROSCOPIES 2021</p>\r\n\r\n<p>Cocreaci&oacute; i coproducci&oacute; d&#39;ALEIX ANTILLACH I MIREIA ZANTOP</p>\r\n\r\n<p>Construint, com dibuixant, mirem, coneixem i potser reconeixem. Juguem amb el paisatge ind&ograve;mit i domesticat. Juguem amb l&rsquo;escala, la mida i la mesura que la nostra mirada conjuga.</p>\r\n\r\n<p>Cat&agrave;leg virtual: <a href="https://meandremanresa.com/2021/08/20/propera-sortida/microscopies_2021/">https://meandremanresa.com/2021/08/20/propera-sortida/microscopies_2021/</a></p>\r\n\r\n<p>Premsa: <a href="https://www.naciodigital.cat/manresa/noticia/98872/segona-microscopies-es-fara-torre-lluvia-amb-obres-efimeres-permanent-angels-freixanet">https://www.naciodigital.cat/manresa/noticia/98872/segona-microscopies-es-fara-torre-lluvia-amb-obres-efimeres-permanent-angels-freixanet</a></p>\r\n	Instal·lació amb estaques.	\N	2021-09-20 19:33:22.589456	2021-09-26 17:13:49.856907
96	85	es	SI i/o NO, torno i no torno	<p>Video-acci&oacute;n para la Exposici&oacute;n itinerante <strong>Plurivisions de Fel&iacute;cia Fuster</strong></p>\r\n\r\n<p>Realizaci&oacute;n del video: Adolf Alca&ntilde;iz</p>\r\n\r\n<p><a href="https://tempsarts.cat/felicia-fuster-plurivisions/">https://tempsarts.cat/felicia-fuster-plurivisions/</a></p>\r\n	\N	Arts Santa Mònica, Barcelona	2021-09-26 20:50:13.269672	2021-09-26 20:50:13.272148
100	92	es	obra gráfica	<p>Estaremos en Bilbao en el Festival Internacional de Grabado y arte sobre papel: Eul&agrave;lia Espasa, Bess Frimog, Roser Sales, Mireia Zantop.</p>\r\n\r\n<p><a href="http://www.figbilbao.com">http://www.figbilbao.com</a></p>\r\n\r\n<p><a href="https://figonlinefair.com/artista/mireia-zantop/">https://figonlinefair.com/artista/mireia-zantop/</a></p>\r\n	grabado calcográfico i serigrafía sobre diversos papeles i soportes	\N	2021-11-20 13:40:05.73467	2022-01-05 20:02:40.480179
99	92	en	prints	<p>&nbsp;FIG Bilbao al Festival Internacional de Grabado y arte sobre papel: Eul&agrave;lia Espasa, Bess Frimog, Roser Sales, Mireia Zantop.</p>\r\n\r\n<p><a href="http://www.figbilbao.com">http://www.figbilbao.com</a></p>\r\n\r\n<p><a href="https://figonlinefair.com/artista/mireia-zantop/">https://figonlinefair.com/artista/mireia-zantop/</a></p>\r\n	gravat calcogràfic i serigrafia sobre diversos papers i suports	\N	2021-11-20 13:37:15.600703	2021-11-20 13:37:15.603289
97	92	ca	obra gràfica	<p>Exposem a Bilbao al Festival Internacional de Grabado y arte sobre papel: Eul&agrave;lia Espasa, Bess Frimog, Roser Sales, Mireia Zantop.</p>\r\n\r\n<p><a href="http://www.figbilbao.com">http://www.figbilbao.com</a></p>\r\n\r\n<p><a href="https://figonlinefair.com/artista/mireia-zantop/">https://figonlinefair.com/artista/mireia-zantop/</a></p>\r\n	gravat calcogràfic i serigrafia sobre diversos papers i suports	\N	2021-11-19 20:17:29.236969	2021-11-20 13:40:31.601172
106	72	es	cap cap	<p><strong>Festival de Land-art</strong> ArtiGavarres, 2019</p>\r\n\r\n<p><a href="http://www.artigavarres.cat/galeria.php?idc=2#prettyPhoto">http://www.artigavarres.cat/galeria.php?idc=2#prettyPhoto</a></p>\r\n\r\n<p>Proyecto de cocreaci&oacute;n con Aleix Antillach</p>\r\n\r\n<p><a href="http://leix.org">http://leix.org</a></p>\r\n\r\n<p>&nbsp;</p>\r\n	escultures efímeres de palla 	\N	2022-01-05 21:06:26.094854	2022-01-05 21:06:26.097595
101	82	es	Phoscenes	<p>Dibujos del confinamiento, exposici&oacute;n del 18 de septiembre al 30 de octubre 2020 en Lapek (Lavern Subirats) i Madremanya (Girona).</p>\r\n	mixta s/ papel	\N	2022-01-05 20:06:46.252987	2022-01-05 20:07:42.792587
102	13	es	constelacciones	<p>Acci&oacute;n in&eacute;dita realizada con Elisabetta Balasso.</p>\r\n	dibujo sobre piel	\N	2022-01-05 20:10:05.54647	2022-01-05 20:10:05.549086
98	88	es	ULL! agulles	<p>Festival de Land Art MICROSCOPIES</p>\r\n\r\n<p>Manresa, 2021</p>\r\n\r\n<p>Cocreaci&oacute;n i coproducci&oacute;n de ALEIX ANTILLACH y MIREIA ZANTOP</p>\r\n\r\n<p>Construyendo, as&iacute; como dibujando, miramos, conocemos y, tal vez, reconocemos. Jugamos con el paisaje ind&oacute;mito y el domesticado. Jugamos con la escala, el tama&ntilde;o y la medida que nuestra mirada conjuga.</p>\r\n\r\n<p>Cat&aacute;logo virtual: <a href="https://meandremanresa.com/2021/08/20/propera-sortida/microscopies_2021/">https://meandremanresa.com/2021/08/20/propera-sortida/microscopies_2021/</a></p>\r\n\r\n<p>Prensa: <a href="https://www.naciodigital.cat/manresa/noticia/98872/segona-microscopies-es-fara-torre-lluvia-amb-obres-efimeres-permanent-angels-freixanet">https://www.naciodigital.cat/manresa/noticia/98872/segona-microscopies-es-fara-torre-lluvia-amb-obres-efimeres-permanent-angels-freixanet</a></p>\r\n	Instalación efímera en el paisaje	\N	2021-11-19 21:41:37.138667	2022-01-05 20:16:55.148213
103	71	es	entrar saliendo, salir entrando		Escultura de alabastro	\N	2022-01-05 20:21:12.669864	2022-01-05 20:21:12.67258
107	67	es	ip(sum), id(est)	<p>Acci&oacute;n en la Fundaci&oacute;n Valvi en el marco del festival Inundart, Girona</p>\r\n\r\n<p>1 de julio de 2018</p>\r\n	Performance, dibujo con el cuerpo, yeso, carbón, saliva y agua.	\N	2022-01-05 21:12:29.961094	2022-01-05 21:12:29.963527
104	76	es	gravat 9	<p><strong>Acciones fotograbadas y poes&iacute;as visuales</strong> (serie cont&iacute;nuos-discont&iacute;nuos y serie r&iacute;os de cielo)</p>\r\n\r\n<p>Exposici&oacute;n colectiva en La Mirada Expandida y Can Bast&eacute;, Barcelona</p>\r\n	fotograbado	\N	2022-01-05 20:25:20.171489	2022-01-05 20:26:16.346682
109	44	es	estOna	<p>Intervenci&oacute;n ef&iacute;mera en el sector &quot;Ona&quot; en la Alta Garrotxa.</p>\r\n\r\n<p>ona = ola</p>\r\n\r\n<p>estona = rato</p>\r\n\r\n<p>est = este, punto cardinal, o es, del lat&iacute;n</p>\r\n\r\n<p>visibilizaci&oacute;n de una l&iacute;nea de est-ratos</p>\r\n\r\n<p>&nbsp;</p>\r\n	intervención efímera	\N	2022-01-05 21:31:18.943235	2022-01-05 21:38:07.451519
108	64	es	fluxus	<p>Festival La Muga Caula</p>\r\n\r\n<p><strong>Exposici&oacute;n colectiva en homenaje a Ben Patterson. </strong></p>\r\n\r\n<p><strong>Galeria Dolors Vent&oacute;s, Figueres.</strong></p>\r\n\r\n<p>Acci&oacute;n-instalaci&oacute;n iniciada antes de la inauguraci&oacute;n, completando-se durante la exposici&oacute;.</p>\r\n	tintas sobre papel, bolsa de suero, equipo de perfusión, cascabels	\N	2022-01-05 21:18:23.188331	2022-01-05 21:20:49.99799
110	73	es	trans form/morf I-VII		manipulación,transformación, reubicación de materiales naturales 	\N	2022-01-05 21:43:08.66151	2022-01-05 21:43:08.663907
112	75	es	EnClaveDeBes(os)	<p>Instalacci&oacute;n po&eacute;tica</p>\r\n\r\n<p><strong>Fisures</strong> I Encuentro y Muestra de Arte Multidisciplinario de Palafolls</p>\r\n\r\n<p>acci&oacute;n: 12 de julio de 2014</p>\r\n	Escalera, martillo, clavos, papel hecho a mano, ropa de lino, alfabetos, sonidos, ramas, pintalabios	\N	2022-01-10 11:45:29.813529	2022-01-10 11:45:58.782086
111	14	es	AflorA	<p>Exposici&oacute;n de obra gr&aacute;fica original, Sin&egrave;rgia, Vic.</p>\r\n	calcografía y serigrafía	\N	2022-01-05 21:50:21.122443	2022-01-10 11:21:20.719942
105	74	es	paisaje líquido	<p><strong>Exposici&oacute;n colectiva y taller &quot;La piel como paisaje&quot;</strong></p>\r\n\r\n<p>de Tatiana Blanc, Eva Miquel, Victoria Raval, Lesley Yendell y Mireia Zantop</p>\r\n\r\n<p>en La Pedrera, Subirats.</p>\r\n\r\n<p>&nbsp;</p>\r\n	obra original sobre papel y obra gráfica	\N	2022-01-05 20:33:13.007013	2022-01-10 11:22:41.06805
113	38	es	ad hoc	<p>serie de acciones e intervenciones improvisadas ad hoc</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n	movimiento y relación con y entre los objets trouvés, acción, escultura e instalación efímera	\N	2022-01-10 11:49:06.041888	2022-01-10 11:49:06.044599
\.


--
-- Name: work_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('work_translations_id_seq', 113, true);


--
-- Data for Name: works; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY works (id, slug_en, slug_es, slug_ca, realization_date, dimensions, "position", type, created_at, updated_at, published, images_count) FROM stdin;
83	des-cuidar	des-cuidar	des-cuidar	2020-03-08	\N	66	ActionWork	2021-01-04 20:46:03.849595	2021-01-04 20:49:41.618875	f	7
78	thyllandsias	thyllandsias	thyllandsias	2019-02-14	petites	64	VisualWork	2020-02-14 21:53:45.784852	2020-10-14 23:00:12.393682	f	4
82	phoscenes	phoscenes	phoscenes	2020-09-20	15x20cm y 21x30cm	65	VisualWork	2020-09-21 08:55:36.118883	2022-01-05 20:07:42.746165	t	8
72	cap-cap	cap-cap	cap-cap	2019-04-10	4 x 2 x 2m cada cap	60	VisualWork	2019-04-10 23:03:30.93674	2022-01-05 21:06:26.043782	t	4
70	proces-in-solid	proces-in-solid	petraperta	2020-01-28		57	VisualWork	2019-01-28 21:07:00.386441	2020-09-20 21:15:52.229861	f	0
68	quid-de-la-questio	quid-de-la-questio	quid-de-la-questio	2018-08-18	\N	55	ActionWork	2018-08-22 15:29:30.538993	2020-09-20 20:50:24.952837	t	5
66	per-se	per-se	per-se	2018-06-15	\N	53	ActionWork	2018-08-22 15:12:28.262887	2020-09-20 20:50:24.991831	t	5
65	desig-per-z-ones	desig-per-z-ones	desig-per-z-ones	2018-06-28	\N	52	ActionWork	2018-08-22 15:06:01.745665	2020-09-20 20:50:25.025151	t	8
44	estona	estona	estona	2014-01-04	200m x 4h	34	VisualWork	2015-01-05 00:13:34.134193	2022-01-05 21:38:07.421219	t	5
67	ip-sum-id-est	ip-sum-id-est	ip-sum-id-est	2018-08-22	diàmetro: 35cm	54	VisualWork	2018-08-22 15:22:59.105854	2022-01-05 21:12:29.898868	t	7
71	entrar-sortint-sortir-entrant	entrar-saliendo-salir-entrando	entrar-sortint-sortir-entrant	2019-03-07	22 x 20 x 10 cm	58	VisualWork	2019-03-07 22:44:49.704275	2022-01-05 20:21:12.642688	t	3
73	trans-form-morf-i-vii	trans-form-morf-i-vii	trans-form-morf-i-vii	2018-04-15		59	VisualWork	2019-04-15 11:41:03.226797	2022-01-05 21:43:08.606615	t	7
81	s-o-gota-a-gota	s-o-gota-a-gota	gota-gota	2017-02-19	50 x 50 x 175cm	51	VisualWork	2020-02-19 17:54:40.91911	2020-09-20 21:21:00.647538	f	0
63	flux-u	flux-u	flux	2016-09-09	\N	50	ActionWork	2017-06-02 00:01:30.321383	2020-09-20 20:50:25.005059	t	5
62	donar-veu-i-veure-mes	donar-veu-i-veure-mes	donar-veu-i-veure-mes	2017-03-08	\N	49	ActionWork	2017-06-01 23:32:58.900866	2020-09-20 20:50:25.012495	t	12
57	tot-fluxus	tot-fluxus	flux-us	2016-09-17	\N	46	ActionWork	2016-10-19 22:59:40.404894	2020-09-20 20:50:24.893548	t	5
56	cromosomx	cromosomx	cromosomx	2016-10-01	\N	45	ActionWork	2016-10-19 22:54:27.41393	2020-09-20 20:50:24.881316	t	4
51	pomps-of-the-subsoil	pomps-of-the-subsoil	pomps-of-the-subsoil	2015-11-06	\N	43	ActionWork	2016-08-01 16:18:28.208002	2016-08-05 11:39:07.587787	t	10
54	donar-veu-al-desig	donar-veu-al-desig	donar-veu-al-desig	2015-12-12	\N	42	ActionWork	2016-08-01 17:50:44.208163	2020-09-20 20:50:25.018978	t	5
53	fluxus	fluxus	fluxus	2016-07-29	\N	41	ActionWork	2016-08-01 17:43:51.781812	2020-09-20 20:50:25.039552	t	8
52	eventuall	eventuall	eventuall	2015-07-31	\N	40	ActionWork	2016-08-01 16:58:23.594865	2016-08-01 16:59:31.49856	t	5
64	fluxus--2	fluxus--2	fluxus--2	2016-06-02	3 x 1 x 1,75m	44	VisualWork	2017-06-02 00:41:09.680582	2022-01-05 21:20:49.963678	t	6
55	donar-veu-fer-un-pas	donar-veu-fer-un-pas	donar-veu-i-fer-un-pas	2015-03-08	\N	39	ActionWork	2016-08-01 17:54:00.844746	2020-09-20 20:50:25.046377	t	6
49	sonet-i-tes-yeux-aux-bleux-aigus-d-acier-et-de-cristal	sonet-i-tes-yeux-aux-bleux-aigus-d-acier-et-de-cristal	aux-bleux-aigus-d-acier-et-de-cristal--2	2015-01-27	\N	38	ActionWork	2016-08-01 15:46:03.101867	2016-08-01 17:00:18.671453	t	2
48	pes-pressio	pes-pressio	pes-pressio	2015-10-22	\N	37	ActionWork	2016-08-01 15:36:37.797864	2020-09-20 20:50:24.913002	t	10
47	elgrandtour	elgrandtour	elgrandtour	2015-08-27	\N	36	ActionWork	2015-09-27 22:40:21.937473	2015-09-27 22:42:43.6855	t	10
46	free-will-x-veure	free-will-x-veure	free-will-x-veure	2015-05-29	\N	35	ActionWork	2015-07-03 00:07:34.077024	2020-09-20 20:50:24.906908	t	6
43	esclau	esclau	esclau	2014-12-07	\N	33	ActionWork	2015-01-04 23:00:32.867555	2015-01-04 23:21:24.331086	t	11
42	d-accions-i-diccions	d-accions-i-diccions	d-accions-i-diccions	2014-10-12	\N	32	ActionWork	2015-01-04 22:05:04.756829	2015-01-04 22:13:33.864906	t	7
41	present-o-saltal-ara	present-o-saltal-ara	present-o-saltal-ara	2014-04-25	\N	31	ActionWork	2014-05-17 13:20:04.134108	2020-09-20 20:50:24.966677	t	9
38	ad-hoc-al-lloc	ad-hoc	ad-hoc	2014-05-17	de 5cm a 30m de diámetro	27	VisualWork	2014-05-17 12:58:01.573508	2022-01-10 11:49:05.968889	t	7
92	prints	obra-grafica	obra-grafica	2021-11-19		71	VisualWork	2021-11-19 20:17:25.43168	2022-01-05 20:02:40.427619	t	7
74	paisatge-liquid	paisaje-liquido	paisatge-liquid	2019-06-10	varias	61	VisualWork	2019-06-10 20:41:47.106447	2022-01-10 11:24:54.400521	t	10
87	over-and-over-again-and-again	over-and-over-again-and-again	over-and-over-again-and-again	2021-08-08	\N	69	ActionWork	2021-08-31 23:10:08.820784	2022-01-13 20:54:16.093342	t	5
85	i-o-torno-i-no-torno	si-i-o-no-torno-i-no-torno	si-i-o-no-torno-i-no-torno	2021-03-22	\N	68	ActionWork	2021-04-08 21:04:22.982108	2021-09-26 20:50:13.214682	t	6
84	entrelinies-8ple8buit	entrelinies-8ple8buit	entre-linies-8ple8buit-veure	2020-11-16	\N	67	ActionWork	2021-01-04 20:54:14.332123	2021-08-31 23:06:53.60256	t	4
69	ipse-ipsa-ipsum-em	ipse-ipsa-ipsum-em	ipse-ipsa-ipsum-em	2019-01-12	\N	56	ActionWork	2019-01-18 23:45:25.386543	2020-09-20 20:50:24.946269	t	4
61	we-were-waiting-for-you--2	we-were-waiting-for-you--2	we-were-waiting-for-you--2	2017-05-04	\N	48	ActionWork	2017-06-01 23:00:44.560054	2018-12-22 17:31:52.27902	t	1
59	idenditat	idenditat	idenditat	2017-04-29	\N	47	ActionWork	2017-06-01 22:46:00.441816	2020-09-20 20:50:24.959875	t	10
40	birds-ocells-al-cap	birds-ocells-al-cap	birds-ocells-al-cap	2014-05-10	\N	29	ActionWork	2014-05-17 13:01:15.490385	2016-08-05 12:02:03.827813	t	1
39	polissons	polissons	els-polissons	2014-05-31	\N	28	ActionWork	2014-05-17 12:59:00.756984	2020-09-20 20:50:24.979295	t	6
37	n-ombrares	n-ombrares	n-ombrares	2013-06-22	\N	26	ActionWork	2014-05-17 12:35:47.228536	2020-09-20 20:50:24.939653	t	6
36	despunxar	despunxar	despunxar	2013-11-09	\N	25	ActionWork	2013-12-06 13:20:53.584595	2020-09-20 20:50:24.919016	t	6
35	quina-es-la-pregunta	quina-es-la-pregunta	quina-es-la-pregunta	2013-11-25	\N	24	ActionWork	2013-12-06 13:07:19.832531	2020-09-20 20:50:24.972956	t	5
34	sum-us	sum-us	sum-us	2013-11-22	\N	23	ActionWork	2013-12-06 13:04:41.818596	2020-09-20 20:50:24.925366	t	7
33	fent-volar-coloms	fent-volar-coloms	fent-volar-coloms	2013-11-28	\N	22	ActionWork	2013-12-06 12:49:22.391758	2020-09-20 20:50:24.932879	t	7
31	a-z-5-5-f-acts	a-z-5-5-f-acts	a-z-5-5-f-acts	2013-07-12	\N	21	ActionWork	2013-09-05 14:59:30.581912	2020-09-20 20:50:24.887363	t	1
30	axis-salus-hommage-to-the-good-doctor	axis-salus-homenaje-al-buen-medico-premio-separ	axis-salus-homenatge-al-bon-metge	2013-08-20	11,5 x 14 x 13 cm	20	VisualWork	2013-08-20 12:50:53.330132	2014-10-09 17:19:05.582834	f	2
29	grafies-d-una-mirada-a-sarria	grafies-d-una-mirada-a-sarria	grafies-d-una-mirada-a-sarria	2012-04-05	18 x 23 cm	19	VisualWork	2013-04-05 18:53:13.913679	2013-04-05 18:56:47.172902	t	8
27	si-lent-si-silenci	si-lent-si-silenci	si-lent-si-silenci	2013-04-05	\N	18	ActionWork	2013-04-05 15:05:10.489553	2020-09-20 20:50:24.862163	f	0
24	s-t-sin-titulo	s-t-sin-titulo	s-t-sense-titol	2013-02-23	\N	17	ActionWork	2013-03-27 21:35:26.163119	2020-09-20 20:50:24.874958	t	10
75	enclaudebes	enclavedebes-os	enclaudebes	2014-06-10	Sala de exposiciones del MiD	30	VisualWork	2019-06-10 21:35:27.166925	2022-01-10 11:45:58.720538	t	10
6	zenits-1	zenits-1	zenits-1	2011-09-16	30 x 39,5 cm	6	VisualWork	2013-01-04 20:32:19.488412	2013-03-28 01:44:05.424587	t	10
12	musical-ment	musical-ment	musical-ment	2011-08-15	\N	5	ActionWork	2013-01-05 01:21:06.678029	2020-09-21 12:33:25.921228	t	4
11	dinergia-i-ii-iii	dinergia-i-ii-iii	dinergia-i-ii-iii	2009-01-05		4	VisualWork	2013-01-05 00:51:50.446447	2013-01-05 00:56:53.398888	t	5
26	el-celler-i--2	el-celler-i--2	el-celler-i--2	2008-03-28		3	VisualWork	2013-03-28 00:59:05.058178	2013-03-28 01:20:39.603891	t	3
8	dues-veus-nues	dues-veus-nues	dues-veus-nues	2011-04-01		2	VisualWork	2013-01-04 20:55:13.990187	2020-09-20 20:50:24.900473	t	3
7	possibles-impossibles	possibles-impossibles	possibles-impossibles	2011-04-28	\N	1	ActionWork	2013-01-04 20:49:48.47245	2020-09-20 20:50:24.985554	t	3
14	aflora	aflora	aflora	2011-01-05		8	VisualWork	2013-01-05 01:36:09.623864	2022-01-10 11:21:20.689562	t	5
13	constelaccions	constelacciones	constelaccions	2008-01-05		9	VisualWork	2013-01-05 01:30:14.33089	2022-01-05 20:10:05.535745	t	1
88	ull-agulles	ull-agulles	ull-agulles	2021-09-20	Un trozo de campo en Torre Lluvià. O también: de aquí a Montserrat	70	VisualWork	2021-09-20 19:33:22.557705	2022-01-05 20:16:55.089635	t	8
77	de-veu-en-veu	de-veu-en-veu	de-veu-en-veu	2019-03-06	\N	63	ActionWork	2019-06-10 22:08:30.86874	2021-08-31 23:07:42.432665	f	3
23	6-senses--7	6-senses--7	6-senses-consentidosinsentido	2013-03-07	\N	16	ActionWork	2013-03-22 00:11:06.526061	2020-09-20 20:50:24.851568	t	5
9	e-qui-libri-s-ii	e-qui-libri-s-ii	e-qui-libri-s-ii	2012-09-27	\N	15	ActionWork	2013-01-04 22:53:52.680536	2020-09-20 20:50:24.868469	t	11
17	uters	uters	uters	2010-01-20		14	VisualWork	2013-01-20 01:01:01.351696	2013-03-28 00:07:10.388773	t	3
19	taboo-ser-res-cos-soc	taboo-ser-res-cos-soc	taboo-ser-res-cos-soc	2010-05-02	\N	13	ActionWork	2013-01-20 02:38:39.839034	2020-09-20 20:50:25.03206	t	7
16	ouroboros-veus	ouroboros-veus	ouroboros-veus	2011-09-06	\N	12	ActionWork	2013-01-20 00:53:54.408037	2020-09-20 20:50:24.836661	t	8
10	anima-l-u	anima-l-u	anima-l-u	2011-03-09	\N	11	ActionWork	2013-01-05 00:35:47.123185	2020-09-20 20:50:24.808167	t	4
15	improvisar	improvisar	impro	2012-03-23	\N	10	ActionWork	2013-01-05 01:58:04.864981	2020-09-20 20:50:24.829423	t	3
18	itaca-pas-a-dos	itaca-pas-a-dos	itaca-pas-a-dos	2009-06-22	\N	7	ActionWork	2013-01-20 02:15:44.616616	2020-09-20 20:50:24.844214	t	3
76	gravat9	gravat-9	gravat-9	2019-06-10	varias	62	VisualWork	2019-06-10 21:53:33.118572	2022-01-05 20:26:16.304672	t	7
\.


--
-- Name: works_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('works_id_seq', 92, true);


--
-- Name: ckeditor_assets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ckeditor_assets
    ADD CONSTRAINT ckeditor_assets_pkey PRIMARY KEY (id);


--
-- Name: friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: image_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY image_translations
    ADD CONSTRAINT image_translations_pkey PRIMARY KEY (id);


--
-- Name: images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: page_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY page_translations
    ADD CONSTRAINT page_translations_pkey PRIMARY KEY (id);


--
-- Name: pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: section_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY section_translations
    ADD CONSTRAINT section_translations_pkey PRIMARY KEY (id);


--
-- Name: sections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (id);


--
-- Name: tag_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tag_translations
    ADD CONSTRAINT tag_translations_pkey PRIMARY KEY (id);


--
-- Name: taggings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY taggings
    ADD CONSTRAINT taggings_pkey PRIMARY KEY (id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: work_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY work_translations
    ADD CONSTRAINT work_translations_pkey PRIMARY KEY (id);


--
-- Name: works_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY works
    ADD CONSTRAINT works_pkey PRIMARY KEY (id);


--
-- Name: idx_ckeditor_assetable; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_ckeditor_assetable ON ckeditor_assets USING btree (assetable_type, assetable_id);


--
-- Name: idx_ckeditor_assetable_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_ckeditor_assetable_type ON ckeditor_assets USING btree (assetable_type, type, assetable_id);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON friendly_id_slugs USING btree (slug, sluggable_type);


--
-- Name: index_friendly_id_slugs_on_sluggable_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_id ON friendly_id_slugs USING btree (sluggable_id);


--
-- Name: index_friendly_id_slugs_on_sluggable_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type ON friendly_id_slugs USING btree (sluggable_type);


--
-- Name: index_image_translations_on_image_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_image_translations_on_image_id ON image_translations USING btree (image_id);


--
-- Name: index_image_translations_on_locale; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_image_translations_on_locale ON image_translations USING btree (locale);


--
-- Name: index_images_on_illustrated_id_and_illustrated_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_images_on_illustrated_id_and_illustrated_type ON images USING btree (illustrated_id, illustrated_type);


--
-- Name: index_page_translations_on_locale; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_page_translations_on_locale ON page_translations USING btree (locale);


--
-- Name: index_page_translations_on_page_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_page_translations_on_page_id ON page_translations USING btree (page_id);


--
-- Name: index_section_translations_on_locale; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_section_translations_on_locale ON section_translations USING btree (locale);


--
-- Name: index_section_translations_on_section_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_section_translations_on_section_id ON section_translations USING btree (section_id);


--
-- Name: index_sections_on_content_id_and_content_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_sections_on_content_id_and_content_type ON sections USING btree (content_id, content_type);


--
-- Name: index_tag_translations_on_locale; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_tag_translations_on_locale ON tag_translations USING btree (locale);


--
-- Name: index_tag_translations_on_tag_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_tag_translations_on_tag_id ON tag_translations USING btree (tag_id);


--
-- Name: index_taggings_on_tag_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_taggings_on_tag_id ON taggings USING btree (tag_id);


--
-- Name: index_taggings_on_taggable_type_and_taggable_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_taggings_on_taggable_type_and_taggable_id ON taggings USING btree (taggable_type, taggable_id);


--
-- Name: index_tags_on_slug_ca; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_tags_on_slug_ca ON tags USING btree (slug_ca);


--
-- Name: index_tags_on_slug_en; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_tags_on_slug_en ON tags USING btree (slug_en);


--
-- Name: index_tags_on_slug_es; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_tags_on_slug_es ON tags USING btree (slug_es);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_name ON users USING btree (name);


--
-- Name: index_work_translations_on_locale; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_work_translations_on_locale ON work_translations USING btree (locale);


--
-- Name: index_work_translations_on_work_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_work_translations_on_work_id ON work_translations USING btree (work_id);


--
-- Name: index_works_on_slug_ca; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_works_on_slug_ca ON works USING btree (slug_ca);


--
-- Name: index_works_on_slug_en; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_works_on_slug_en ON works USING btree (slug_en);


--
-- Name: index_works_on_slug_es; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_works_on_slug_es ON works USING btree (slug_es);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

