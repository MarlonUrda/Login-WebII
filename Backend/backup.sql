--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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
-- Name: class; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.class (
    id_class integer NOT NULL,
    id_module integer
);


ALTER TABLE public.class OWNER TO postgres;

--
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu (
    id_menu integer NOT NULL,
    id_module integer
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- Name: method; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.method (
    id_method integer NOT NULL,
    id_class integer
);


ALTER TABLE public.method OWNER TO postgres;

--
-- Name: module; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.module (
    id_module integer NOT NULL
);


ALTER TABLE public.module OWNER TO postgres;

--
-- Name: option; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.option (
    id_option integer NOT NULL,
    id_menu integer
);


ALTER TABLE public.option OWNER TO postgres;

--
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id_person integer NOT NULL
);


ALTER TABLE public.person OWNER TO postgres;

--
-- Name: profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile (
    id_profile integer NOT NULL
);


ALTER TABLE public.profile OWNER TO postgres;

--
-- Name: profile_method; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile_method (
    id_p_m integer NOT NULL,
    id_profile integer,
    id_method integer
);


ALTER TABLE public.profile_method OWNER TO postgres;

--
-- Name: profile_module; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile_module (
    id_p_m integer NOT NULL,
    id_profile integer,
    id_module integer
);


ALTER TABLE public.profile_module OWNER TO postgres;

--
-- Name: profile_option; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile_option (
    id_p_o integer NOT NULL,
    id_profile integer,
    id_option integer
);


ALTER TABLE public.profile_option OWNER TO postgres;

--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id_user integer NOT NULL,
    id_person integer
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_profile (
    id_u_p integer NOT NULL,
    id_user integer,
    id_profile integer
);


ALTER TABLE public.user_profile OWNER TO postgres;

--
-- Data for Name: class; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.class (id_class, id_module) FROM stdin;
\.


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu (id_menu, id_module) FROM stdin;
\.


--
-- Data for Name: method; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.method (id_method, id_class) FROM stdin;
\.


--
-- Data for Name: module; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.module (id_module) FROM stdin;
\.


--
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.option (id_option, id_menu) FROM stdin;
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.person (id_person) FROM stdin;
\.


--
-- Data for Name: profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile (id_profile) FROM stdin;
\.


--
-- Data for Name: profile_method; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile_method (id_p_m, id_profile, id_method) FROM stdin;
\.


--
-- Data for Name: profile_module; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile_module (id_p_m, id_profile, id_module) FROM stdin;
\.


--
-- Data for Name: profile_option; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile_option (id_p_o, id_profile, id_option) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id_user, id_person) FROM stdin;
\.


--
-- Data for Name: user_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_profile (id_u_p, id_user, id_profile) FROM stdin;
\.


--
-- Name: class pk_class; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class
    ADD CONSTRAINT pk_class PRIMARY KEY (id_class);


--
-- Name: menu pk_menu; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT pk_menu PRIMARY KEY (id_menu);


--
-- Name: method pk_method; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.method
    ADD CONSTRAINT pk_method PRIMARY KEY (id_method);


--
-- Name: module pk_module; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.module
    ADD CONSTRAINT pk_module PRIMARY KEY (id_module);


--
-- Name: option pk_option; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.option
    ADD CONSTRAINT pk_option PRIMARY KEY (id_option);


--
-- Name: person pk_person; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT pk_person PRIMARY KEY (id_person);


--
-- Name: profile pk_profile; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT pk_profile PRIMARY KEY (id_profile);


--
-- Name: profile_method pk_profile_method; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_method
    ADD CONSTRAINT pk_profile_method PRIMARY KEY (id_p_m);


--
-- Name: profile_module pk_profile_module; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_module
    ADD CONSTRAINT pk_profile_module PRIMARY KEY (id_p_m);


--
-- Name: profile_option pk_profile_option; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_option
    ADD CONSTRAINT pk_profile_option PRIMARY KEY (id_p_o);


--
-- Name: user pk_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT pk_user PRIMARY KEY (id_user);


--
-- Name: user_profile pk_user_profile; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT pk_user_profile PRIMARY KEY (id_u_p);


--
-- Name: user unq_user_id_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT unq_user_id_user UNIQUE (id_user);


--
-- Name: unq_person_id_person; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unq_person_id_person ON public.person USING btree (id_person);


--
-- Name: class fk_class_module; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class
    ADD CONSTRAINT fk_class_module FOREIGN KEY (id_module) REFERENCES public.module(id_module);


--
-- Name: menu fk_menu_module; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT fk_menu_module FOREIGN KEY (id_module) REFERENCES public.module(id_module);


--
-- Name: method fk_method_class; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.method
    ADD CONSTRAINT fk_method_class FOREIGN KEY (id_class) REFERENCES public.class(id_class);


--
-- Name: option fk_option_menu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.option
    ADD CONSTRAINT fk_option_menu FOREIGN KEY (id_menu) REFERENCES public.menu(id_menu);


--
-- Name: profile_method fk_profile_method_method; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_method
    ADD CONSTRAINT fk_profile_method_method FOREIGN KEY (id_method) REFERENCES public.method(id_method);


--
-- Name: profile_method fk_profile_method_profile; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_method
    ADD CONSTRAINT fk_profile_method_profile FOREIGN KEY (id_profile) REFERENCES public.profile(id_profile);


--
-- Name: profile_module fk_profile_module_module; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_module
    ADD CONSTRAINT fk_profile_module_module FOREIGN KEY (id_module) REFERENCES public.module(id_module);


--
-- Name: profile_module fk_profile_module_profile; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_module
    ADD CONSTRAINT fk_profile_module_profile FOREIGN KEY (id_profile) REFERENCES public.profile(id_profile);


--
-- Name: profile_option fk_profile_option_option; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_option
    ADD CONSTRAINT fk_profile_option_option FOREIGN KEY (id_option) REFERENCES public.option(id_option);


--
-- Name: profile_option fk_profile_option_profile; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_option
    ADD CONSTRAINT fk_profile_option_profile FOREIGN KEY (id_profile) REFERENCES public.profile(id_profile);


--
-- Name: user fk_user_person; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT fk_user_person FOREIGN KEY (id_person) REFERENCES public.person(id_person);


--
-- Name: user_profile fk_user_profile_profile; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT fk_user_profile_profile FOREIGN KEY (id_profile) REFERENCES public.profile(id_profile);


--
-- Name: user_profile fk_user_profile_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT fk_user_profile_user FOREIGN KEY (id_user) REFERENCES public."user"(id_user);


--
-- PostgreSQL database dump complete
--

