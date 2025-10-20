--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

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
-- Name: carreras; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.carreras (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    codigo character varying(5)
);


--
-- Name: carreras_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.carreras_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: carreras_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.carreras_id_seq OWNED BY public.carreras.id;


--
-- Name: estado_oferta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.estado_oferta (
    id integer NOT NULL,
    ramo_id integer,
    carrera_id integer,
    activo boolean DEFAULT false
);


--
-- Name: estado_oferta_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.estado_oferta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: estado_oferta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.estado_oferta_id_seq OWNED BY public.estado_oferta.id;


--
-- Name: formularios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.formularios (
    id integer NOT NULL,
    ramo_id integer NOT NULL,
    nombre character varying(255),
    enlace character varying(255)
);


--
-- Name: formularios_temp_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.formularios_temp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: formularios_temp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.formularios_temp_id_seq OWNED BY public.formularios.id;


--
-- Name: profesores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.profesores (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    correo character varying(100) NOT NULL
);


--
-- Name: profesores_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.profesores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: profesores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.profesores_id_seq OWNED BY public.profesores.id;


--
-- Name: profesores_ramos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.profesores_ramos (
    id integer NOT NULL,
    profesor_id integer NOT NULL,
    ramo_id integer NOT NULL,
    carrera_id integer NOT NULL
);


--
-- Name: profesores_ramos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.profesores_ramos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: profesores_ramos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.profesores_ramos_id_seq OWNED BY public.profesores_ramos.id;


--
-- Name: ramos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ramos (
    id integer NOT NULL,
    sigla character varying(20) NOT NULL,
    nombre character varying(100) NOT NULL,
    carrera_id integer,
    semestre character varying(50) NOT NULL
);


--
-- Name: ramos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ramos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ramos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ramos_id_seq OWNED BY public.ramos.id;


--
-- Name: respuestas_formulario_local; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.respuestas_formulario_local (
    id integer NOT NULL,
    ramo_id integer NOT NULL,
    carrera_id integer NOT NULL,
    anio integer NOT NULL,
    semestre character varying(20) NOT NULL,
    respondent_email character varying(255) NOT NULL,
    rut character varying(20),
    nombres character varying(255),
    apellidos character varying(255),
    carrera character varying(255),
    anio_ingreso integer,
    veces_curso character varying(20),
    nota_aprobacion numeric(3,2),
    ayudantias text,
    experiencia_evaluaciones text,
    tutorias text,
    talleres_umdu text,
    nivel_riesgo character varying(20),
    motivo_ayudantia text,
    bloques_disponibles jsonb,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    asignado boolean DEFAULT false
);


--
-- Name: respuestas_formulario_local_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.respuestas_formulario_local_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: respuestas_formulario_local_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.respuestas_formulario_local_id_seq OWNED BY public.respuestas_formulario_local.id;


--
-- Name: respuestas_formularios_ramos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.respuestas_formularios_ramos (
    id integer NOT NULL,
    ramo_id integer NOT NULL,
    formulario_url text NOT NULL,
    spreadsheet_id text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    form_id character varying,
    nombre text
);


--
-- Name: respuestas_formularios_ramos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.respuestas_formularios_ramos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: respuestas_formularios_ramos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.respuestas_formularios_ramos_id_seq OWNED BY public.respuestas_formularios_ramos.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    contrasena character varying(255) NOT NULL,
    rol_id integer NOT NULL
);


--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- Name: carreras id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carreras ALTER COLUMN id SET DEFAULT nextval('public.carreras_id_seq'::regclass);


--
-- Name: estado_oferta id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estado_oferta ALTER COLUMN id SET DEFAULT nextval('public.estado_oferta_id_seq'::regclass);


--
-- Name: formularios id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.formularios ALTER COLUMN id SET DEFAULT nextval('public.formularios_temp_id_seq'::regclass);


--
-- Name: profesores id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profesores ALTER COLUMN id SET DEFAULT nextval('public.profesores_id_seq'::regclass);


--
-- Name: profesores_ramos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profesores_ramos ALTER COLUMN id SET DEFAULT nextval('public.profesores_ramos_id_seq'::regclass);


--
-- Name: ramos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ramos ALTER COLUMN id SET DEFAULT nextval('public.ramos_id_seq'::regclass);


--
-- Name: respuestas_formulario_local id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.respuestas_formulario_local ALTER COLUMN id SET DEFAULT nextval('public.respuestas_formulario_local_id_seq'::regclass);


