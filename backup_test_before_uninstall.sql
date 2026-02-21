--
-- PostgreSQL database dump
--

\restrict zURFsZ91y1LOKhQjcxILXSfF3vdDxCy3X472fTflUfUWR1DtxeAPqjjMMxBzaJz

-- Dumped from database version 16.11 (Debian 16.11-1.pgdg13+1)
-- Dumped by pg_dump version 16.11 (Debian 16.11-1.pgdg13+1)

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
-- Name: orm_signaling_assets; Type: TABLE; Schema: public; Owner: odoo
--

CREATE TABLE public.orm_signaling_assets (
    id integer NOT NULL,
    date timestamp without time zone DEFAULT now()
);


ALTER TABLE public.orm_signaling_assets OWNER TO odoo;

--
-- Name: orm_signaling_assets_id_seq; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.orm_signaling_assets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orm_signaling_assets_id_seq OWNER TO odoo;

--
-- Name: orm_signaling_assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: odoo
--

ALTER SEQUENCE public.orm_signaling_assets_id_seq OWNED BY public.orm_signaling_assets.id;


--
-- Name: orm_signaling_default; Type: TABLE; Schema: public; Owner: odoo
--

CREATE TABLE public.orm_signaling_default (
    id integer NOT NULL,
    date timestamp without time zone DEFAULT now()
);


ALTER TABLE public.orm_signaling_default OWNER TO odoo;

--
-- Name: orm_signaling_default_id_seq; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.orm_signaling_default_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orm_signaling_default_id_seq OWNER TO odoo;

--
-- Name: orm_signaling_default_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: odoo
--

ALTER SEQUENCE public.orm_signaling_default_id_seq OWNED BY public.orm_signaling_default.id;


--
-- Name: orm_signaling_groups; Type: TABLE; Schema: public; Owner: odoo
--

CREATE TABLE public.orm_signaling_groups (
    id integer NOT NULL,
    date timestamp without time zone DEFAULT now()
);


ALTER TABLE public.orm_signaling_groups OWNER TO odoo;

--
-- Name: orm_signaling_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.orm_signaling_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orm_signaling_groups_id_seq OWNER TO odoo;

--
-- Name: orm_signaling_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: odoo
--

ALTER SEQUENCE public.orm_signaling_groups_id_seq OWNED BY public.orm_signaling_groups.id;


--
-- Name: orm_signaling_registry; Type: TABLE; Schema: public; Owner: odoo
--

CREATE TABLE public.orm_signaling_registry (
    id integer NOT NULL,
    date timestamp without time zone DEFAULT now()
);


ALTER TABLE public.orm_signaling_registry OWNER TO odoo;

--
-- Name: orm_signaling_registry_id_seq; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.orm_signaling_registry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orm_signaling_registry_id_seq OWNER TO odoo;

--
-- Name: orm_signaling_registry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: odoo
--

ALTER SEQUENCE public.orm_signaling_registry_id_seq OWNED BY public.orm_signaling_registry.id;


--
-- Name: orm_signaling_routing; Type: TABLE; Schema: public; Owner: odoo
--

CREATE TABLE public.orm_signaling_routing (
    id integer NOT NULL,
    date timestamp without time zone DEFAULT now()
);


ALTER TABLE public.orm_signaling_routing OWNER TO odoo;

--
-- Name: orm_signaling_routing_id_seq; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.orm_signaling_routing_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orm_signaling_routing_id_seq OWNER TO odoo;

--
-- Name: orm_signaling_routing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: odoo
--

ALTER SEQUENCE public.orm_signaling_routing_id_seq OWNED BY public.orm_signaling_routing.id;


--
-- Name: orm_signaling_stable; Type: TABLE; Schema: public; Owner: odoo
--

CREATE TABLE public.orm_signaling_stable (
    id integer NOT NULL,
    date timestamp without time zone DEFAULT now()
);


ALTER TABLE public.orm_signaling_stable OWNER TO odoo;

--
-- Name: orm_signaling_stable_id_seq; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.orm_signaling_stable_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orm_signaling_stable_id_seq OWNER TO odoo;

--
-- Name: orm_signaling_stable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: odoo
--

ALTER SEQUENCE public.orm_signaling_stable_id_seq OWNED BY public.orm_signaling_stable.id;


--
-- Name: orm_signaling_templates; Type: TABLE; Schema: public; Owner: odoo
--

CREATE TABLE public.orm_signaling_templates (
    id integer NOT NULL,
    date timestamp without time zone DEFAULT now()
);


ALTER TABLE public.orm_signaling_templates OWNER TO odoo;

--
-- Name: orm_signaling_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.orm_signaling_templates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orm_signaling_templates_id_seq OWNER TO odoo;

--
-- Name: orm_signaling_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: odoo
--

ALTER SEQUENCE public.orm_signaling_templates_id_seq OWNED BY public.orm_signaling_templates.id;


--
-- Name: orm_signaling_assets id; Type: DEFAULT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.orm_signaling_assets ALTER COLUMN id SET DEFAULT nextval('public.orm_signaling_assets_id_seq'::regclass);


