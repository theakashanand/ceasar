--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.2

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
-- Name: measurements; Type: TABLE; Schema: public; Owner: akash
--

CREATE TABLE public.measurements (
    id integer NOT NULL,
    sensor_id integer,
    celcius double precision,
    humidity double precision,
    created timestamp without time zone DEFAULT now()
);


ALTER TABLE public.measurements OWNER TO akash;

--
-- Name: measurements_id_seq; Type: SEQUENCE; Schema: public; Owner: akash
--

CREATE SEQUENCE public.measurements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.measurements_id_seq OWNER TO akash;

--
-- Name: measurements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: akash
--

ALTER SEQUENCE public.measurements_id_seq OWNED BY public.measurements.id;


--
-- Name: sensors; Type: TABLE; Schema: public; Owner: akash
--

CREATE TABLE public.sensors (
    sensor_id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.sensors OWNER TO akash;

--
-- Name: sensors_sensor_id_seq; Type: SEQUENCE; Schema: public; Owner: akash
--

CREATE SEQUENCE public.sensors_sensor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sensors_sensor_id_seq OWNER TO akash;

--
-- Name: sensors_sensor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: akash
--

ALTER SEQUENCE public.sensors_sensor_id_seq OWNED BY public.sensors.sensor_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: akash
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(50),
    password character varying(255),
    is_admin boolean DEFAULT false
);


ALTER TABLE public.users OWNER TO akash;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: akash
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO akash;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: akash
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: measurements id; Type: DEFAULT; Schema: public; Owner: akash
--

ALTER TABLE ONLY public.measurements ALTER COLUMN id SET DEFAULT nextval('public.measurements_id_seq'::regclass);


--
-- Name: sensors sensor_id; Type: DEFAULT; Schema: public; Owner: akash
--

ALTER TABLE ONLY public.sensors ALTER COLUMN sensor_id SET DEFAULT nextval('public.sensors_sensor_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: akash
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: measurements; Type: TABLE DATA; Schema: public; Owner: akash
--

COPY public.measurements (id, sensor_id, celcius, humidity, created) FROM stdin;
\.


--
-- Data for Name: sensors; Type: TABLE DATA; Schema: public; Owner: akash
--

COPY public.sensors (sensor_id, name) FROM stdin;
1	NodeMCU  ESP32
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: akash
--

COPY public.users (user_id, username, password, is_admin) FROM stdin;
1	ceasar	rasbpi	f
\.


--
-- Name: measurements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: akash
--

SELECT pg_catalog.setval('public.measurements_id_seq', 1, false);


--
-- Name: sensors_sensor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: akash
--

SELECT pg_catalog.setval('public.sensors_sensor_id_seq', 1, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: akash
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, true);


--
-- Name: measurements measurements_pkey; Type: CONSTRAINT; Schema: public; Owner: akash
--

ALTER TABLE ONLY public.measurements
    ADD CONSTRAINT measurements_pkey PRIMARY KEY (id);


--
-- Name: sensors sensors_pkey; Type: CONSTRAINT; Schema: public; Owner: akash
--

ALTER TABLE ONLY public.sensors
    ADD CONSTRAINT sensors_pkey PRIMARY KEY (sensor_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: akash
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: measurements sensor; Type: FK CONSTRAINT; Schema: public; Owner: akash
--

ALTER TABLE ONLY public.measurements
    ADD CONSTRAINT sensor FOREIGN KEY (sensor_id) REFERENCES public.sensors(sensor_id);


--
-- PostgreSQL database dump complete
--