--
-- Name: respuestas_formularios_ramos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.respuestas_formularios_ramos ALTER COLUMN id SET DEFAULT nextval('public.respuestas_formularios_ramos_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- Data for Name: carreras; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.carreras VALUES (1, 'Ingeniería Informática', 'INF');
INSERT INTO public.carreras VALUES (2, 'Ingeniería Civil Informática', 'ICI');
INSERT INTO public.carreras VALUES (3, 'Ingeniería Civil en Ciencia de Datos', 'ICD');


--
-- Data for Name: estado_oferta; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.estado_oferta VALUES (34, 34, 1, false);
INSERT INTO public.estado_oferta VALUES (35, 35, 1, false);
INSERT INTO public.estado_oferta VALUES (12, 12, 1, false);
INSERT INTO public.estado_oferta VALUES (90, 90, 3, true);
INSERT INTO public.estado_oferta VALUES (94, 94, 3, true);
INSERT INTO public.estado_oferta VALUES (14, 14, 1, false);
INSERT INTO public.estado_oferta VALUES (15, 15, 1, false);
INSERT INTO public.estado_oferta VALUES (16, 16, 1, false);
INSERT INTO public.estado_oferta VALUES (18, 18, 1, false);
INSERT INTO public.estado_oferta VALUES (19, 19, 1, false);
INSERT INTO public.estado_oferta VALUES (46, 46, 2, false);
INSERT INTO public.estado_oferta VALUES (1, 1, 1, true);
INSERT INTO public.estado_oferta VALUES (51, 51, 2, false);
INSERT INTO public.estado_oferta VALUES (54, 54, 2, false);
INSERT INTO public.estado_oferta VALUES (55, 55, 2, false);
INSERT INTO public.estado_oferta VALUES (56, 56, 2, false);
INSERT INTO public.estado_oferta VALUES (57, 57, 2, false);
INSERT INTO public.estado_oferta VALUES (5, 5, 1, false);
INSERT INTO public.estado_oferta VALUES (59, 59, 2, false);
INSERT INTO public.estado_oferta VALUES (60, 60, 2, false);
INSERT INTO public.estado_oferta VALUES (61, 61, 2, false);
INSERT INTO public.estado_oferta VALUES (62, 62, 2, false);
INSERT INTO public.estado_oferta VALUES (63, 63, 2, false);
INSERT INTO public.estado_oferta VALUES (65, 65, 2, false);
INSERT INTO public.estado_oferta VALUES (66, 66, 2, false);
INSERT INTO public.estado_oferta VALUES (67, 67, 2, false);
INSERT INTO public.estado_oferta VALUES (68, 68, 2, false);
INSERT INTO public.estado_oferta VALUES (69, 69, 2, false);
INSERT INTO public.estado_oferta VALUES (3, 3, 1, false);
INSERT INTO public.estado_oferta VALUES (71, 71, 2, false);
INSERT INTO public.estado_oferta VALUES (72, 72, 2, false);
INSERT INTO public.estado_oferta VALUES (73, 73, 2, false);
INSERT INTO public.estado_oferta VALUES (74, 74, 2, false);
INSERT INTO public.estado_oferta VALUES (75, 75, 2, false);
INSERT INTO public.estado_oferta VALUES (76, 76, 2, false);
INSERT INTO public.estado_oferta VALUES (77, 77, 2, false);
INSERT INTO public.estado_oferta VALUES (78, 78, 2, false);
INSERT INTO public.estado_oferta VALUES (79, 79, 2, false);
INSERT INTO public.estado_oferta VALUES (80, 80, 2, false);
INSERT INTO public.estado_oferta VALUES (81, 81, 2, false);
INSERT INTO public.estado_oferta VALUES (82, 82, 2, false);
INSERT INTO public.estado_oferta VALUES (83, 83, 2, false);
INSERT INTO public.estado_oferta VALUES (84, 84, 2, false);
INSERT INTO public.estado_oferta VALUES (20, 20, 1, false);
INSERT INTO public.estado_oferta VALUES (21, 21, 1, false);
INSERT INTO public.estado_oferta VALUES (85, 85, 3, false);
INSERT INTO public.estado_oferta VALUES (23, 23, 1, false);
INSERT INTO public.estado_oferta VALUES (24, 24, 1, false);
INSERT INTO public.estado_oferta VALUES (25, 25, 1, false);
INSERT INTO public.estado_oferta VALUES (26, 26, 1, false);
INSERT INTO public.estado_oferta VALUES (87, 87, 3, false);
INSERT INTO public.estado_oferta VALUES (28, 28, 1, false);
INSERT INTO public.estado_oferta VALUES (29, 29, 1, false);
INSERT INTO public.estado_oferta VALUES (30, 30, 1, false);
INSERT INTO public.estado_oferta VALUES (31, 31, 1, false);
INSERT INTO public.estado_oferta VALUES (115, 115, 3, true);
INSERT INTO public.estado_oferta VALUES (122, 122, 3, true);
INSERT INTO public.estado_oferta VALUES (37, 37, 2, false);
INSERT INTO public.estado_oferta VALUES (38, 38, 2, false);
INSERT INTO public.estado_oferta VALUES (6, 6, 1, true);
INSERT INTO public.estado_oferta VALUES (11, 11, 1, true);
INSERT INTO public.estado_oferta VALUES (13, 13, 1, true);
INSERT INTO public.estado_oferta VALUES (2, 2, 1, true);
INSERT INTO public.estado_oferta VALUES (36, 36, 2, false);
INSERT INTO public.estado_oferta VALUES (10, 10, 1, false);
INSERT INTO public.estado_oferta VALUES (33, 33, 1, false);
INSERT INTO public.estado_oferta VALUES (86, 86, 3, false);
INSERT INTO public.estado_oferta VALUES (89, 89, 3, false);
INSERT INTO public.estado_oferta VALUES (95, 95, 3, false);
INSERT INTO public.estado_oferta VALUES (98, 98, 3, false);
INSERT INTO public.estado_oferta VALUES (99, 99, 3, false);
INSERT INTO public.estado_oferta VALUES (100, 100, 3, false);
INSERT INTO public.estado_oferta VALUES (104, 104, 3, false);
INSERT INTO public.estado_oferta VALUES (105, 105, 3, false);
INSERT INTO public.estado_oferta VALUES (106, 106, 3, false);
INSERT INTO public.estado_oferta VALUES (108, 108, 3, false);
INSERT INTO public.estado_oferta VALUES (109, 109, 3, false);
INSERT INTO public.estado_oferta VALUES (110, 110, 3, false);
INSERT INTO public.estado_oferta VALUES (111, 111, 3, false);
INSERT INTO public.estado_oferta VALUES (112, 112, 3, false);
INSERT INTO public.estado_oferta VALUES (114, 114, 3, false);
INSERT INTO public.estado_oferta VALUES (116, 116, 3, false);
INSERT INTO public.estado_oferta VALUES (117, 117, 3, false);
INSERT INTO public.estado_oferta VALUES (118, 118, 3, false);
INSERT INTO public.estado_oferta VALUES (120, 120, 3, false);
INSERT INTO public.estado_oferta VALUES (121, 121, 3, false);
INSERT INTO public.estado_oferta VALUES (123, 123, 3, false);
INSERT INTO public.estado_oferta VALUES (124, 124, 3, false);
INSERT INTO public.estado_oferta VALUES (125, 125, 3, false);
INSERT INTO public.estado_oferta VALUES (126, 126, 3, false);
INSERT INTO public.estado_oferta VALUES (127, 127, 3, false);
INSERT INTO public.estado_oferta VALUES (128, 128, 3, false);
INSERT INTO public.estado_oferta VALUES (129, 129, 3, false);
INSERT INTO public.estado_oferta VALUES (130, 130, 3, false);
INSERT INTO public.estado_oferta VALUES (131, 131, 3, false);
INSERT INTO public.estado_oferta VALUES (132, 132, 3, false);
INSERT INTO public.estado_oferta VALUES (133, 133, 3, false);
INSERT INTO public.estado_oferta VALUES (40, 40, 2, false);
INSERT INTO public.estado_oferta VALUES (41, 41, 2, false);
INSERT INTO public.estado_oferta VALUES (45, 45, 2, true);
INSERT INTO public.estado_oferta VALUES (49, 49, 2, true);
INSERT INTO public.estado_oferta VALUES (50, 50, 2, true);


--
-- Data for Name: formularios; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.formularios VALUES (2, 3, 'INF1413 BIENESTAR Y APRENDIZAJE UNIVERSITARIO', 'https://docs.google.com/forms/d/1HTJy2U2kInrNNy1XdyBf_kEmdqow5DltlgVNaOCVeGI/edit');
INSERT INTO public.formularios VALUES (4, 5, 'FIN100-14 DESARROLLO INTEGRAL Y COMUNICACION PARA INGENIERIA', 'https://docs.google.com/forms/d/1YYiUqOuDITJISS7_LWL8OmCkXQTA6UDA9OzZchOxQx0/edit');
INSERT INTO public.formularios VALUES (5, 6, 'INF1214 FUNDAMENTOS DE PROGRAMACION', 'https://docs.google.com/forms/d/1PvjXcIl1z8yDWM6WnnRysnydCsVRT_DoOgL3oDPISDE/edit');
INSERT INTO public.formularios VALUES (9, 10, 'INF2121 ESTADISTICA COMPUTACIONAL', 'https://docs.google.com/forms/d/1eJ_kjYxW6Hpx4YGKo8Tv2xu5TkHQCSwJdQ7L2vnGoFc/edit');
INSERT INTO public.formularios VALUES (10, 11, 'INF2223 ESTRUCTURA DE DATOS', 'https://docs.google.com/forms/d/1HRCbvZMeAt_2fK6xYQey9iAclCA4Wt2PpajsLYjCFnY/edit');
INSERT INTO public.formularios VALUES (11, 12, 'INF2322 HARDWARE Y SISTEMAS OPERATIVOS', 'https://docs.google.com/forms/d/1N3yR_Bn8OSDgXRBjnXF7LEJK-GZFRHLiwJO763d69XE/edit');
INSERT INTO public.formularios VALUES (12, 13, 'INF2235 BASE DE DATOS', 'https://docs.google.com/forms/d/1TWRm2_yY8ZjQeMU6KGK_zDvQ1uFiocXAv1CLXnF8krg/edit');
INSERT INTO public.formularios VALUES (13, 14, 'INF2236 PROGRAMACION AVANZADA', 'https://docs.google.com/forms/d/1oQ1HA0QB4rm3YRN2ihOW7LZf_lnQXooLEiq9nwfi8QE/edit');
INSERT INTO public.formularios VALUES (14, 15, 'INF2237 INGENIERIA DE SOFTWARE', 'https://docs.google.com/forms/d/1F9TD_iaW26ARC5m7rK9LM7PRqQqryH_hvyeeGLENYJk/edit');
INSERT INTO public.formularios VALUES (15, 16, 'INF2324 REDES DE COMPUTADORES', 'https://docs.google.com/forms/d/1bHh32taYnu-3KSN9y_0ewgaOr2tVuklUMjJrRsaCqQ0/edit');
INSERT INTO public.formularios VALUES (17, 18, 'INF3132 ECONOMIA Y FINANZAS', 'https://docs.google.com/forms/d/11-FWM0x_wRI7wkfT-gI5YclHvTVNI8EUO8YsHpaLn0I/edit');
INSERT INTO public.formularios VALUES (18, 19, 'INF3233 INTELIGENCIA ARTIFICIAL', 'https://docs.google.com/forms/d/1ShhQnrioNkk8n4b4yborbCJpGq_u0I1uL3QN_3oalk4/edit');
INSERT INTO public.formularios VALUES (19, 20, 'INF3234 MODELAMIENTO DE SOFTWARE', 'https://docs.google.com/forms/d/1S1-HTqlJrIUVbLxhy1MvSyq5Bn2wuESDwWrghFpQ5-M/edit');
INSERT INTO public.formularios VALUES (20, 21, 'INF3235 INGENIERIA DE REQUERIMIENTOS', 'https://docs.google.com/forms/d/1NhgXJtsK3IfF-qkoC18Mk9W_P8b4hH2uAQNBN2m0T3M/edit');
INSERT INTO public.formularios VALUES (22, 23, 'INF3136 OPTIMIZACION', 'https://docs.google.com/forms/d/1uYHX1ipOCIb9u_uLd_qXQMgPdj7p99mcFBxbun03nUw/edit');
INSERT INTO public.formularios VALUES (23, 24, 'INF3245 INGENIERIA WEB Y MOVIL', 'https://docs.google.com/forms/d/18d-31PxpiReQz8zpZnXcQn_xh1zzSyj_M8FSgvrTNYc/edit');
INSERT INTO public.formularios VALUES (24, 25, 'INF3246 EXPERIENCIA DEL USUARIO', 'https://docs.google.com/forms/d/1VOapvd-wqUVIDxaEDjCzqWfM9uYopJVQWM9MXbDcBZM/edit');
INSERT INTO public.formularios VALUES (25, 26, 'INF3541 TALLER DE BASE DE DATOS', 'https://docs.google.com/forms/d/1zs0yftG6OIoByvsZeDQ3DT4T0QLmO9DRSpB9pypDTIE/edit');
INSERT INTO public.formularios VALUES (27, 28, 'INF4353 CIBERSEGURIDAD', 'https://docs.google.com/forms/d/10AipGTpgmB6UVEg9Tdt6Lr7wdZ2gNu-3I_r0QtgJOEI/edit');
INSERT INTO public.formularios VALUES (28, 29, 'INF4457 TECNOLOGIAS EMERGENTES', 'https://docs.google.com/forms/d/1z1G_42mAUgm98sO_R-jT_Fs7d8krKri4HJZ47W-k1Vs/edit');
INSERT INTO public.formularios VALUES (29, 30, 'INF4552 TALLER DE INGENIERIA DE SOFTWARE', 'https://docs.google.com/forms/d/1FHIDF22OJ66UVzqeH4Aj0FBvt5Vn2sMm1Hd6oHF8UIQ/edit');
INSERT INTO public.formularios VALUES (30, 31, 'INF4556 SEMINARIO DE TITULO', 'https://docs.google.com/forms/d/1PKMLF9H3oMeyuZY2GEM6OdTVdvmRJCdVMDTkEUSbX2E/edit');
INSERT INTO public.formularios VALUES (32, 33, 'INF4458 NEGOCIOS, INNOVACION Y EMPRENDIMIENTO', 'https://docs.google.com/forms/d/1gPvM94YyvA_dJbcqXf-Gq1z4dXEXitKbG8D8sy0CBwQ/edit');
INSERT INTO public.formularios VALUES (33, 34, 'INF4459 LEGISLACION, ETICA Y TECNOLOGIA', 'https://docs.google.com/forms/d/1xAFkSd3jpUXr95aEHTw-CK2fqCVRgaI3NXfWaQCdGi4/edit');
INSERT INTO public.formularios VALUES (34, 35, 'INF4560 PROYECTO DE TITULO', 'https://docs.google.com/forms/d/1kMte1jLSqxcQ36Dg_8EmtNMCzSeiWLmdfuP3bVt4YbA/edit');
INSERT INTO public.formularios VALUES (36, 40, 'FIN100-14 DESARROLLO INTEGRAL Y COMUNICACION PARA INGENIERIA', 'https://docs.google.com/forms/d/1YYiUqOuDITJISS7_LWL8OmCkXQTA6UDA9OzZchOxQx0/edit');
INSERT INTO public.formularios VALUES (45, 89, 'FIN100-14 DESARROLLO INTEGRAL Y COMUNICACION PARA INGENIERIA', 'https://docs.google.com/forms/d/1YYiUqOuDITJISS7_LWL8OmCkXQTA6UDA9OzZchOxQx0/edit');
INSERT INTO public.formularios VALUES (54, 5, 'FIN100-14 DESARROLLO INTEGRAL Y COMUNICACION PARA INGENIERIA', 'https://docs.google.com/forms/d/1BF2lXzYtOV50wH7hnFuCK4fyArxAWLSWu7mqn6LSWh4/edit');
INSERT INTO public.formularios VALUES (62, 37, 'ICI1243 INTRODUCCION A LA INGENIERIA INFORMATICA', 'https://docs.google.com/forms/d/181seYv2bI2W570sXYCWwp3TDqYrXRC_oX8WARWC4Dso/edit');
INSERT INTO public.formularios VALUES (63, 38, 'ICI1458 BIENESTAR Y APRENDIZAJE UNIVERSITARIO', 'https://docs.google.com/forms/d/1eRCQAW_hOHqMlVsXMYTG045PXC9Fw4SBh07VX347TMU/edit');
INSERT INTO public.formularios VALUES (65, 40, 'FIN100-14 DESARROLLO INTEGRAL Y COMUNICACION PARA INGENIERIA', 'https://docs.google.com/forms/d/1BF2lXzYtOV50wH7hnFuCK4fyArxAWLSWu7mqn6LSWh4/edit');
INSERT INTO public.formularios VALUES (66, 41, 'ICI1242 FUNDAMENTOS DE PROGRAMACION', 'https://docs.google.com/forms/d/1LekU9ixkhKBg6g1BmrtCUJrcZCz3er_mZYGUktoqd0M/edit');
INSERT INTO public.formularios VALUES (70, 45, 'ICI2145 ANALISIS INTELIGENTE DE DATOS', 'https://docs.google.com/forms/d/1tjf5714PqBEcSEFy8oF4MdP9YWkalmYyR3Y6wB2EH4o/edit');
INSERT INTO public.formularios VALUES (71, 46, 'ICI2240 ESTRUCTURA DE DATOS', 'https://docs.google.com/forms/d/1qJ4-RBzMezYRaCGdnJhWSGd_laXQcrneRbe7M1aZt1I/edit');
INSERT INTO public.formularios VALUES (74, 49, 'ICI2141 METODOS NUMERICOS', 'https://docs.google.com/forms/d/171axs1U36IR5yIw16cVolDk00dFFWV6GGuSH7vzriWs/edit');
INSERT INTO public.formularios VALUES (75, 50, 'ICI2241 PROGRAMACION AVANZADA', 'https://docs.google.com/forms/d/19AxOQzo0t4sof9ZKOA5bLnAKYwNQiHebvted4vO1OL8/edit');
INSERT INTO public.formularios VALUES (76, 51, 'ICI2242 ANALISIS Y DISEÑO DE ALGORITMOS', 'https://docs.google.com/forms/d/1VFXbAAee4T6aeEtkMgZ_k3LMJBBL67z0jSnyHANYwEQ/edit');
INSERT INTO public.formularios VALUES (79, 54, 'ICI3240 BASE DE DATOS', 'https://docs.google.com/forms/d/1VMwTLb_vXweQULT98fB9TdgpBz3dEOD-qKNtillGMfY/edit');
INSERT INTO public.formularios VALUES (80, 55, 'ICI3244 INTELIGENCIA ARTIFICIAL', 'https://docs.google.com/forms/d/1LMtpBfLhbhismfDaWxV0Z441p0aX9CYfh22yF4nuJ1Y/edit');
INSERT INTO public.formularios VALUES (81, 56, 'ICI3245 AUTOMATAS Y COMPILADORES', 'https://docs.google.com/forms/d/1Dorf1JO3boUfjkjn0NTT2PJM7tv_14I2BpDyq_rGOdM/edit');
INSERT INTO public.formularios VALUES (82, 57, 'ICI3344 HARDWARE Y SISTEMAS OPERATIVOS', 'https://docs.google.com/forms/d/1yAmaEoTvhgN4rEADI60sumBLN_0VK8tr34fDvQoD6HM/edit');
INSERT INTO public.formularios VALUES (84, 59, 'ICA4121 ADMINISTRACION DE EMPRESAS', 'https://docs.google.com/forms/d/1fvd7ClJV6AwzDqz_ZYaJMZh86dTK8r-880rGbWjOMoU/edit');
INSERT INTO public.formularios VALUES (85, 60, 'ICI3150 CIENCIA Y TECNOLOGIA', 'https://docs.google.com/forms/d/1KEAm7NadJB3-J5YWiH0nG-Pz-YrIgMTmw8CxUZYS5wE/edit');
INSERT INTO public.formularios VALUES (86, 61, 'ICI3170 ESTADISTICA COMPUTACIONAL', 'https://docs.google.com/forms/d/1Ht77NteUE55jZEyHfuOAitPrO0lkX4DXv3txbT_AnRc/edit');
INSERT INTO public.formularios VALUES (87, 62, 'ICI3246 MODELAMIENTO DE SOFTWARE', 'https://docs.google.com/forms/d/1v-KqVP69TNX6X6RWUEzAkIRTRaFJhCrlf_JkHWln310/edit');
INSERT INTO public.formularios VALUES (88, 63, 'ICI3343 REDES DE COMPUTADORES', 'https://docs.google.com/forms/d/1P-Vz33MJYDvnRYEoDy06fcC0hZGtszFQ7QS9c8b3cwU/edit');
INSERT INTO public.formularios VALUES (90, 65, 'ICI4150 ROBOTICA Y SISTEMAS AUTONOMOS', 'https://docs.google.com/forms/d/1gyxp8KuyIGuX5g6z2CD_n-D_zZ265YUPoAExXalhsLk/edit');
INSERT INTO public.formularios VALUES (91, 66, 'ICI4151 OPTIMIZACION', 'https://docs.google.com/forms/d/1lyP09znmZ1vt3M-jGlTrJE9KNB5pSa8JudpHa7q4LhU/edit');
INSERT INTO public.formularios VALUES (92, 67, 'ICI4244 INGENIERIA DE SOFTWARE', 'https://docs.google.com/forms/d/1x1G7v59Jj_kLm4QyJrCruRFkJ9WGFQG3tFWsdqIf2ck/edit');
INSERT INTO public.formularios VALUES (93, 68, 'ICI4247 INGENIERIA WEB Y MOVIL', 'https://docs.google.com/forms/d/1XPu9UT1ghcuPba9Pvg8oNUyer8xAactoiZsfhel14eo/edit');
INSERT INTO public.formularios VALUES (94, 69, 'ICI4344 COMPUTACION PARALELA Y DISTRIBUIDA', 'https://docs.google.com/forms/d/1IelzzA-tqIMM6PEw-vAnv62FgiFcNA681qzXCeXo4b8/edit');
INSERT INTO public.formularios VALUES (96, 71, 'ICA4161 ECONOMIA Y FINANZAS', 'https://docs.google.com/forms/d/15JyUvc1jb7a3YbyEEslQqUbOa35SK_EfcreAsiv1x7c/edit');
INSERT INTO public.formularios VALUES (97, 72, 'ICI4248 INGENIERIA DE REQUERIMIENTOS', 'https://docs.google.com/forms/d/1IR5yNijn2AER7kBNbk1oPAWYp81yYEox2kyol-qRgik/edit');
INSERT INTO public.formularios VALUES (98, 73, 'ICI4370 CIBERSEGURIDAD', 'https://docs.google.com/forms/d/1RCWIXQXOMM0-NnxywWVNKoSDyRPKavhWLLABUtO1_q0/edit');
INSERT INTO public.formularios VALUES (99, 74, 'ICI4541 TALLER DE BASE DE DATOS', 'https://docs.google.com/forms/d/10E5IwMo_P-mu1WZJ4gasXCEbs7IpBvFRenbxJ_4P0TE/edit');
INSERT INTO public.formularios VALUES (100, 75, 'ICI5247 EXPERIENCIA DE USUARIO', 'https://docs.google.com/forms/d/1yaTxd2_QR405Tuognyzt26wrO8ngoOqKdNGb4nyMPB8/edit');
INSERT INTO public.formularios VALUES (101, 76, 'ICI5441 ADMINISTRACION DE PROYECTOS INFORMATICOS', 'https://docs.google.com/forms/d/15DnBKUe9oyClCm1IuNjX-LLtCV2jBZYzs7Mw9s24re4/edit');
INSERT INTO public.formularios VALUES (102, 77, 'ICI5442 TECNOLOGIAS EMERGENTES', 'https://docs.google.com/forms/d/1nMBclitmEpX02fde8iLH3Os2_BAnmtf11lGF_uWxYRg/edit');
INSERT INTO public.formularios VALUES (103, 78, 'ICI5475 NEGOCIOS, INNOVACION Y EMPRENDIMIENTO', 'https://docs.google.com/forms/d/1OePE2jyYwJKNfWnr7kr7G-B9_SedcFN7cyYYUMCiG58/edit');
INSERT INTO public.formularios VALUES (104, 79, 'ICI5545 TALLER DE INGENIERIA DE SOFTWARE', 'https://docs.google.com/forms/d/1ZOksNXBLWrpDebh4PPH6276s84vmPGsfspMCIDkBbm0/edit');
INSERT INTO public.formularios VALUES (105, 80, 'ICI5345 LEGISLACION ETICA Y TECNOLOGICA', 'https://docs.google.com/forms/d/1PTRCDqFpXIqmPL52WuI87FlUShduRoEgJ8EENcKNEXk/edit');
INSERT INTO public.formularios VALUES (106, 81, 'ICI5444 TALLER DE FORMULACION DE PROYECTOS INFORMATICOS', 'https://docs.google.com/forms/d/1AdXIfguPQDez57YSLHcYkN3VN_eTtmAHETt7CLmxgRM/edit');
INSERT INTO public.formularios VALUES (107, 82, 'ICI5476 TALLER DE LIDERAZGO Y TRABAJO EN EQUIPO', 'https://docs.google.com/forms/d/1PwfLrs-g0orw3b5j7dBLBJP_icGitiNTW_W1X3JD9Zw/edit');
INSERT INTO public.formularios VALUES (108, 83, 'ICI5541 SEMINARIO DE TITULO', 'https://docs.google.com/forms/d/1MbCYAifFjUzRu2v25UbAuSkvOWbSKlMUmGUeLcWIuhI/edit');
INSERT INTO public.formularios VALUES (109, 84, 'ICI6541 PROYECTO DE TITULO', 'https://docs.google.com/forms/d/1Jaji92QITTHpuCE43ZRbmBjSHKOZ-D3WCc1gxWczWT0/edit');
INSERT INTO public.formularios VALUES (111, 89, 'FIN100-14 DESARROLLO INTEGRAL Y COMUNICACION PARA INGENIERIA', 'https://docs.google.com/forms/d/1BF2lXzYtOV50wH7hnFuCK4fyArxAWLSWu7mqn6LSWh4/edit');
INSERT INTO public.formularios VALUES (123, 5, 'FIN100-14 DESARROLLO INTEGRAL Y COMUNICACION PARA INGENIERIA', 'https://docs.google.com/forms/d/1ZQ0uxNplmTe0KtqTIADp5QdVaO7EnOBpfadL2FUVOSc/edit');
INSERT INTO public.formularios VALUES (132, 40, 'FIN100-14 DESARROLLO INTEGRAL Y COMUNICACION PARA INGENIERIA', 'https://docs.google.com/forms/d/1ZQ0uxNplmTe0KtqTIADp5QdVaO7EnOBpfadL2FUVOSc/edit');
INSERT INTO public.formularios VALUES (143, 86, 'ICD1341 FUNDAMENTOS DE ALGORITMOS', 'https://docs.google.com/forms/d/1ItqVB2mlYgzaOZkf49AY0yWw2N0cpxoMQ0e2F8N0buU/edit');
INSERT INTO public.formularios VALUES (144, 87, 'ICD1401 BIENESTAR Y APRENDIZAJE UNIVERSITARIO', 'https://docs.google.com/forms/d/1sG61lri6dCNU1mou4QwPudsfAkHSVCvty67ZJjxvZhU/edit');
INSERT INTO public.formularios VALUES (146, 89, 'FIN100-14 DESARROLLO INTEGRAL Y COMUNICACION PARA INGENIERIA', 'https://docs.google.com/forms/d/1ZQ0uxNplmTe0KtqTIADp5QdVaO7EnOBpfadL2FUVOSc/edit');
INSERT INTO public.formularios VALUES (147, 90, 'ICD1342 FUNDAMENTOS DE PROGRAMACION', 'https://docs.google.com/forms/d/1TypZoqz4f7-vyuQkAFFuDHkIPmcOY7iorlABhi5K278/edit');
INSERT INTO public.formularios VALUES (151, 94, 'ICD2243 INTRODUCCION AL ANALISIS DE DATOS', 'https://docs.google.com/forms/d/1RMM-yNGBnfhq3XvQ1eB1RDFBTpFrXKDVK1lcuaQnZvQ/edit');
INSERT INTO public.formularios VALUES (152, 95, 'ICD2344 ESTRUCTURA DE DATOS', 'https://docs.google.com/forms/d/1MgoFFUWJ_wOcKiFD81IrESiS6MKqzWS5A7QaR8Mda24/edit');
INSERT INTO public.formularios VALUES (155, 98, 'ICD2145 CIENCIA Y TECNOLOGIA', 'https://docs.google.com/forms/d/1rr4Ld0YVAckovfG_MTtB-RI4xBx5DVo2tUd1baiDXwA/edit');
INSERT INTO public.formularios VALUES (156, 99, 'ICD2346 PARADIGMAS DE PROGRAMACION', 'https://docs.google.com/forms/d/1Js4dXnFdOoDyO8RVNJKCjojUlnts5ZGQ32d1Kp0OURk/edit');
INSERT INTO public.formularios VALUES (157, 100, 'ICD2347 ANALISIS Y DISEÑO DE ALGORITMOS', 'https://docs.google.com/forms/d/1s2izaUaGKKl1_Q5A1udMW-4ejNcDj5j9bcQfbrm6kGM/edit');
INSERT INTO public.formularios VALUES (191, 1, 'INF1211 FUNDAMENTOS DE ALGORITMOS', 'https://docs.google.com/forms/d/1vkbFiaKIzBJW2AOCN7gbAR7OMhEAfdT_DWgJDW3K09Q/edit');
INSERT INTO public.formularios VALUES (161, 104, 'ICD3148 ESTADISTICA COMPUTACIONAL', 'https://docs.google.com/forms/d/1orq426ggzR5x06iskqdQ_irgA7ie_TXeqoYnHMkD4a8/edit');
INSERT INTO public.formularios VALUES (162, 105, 'ICD3149 TEORIA DE SISTEMAS', 'https://docs.google.com/forms/d/1HMdzsDWdF_X9y9FiarvMZ78g0ZNy87CXObVUV4hpuig/edit');
INSERT INTO public.formularios VALUES (163, 106, 'ICD3350 BASE DE DATOS', 'https://docs.google.com/forms/d/186Y_CBYwtKTeG4XgDG-dunw4ooe4Ran_Pv1XJgK1K2E/edit');
INSERT INTO public.formularios VALUES (165, 108, 'ICD3151 METODOS NUMERICOS', 'https://docs.google.com/forms/d/1FVnghXKFfazpGZ_o_6C0obMicOLCFdR8Xv-GtqEskwg/edit');
INSERT INTO public.formularios VALUES (166, 109, 'ICD3152 ESTADISTICA AVANZADA', 'https://docs.google.com/forms/d/1Wm9SMt6oWZ1eciTu_dNGu4epTz-IW1eABW9dcKtTdy8/edit');
INSERT INTO public.formularios VALUES (167, 110, 'ICD3153 INTELIGENCIA ARTIFICIAL', 'https://docs.google.com/forms/d/1rNk79Vtt2ZhqHCh_JLaGU3J_WKS07brT4rUVQt8D90o/edit');
INSERT INTO public.formularios VALUES (168, 111, 'ICD3255 ANALISIS INTELIGENTE DE DATOS', 'https://docs.google.com/forms/d/1Sj0n3R8gCc6FuARxBg6tncxkvbLoN0WmAVOKpRJVSno/edit');
INSERT INTO public.formularios VALUES (169, 112, 'ICD3354 HARDWARE Y SISTEMAS OPERATIVOS', 'https://docs.google.com/forms/d/1dtidOw51mR7nSDdYIpMXbmWzbVBdBn4zOlJ5F2VTTSc/edit');
INSERT INTO public.formularios VALUES (171, 114, 'ICA2121 ADMINISTRACION DE EMPRESAS', 'https://docs.google.com/forms/d/1q0MBgsQhiw4xUOSfO1Q-Nc2mw3SqH-OdCY6oDeIxtlw/edit');
INSERT INTO public.formularios VALUES (172, 115, 'ICD4156 OPTIMIZACION 1', 'https://docs.google.com/forms/d/1SiMGIU1SFYJp0cqMx4ib_DBxkP1Bd4kxZluVkv4ESUU/edit');
INSERT INTO public.formularios VALUES (173, 116, 'ICD4157 ANALISIS DE SERIES DE TIEMPO', 'https://docs.google.com/forms/d/1OBze0onSmeGUsBHhRjE-ZtrD_AABG-lCcGX__HC9SLY/edit');
INSERT INTO public.formularios VALUES (174, 117, 'ICD4258 APRENDIZAJE AUTOMATICO 1', 'https://docs.google.com/forms/d/1rXVfnhFGDwEG7jISFkxRMuljusPd0JxR9FPfBvw1MOI/edit');
INSERT INTO public.formularios VALUES (175, 118, 'ICD4359 ALMACENAMIENTO Y RECUPERACION DE DATOS', 'https://docs.google.com/forms/d/1pSnuG2PdL01dscQakugwRIEPNbuP9E6Qf1jcHAxBdQA/edit');
INSERT INTO public.formularios VALUES (177, 120, 'ICD4160 OPTIMIZACION 2', 'https://docs.google.com/forms/d/1c7ogpHZreYK3JDQY5ivTXt_AEzxkIibs6QH7KkSnvMc/edit');
INSERT INTO public.formularios VALUES (178, 121, 'ICD4262 APRENDIZAJE AUTOMATICO 2', 'https://docs.google.com/forms/d/1S2muS9hUE5XjY3OC1hMIxcpbecZCm50BbwgOVqpia0w/edit');
INSERT INTO public.formularios VALUES (179, 122, 'ICD4363 REDES DE COMPUTADORES', 'https://docs.google.com/forms/d/1FWy90C8NJ52LX6CMYPLf7jJvHbM4shOOUat8CJpn4NY/edit');
INSERT INTO public.formularios VALUES (180, 123, 'ICD4461 METODOLOGIA DE DESARROLLO DE SOFTWARE', 'https://docs.google.com/forms/d/1G13rdLvbTjWwmezurcgylVCla6i_zEoaq5UVVUIDsq0/edit');
INSERT INTO public.formularios VALUES (181, 124, 'ICA5164 ECONOMIA Y FINANZAS', 'https://docs.google.com/forms/d/1033TYh-PNcGfEoncfd6rTxUSyZdM_9uLREgqRJ8r8hM/edit');
INSERT INTO public.formularios VALUES (182, 125, 'ICD5167 CIENCIA DE REDES', 'https://docs.google.com/forms/d/1IqXVeetfwzwXM138L73QIIL-8IrI8Ey56WPzeESVCj8/edit');
INSERT INTO public.formularios VALUES (183, 126, 'ICD5366 COMPUTACION PARALELA Y DISTRIBUIDA', 'https://docs.google.com/forms/d/1vev1kGJZtLRjzvRLFnrr9HRoOYqrE0Ooia4KTz1_VZ4/edit');
INSERT INTO public.formularios VALUES (184, 127, 'ICD5465 VISUALIZACION DE DATOS', 'https://docs.google.com/forms/d/1UOpxo1QmBIng0M70T5NSgugPj7mRlyT4sxTe8MBW-Co/edit');
INSERT INTO public.formularios VALUES (185, 128, 'ICD5468 TALLER DE LIDERAZGO Y TRABAJO EN EQUIPO', 'https://docs.google.com/forms/d/1lnpbvyw8PK1mnAXAfbpT-XLHwW0q63vFdkr2fJtWrrQ/edit');
INSERT INTO public.formularios VALUES (186, 129, 'ICD5369 BIG DATA', 'https://docs.google.com/forms/d/1JZ8RlDOhi5YoakYpycrDTY3fW2V2naW5EgWU3NzZ0v0/edit');
INSERT INTO public.formularios VALUES (187, 130, 'ICD5471 NEGOCIOS, INNOVACION Y EMPRENDIMIENTO', 'https://docs.google.com/forms/d/1JHS4NmIvOs9VVBM4H4Xl78Vfq_H9DyFfnKEBb7piZ1A/edit');
INSERT INTO public.formularios VALUES (188, 131, 'ICD5570 SEMINARIO DE TITULO', 'https://docs.google.com/forms/d/1qdbWobePzEd5GqsZMEhIF__fgqPlH1GUnM9A0de1HlY/edit');
INSERT INTO public.formularios VALUES (189, 132, 'ICD6473 PRIVACIDAD, ETICA Y SEGURIDAD', 'https://docs.google.com/forms/d/1PQYpbtYVWwZMhv0nmoTVMZbTZR6nkxlSwv-wPH7sS-A/edit');
INSERT INTO public.formularios VALUES (190, 133, 'ICD6572 PROYECTO DE TITULO', 'https://docs.google.com/forms/d/1kPsBhcjFo3oRort_icTslQhVo-LEK1IKhXs1Dj9SNcI/edit');
INSERT INTO public.formularios VALUES (1, 2, 'INF1212 INTRODUCCION A LA INGENIERIA INFORMATICA', 'https://docs.google.com/forms/d/1w0ov6bVPGLkY1nNURlQ7Kqa7MaZGqiwQBwpCiTgLdI0/edit');


--
-- Data for Name: profesores; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.profesores VALUES (1, 'Broderick Crawford Labrín', 'broderick.crawford@pucv.cl');
INSERT INTO public.profesores VALUES (2, 'Iván Mercado Bermúdez', 'ivan.mercado@pucv.cl');
INSERT INTO public.profesores VALUES (3, 'Wenceslao Palma Muñoz', 'wenceslao.palma@pucv.cl');
INSERT INTO public.profesores VALUES (4, 'Guillermo Cabrera Guerrero', 'guillermo.cabrera@pucv.cl');
INSERT INTO public.profesores VALUES (5, 'Nibaldo Rodríguez Agurto', 'nibaldo.rodriguez@pucv.cl');
INSERT INTO public.profesores VALUES (6, 'Cristian Rusu', 'cristian.rusu@pucv.cl');
INSERT INTO public.profesores VALUES (7, 'Silvana Roncagliolo De La Horra', 'silvana.roncagliolo@pucv.cl');
INSERT INTO public.profesores VALUES (8, 'Claudio Cubillos Figueroa', 'claudio.cubillos@pucv.cl');
INSERT INTO public.profesores VALUES (9, 'Pamela Hermosilla Monckton', 'pamela.hermosilla@pucv.cl');
INSERT INTO public.profesores VALUES (10, 'Héctor Allende Cid', 'hector.allende@pucv.cl');
INSERT INTO public.profesores VALUES (11, 'Ignacio Araya Zamorano', 'ignacio.araya@pucv.cl');
INSERT INTO public.profesores VALUES (12, 'Daniela Quiñones Otey', 'daniela.quinones@pucv.cl');
INSERT INTO public.profesores VALUES (13, 'Leslie Pérez Cáceres', 'leslie.perez@pucv.cl');
INSERT INTO public.profesores VALUES (14, 'Rodrigo Alfaro Arancibia', 'rodrigo.alfaro@pucv.cl');
INSERT INTO public.profesores VALUES (15, 'Sandra Cano Mazuera', 'sandra.cano@pucv.cl');
INSERT INTO public.profesores VALUES (16, 'Emanuel Enrique Vega Mena', 'emanuel.vega@pucv.cl');
INSERT INTO public.profesores VALUES (17, 'Christoffer Löffler', 'christoffer.loffler@pucv.cl');
INSERT INTO public.profesores VALUES (18, 'Aldo Migliaro Osorio', 'amigliar@inf.ucv.cl');
INSERT INTO public.profesores VALUES (19, 'Ricardo Soto De Giorgis', 'ricardo.soto@pucv.cl');
INSERT INTO public.profesores VALUES (20, 'René Araya Rojas', 'rene.araya.r@mail.pucv.cl');


--
-- Data for Name: profesores_ramos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.profesores_ramos VALUES (3, 1, 2, 1);
INSERT INTO public.profesores_ramos VALUES (5, 1, 6, 1);
INSERT INTO public.profesores_ramos VALUES (6, 1, 50, 2);
INSERT INTO public.profesores_ramos VALUES (7, 1, 129, 3);
INSERT INTO public.profesores_ramos VALUES (12, 7, 1, 1);
INSERT INTO public.profesores_ramos VALUES (14, 3, 3, 1);
INSERT INTO public.profesores_ramos VALUES (18, 7, 50, 2);
INSERT INTO public.profesores_ramos VALUES (19, 7, 100, 3);
INSERT INTO public.profesores_ramos VALUES (20, 7, 6, 1);
INSERT INTO public.profesores_ramos VALUES (21, 7, 19, 1);
INSERT INTO public.profesores_ramos VALUES (22, 19, 37, 2);
INSERT INTO public.profesores_ramos VALUES (23, 19, 46, 2);
INSERT INTO public.profesores_ramos VALUES (24, 2, 12, 1);
INSERT INTO public.profesores_ramos VALUES (25, 3, 41, 2);
INSERT INTO public.profesores_ramos VALUES (26, 3, 57, 2);
INSERT INTO public.profesores_ramos VALUES (27, 4, 15, 1);
INSERT INTO public.profesores_ramos VALUES (28, 4, 37, 2);
INSERT INTO public.profesores_ramos VALUES (29, 5, 63, 2);
INSERT INTO public.profesores_ramos VALUES (30, 5, 46, 2);
INSERT INTO public.profesores_ramos VALUES (31, 5, 41, 2);
INSERT INTO public.profesores_ramos VALUES (32, 6, 41, 2);
INSERT INTO public.profesores_ramos VALUES (33, 6, 67, 2);
INSERT INTO public.profesores_ramos VALUES (34, 7, 37, 2);
INSERT INTO public.profesores_ramos VALUES (35, 3, 55, 2);
INSERT INTO public.profesores_ramos VALUES (36, 7, 55, 2);
INSERT INTO public.profesores_ramos VALUES (37, 8, 55, 2);
INSERT INTO public.profesores_ramos VALUES (38, 9, 13, 1);
INSERT INTO public.profesores_ramos VALUES (39, 9, 54, 2);
INSERT INTO public.profesores_ramos VALUES (40, 10, 41, 2);
INSERT INTO public.profesores_ramos VALUES (41, 11, 46, 2);
INSERT INTO public.profesores_ramos VALUES (42, 12, 21, 1);
INSERT INTO public.profesores_ramos VALUES (43, 12, 72, 2);
INSERT INTO public.profesores_ramos VALUES (44, 12, 76, 2);
INSERT INTO public.profesores_ramos VALUES (45, 14, 78, 2);
INSERT INTO public.profesores_ramos VALUES (46, 15, 24, 1);
INSERT INTO public.profesores_ramos VALUES (47, 15, 68, 2);
INSERT INTO public.profesores_ramos VALUES (48, 15, 65, 2);
INSERT INTO public.profesores_ramos VALUES (49, 15, 99, 3);
INSERT INTO public.profesores_ramos VALUES (50, 1, 1, 1);


--
-- Data for Name: ramos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.ramos VALUES (36, 'ICI1241', 'Fundamentos de algoritmos', 2, 'primer semestre');
INSERT INTO public.ramos VALUES (37, 'ICI1243', 'Introducción a la ingeniería informática', 2, 'primer semestre');
INSERT INTO public.ramos VALUES (38, 'ICI1458', 'Bienestar y aprendizaje universitario', 2, 'primer semestre');
INSERT INTO public.ramos VALUES (40, 'FIN100-14', 'Desarrollo integral y comunicación para ingeniería', 2, 'primer semestre');
INSERT INTO public.ramos VALUES (41, 'ICI1242', 'Fundamentos de programación', 2, 'primer semestre');
INSERT INTO public.ramos VALUES (45, 'ICI2145', 'Análisis inteligente de datos', 2, 'segundo semestre');
INSERT INTO public.ramos VALUES (46, 'ICI2240', 'Estructura de datos', 2, 'segundo semestre');
INSERT INTO public.ramos VALUES (49, 'ICI2141', 'Métodos numéricos', 2, 'segundo semestre');
INSERT INTO public.ramos VALUES (50, 'ICI2241', 'Programación avanzada', 2, 'primer semestre');
INSERT INTO public.ramos VALUES (51, 'ICI2242', 'Análisis y diseño de algoritmos', 2, 'primer semestre');
INSERT INTO public.ramos VALUES (54, 'ICI3240', 'Base de datos', 2, 'primer semestre');
INSERT INTO public.ramos VALUES (55, 'ICI3244', 'Inteligencia artificial', 2, 'segundo semestre');
INSERT INTO public.ramos VALUES (56, 'ICI3245', 'Autómatas y compiladores', 2, 'segundo semestre');
INSERT INTO public.ramos VALUES (57, 'ICI3344', 'Hardware y sistemas operativos', 2, 'segundo semestre');
INSERT INTO public.ramos VALUES (59, 'ICA4121', 'Administración de empresas', 2, 'segundo semestre');
INSERT INTO public.ramos VALUES (60, 'ICI3150', 'Ciencia y tecnología', 2, 'segundo semestre');
INSERT INTO public.ramos VALUES (61, 'ICI3170', 'Estadística computacional', 2, 'segundo semestre');
INSERT INTO public.ramos VALUES (62, 'ICI3246', 'Modelamiento de software', 2, 'primer semestre');
INSERT INTO public.ramos VALUES (63, 'ICI3343', 'Redes de computadores', 2, 'primer semestre');
INSERT INTO public.ramos VALUES (65, 'ICI4150', 'Robótica y sistemas autónomos', 2, 'segundo semestre');
INSERT INTO public.ramos VALUES (66, 'ICI4151', 'Optimización', 2, 'segundo semestre');
INSERT INTO public.ramos VALUES (67, 'ICI4244', 'Ingeniería de software', 2, 'segundo semestre');
INSERT INTO public.ramos VALUES (68, 'ICI4247', 'Ingeniería web y móvil', 2, 'primer semestre');
INSERT INTO public.ramos VALUES (69, 'ICI4344', 'Computación paralela y distribuida', 2, 'primer semestre');
INSERT INTO public.ramos VALUES (71, 'ICA4161', 'Economía y finanzas', 2, 'primer semestre');
INSERT INTO public.ramos VALUES (72, 'ICI4248', 'Ingeniería de requerimientos', 2, 'segundo semestre');
INSERT INTO public.ramos VALUES (73, 'ICI4370', 'Ciberseguridad', 2, 'segundo semestre');
INSERT INTO public.ramos VALUES (74, 'ICI4541', 'Taller de base de datos', 2, 'segundo semestre');
INSERT INTO public.ramos VALUES (75, 'ICI5247', 'Experiencia de usuario', 2, 'segundo semestre');
INSERT INTO public.ramos VALUES (76, 'ICI5441', 'Administración de proyectos informáticos', 2, 'segundo semestre');
INSERT INTO public.ramos VALUES (77, 'ICI5442', 'Tecnologías emergentes', 2, 'segundo semestre');
INSERT INTO public.ramos VALUES (78, 'ICI5475', 'Negocios, innovación y emprendimiento', 2, 'segundo semestre');
INSERT INTO public.ramos VALUES (79, 'ICI5545', 'Taller de ingeniería de software', 2, 'segundo semestre');
INSERT INTO public.ramos VALUES (80, 'ICI5345', 'Legislación ética y tecnológica', 2, 'segundo semestre');
INSERT INTO public.ramos VALUES (81, 'ICI5444', 'Taller de formulación de proyectos informáticos', 2, 'segundo semestre');
INSERT INTO public.ramos VALUES (82, 'ICI5476', 'Taller de liderazgo y trabajo en equipo', 2, 'segundo semestre');
INSERT INTO public.ramos VALUES (83, 'ICI5541', 'Seminario de título', 2, 'segundo semestre');
INSERT INTO public.ramos VALUES (84, 'ICI6541', 'Proyecto de título', 2, 'segundo semestre');
INSERT INTO public.ramos VALUES (1, 'INF1211', 'Fundamentos De Algoritmos', 1, 'primer semestre');
INSERT INTO public.ramos VALUES (2, 'INF1212', 'Introduccion A La Ingenieria Informatica', 1, 'primer semestre');
INSERT INTO public.ramos VALUES (3, 'INF1413', 'Bienestar Y Aprendizaje Universitario', 1, 'primer semestre');
INSERT INTO public.ramos VALUES (5, 'FIN100-14', 'Desarrollo Integral Y Comunicacion Para Ingenieria', 1, 'primer semestre');
INSERT INTO public.ramos VALUES (6, 'INF1214', 'Fundamentos De Programacion', 1, 'primer semestre');
INSERT INTO public.ramos VALUES (10, 'INF2121', 'Estadistica Computacional', 1, 'segundo semestre');
INSERT INTO public.ramos VALUES (11, 'INF2223', 'Estructura De Datos', 1, 'segundo semestre');
INSERT INTO public.ramos VALUES (12, 'INF2322', 'Hardware Y Sistemas Operativos', 1, 'segundo semestre');
INSERT INTO public.ramos VALUES (13, 'INF2235', 'Base De Datos', 1, 'segundo semestre');
INSERT INTO public.ramos VALUES (14, 'INF2236', 'Programacion Avanzada', 1, 'segundo semestre');
INSERT INTO public.ramos VALUES (15, 'INF2237', 'Ingenieria De Software', 1, 'segundo semestre');
INSERT INTO public.ramos VALUES (16, 'INF2324', 'Redes De Computadores', 1, 'primer semestre');
INSERT INTO public.ramos VALUES (18, 'INF3132', 'Economia Y Finanzas', 1, 'primer semestre');
INSERT INTO public.ramos VALUES (19, 'INF3233', 'Inteligencia Artificial', 1, 'segundo semestre');
INSERT INTO public.ramos VALUES (89, 'FIN100-14', 'Desarrollo Integral Y Comunicacion Para Ingenieria', 3, 'primer semestre');
INSERT INTO public.ramos VALUES (90, 'ICD1342', 'Fundamentos De Programacion', 3, 'primer semestre');
INSERT INTO public.ramos VALUES (94, 'ICD2243', 'Introduccion Al Analisis De Datos', 3, 'segundo semestre');
INSERT INTO public.ramos VALUES (95, 'ICD2344', 'Estructura De Datos', 3, 'segundo semestre');
INSERT INTO public.ramos VALUES (98, 'ICD2145', 'Ciencia Y Tecnologia', 3, 'segundo semestre');
INSERT INTO public.ramos VALUES (99, 'ICD2346', 'Paradigmas De Programacion', 3, 'primer semestre');
INSERT INTO public.ramos VALUES (100, 'ICD2347', 'Analisis Y Diseño De Algoritmos', 3, 'primer semestre');
INSERT INTO public.ramos VALUES (104, 'ICD3148', 'Estadistica Computacional', 3, 'segundo semestre');
INSERT INTO public.ramos VALUES (105, 'ICD3149', 'Teoria De Sistemas', 3, 'segundo semestre');
INSERT INTO public.ramos VALUES (20, 'INF3234', 'Modelamiento De Software', 1, 'segundo semestre');
INSERT INTO public.ramos VALUES (21, 'INF3235', 'Ingenieria De Requerimientos', 1, 'segundo semestre');
INSERT INTO public.ramos VALUES (23, 'INF3136', 'Optimizacion', 1, 'primer semestre');
INSERT INTO public.ramos VALUES (24, 'INF3245', 'Ingenieria Web Y Movil', 1, 'primer semestre');
INSERT INTO public.ramos VALUES (25, 'INF3246', 'Experiencia Del Usuario', 1, 'primer semestre');
INSERT INTO public.ramos VALUES (26, 'INF3541', 'Taller De Base De Datos', 1, 'primer semestre');
INSERT INTO public.ramos VALUES (28, 'INF4353', 'Ciberseguridad', 1, 'segundo semestre');
INSERT INTO public.ramos VALUES (29, 'INF4457', 'Tecnologias Emergentes', 1, 'segundo semestre');
INSERT INTO public.ramos VALUES (30, 'INF4552', 'Taller De Ingenieria De Software', 1, 'segundo semestre');
INSERT INTO public.ramos VALUES (31, 'INF4556', 'Seminario De Titulo', 1, 'primer semestre');
INSERT INTO public.ramos VALUES (33, 'INF4458', 'Negocios, Innovacion Y Emprendimiento', 1, 'primer semestre');
INSERT INTO public.ramos VALUES (34, 'INF4459', 'Legislacion, Etica Y Tecnologia', 1, 'primer semestre');
INSERT INTO public.ramos VALUES (35, 'INF4560', 'Proyecto De Titulo', 1, 'segundo semestre');
INSERT INTO public.ramos VALUES (85, 'ICD1140', 'Introduccion A La Ingenieria En Ciencia De Datos', 3, 'primer semestre');
INSERT INTO public.ramos VALUES (86, 'ICD1341', 'Fundamentos De Algoritmos', 3, 'primer semestre');
INSERT INTO public.ramos VALUES (87, 'ICD1401', 'Bienestar Y Aprendizaje Universitario', 3, 'primer semestre');
INSERT INTO public.ramos VALUES (106, 'ICD3350', 'Base De Datos', 3, 'segundo semestre');
INSERT INTO public.ramos VALUES (108, 'ICD3151', 'Metodos Numericos', 3, 'primer semestre');
INSERT INTO public.ramos VALUES (109, 'ICD3152', 'Estadistica Avanzada', 3, 'primer semestre');
INSERT INTO public.ramos VALUES (110, 'ICD3153', 'Inteligencia Artificial', 3, 'primer semestre');
INSERT INTO public.ramos VALUES (111, 'ICD3255', 'Analisis Inteligente De Datos', 3, 'primer semestre');
INSERT INTO public.ramos VALUES (112, 'ICD3354', 'Hardware Y Sistemas Operativos', 3, 'primer semestre');
INSERT INTO public.ramos VALUES (114, 'ICA2121', 'Administracion De Empresas', 3, 'segundo semestre');
INSERT INTO public.ramos VALUES (115, 'ICD4156', 'Optimizacion 1', 3, 'segundo semestre');
INSERT INTO public.ramos VALUES (116, 'ICD4157', 'Analisis De Series De Tiempo', 3, 'segundo semestre');
INSERT INTO public.ramos VALUES (117, 'ICD4258', 'Aprendizaje Automatico 1', 3, 'primer semestre');
INSERT INTO public.ramos VALUES (118, 'ICD4359', 'Almacenamiento Y Recuperacion De Datos', 3, 'primer semestre');
INSERT INTO public.ramos VALUES (120, 'ICD4160', 'Optimizacion 2', 3, 'primer semestre');
INSERT INTO public.ramos VALUES (121, 'ICD4262', 'Aprendizaje Automatico 2', 3, 'segundo semestre');
INSERT INTO public.ramos VALUES (122, 'ICD4363', 'Redes De Computadores', 3, 'segundo semestre');
INSERT INTO public.ramos VALUES (123, 'ICD4461', 'Metodologia De Desarrollo De Software', 3, 'segundo semestre');
INSERT INTO public.ramos VALUES (124, 'ICA5164', 'Economia Y Finanzas', 3, 'segundo semestre');
INSERT INTO public.ramos VALUES (125, 'ICD5167', 'Ciencia De Redes', 3, 'primer semestre');
INSERT INTO public.ramos VALUES (126, 'ICD5366', 'Computacion Paralela Y Distribuida', 3, 'primer semestre');
INSERT INTO public.ramos VALUES (127, 'ICD5465', 'Visualizacion De Datos', 3, 'primer semestre');
INSERT INTO public.ramos VALUES (128, 'ICD5468', 'Taller De Liderazgo Y Trabajo En Equipo', 3, 'primer semestre');
INSERT INTO public.ramos VALUES (129, 'ICD5369', 'Big Data', 3, 'segundo semestre');
INSERT INTO public.ramos VALUES (130, 'ICD5471', 'Negocios, Innovacion Y Emprendimiento', 3, 'segundo semestre');
INSERT INTO public.ramos VALUES (131, 'ICD5570', 'Seminario De Titulo', 3, 'segundo semestre');
INSERT INTO public.ramos VALUES (132, 'ICD6473', 'Privacidad, Etica Y Seguridad', 3, 'segundo semestre');
INSERT INTO public.ramos VALUES (133, 'ICD6572', 'Proyecto De Titulo', 3, 'segundo semestre');


--
-- Data for Name: respuestas_formulario_local; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.respuestas_formulario_local VALUES (2, 1, 1, 2024, 'primer semestre', 'estudiante@ejemplo.com', '12345678-9', 'Nombre Estudiante', 'Apellido Estudiante', 'Ingeniería Informática', 2022, 'dos veces', 6.00, 'Ramo de Matemática, Primer Semestre 2023', 'Sí, participé en evaluaciones', 'Tutoría en Álgebra para primer semestre', 'Sí, taller de formación docente 2023', 'Bajo', 'Quiero ser ayudante para reforzar conocimientos y apoyar a mis compañeros.', '{"lunes": ["1-2", "3-4"], "jueves": ["7-8"], "martes": ["5-6"], "viernes": ["1-2", "3-4", "5-6"], "miercoles": []}', '2024-11-27 21:24:35.067043', '2024-11-27 21:24:35.067043', false);
INSERT INTO public.respuestas_formulario_local VALUES (9, 1, 1, 2025, 'primer semestre', 'ejemplo2@ejemplo.com', '19615694-4', 'Lisa', 'Simpson', 'Ingeniería Civil Informática', 2024, '1', 7.00, 'Si, en muchos', 'De todo tipo', 'Muchas', 'En todos', 'Bajo', 'MEGACEREBRO', '{"lunes": [], "jueves": [], "martes": [], "viernes": ["13-14"], "miercoles": []}', '2024-12-03 01:24:49.986935', '2024-12-03 01:24:49.986935', false);
INSERT INTO public.respuestas_formulario_local VALUES (13, 45, 2, 2025, 'primer semestre', 'ejemplo1@ejemplo.com', '19615694-1', 'Rene Patricio', 'Araya Rojas', 'Ingeniería Informática', 2019, '2', 5.50, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam tempor porttitor nisl. Fusce lobortis a velit vel molestie. Ut molestie turpis blandit, tristique nisl quis, gravida tellus. Pellentesque ultricies, ante non hendrerit lacinia, lacus nibh suscipit orci, et iaculis dui mi vitae elit. Aenean faucibus cursus tempor. Donec non ex orci. Praesent lacinia suscipit placerat. Morbi commodo quis magna quis blandit. Vestibulum laoreet augue ut bibendum interdum. Praesent gravida massa nec lacinia venenatis. Nullam volutpat blandit ex, sollicitudin laoreet nunc ultrices vel.

Maecenas sed tortor at dui efficitur ultrices eget eget eros. Proin sed dolor eget ante sollicitudin consectetur. Morbi eu enim arcu. Phasellus non molestie augue. Vestibulum auctor orci id ultricies porttitor. Praesent elementum feugiat enim, ac suscipit ipsum vulputate vitae. Donec vehicula ultricies turpis, ut bibendum felis. Nam at libero non orci convallis congue. Vivamus eget sagittis nulla. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ac scelerisque purus. Aliquam faucibus, velit at maximus imperdiet, mauris massa molestie ante, vitae pharetra enim justo et ipsum. Aenean venenatis consequat est, a pellentesque velit vulputate ac. Proin vitae turpis eros. Sed placerat posuere mattis.

Aliquam ut magna ac velit porttitor posuere eget sit amet turpis. Nunc vel dignissim lorem. Sed convallis molestie ante vel commodo. Nam luctus turpis sed sapien semper, eu vehicula lorem tincidunt. Suspendisse luctus condimentum turpis sed lobortis. Nam sed laoreet ipsum, quis sagittis felis. Mauris ac arcu sit amet nibh elementum posuere. Ut at justo dapibus, semper massa in, pellentesque ipsum. Sed pretium vulputate mattis. Curabitur ornare gravida dignissim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam tempor porttitor nisl. Fusce lobortis a velit vel molestie. Ut molestie turpis blandit, tristique nisl quis, gravida tellus. Pellentesque ultricies, ante non hendrerit lacinia, lacus nibh suscipit orci, et iaculis dui mi vitae elit. Aenean faucibus cursus tempor. Donec non ex orci. Praesent lacinia suscipit placerat. Morbi commodo quis magna quis blandit. Vestibulum laoreet augue ut bibendum interdum. Praesent gravida massa nec lacinia venenatis. Nullam volutpat blandit ex, sollicitudin laoreet nunc ultrices vel.

Maecenas sed tortor at dui efficitur ultrices eget eget eros. Proin sed dolor eget ante sollicitudin consectetur. Morbi eu enim arcu. Phasellus non molestie augue. Vestibulum auctor orci id ultricies porttitor. Praesent elementum feugiat enim, ac suscipit ipsum vulputate vitae. Donec vehicula ultricies turpis, ut bibendum felis. Nam at libero non orci convallis congue. Vivamus eget sagittis nulla. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ac scelerisque purus. Aliquam faucibus, velit at maximus imperdiet, mauris massa molestie ante, vitae pharetra enim justo et ipsum. Aenean venenatis consequat est, a pellentesque velit vulputate ac. Proin vitae turpis eros. Sed placerat posuere mattis.

Aliquam ut magna ac velit porttitor posuere eget sit amet turpis. Nunc vel dignissim lorem. Sed convallis molestie ante vel commodo. Nam luctus turpis sed sapien semper, eu vehicula lorem tincidunt. Suspendisse luctus condimentum turpis sed lobortis. Nam sed laoreet ipsum, quis sagittis felis. Mauris ac arcu sit amet nibh elementum posuere. Ut at justo dapibus, semper massa in, pellentesque ipsum. Sed pretium vulputate mattis. Curabitur ornare gravida dignissim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam tempor porttitor nisl. Fusce lobortis a velit vel molestie. Ut molestie turpis blandit, tristique nisl quis, gravida tellus. Pellentesque ultricies, ante non hendrerit lacinia, lacus nibh suscipit orci, et iaculis dui mi vitae elit. Aenean faucibus cursus tempor. Donec non ex orci. Praesent lacinia suscipit placerat. Morbi commodo quis magna quis blandit. Vestibulum laoreet augue ut bibendum interdum. Praesent gravida massa nec lacinia venenatis. Nullam volutpat blandit ex, sollicitudin laoreet nunc ultrices vel.

Maecenas sed tortor at dui efficitur ultrices eget eget eros. Proin sed dolor eget ante sollicitudin consectetur. Morbi eu enim arcu. Phasellus non molestie augue. Vestibulum auctor orci id ultricies porttitor. Praesent elementum feugiat enim, ac suscipit ipsum vulputate vitae. Donec vehicula ultricies turpis, ut bibendum felis. Nam at libero non orci convallis congue. Vivamus eget sagittis nulla. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ac scelerisque purus. Aliquam faucibus, velit at maximus imperdiet, mauris massa molestie ante, vitae pharetra enim justo et ipsum. Aenean venenatis consequat est, a pellentesque velit vulputate ac. Proin vitae turpis eros. Sed placerat posuere mattis.

Aliquam ut magna ac velit porttitor posuere eget sit amet turpis. Nunc vel dignissim lorem. Sed convallis molestie ante vel commodo. Nam luctus turpis sed sapien semper, eu vehicula lorem tincidunt. Suspendisse luctus condimentum turpis sed lobortis. Nam sed laoreet ipsum, quis sagittis felis. Mauris ac arcu sit amet nibh elementum posuere. Ut at justo dapibus, semper massa in, pellentesque ipsum. Sed pretium vulputate mattis. Curabitur ornare gravida dignissim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam tempor porttitor nisl. Fusce lobortis a velit vel molestie. Ut molestie turpis blandit, tristique nisl quis, gravida tellus. Pellentesque ultricies, ante non hendrerit lacinia, lacus nibh suscipit orci, et iaculis dui mi vitae elit. Aenean faucibus cursus tempor. Donec non ex orci. Praesent lacinia suscipit placerat. Morbi commodo quis magna quis blandit. Vestibulum laoreet augue ut bibendum interdum. Praesent gravida massa nec lacinia venenatis. Nullam volutpat blandit ex, sollicitudin laoreet nunc ultrices vel.

Maecenas sed tortor at dui efficitur ultrices eget eget eros. Proin sed dolor eget ante sollicitudin consectetur. Morbi eu enim arcu. Phasellus non molestie augue. Vestibulum auctor orci id ultricies porttitor. Praesent elementum feugiat enim, ac suscipit ipsum vulputate vitae. Donec vehicula ultricies turpis, ut bibendum felis. Nam at libero non orci convallis congue. Vivamus eget sagittis nulla. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ac scelerisque purus. Aliquam faucibus, velit at maximus imperdiet, mauris massa molestie ante, vitae pharetra enim justo et ipsum. Aenean venenatis consequat est, a pellentesque velit vulputate ac. Proin vitae turpis eros. Sed placerat posuere mattis.

Aliquam ut magna ac velit porttitor posuere eget sit amet turpis. Nunc vel dignissim lorem. Sed convallis molestie ante vel commodo. Nam luctus turpis sed sapien semper, eu vehicula lorem tincidunt. Suspendisse luctus condimentum turpis sed lobortis. Nam sed laoreet ipsum, quis sagittis felis. Mauris ac arcu sit amet nibh elementum posuere. Ut at justo dapibus, semper massa in, pellentesque ipsum. Sed pretium vulputate mattis. Curabitur ornare gravida dignissim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.', 'Bajo', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam tempor porttitor nisl. Fusce lobortis a velit vel molestie. Ut molestie turpis blandit, tristique nisl quis, gravida tellus. Pellentesque ultricies, ante non hendrerit lacinia, lacus nibh suscipit orci, et iaculis dui mi vitae elit. Aenean faucibus cursus tempor. Donec non ex orci. Praesent lacinia suscipit placerat. Morbi commodo quis magna quis blandit. Vestibulum laoreet augue ut bibendum interdum. Praesent gravida massa nec lacinia venenatis. Nullam volutpat blandit ex, sollicitudin laoreet nunc ultrices vel.
. Ut at justo dapibus, semper massa in, pellentesque ipsum. Sed pretium vulputate mattis. Curabitur ornare gravida dignissim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.', '{"lunes": ["1-2"], "jueves": [], "martes": ["11-12"], "viernes": [], "miercoles": [], "miércoles": ["13-14"]}', '2024-12-04 11:01:23.95095', '2024-12-04 11:01:23.95095', false);
INSERT INTO public.respuestas_formulario_local VALUES (16, 1, 1, 2025, 'primer semestre', 'cristoca@pucv.cl', '19615694-6', 'Cris aa', 'ARA', 'Ingeniería Civil Informática', 2018, '2', 5.40, 'Lorem Pipsksdjfdf', 'Lorem Pipsksdjfdf', 'Lorem Pipsksdjfdf', 'Lorem Pipsksdjfdf', 'Bajo', 'Quiero paltita', '{"lunes": ["1-2"], "jueves": [], "martes": ["13-14"], "viernes": [], "miercoles": []}', '2024-12-09 14:11:25.500842', '2024-12-09 14:11:25.500842', false);
INSERT INTO public.respuestas_formulario_local VALUES (11, 1, 1, 2025, 'primer semestre', 'ejemplo4@ejemplo.com', '19615694-8', 'Marge', 'Simpson', 'Ingeniería Civil Informática', 2000, '1', 5.90, 'no', 'no', 'no', 'no', 'Bajo', 'soy marge', '{"lunes": [], "jueves": ["13-14"], "martes": [], "viernes": [], "miercoles": []}', '2024-12-03 14:30:25.449682', '2024-12-03 14:30:25.449682', false);
INSERT INTO public.respuestas_formulario_local VALUES (8, 1, 1, 2025, 'primer semestre', 'ejemplo1@ejemplo.com', '19615694-3', 'Bart', 'Simpson', 'Ingeniería Informática', 1999, '', 4.00, 'no', 'no', 'no', 'no', 'Alto', 'el Barto', '{"lunes": ["1-2"], "jueves": ["7-8"], "martes": ["3-4"], "viernes": ["9-10"], "miercoles": [], "miércoles": ["5-6"]}', '2024-12-03 01:10:37.887176', '2024-12-03 01:10:37.887176', false);
INSERT INTO public.respuestas_formulario_local VALUES (15, 1, 1, 2025, 'primer semestre', 'rene.araya@pucv.cl', '19615694-2', 'Rene Patricio', 'Araya Rojas', '', 2019, '1', 5.40, 'SI, realice ayudantias en Matematicas ', 'Si, didacticas ', 'No', 'No, no sabia de su existencia', 'Bajo', 'Necesito dinero', '{"lunes": ["1-2", "13-14"], "jueves": [], "martes": [], "viernes": [], "miercoles": []}', '2024-12-05 17:58:53.464798', '2024-12-05 17:58:53.464798', false);
INSERT INTO public.respuestas_formulario_local VALUES (5, 1, 1, 2025, 'primer semestre', 'postulante@example.com', '12345678-9', 'Juan', 'Pérez', 'Ingeniería Informática', 2022, NULL, 6.00, '2', 'Sí', 'No', 'No', 'Bajo', 'Me gusta enseñar', '{"lunes": ["08:00-09:00"], "martes": ["10:00-11:00"]}', '2024-11-28 12:10:46.182504', '2024-11-28 12:10:46.182504', false);
INSERT INTO public.respuestas_formulario_local VALUES (17, 1, 1, 2025, 'primer semestre', 'patricio.r@pucv.cl', '19615694-4', 'Patricio Alexander', ' Rojas Riquelme', 'Ingeniería Civil Informática', 2018, '1', 6.50, 'Si, realice una ayudantía en el ramo Arquitectura de hardware para ingeniería ejecución informática en el primer semestre del año 2019', 'Si tengo experiencia, cree diversas evaluaciones tipo tarea por medio del aula virtual', 'No, solo la ayudantía anteriormente mencionada', 'No pues nunca vi una convocatoria para estas instancias', 'Bajo', 'Tengo experiencia en el ramo, termine con un buen promedio y deseo mantener fresca la información de este, además de ayudar a estudiantes que necesiten reforzamiento en esta asignatura', '{"lunes": ["13-14"], "jueves": [], "martes": [], "viernes": ["13-14"], "miercoles": [], "miércoles": ["13-14"]}', '2024-12-11 01:42:19.271347', '2024-12-11 01:42:19.271347', true);
INSERT INTO public.respuestas_formulario_local VALUES (10, 1, 1, 2025, 'primer semestre', 'ejemplo3@ejemplo.com', '19615694-9', 'Homero', 'Simpson', 'Ingeniería Civil en Ciencia de Datos', 1998, '9', 4.00, 'no', 'no', 'no', 'no', 'Medio', 'Donas', '{"lunes": ["1-2"], "jueves": [], "martes": ["3-4"], "viernes": [], "miercoles": []}', '2024-12-03 01:29:53.742371', '2024-12-03 01:29:53.742371', false);
INSERT INTO public.respuestas_formulario_local VALUES (6, 1, 1, 2025, 'primer semestre', 'estudiante2@ejemplo.com', '19615694-2', 'Pato Rene', 'Rojas Araya', '', 2018, '', 6.20, 'si', 'si', 'si', 'si', 'Bajo', 'si', '{"lunes": ["1-2", "3-4"], "jueves": ["9-10", "11-12"], "martes": ["5-6", "7-8"], "viernes": ["13-14"], "miercoles": []}', '2024-12-03 01:02:06.653922', '2024-12-03 01:02:06.653922', true);
INSERT INTO public.respuestas_formulario_local VALUES (12, 1, 1, 2025, 'primer semestre', 'ejemplo5@ejemplo.com', '12245031-7', 'Ruth Carmen', 'Rojas Araya', 'Ingeniería Informática', 1972, '1', 6.30, 'no', '', 'No', 'Algunos', 'Bajo', 'Quiero retomar estudios', '{"lunes": ["1-2"], "jueves": [], "martes": ["5-6"], "viernes": ["13-14"], "miercoles": [], "miércoles": ["9-10"]}', '2024-12-03 16:48:28.207235', '2024-12-03 16:48:28.207235', false);
INSERT INTO public.respuestas_formulario_local VALUES (14, 1, 1, 2025, 'primer semestre', 'rene.araya.r@mail.pucv.cl', '19615694-1', 'Rene Patricio', 'Araya Rojas', 'Ingeniería Informática', 2018, '2', 5.50, 'Si, realice ayudantías en Ciberseguridad como asistente. Esto fue el año 2023 el segundo semestre para todos quienes tomaran el ramo, al ser optativo habían alumnos de ejecución y civiles', 'Si, cree diversas evaluaciones, ejercicios y revise estos, también tareas. Todos con guías paso a paso de como ejecutar los programas y scripts necesarios para las evaluaciones pues estas tenían un enfoque investigativo y de experimentación para los estudiantes', 'Tutorías no, solamente esa ayudantía como asistente en ciberseguridad. ', 'No participe en ninguno pues desconocía su existencia. ', 'Bajo', 'Retomar lo básico, ayudar e inspirar a los nuevos informáticos pues al ser el ramo introductorio puede ser retador.', '{"lunes": ["13-14"], "jueves": ["13-14", "11-12"], "martes": ["5-6"], "viernes": ["1-2"], "miercoles": [], "miércoles": ["1-2"]}', '2024-12-05 16:54:04.277272', '2024-12-05 16:54:04.277272', false);
INSERT INTO public.respuestas_formulario_local VALUES (18, 45, 2, 2025, 'primer semestre', 'ejemplo@pucv.cl', '12256984-2', 'Santiago Gabriel', 'Lillo Lopez', 'Ingeniería Civil Informática', 2023, '1', 6.70, 'si, en introducción a la informática ', 'no, el docente se encargaba de entregarme las evaluaciones', 'no', 'si, introducción a la docencia', 'Bajo', 'Aprender docencia universitaria', '{"lunes": ["1-2"], "jueves": ["3-4"], "martes": ["7-8"], "viernes": [], "miercoles": [], "miércoles": ["1-2"]}', '2025-10-17 13:15:55.087411', '2025-10-17 13:15:55.087411', false);


--
-- Data for Name: respuestas_formularios_ramos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.respuestas_formularios_ramos VALUES (9, 10, 'https://docs.google.com/forms/d/1eJ_kjYxW6Hpx4YGKo8Tv2xu5TkHQCSwJdQ7L2vnGoFc/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1eJ_kjYxW6Hpx4YGKo8Tv2xu5TkHQCSwJdQ7L2vnGoFc', 'INF2121 ESTADISTICA COMPUTACIONAL');
INSERT INTO public.respuestas_formularios_ramos VALUES (11, 12, 'https://docs.google.com/forms/d/1N3yR_Bn8OSDgXRBjnXF7LEJK-GZFRHLiwJO763d69XE/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1N3yR_Bn8OSDgXRBjnXF7LEJK-GZFRHLiwJO763d69XE', 'INF2322 HARDWARE Y SISTEMAS OPERATIVOS');
INSERT INTO public.respuestas_formularios_ramos VALUES (12, 13, 'https://docs.google.com/forms/d/1TWRm2_yY8ZjQeMU6KGK_zDvQ1uFiocXAv1CLXnF8krg/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1TWRm2_yY8ZjQeMU6KGK_zDvQ1uFiocXAv1CLXnF8krg', 'INF2235 BASE DE DATOS');
INSERT INTO public.respuestas_formularios_ramos VALUES (13, 14, 'https://docs.google.com/forms/d/1oQ1HA0QB4rm3YRN2ihOW7LZf_lnQXooLEiq9nwfi8QE/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1oQ1HA0QB4rm3YRN2ihOW7LZf_lnQXooLEiq9nwfi8QE', 'INF2236 PROGRAMACION AVANZADA');
INSERT INTO public.respuestas_formularios_ramos VALUES (14, 15, 'https://docs.google.com/forms/d/1F9TD_iaW26ARC5m7rK9LM7PRqQqryH_hvyeeGLENYJk/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1F9TD_iaW26ARC5m7rK9LM7PRqQqryH_hvyeeGLENYJk', 'INF2237 INGENIERIA DE SOFTWARE');
INSERT INTO public.respuestas_formularios_ramos VALUES (15, 16, 'https://docs.google.com/forms/d/1bHh32taYnu-3KSN9y_0ewgaOr2tVuklUMjJrRsaCqQ0/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1bHh32taYnu-3KSN9y_0ewgaOr2tVuklUMjJrRsaCqQ0', 'INF2324 REDES DE COMPUTADORES');
INSERT INTO public.respuestas_formularios_ramos VALUES (17, 18, 'https://docs.google.com/forms/d/11-FWM0x_wRI7wkfT-gI5YclHvTVNI8EUO8YsHpaLn0I/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '11-FWM0x_wRI7wkfT-gI5YclHvTVNI8EUO8YsHpaLn0I', 'INF3132 ECONOMIA Y FINANZAS');
INSERT INTO public.respuestas_formularios_ramos VALUES (18, 19, 'https://docs.google.com/forms/d/1ShhQnrioNkk8n4b4yborbCJpGq_u0I1uL3QN_3oalk4/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1ShhQnrioNkk8n4b4yborbCJpGq_u0I1uL3QN_3oalk4', 'INF3233 INTELIGENCIA ARTIFICIAL');
INSERT INTO public.respuestas_formularios_ramos VALUES (19, 20, 'https://docs.google.com/forms/d/1S1-HTqlJrIUVbLxhy1MvSyq5Bn2wuESDwWrghFpQ5-M/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1S1-HTqlJrIUVbLxhy1MvSyq5Bn2wuESDwWrghFpQ5-M', 'INF3234 MODELAMIENTO DE SOFTWARE');
INSERT INTO public.respuestas_formularios_ramos VALUES (20, 21, 'https://docs.google.com/forms/d/1NhgXJtsK3IfF-qkoC18Mk9W_P8b4hH2uAQNBN2m0T3M/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1NhgXJtsK3IfF-qkoC18Mk9W_P8b4hH2uAQNBN2m0T3M', 'INF3235 INGENIERIA DE REQUERIMIENTOS');
INSERT INTO public.respuestas_formularios_ramos VALUES (22, 23, 'https://docs.google.com/forms/d/1uYHX1ipOCIb9u_uLd_qXQMgPdj7p99mcFBxbun03nUw/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1uYHX1ipOCIb9u_uLd_qXQMgPdj7p99mcFBxbun03nUw', 'INF3136 OPTIMIZACION');
INSERT INTO public.respuestas_formularios_ramos VALUES (23, 24, 'https://docs.google.com/forms/d/18d-31PxpiReQz8zpZnXcQn_xh1zzSyj_M8FSgvrTNYc/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '18d-31PxpiReQz8zpZnXcQn_xh1zzSyj_M8FSgvrTNYc', 'INF3245 INGENIERIA WEB Y MOVIL');
INSERT INTO public.respuestas_formularios_ramos VALUES (24, 25, 'https://docs.google.com/forms/d/1VOapvd-wqUVIDxaEDjCzqWfM9uYopJVQWM9MXbDcBZM/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1VOapvd-wqUVIDxaEDjCzqWfM9uYopJVQWM9MXbDcBZM', 'INF3246 EXPERIENCIA DEL USUARIO');
INSERT INTO public.respuestas_formularios_ramos VALUES (25, 26, 'https://docs.google.com/forms/d/1zs0yftG6OIoByvsZeDQ3DT4T0QLmO9DRSpB9pypDTIE/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1zs0yftG6OIoByvsZeDQ3DT4T0QLmO9DRSpB9pypDTIE', 'INF3541 TALLER DE BASE DE DATOS');
INSERT INTO public.respuestas_formularios_ramos VALUES (27, 28, 'https://docs.google.com/forms/d/10AipGTpgmB6UVEg9Tdt6Lr7wdZ2gNu-3I_r0QtgJOEI/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '10AipGTpgmB6UVEg9Tdt6Lr7wdZ2gNu-3I_r0QtgJOEI', 'INF4353 CIBERSEGURIDAD');
INSERT INTO public.respuestas_formularios_ramos VALUES (28, 29, 'https://docs.google.com/forms/d/1z1G_42mAUgm98sO_R-jT_Fs7d8krKri4HJZ47W-k1Vs/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1z1G_42mAUgm98sO_R-jT_Fs7d8krKri4HJZ47W-k1Vs', 'INF4457 TECNOLOGIAS EMERGENTES');
INSERT INTO public.respuestas_formularios_ramos VALUES (29, 30, 'https://docs.google.com/forms/d/1FHIDF22OJ66UVzqeH4Aj0FBvt5Vn2sMm1Hd6oHF8UIQ/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1FHIDF22OJ66UVzqeH4Aj0FBvt5Vn2sMm1Hd6oHF8UIQ', 'INF4552 TALLER DE INGENIERIA DE SOFTWARE');
INSERT INTO public.respuestas_formularios_ramos VALUES (30, 31, 'https://docs.google.com/forms/d/1PKMLF9H3oMeyuZY2GEM6OdTVdvmRJCdVMDTkEUSbX2E/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1PKMLF9H3oMeyuZY2GEM6OdTVdvmRJCdVMDTkEUSbX2E', 'INF4556 SEMINARIO DE TITULO');
INSERT INTO public.respuestas_formularios_ramos VALUES (32, 33, 'https://docs.google.com/forms/d/1gPvM94YyvA_dJbcqXf-Gq1z4dXEXitKbG8D8sy0CBwQ/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1gPvM94YyvA_dJbcqXf-Gq1z4dXEXitKbG8D8sy0CBwQ', 'INF4458 NEGOCIOS, INNOVACION Y EMPRENDIMIENTO');
INSERT INTO public.respuestas_formularios_ramos VALUES (33, 34, 'https://docs.google.com/forms/d/1xAFkSd3jpUXr95aEHTw-CK2fqCVRgaI3NXfWaQCdGi4/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1xAFkSd3jpUXr95aEHTw-CK2fqCVRgaI3NXfWaQCdGi4', 'INF4459 LEGISLACION, ETICA Y TECNOLOGIA');
INSERT INTO public.respuestas_formularios_ramos VALUES (34, 35, 'https://docs.google.com/forms/d/1kMte1jLSqxcQ36Dg_8EmtNMCzSeiWLmdfuP3bVt4YbA/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1kMte1jLSqxcQ36Dg_8EmtNMCzSeiWLmdfuP3bVt4YbA', 'INF4560 PROYECTO DE TITULO');
INSERT INTO public.respuestas_formularios_ramos VALUES (36, 40, 'https://docs.google.com/forms/d/1YYiUqOuDITJISS7_LWL8OmCkXQTA6UDA9OzZchOxQx0/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1YYiUqOuDITJISS7_LWL8OmCkXQTA6UDA9OzZchOxQx0', 'FIN100-14 DESARROLLO INTEGRAL Y COMUNICACION PARA INGENIERIA');
INSERT INTO public.respuestas_formularios_ramos VALUES (45, 89, 'https://docs.google.com/forms/d/1YYiUqOuDITJISS7_LWL8OmCkXQTA6UDA9OzZchOxQx0/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1YYiUqOuDITJISS7_LWL8OmCkXQTA6UDA9OzZchOxQx0', 'FIN100-14 DESARROLLO INTEGRAL Y COMUNICACION PARA INGENIERIA');
INSERT INTO public.respuestas_formularios_ramos VALUES (54, 5, 'https://docs.google.com/forms/d/1BF2lXzYtOV50wH7hnFuCK4fyArxAWLSWu7mqn6LSWh4/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1BF2lXzYtOV50wH7hnFuCK4fyArxAWLSWu7mqn6LSWh4', 'FIN100-14 DESARROLLO INTEGRAL Y COMUNICACION PARA INGENIERIA');
INSERT INTO public.respuestas_formularios_ramos VALUES (62, 37, 'https://docs.google.com/forms/d/181seYv2bI2W570sXYCWwp3TDqYrXRC_oX8WARWC4Dso/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '181seYv2bI2W570sXYCWwp3TDqYrXRC_oX8WARWC4Dso', 'ICI1243 INTRODUCCION A LA INGENIERIA INFORMATICA');
INSERT INTO public.respuestas_formularios_ramos VALUES (63, 38, 'https://docs.google.com/forms/d/1eRCQAW_hOHqMlVsXMYTG045PXC9Fw4SBh07VX347TMU/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1eRCQAW_hOHqMlVsXMYTG045PXC9Fw4SBh07VX347TMU', 'ICI1458 BIENESTAR Y APRENDIZAJE UNIVERSITARIO');
INSERT INTO public.respuestas_formularios_ramos VALUES (65, 40, 'https://docs.google.com/forms/d/1BF2lXzYtOV50wH7hnFuCK4fyArxAWLSWu7mqn6LSWh4/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1BF2lXzYtOV50wH7hnFuCK4fyArxAWLSWu7mqn6LSWh4', 'FIN100-14 DESARROLLO INTEGRAL Y COMUNICACION PARA INGENIERIA');
INSERT INTO public.respuestas_formularios_ramos VALUES (66, 41, 'https://docs.google.com/forms/d/1LekU9ixkhKBg6g1BmrtCUJrcZCz3er_mZYGUktoqd0M/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1LekU9ixkhKBg6g1BmrtCUJrcZCz3er_mZYGUktoqd0M', 'ICI1242 FUNDAMENTOS DE PROGRAMACION');
INSERT INTO public.respuestas_formularios_ramos VALUES (70, 45, 'https://docs.google.com/forms/d/1tjf5714PqBEcSEFy8oF4MdP9YWkalmYyR3Y6wB2EH4o/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1tjf5714PqBEcSEFy8oF4MdP9YWkalmYyR3Y6wB2EH4o', 'ICI2145 ANALISIS INTELIGENTE DE DATOS');
INSERT INTO public.respuestas_formularios_ramos VALUES (71, 46, 'https://docs.google.com/forms/d/1qJ4-RBzMezYRaCGdnJhWSGd_laXQcrneRbe7M1aZt1I/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1qJ4-RBzMezYRaCGdnJhWSGd_laXQcrneRbe7M1aZt1I', 'ICI2240 ESTRUCTURA DE DATOS');
INSERT INTO public.respuestas_formularios_ramos VALUES (74, 49, 'https://docs.google.com/forms/d/171axs1U36IR5yIw16cVolDk00dFFWV6GGuSH7vzriWs/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '171axs1U36IR5yIw16cVolDk00dFFWV6GGuSH7vzriWs', 'ICI2141 METODOS NUMERICOS');
INSERT INTO public.respuestas_formularios_ramos VALUES (75, 50, 'https://docs.google.com/forms/d/19AxOQzo0t4sof9ZKOA5bLnAKYwNQiHebvted4vO1OL8/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '19AxOQzo0t4sof9ZKOA5bLnAKYwNQiHebvted4vO1OL8', 'ICI2241 PROGRAMACION AVANZADA');
INSERT INTO public.respuestas_formularios_ramos VALUES (76, 51, 'https://docs.google.com/forms/d/1VFXbAAee4T6aeEtkMgZ_k3LMJBBL67z0jSnyHANYwEQ/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1VFXbAAee4T6aeEtkMgZ_k3LMJBBL67z0jSnyHANYwEQ', 'ICI2242 ANALISIS Y DISEÑO DE ALGORITMOS');
INSERT INTO public.respuestas_formularios_ramos VALUES (79, 54, 'https://docs.google.com/forms/d/1VMwTLb_vXweQULT98fB9TdgpBz3dEOD-qKNtillGMfY/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1VMwTLb_vXweQULT98fB9TdgpBz3dEOD-qKNtillGMfY', 'ICI3240 BASE DE DATOS');
INSERT INTO public.respuestas_formularios_ramos VALUES (80, 55, 'https://docs.google.com/forms/d/1LMtpBfLhbhismfDaWxV0Z441p0aX9CYfh22yF4nuJ1Y/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1LMtpBfLhbhismfDaWxV0Z441p0aX9CYfh22yF4nuJ1Y', 'ICI3244 INTELIGENCIA ARTIFICIAL');
INSERT INTO public.respuestas_formularios_ramos VALUES (81, 56, 'https://docs.google.com/forms/d/1Dorf1JO3boUfjkjn0NTT2PJM7tv_14I2BpDyq_rGOdM/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1Dorf1JO3boUfjkjn0NTT2PJM7tv_14I2BpDyq_rGOdM', 'ICI3245 AUTOMATAS Y COMPILADORES');
INSERT INTO public.respuestas_formularios_ramos VALUES (82, 57, 'https://docs.google.com/forms/d/1yAmaEoTvhgN4rEADI60sumBLN_0VK8tr34fDvQoD6HM/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1yAmaEoTvhgN4rEADI60sumBLN_0VK8tr34fDvQoD6HM', 'ICI3344 HARDWARE Y SISTEMAS OPERATIVOS');
INSERT INTO public.respuestas_formularios_ramos VALUES (84, 59, 'https://docs.google.com/forms/d/1fvd7ClJV6AwzDqz_ZYaJMZh86dTK8r-880rGbWjOMoU/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1fvd7ClJV6AwzDqz_ZYaJMZh86dTK8r-880rGbWjOMoU', 'ICA4121 ADMINISTRACION DE EMPRESAS');
INSERT INTO public.respuestas_formularios_ramos VALUES (85, 60, 'https://docs.google.com/forms/d/1KEAm7NadJB3-J5YWiH0nG-Pz-YrIgMTmw8CxUZYS5wE/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1KEAm7NadJB3-J5YWiH0nG-Pz-YrIgMTmw8CxUZYS5wE', 'ICI3150 CIENCIA Y TECNOLOGIA');
INSERT INTO public.respuestas_formularios_ramos VALUES (86, 61, 'https://docs.google.com/forms/d/1Ht77NteUE55jZEyHfuOAitPrO0lkX4DXv3txbT_AnRc/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1Ht77NteUE55jZEyHfuOAitPrO0lkX4DXv3txbT_AnRc', 'ICI3170 ESTADISTICA COMPUTACIONAL');
INSERT INTO public.respuestas_formularios_ramos VALUES (87, 62, 'https://docs.google.com/forms/d/1v-KqVP69TNX6X6RWUEzAkIRTRaFJhCrlf_JkHWln310/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1v-KqVP69TNX6X6RWUEzAkIRTRaFJhCrlf_JkHWln310', 'ICI3246 MODELAMIENTO DE SOFTWARE');
INSERT INTO public.respuestas_formularios_ramos VALUES (88, 63, 'https://docs.google.com/forms/d/1P-Vz33MJYDvnRYEoDy06fcC0hZGtszFQ7QS9c8b3cwU/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1P-Vz33MJYDvnRYEoDy06fcC0hZGtszFQ7QS9c8b3cwU', 'ICI3343 REDES DE COMPUTADORES');
INSERT INTO public.respuestas_formularios_ramos VALUES (90, 65, 'https://docs.google.com/forms/d/1gyxp8KuyIGuX5g6z2CD_n-D_zZ265YUPoAExXalhsLk/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1gyxp8KuyIGuX5g6z2CD_n-D_zZ265YUPoAExXalhsLk', 'ICI4150 ROBOTICA Y SISTEMAS AUTONOMOS');
INSERT INTO public.respuestas_formularios_ramos VALUES (91, 66, 'https://docs.google.com/forms/d/1lyP09znmZ1vt3M-jGlTrJE9KNB5pSa8JudpHa7q4LhU/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1lyP09znmZ1vt3M-jGlTrJE9KNB5pSa8JudpHa7q4LhU', 'ICI4151 OPTIMIZACION');
INSERT INTO public.respuestas_formularios_ramos VALUES (92, 67, 'https://docs.google.com/forms/d/1x1G7v59Jj_kLm4QyJrCruRFkJ9WGFQG3tFWsdqIf2ck/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1x1G7v59Jj_kLm4QyJrCruRFkJ9WGFQG3tFWsdqIf2ck', 'ICI4244 INGENIERIA DE SOFTWARE');
INSERT INTO public.respuestas_formularios_ramos VALUES (93, 68, 'https://docs.google.com/forms/d/1XPu9UT1ghcuPba9Pvg8oNUyer8xAactoiZsfhel14eo/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1XPu9UT1ghcuPba9Pvg8oNUyer8xAactoiZsfhel14eo', 'ICI4247 INGENIERIA WEB Y MOVIL');
INSERT INTO public.respuestas_formularios_ramos VALUES (94, 69, 'https://docs.google.com/forms/d/1IelzzA-tqIMM6PEw-vAnv62FgiFcNA681qzXCeXo4b8/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1IelzzA-tqIMM6PEw-vAnv62FgiFcNA681qzXCeXo4b8', 'ICI4344 COMPUTACION PARALELA Y DISTRIBUIDA');
INSERT INTO public.respuestas_formularios_ramos VALUES (96, 71, 'https://docs.google.com/forms/d/15JyUvc1jb7a3YbyEEslQqUbOa35SK_EfcreAsiv1x7c/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '15JyUvc1jb7a3YbyEEslQqUbOa35SK_EfcreAsiv1x7c', 'ICA4161 ECONOMIA Y FINANZAS');
INSERT INTO public.respuestas_formularios_ramos VALUES (97, 72, 'https://docs.google.com/forms/d/1IR5yNijn2AER7kBNbk1oPAWYp81yYEox2kyol-qRgik/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1IR5yNijn2AER7kBNbk1oPAWYp81yYEox2kyol-qRgik', 'ICI4248 INGENIERIA DE REQUERIMIENTOS');
INSERT INTO public.respuestas_formularios_ramos VALUES (98, 73, 'https://docs.google.com/forms/d/1RCWIXQXOMM0-NnxywWVNKoSDyRPKavhWLLABUtO1_q0/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1RCWIXQXOMM0-NnxywWVNKoSDyRPKavhWLLABUtO1_q0', 'ICI4370 CIBERSEGURIDAD');
INSERT INTO public.respuestas_formularios_ramos VALUES (99, 74, 'https://docs.google.com/forms/d/10E5IwMo_P-mu1WZJ4gasXCEbs7IpBvFRenbxJ_4P0TE/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '10E5IwMo_P-mu1WZJ4gasXCEbs7IpBvFRenbxJ_4P0TE', 'ICI4541 TALLER DE BASE DE DATOS');
INSERT INTO public.respuestas_formularios_ramos VALUES (100, 75, 'https://docs.google.com/forms/d/1yaTxd2_QR405Tuognyzt26wrO8ngoOqKdNGb4nyMPB8/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1yaTxd2_QR405Tuognyzt26wrO8ngoOqKdNGb4nyMPB8', 'ICI5247 EXPERIENCIA DE USUARIO');
INSERT INTO public.respuestas_formularios_ramos VALUES (101, 76, 'https://docs.google.com/forms/d/15DnBKUe9oyClCm1IuNjX-LLtCV2jBZYzs7Mw9s24re4/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '15DnBKUe9oyClCm1IuNjX-LLtCV2jBZYzs7Mw9s24re4', 'ICI5441 ADMINISTRACION DE PROYECTOS INFORMATICOS');
INSERT INTO public.respuestas_formularios_ramos VALUES (102, 77, 'https://docs.google.com/forms/d/1nMBclitmEpX02fde8iLH3Os2_BAnmtf11lGF_uWxYRg/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1nMBclitmEpX02fde8iLH3Os2_BAnmtf11lGF_uWxYRg', 'ICI5442 TECNOLOGIAS EMERGENTES');
INSERT INTO public.respuestas_formularios_ramos VALUES (103, 78, 'https://docs.google.com/forms/d/1OePE2jyYwJKNfWnr7kr7G-B9_SedcFN7cyYYUMCiG58/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1OePE2jyYwJKNfWnr7kr7G-B9_SedcFN7cyYYUMCiG58', 'ICI5475 NEGOCIOS, INNOVACION Y EMPRENDIMIENTO');
INSERT INTO public.respuestas_formularios_ramos VALUES (104, 79, 'https://docs.google.com/forms/d/1ZOksNXBLWrpDebh4PPH6276s84vmPGsfspMCIDkBbm0/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1ZOksNXBLWrpDebh4PPH6276s84vmPGsfspMCIDkBbm0', 'ICI5545 TALLER DE INGENIERIA DE SOFTWARE');
INSERT INTO public.respuestas_formularios_ramos VALUES (105, 80, 'https://docs.google.com/forms/d/1PTRCDqFpXIqmPL52WuI87FlUShduRoEgJ8EENcKNEXk/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1PTRCDqFpXIqmPL52WuI87FlUShduRoEgJ8EENcKNEXk', 'ICI5345 LEGISLACION ETICA Y TECNOLOGICA');
INSERT INTO public.respuestas_formularios_ramos VALUES (106, 81, 'https://docs.google.com/forms/d/1AdXIfguPQDez57YSLHcYkN3VN_eTtmAHETt7CLmxgRM/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1AdXIfguPQDez57YSLHcYkN3VN_eTtmAHETt7CLmxgRM', 'ICI5444 TALLER DE FORMULACION DE PROYECTOS INFORMATICOS');
INSERT INTO public.respuestas_formularios_ramos VALUES (107, 82, 'https://docs.google.com/forms/d/1PwfLrs-g0orw3b5j7dBLBJP_icGitiNTW_W1X3JD9Zw/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1PwfLrs-g0orw3b5j7dBLBJP_icGitiNTW_W1X3JD9Zw', 'ICI5476 TALLER DE LIDERAZGO Y TRABAJO EN EQUIPO');
INSERT INTO public.respuestas_formularios_ramos VALUES (108, 83, 'https://docs.google.com/forms/d/1MbCYAifFjUzRu2v25UbAuSkvOWbSKlMUmGUeLcWIuhI/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1MbCYAifFjUzRu2v25UbAuSkvOWbSKlMUmGUeLcWIuhI', 'ICI5541 SEMINARIO DE TITULO');
INSERT INTO public.respuestas_formularios_ramos VALUES (109, 84, 'https://docs.google.com/forms/d/1Jaji92QITTHpuCE43ZRbmBjSHKOZ-D3WCc1gxWczWT0/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1Jaji92QITTHpuCE43ZRbmBjSHKOZ-D3WCc1gxWczWT0', 'ICI6541 PROYECTO DE TITULO');
INSERT INTO public.respuestas_formularios_ramos VALUES (111, 89, 'https://docs.google.com/forms/d/1BF2lXzYtOV50wH7hnFuCK4fyArxAWLSWu7mqn6LSWh4/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1BF2lXzYtOV50wH7hnFuCK4fyArxAWLSWu7mqn6LSWh4', 'FIN100-14 DESARROLLO INTEGRAL Y COMUNICACION PARA INGENIERIA');
INSERT INTO public.respuestas_formularios_ramos VALUES (1, 2, 'https://docs.google.com/forms/d/1w0ov6bVPGLkY1nNURlQ7Kqa7MaZGqiwQBwpCiTgLdI0/edit', '1Z0MMvM6ok8dY7u5CvXX_RUkAZdD_rcfbJFN5sGHnQ9c', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1w0ov6bVPGLkY1nNURlQ7Kqa7MaZGqiwQBwpCiTgLdI0', 'INF1212 INTRODUCCION A LA INGENIERIA INFORMATICA');
INSERT INTO public.respuestas_formularios_ramos VALUES (10, 11, 'https://docs.google.com/forms/d/1HRCbvZMeAt_2fK6xYQey9iAclCA4Wt2PpajsLYjCFnY/edit', '1Gu_f061QRODJYNyx_t-ApYvVZSzvIJu7PVHOK7kxrkE', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1HRCbvZMeAt_2fK6xYQey9iAclCA4Wt2PpajsLYjCFnY', 'INF2223 ESTRUCTURA DE DATOS');
INSERT INTO public.respuestas_formularios_ramos VALUES (2, 3, 'https://docs.google.com/forms/d/1HTJy2U2kInrNNy1XdyBf_kEmdqow5DltlgVNaOCVeGI/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1HTJy2U2kInrNNy1XdyBf_kEmdqow5DltlgVNaOCVeGI', 'INF1413 BIENESTAR Y APRENDIZAJE UNIVERSITARIO');
INSERT INTO public.respuestas_formularios_ramos VALUES (4, 5, 'https://docs.google.com/forms/d/1YYiUqOuDITJISS7_LWL8OmCkXQTA6UDA9OzZchOxQx0/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1YYiUqOuDITJISS7_LWL8OmCkXQTA6UDA9OzZchOxQx0', 'FIN100-14 DESARROLLO INTEGRAL Y COMUNICACION PARA INGENIERIA');
INSERT INTO public.respuestas_formularios_ramos VALUES (5, 6, 'https://docs.google.com/forms/d/1PvjXcIl1z8yDWM6WnnRysnydCsVRT_DoOgL3oDPISDE/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1PvjXcIl1z8yDWM6WnnRysnydCsVRT_DoOgL3oDPISDE', 'INF1214 FUNDAMENTOS DE PROGRAMACION');
INSERT INTO public.respuestas_formularios_ramos VALUES (123, 5, 'https://docs.google.com/forms/d/1ZQ0uxNplmTe0KtqTIADp5QdVaO7EnOBpfadL2FUVOSc/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1ZQ0uxNplmTe0KtqTIADp5QdVaO7EnOBpfadL2FUVOSc', 'FIN100-14 DESARROLLO INTEGRAL Y COMUNICACION PARA INGENIERIA');
INSERT INTO public.respuestas_formularios_ramos VALUES (132, 40, 'https://docs.google.com/forms/d/1ZQ0uxNplmTe0KtqTIADp5QdVaO7EnOBpfadL2FUVOSc/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1ZQ0uxNplmTe0KtqTIADp5QdVaO7EnOBpfadL2FUVOSc', 'FIN100-14 DESARROLLO INTEGRAL Y COMUNICACION PARA INGENIERIA');
INSERT INTO public.respuestas_formularios_ramos VALUES (143, 86, 'https://docs.google.com/forms/d/1ItqVB2mlYgzaOZkf49AY0yWw2N0cpxoMQ0e2F8N0buU/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1ItqVB2mlYgzaOZkf49AY0yWw2N0cpxoMQ0e2F8N0buU', 'ICD1341 FUNDAMENTOS DE ALGORITMOS');
INSERT INTO public.respuestas_formularios_ramos VALUES (144, 87, 'https://docs.google.com/forms/d/1sG61lri6dCNU1mou4QwPudsfAkHSVCvty67ZJjxvZhU/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1sG61lri6dCNU1mou4QwPudsfAkHSVCvty67ZJjxvZhU', 'ICD1401 BIENESTAR Y APRENDIZAJE UNIVERSITARIO');
INSERT INTO public.respuestas_formularios_ramos VALUES (146, 89, 'https://docs.google.com/forms/d/1ZQ0uxNplmTe0KtqTIADp5QdVaO7EnOBpfadL2FUVOSc/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1ZQ0uxNplmTe0KtqTIADp5QdVaO7EnOBpfadL2FUVOSc', 'FIN100-14 DESARROLLO INTEGRAL Y COMUNICACION PARA INGENIERIA');
INSERT INTO public.respuestas_formularios_ramos VALUES (147, 90, 'https://docs.google.com/forms/d/1TypZoqz4f7-vyuQkAFFuDHkIPmcOY7iorlABhi5K278/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1TypZoqz4f7-vyuQkAFFuDHkIPmcOY7iorlABhi5K278', 'ICD1342 FUNDAMENTOS DE PROGRAMACION');
INSERT INTO public.respuestas_formularios_ramos VALUES (151, 94, 'https://docs.google.com/forms/d/1RMM-yNGBnfhq3XvQ1eB1RDFBTpFrXKDVK1lcuaQnZvQ/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1RMM-yNGBnfhq3XvQ1eB1RDFBTpFrXKDVK1lcuaQnZvQ', 'ICD2243 INTRODUCCION AL ANALISIS DE DATOS');
INSERT INTO public.respuestas_formularios_ramos VALUES (152, 95, 'https://docs.google.com/forms/d/1MgoFFUWJ_wOcKiFD81IrESiS6MKqzWS5A7QaR8Mda24/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1MgoFFUWJ_wOcKiFD81IrESiS6MKqzWS5A7QaR8Mda24', 'ICD2344 ESTRUCTURA DE DATOS');
INSERT INTO public.respuestas_formularios_ramos VALUES (155, 98, 'https://docs.google.com/forms/d/1rr4Ld0YVAckovfG_MTtB-RI4xBx5DVo2tUd1baiDXwA/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1rr4Ld0YVAckovfG_MTtB-RI4xBx5DVo2tUd1baiDXwA', 'ICD2145 CIENCIA Y TECNOLOGIA');
INSERT INTO public.respuestas_formularios_ramos VALUES (156, 99, 'https://docs.google.com/forms/d/1Js4dXnFdOoDyO8RVNJKCjojUlnts5ZGQ32d1Kp0OURk/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1Js4dXnFdOoDyO8RVNJKCjojUlnts5ZGQ32d1Kp0OURk', 'ICD2346 PARADIGMAS DE PROGRAMACION');
INSERT INTO public.respuestas_formularios_ramos VALUES (157, 100, 'https://docs.google.com/forms/d/1s2izaUaGKKl1_Q5A1udMW-4ejNcDj5j9bcQfbrm6kGM/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1s2izaUaGKKl1_Q5A1udMW-4ejNcDj5j9bcQfbrm6kGM', 'ICD2347 ANALISIS Y DISEÑO DE ALGORITMOS');
INSERT INTO public.respuestas_formularios_ramos VALUES (161, 104, 'https://docs.google.com/forms/d/1orq426ggzR5x06iskqdQ_irgA7ie_TXeqoYnHMkD4a8/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1orq426ggzR5x06iskqdQ_irgA7ie_TXeqoYnHMkD4a8', 'ICD3148 ESTADISTICA COMPUTACIONAL');
INSERT INTO public.respuestas_formularios_ramos VALUES (162, 105, 'https://docs.google.com/forms/d/1HMdzsDWdF_X9y9FiarvMZ78g0ZNy87CXObVUV4hpuig/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1HMdzsDWdF_X9y9FiarvMZ78g0ZNy87CXObVUV4hpuig', 'ICD3149 TEORIA DE SISTEMAS');
INSERT INTO public.respuestas_formularios_ramos VALUES (163, 106, 'https://docs.google.com/forms/d/186Y_CBYwtKTeG4XgDG-dunw4ooe4Ran_Pv1XJgK1K2E/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '186Y_CBYwtKTeG4XgDG-dunw4ooe4Ran_Pv1XJgK1K2E', 'ICD3350 BASE DE DATOS');
INSERT INTO public.respuestas_formularios_ramos VALUES (165, 108, 'https://docs.google.com/forms/d/1FVnghXKFfazpGZ_o_6C0obMicOLCFdR8Xv-GtqEskwg/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1FVnghXKFfazpGZ_o_6C0obMicOLCFdR8Xv-GtqEskwg', 'ICD3151 METODOS NUMERICOS');
INSERT INTO public.respuestas_formularios_ramos VALUES (166, 109, 'https://docs.google.com/forms/d/1Wm9SMt6oWZ1eciTu_dNGu4epTz-IW1eABW9dcKtTdy8/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1Wm9SMt6oWZ1eciTu_dNGu4epTz-IW1eABW9dcKtTdy8', 'ICD3152 ESTADISTICA AVANZADA');
INSERT INTO public.respuestas_formularios_ramos VALUES (167, 110, 'https://docs.google.com/forms/d/1rNk79Vtt2ZhqHCh_JLaGU3J_WKS07brT4rUVQt8D90o/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1rNk79Vtt2ZhqHCh_JLaGU3J_WKS07brT4rUVQt8D90o', 'ICD3153 INTELIGENCIA ARTIFICIAL');
INSERT INTO public.respuestas_formularios_ramos VALUES (168, 111, 'https://docs.google.com/forms/d/1Sj0n3R8gCc6FuARxBg6tncxkvbLoN0WmAVOKpRJVSno/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1Sj0n3R8gCc6FuARxBg6tncxkvbLoN0WmAVOKpRJVSno', 'ICD3255 ANALISIS INTELIGENTE DE DATOS');
INSERT INTO public.respuestas_formularios_ramos VALUES (169, 112, 'https://docs.google.com/forms/d/1dtidOw51mR7nSDdYIpMXbmWzbVBdBn4zOlJ5F2VTTSc/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1dtidOw51mR7nSDdYIpMXbmWzbVBdBn4zOlJ5F2VTTSc', 'ICD3354 HARDWARE Y SISTEMAS OPERATIVOS');
INSERT INTO public.respuestas_formularios_ramos VALUES (171, 114, 'https://docs.google.com/forms/d/1q0MBgsQhiw4xUOSfO1Q-Nc2mw3SqH-OdCY6oDeIxtlw/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1q0MBgsQhiw4xUOSfO1Q-Nc2mw3SqH-OdCY6oDeIxtlw', 'ICA2121 ADMINISTRACION DE EMPRESAS');
INSERT INTO public.respuestas_formularios_ramos VALUES (172, 115, 'https://docs.google.com/forms/d/1SiMGIU1SFYJp0cqMx4ib_DBxkP1Bd4kxZluVkv4ESUU/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1SiMGIU1SFYJp0cqMx4ib_DBxkP1Bd4kxZluVkv4ESUU', 'ICD4156 OPTIMIZACION 1');
INSERT INTO public.respuestas_formularios_ramos VALUES (173, 116, 'https://docs.google.com/forms/d/1OBze0onSmeGUsBHhRjE-ZtrD_AABG-lCcGX__HC9SLY/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1OBze0onSmeGUsBHhRjE-ZtrD_AABG-lCcGX__HC9SLY', 'ICD4157 ANALISIS DE SERIES DE TIEMPO');
INSERT INTO public.respuestas_formularios_ramos VALUES (174, 117, 'https://docs.google.com/forms/d/1rXVfnhFGDwEG7jISFkxRMuljusPd0JxR9FPfBvw1MOI/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1rXVfnhFGDwEG7jISFkxRMuljusPd0JxR9FPfBvw1MOI', 'ICD4258 APRENDIZAJE AUTOMATICO 1');
INSERT INTO public.respuestas_formularios_ramos VALUES (175, 118, 'https://docs.google.com/forms/d/1pSnuG2PdL01dscQakugwRIEPNbuP9E6Qf1jcHAxBdQA/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1pSnuG2PdL01dscQakugwRIEPNbuP9E6Qf1jcHAxBdQA', 'ICD4359 ALMACENAMIENTO Y RECUPERACION DE DATOS');
INSERT INTO public.respuestas_formularios_ramos VALUES (177, 120, 'https://docs.google.com/forms/d/1c7ogpHZreYK3JDQY5ivTXt_AEzxkIibs6QH7KkSnvMc/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1c7ogpHZreYK3JDQY5ivTXt_AEzxkIibs6QH7KkSnvMc', 'ICD4160 OPTIMIZACION 2');
INSERT INTO public.respuestas_formularios_ramos VALUES (178, 121, 'https://docs.google.com/forms/d/1S2muS9hUE5XjY3OC1hMIxcpbecZCm50BbwgOVqpia0w/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1S2muS9hUE5XjY3OC1hMIxcpbecZCm50BbwgOVqpia0w', 'ICD4262 APRENDIZAJE AUTOMATICO 2');
INSERT INTO public.respuestas_formularios_ramos VALUES (179, 122, 'https://docs.google.com/forms/d/1FWy90C8NJ52LX6CMYPLf7jJvHbM4shOOUat8CJpn4NY/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1FWy90C8NJ52LX6CMYPLf7jJvHbM4shOOUat8CJpn4NY', 'ICD4363 REDES DE COMPUTADORES');
INSERT INTO public.respuestas_formularios_ramos VALUES (180, 123, 'https://docs.google.com/forms/d/1G13rdLvbTjWwmezurcgylVCla6i_zEoaq5UVVUIDsq0/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1G13rdLvbTjWwmezurcgylVCla6i_zEoaq5UVVUIDsq0', 'ICD4461 METODOLOGIA DE DESARROLLO DE SOFTWARE');
INSERT INTO public.respuestas_formularios_ramos VALUES (181, 124, 'https://docs.google.com/forms/d/1033TYh-PNcGfEoncfd6rTxUSyZdM_9uLREgqRJ8r8hM/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1033TYh-PNcGfEoncfd6rTxUSyZdM_9uLREgqRJ8r8hM', 'ICA5164 ECONOMIA Y FINANZAS');
INSERT INTO public.respuestas_formularios_ramos VALUES (182, 125, 'https://docs.google.com/forms/d/1IqXVeetfwzwXM138L73QIIL-8IrI8Ey56WPzeESVCj8/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1IqXVeetfwzwXM138L73QIIL-8IrI8Ey56WPzeESVCj8', 'ICD5167 CIENCIA DE REDES');
INSERT INTO public.respuestas_formularios_ramos VALUES (183, 126, 'https://docs.google.com/forms/d/1vev1kGJZtLRjzvRLFnrr9HRoOYqrE0Ooia4KTz1_VZ4/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1vev1kGJZtLRjzvRLFnrr9HRoOYqrE0Ooia4KTz1_VZ4', 'ICD5366 COMPUTACION PARALELA Y DISTRIBUIDA');
INSERT INTO public.respuestas_formularios_ramos VALUES (184, 127, 'https://docs.google.com/forms/d/1UOpxo1QmBIng0M70T5NSgugPj7mRlyT4sxTe8MBW-Co/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1UOpxo1QmBIng0M70T5NSgugPj7mRlyT4sxTe8MBW-Co', 'ICD5465 VISUALIZACION DE DATOS');
INSERT INTO public.respuestas_formularios_ramos VALUES (185, 128, 'https://docs.google.com/forms/d/1lnpbvyw8PK1mnAXAfbpT-XLHwW0q63vFdkr2fJtWrrQ/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1lnpbvyw8PK1mnAXAfbpT-XLHwW0q63vFdkr2fJtWrrQ', 'ICD5468 TALLER DE LIDERAZGO Y TRABAJO EN EQUIPO');
INSERT INTO public.respuestas_formularios_ramos VALUES (186, 129, 'https://docs.google.com/forms/d/1JZ8RlDOhi5YoakYpycrDTY3fW2V2naW5EgWU3NzZ0v0/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1JZ8RlDOhi5YoakYpycrDTY3fW2V2naW5EgWU3NzZ0v0', 'ICD5369 BIG DATA');
INSERT INTO public.respuestas_formularios_ramos VALUES (187, 130, 'https://docs.google.com/forms/d/1JHS4NmIvOs9VVBM4H4Xl78Vfq_H9DyFfnKEBb7piZ1A/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1JHS4NmIvOs9VVBM4H4Xl78Vfq_H9DyFfnKEBb7piZ1A', 'ICD5471 NEGOCIOS, INNOVACION Y EMPRENDIMIENTO');
INSERT INTO public.respuestas_formularios_ramos VALUES (188, 131, 'https://docs.google.com/forms/d/1qdbWobePzEd5GqsZMEhIF__fgqPlH1GUnM9A0de1HlY/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1qdbWobePzEd5GqsZMEhIF__fgqPlH1GUnM9A0de1HlY', 'ICD5570 SEMINARIO DE TITULO');
INSERT INTO public.respuestas_formularios_ramos VALUES (189, 132, 'https://docs.google.com/forms/d/1PQYpbtYVWwZMhv0nmoTVMZbTZR6nkxlSwv-wPH7sS-A/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1PQYpbtYVWwZMhv0nmoTVMZbTZR6nkxlSwv-wPH7sS-A', 'ICD6473 PRIVACIDAD, ETICA Y SEGURIDAD');
INSERT INTO public.respuestas_formularios_ramos VALUES (190, 133, 'https://docs.google.com/forms/d/1kPsBhcjFo3oRort_icTslQhVo-LEK1IKhXs1Dj9SNcI/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1kPsBhcjFo3oRort_icTslQhVo-LEK1IKhXs1Dj9SNcI', 'ICD6572 PROYECTO DE TITULO');
INSERT INTO public.respuestas_formularios_ramos VALUES (191, 1, 'https://docs.google.com/forms/d/1vkbFiaKIzBJW2AOCN7gbAR7OMhEAfdT_DWgJDW3K09Q/edit', '', '2024-11-13 01:45:24.483592', '2024-11-13 01:45:24.483592', '1vkbFiaKIzBJW2AOCN7gbAR7OMhEAfdT_DWgJDW3K09Q', 'INF1211 FUNDAMENTOS DE ALGORITMOS');


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.roles VALUES (1, 'administrador');
INSERT INTO public.roles VALUES (2, 'profesor');


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.usuarios VALUES (1, 'Broderick Crawford Labrín', 'broderick.crawford@pucv.cl', '$2b$10$rHuebjAVZav5EQifci6IoO3RWg0SOGqeNuZsXqJUes68lWWd4smS6', 2);
INSERT INTO public.usuarios VALUES (2, 'Iván Mercado Bermúdez', 'ivan.mercado@pucv.cl', '$2b$10$7Pr825qp6rYtSl0M0K26rO1mKr5mZjAzvQXfEnIhwMHuOYVGcQ.ee', 2);
INSERT INTO public.usuarios VALUES (3, 'Wenceslao Palma Muñoz', 'wenceslao.palma@pucv.cl', '$2b$10$iO6lct4.D8lp.0sdOIJqlezxRSGQviWumiPwElMz./05eKoJ/BVVu', 2);
INSERT INTO public.usuarios VALUES (4, 'Guillermo Cabrera Guerrero', 'guillermo.cabrera@pucv.cl', '$2b$10$ycbLUpQ2PQW5ptxHQUh31OMKDveho9XPhAYZTvdUsBmCIhCdHyD8S', 2);
INSERT INTO public.usuarios VALUES (5, 'Nibaldo Rodríguez Agurto', 'nibaldo.rodriguez@pucv.cl', '$2b$10$ZHQ.87RcZMdepTSMn8hX0.uyeItOLws/aJluhhjKPyeF4htIOvTve', 2);
INSERT INTO public.usuarios VALUES (6, 'Cristian Rusu', 'cristian.rusu@pucv.cl', '$2b$10$haFw/k/hm7734mMQxo4iYO2mO2BeJ4PSaykJ8kqUebwFkwVtzHbym', 2);
INSERT INTO public.usuarios VALUES (7, 'Silvana Roncagliolo De La Horra', 'silvana.roncagliolo@pucv.cl', '$2b$10$sUT85Ur8xnn6nRNKUbEBPOXiGHicn1n.BsOZ.fVUf3/ElTm6uLirS', 2);
INSERT INTO public.usuarios VALUES (8, 'Claudio Cubillos Figueroa', 'claudio.cubillos@pucv.cl', '$2b$10$Xx10BK65hK1ZDTpUBS.1beRnEbx7s1M4p2sQ2zTU.CVHSHojH5kUm', 2);
INSERT INTO public.usuarios VALUES (9, 'Pamela Hermosilla Monckton', 'pamela.hermosilla@pucv.cl', '$2b$10$a.0X6IdUFfh/BAfB5fVQOO7C7Uz6C.aJINIi5zo7Ki43XQFHRiWmu', 2);
INSERT INTO public.usuarios VALUES (10, 'Héctor Allende Cid', 'hector.allende@pucv.cl', '$2b$10$q/ipYic6wAQmcNlOKr8A0.7IQxoZ8qhxyi/UHZcLzImaiXNpsU/86', 2);
INSERT INTO public.usuarios VALUES (11, 'Ignacio Araya Zamorano', 'ignacio.araya@pucv.cl', '$2b$10$irI3RZvEiemiEaTmtU.yCei0m08mQau06e4B27peai97O69auitCe', 2);
INSERT INTO public.usuarios VALUES (12, 'Daniela Quiñones Otey', 'daniela.quinones@pucv.cl', '$2b$10$lPeDzNkmKiHQgyvKgCQQauM0loPbFW3.1dpGb.q9H2Zs7jFYUYSlK', 2);
INSERT INTO public.usuarios VALUES (13, 'Leslie Pérez Cáceres', 'leslie.perez@pucv.cl', '$2b$10$Fc.MwFDkrqmndx8l8GfpHOLK7SyhVkY0HrM/LurIXaV2COQRr6.cK', 2);
INSERT INTO public.usuarios VALUES (14, 'Rodrigo Alfaro Arancibia', 'rodrigo.alfaro@pucv.cl', '$2b$10$7Iak6G8bm6l71kMYz47PyOmObw8Jyu0rIujSYAfUYx5pMCrcJND3O', 2);
INSERT INTO public.usuarios VALUES (15, 'Sandra Cano Mazuera', 'sandra.cano@pucv.cl', '$2b$10$gMGU6FWus/GDhBYMKTxbf.7zITxKrnGcUMyyEKxkmwm8fm56Eq2aq', 2);
INSERT INTO public.usuarios VALUES (16, 'Emanuel Enrique Vega Mena', 'emanuel.vega@pucv.cl', '$2b$10$CA4JF.jBXmUzt1qOxluHu.2GUCO18S0p3C8GdsCjr8hpU1Iz6oN8G', 2);
INSERT INTO public.usuarios VALUES (17, 'Christoffer Löffler', 'christoffer.loffler@pucv.cl', '$2b$10$RZwuqp3UXAUJceliyP4CGuxf7ZYyzJuahaVSRkhipf2lPYJGqsyHS', 2);
INSERT INTO public.usuarios VALUES (18, 'Aldo Migliaro Osorio', 'amigliar@inf.ucv.cl', '$2b$10$YV.BQ74N0RD.VqM5RejE7.01KdEtnA6tz.EsGokYtEktF2.caesL.', 2);
INSERT INTO public.usuarios VALUES (19, 'Ricardo Soto De Giorgis', 'ricardo.soto@pucv.cl', '$2b$10$TgTMB74/mVmtgiJ4MyaGCOZaG.2KX0gK4B6AIZtuSyOPU/I7SBtuu', 2);
INSERT INTO public.usuarios VALUES (20, 'René Araya Rojas', 'rene.araya.r@mail.pucv.cl', '$2b$10$CQIog3.K.zOh75zh7o6vI.HLoaW7gMY2RZauTSVPfCAQL6WWl60.S', 2);
INSERT INTO public.usuarios VALUES (21, 'Administrador General', 'postulacion.ayudantias.eii@pucv.cl', '$2b$10$/Xsv7nq2yoeampR1dhy4COQ97el1y9IuYuRcEC3djHgRFC7Vl3Deq', 1);


--
-- Name: carreras_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.carreras_id_seq', 3, true);


--
-- Name: estado_oferta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.estado_oferta_id_seq', 698, true);


--
-- Name: formularios_temp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.formularios_temp_id_seq', 191, true);


--
-- Name: profesores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.profesores_id_seq', 20, true);


--
-- Name: profesores_ramos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.profesores_ramos_id_seq', 49, true);


--
-- Name: ramos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ramos_id_seq', 133, true);


--
-- Name: respuestas_formulario_local_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.respuestas_formulario_local_id_seq', 16, true);


--
-- Name: respuestas_formularios_ramos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.respuestas_formularios_ramos_id_seq', 191, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, false);


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 80, true);


--
-- Name: carreras carreras_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carreras
    ADD CONSTRAINT carreras_pkey PRIMARY KEY (id);


--
-- Name: estado_oferta estado_oferta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estado_oferta
    ADD CONSTRAINT estado_oferta_pkey PRIMARY KEY (id);


--
-- Name: formularios formularios_temp_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.formularios
    ADD CONSTRAINT formularios_temp_pkey PRIMARY KEY (id);


--
-- Name: profesores profesores_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profesores
    ADD CONSTRAINT profesores_email_key UNIQUE (correo);


--
-- Name: profesores profesores_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profesores
    ADD CONSTRAINT profesores_pkey PRIMARY KEY (id);


--
-- Name: profesores_ramos profesores_ramos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profesores_ramos
    ADD CONSTRAINT profesores_ramos_pkey PRIMARY KEY (id);


--
-- Name: profesores_ramos profesores_ramos_profesor_id_ramo_id_carrera_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profesores_ramos
    ADD CONSTRAINT profesores_ramos_profesor_id_ramo_id_carrera_id_key UNIQUE (profesor_id, ramo_id, carrera_id);


--
-- Name: ramos ramos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ramos
    ADD CONSTRAINT ramos_pkey PRIMARY KEY (id);


--
-- Name: respuestas_formulario_local respuestas_formulario_local_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.respuestas_formulario_local
    ADD CONSTRAINT respuestas_formulario_local_pkey PRIMARY KEY (id);


--
-- Name: respuestas_formulario_local respuestas_formulario_local_respondent_email_ramo_id_carrer_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.respuestas_formulario_local
    ADD CONSTRAINT respuestas_formulario_local_respondent_email_ramo_id_carrer_key UNIQUE (respondent_email, ramo_id, carrera_id, anio, semestre);


--
-- Name: respuestas_formularios_ramos respuestas_formularios_ramos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.respuestas_formularios_ramos
    ADD CONSTRAINT respuestas_formularios_ramos_pkey PRIMARY KEY (id);


--
-- Name: roles roles_nombre_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_nombre_key UNIQUE (nombre);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: estado_oferta unique_ramo_carrera; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estado_oferta
    ADD CONSTRAINT unique_ramo_carrera UNIQUE (ramo_id, carrera_id);


--
-- Name: usuarios usuarios_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: estado_oferta estado_oferta_carrera_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estado_oferta
    ADD CONSTRAINT estado_oferta_carrera_id_fkey FOREIGN KEY (carrera_id) REFERENCES public.carreras(id) ON DELETE CASCADE;


--
-- Name: estado_oferta estado_oferta_ramo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estado_oferta
    ADD CONSTRAINT estado_oferta_ramo_id_fkey FOREIGN KEY (ramo_id) REFERENCES public.ramos(id) ON DELETE CASCADE;


--
-- Name: profesores_ramos profesores_ramos_carrera_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profesores_ramos
    ADD CONSTRAINT profesores_ramos_carrera_id_fkey FOREIGN KEY (carrera_id) REFERENCES public.carreras(id);


--
-- Name: profesores_ramos profesores_ramos_profesor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profesores_ramos
    ADD CONSTRAINT profesores_ramos_profesor_id_fkey FOREIGN KEY (profesor_id) REFERENCES public.usuarios(id);


--
-- Name: profesores_ramos profesores_ramos_ramo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profesores_ramos
    ADD CONSTRAINT profesores_ramos_ramo_id_fkey FOREIGN KEY (ramo_id) REFERENCES public.ramos(id);


--
-- Name: ramos ramos_carrera_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ramos
    ADD CONSTRAINT ramos_carrera_id_fkey FOREIGN KEY (carrera_id) REFERENCES public.carreras(id);


--
-- Name: respuestas_formulario_local respuestas_formulario_local_carrera_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.respuestas_formulario_local
    ADD CONSTRAINT respuestas_formulario_local_carrera_id_fkey FOREIGN KEY (carrera_id) REFERENCES public.carreras(id);


--
-- Name: respuestas_formulario_local respuestas_formulario_local_ramo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.respuestas_formulario_local
    ADD CONSTRAINT respuestas_formulario_local_ramo_id_fkey FOREIGN KEY (ramo_id) REFERENCES public.ramos(id);


--
-- Name: usuarios usuarios_rol_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_rol_id_fkey FOREIGN KEY (rol_id) REFERENCES public.roles(id);


--
-- PostgreSQL database dump complete
--

