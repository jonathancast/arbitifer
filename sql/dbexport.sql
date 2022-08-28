--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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

--
-- Name: seq_ticket_no; Type: SEQUENCE; Schema: public; Owner: arbitifer_arbitifer
--

CREATE SEQUENCE public.seq_ticket_no
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_ticket_no OWNER TO arbitifer_arbitifer;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: tickets; Type: TABLE; Schema: public; Owner: arbitifer_arbitifer
--

CREATE TABLE public.tickets (
    id integer DEFAULT nextval('public.seq_ticket_no'::regclass) NOT NULL,
    story text NOT NULL
);


ALTER TABLE public.tickets OWNER TO arbitifer_arbitifer;

--
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: arbitifer_arbitifer
--

COPY public.tickets (id, story) FROM stdin;
1	As a user, I want to see a list of all tickets, so I can see what to work on
\.


--
-- Name: seq_ticket_no; Type: SEQUENCE SET; Schema: public; Owner: arbitifer_arbitifer
--

SELECT pg_catalog.setval('public.seq_ticket_no', 1, true);


--
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: arbitifer_arbitifer
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