--
-- Name: orm_signaling_default id; Type: DEFAULT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.orm_signaling_default ALTER COLUMN id SET DEFAULT nextval('public.orm_signaling_default_id_seq'::regclass);


--
-- Name: orm_signaling_groups id; Type: DEFAULT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.orm_signaling_groups ALTER COLUMN id SET DEFAULT nextval('public.orm_signaling_groups_id_seq'::regclass);


--
-- Name: orm_signaling_registry id; Type: DEFAULT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.orm_signaling_registry ALTER COLUMN id SET DEFAULT nextval('public.orm_signaling_registry_id_seq'::regclass);


--
-- Name: orm_signaling_routing id; Type: DEFAULT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.orm_signaling_routing ALTER COLUMN id SET DEFAULT nextval('public.orm_signaling_routing_id_seq'::regclass);


--
-- Name: orm_signaling_stable id; Type: DEFAULT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.orm_signaling_stable ALTER COLUMN id SET DEFAULT nextval('public.orm_signaling_stable_id_seq'::regclass);


--
-- Name: orm_signaling_templates id; Type: DEFAULT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.orm_signaling_templates ALTER COLUMN id SET DEFAULT nextval('public.orm_signaling_templates_id_seq'::regclass);


--
-- Data for Name: orm_signaling_assets; Type: TABLE DATA; Schema: public; Owner: odoo
--

COPY public.orm_signaling_assets (id, date) FROM stdin;
1	2026-02-21 10:55:51.034886
\.


--
-- Data for Name: orm_signaling_default; Type: TABLE DATA; Schema: public; Owner: odoo
--

COPY public.orm_signaling_default (id, date) FROM stdin;
1	2026-02-21 10:55:51.034886
\.


--
-- Data for Name: orm_signaling_groups; Type: TABLE DATA; Schema: public; Owner: odoo
--

COPY public.orm_signaling_groups (id, date) FROM stdin;
1	2026-02-21 10:55:51.034886
\.


--
-- Data for Name: orm_signaling_registry; Type: TABLE DATA; Schema: public; Owner: odoo
--

COPY public.orm_signaling_registry (id, date) FROM stdin;
1	2026-02-21 10:55:51.034886
\.


--
-- Data for Name: orm_signaling_routing; Type: TABLE DATA; Schema: public; Owner: odoo
--

COPY public.orm_signaling_routing (id, date) FROM stdin;
1	2026-02-21 10:55:51.034886
\.


--
-- Data for Name: orm_signaling_stable; Type: TABLE DATA; Schema: public; Owner: odoo
--

COPY public.orm_signaling_stable (id, date) FROM stdin;
1	2026-02-21 10:55:51.034886
\.


--
-- Data for Name: orm_signaling_templates; Type: TABLE DATA; Schema: public; Owner: odoo
--

COPY public.orm_signaling_templates (id, date) FROM stdin;
1	2026-02-21 10:55:51.034886
\.


--
-- Name: orm_signaling_assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.orm_signaling_assets_id_seq', 1, true);


--
-- Name: orm_signaling_default_id_seq; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.orm_signaling_default_id_seq', 1, true);


--
-- Name: orm_signaling_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.orm_signaling_groups_id_seq', 1, true);


--
-- Name: orm_signaling_registry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.orm_signaling_registry_id_seq', 1, true);


--
-- Name: orm_signaling_routing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.orm_signaling_routing_id_seq', 1, true);


--
-- Name: orm_signaling_stable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.orm_signaling_stable_id_seq', 1, true);


--
-- Name: orm_signaling_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.orm_signaling_templates_id_seq', 1, true);


--
-- Name: orm_signaling_assets orm_signaling_assets_pkey; Type: CONSTRAINT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.orm_signaling_assets
    ADD CONSTRAINT orm_signaling_assets_pkey PRIMARY KEY (id);


--
-- Name: orm_signaling_default orm_signaling_default_pkey; Type: CONSTRAINT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.orm_signaling_default
    ADD CONSTRAINT orm_signaling_default_pkey PRIMARY KEY (id);


--
-- Name: orm_signaling_groups orm_signaling_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.orm_signaling_groups
    ADD CONSTRAINT orm_signaling_groups_pkey PRIMARY KEY (id);


--
-- Name: orm_signaling_registry orm_signaling_registry_pkey; Type: CONSTRAINT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.orm_signaling_registry
    ADD CONSTRAINT orm_signaling_registry_pkey PRIMARY KEY (id);


--
-- Name: orm_signaling_routing orm_signaling_routing_pkey; Type: CONSTRAINT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.orm_signaling_routing
    ADD CONSTRAINT orm_signaling_routing_pkey PRIMARY KEY (id);


--
-- Name: orm_signaling_stable orm_signaling_stable_pkey; Type: CONSTRAINT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.orm_signaling_stable
    ADD CONSTRAINT orm_signaling_stable_pkey PRIMARY KEY (id);


--
-- Name: orm_signaling_templates orm_signaling_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.orm_signaling_templates
    ADD CONSTRAINT orm_signaling_templates_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict zURFsZ91y1LOKhQjcxILXSfF3vdDxCy3X472fTflUfUWR1DtxeAPqjjMMxBzaJz

