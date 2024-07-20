--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

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
-- Name: tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tasks (
    task_id integer NOT NULL,
    task_desc text NOT NULL,
    obj_id integer NOT NULL,
    start_date date,
    deadline date,
    task_name character varying(100) NOT NULL
);


ALTER TABLE public.tasks OWNER TO postgres;

--
-- Name: actividad_id_actividad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actividad_id_actividad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.actividad_id_actividad_seq OWNER TO postgres;

--
-- Name: actividad_id_actividad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.actividad_id_actividad_seq OWNED BY public.tasks.task_id;


--
-- Name: actividad_id_objetivo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actividad_id_objetivo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.actividad_id_objetivo_seq OWNER TO postgres;

--
-- Name: actividad_id_objetivo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.actividad_id_objetivo_seq OWNED BY public.tasks.obj_id;


--
-- Name: assignments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assignments (
    assignment_id integer NOT NULL,
    task_id integer NOT NULL,
    member_id integer NOT NULL
);


ALTER TABLE public.assignments OWNER TO postgres;

--
-- Name: asignacion_id_actividad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.asignacion_id_actividad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.asignacion_id_actividad_seq OWNER TO postgres;

--
-- Name: asignacion_id_actividad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asignacion_id_actividad_seq OWNED BY public.assignments.task_id;


--
-- Name: asignacion_id_asignacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.asignacion_id_asignacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.asignacion_id_asignacion_seq OWNER TO postgres;

--
-- Name: asignacion_id_asignacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asignacion_id_asignacion_seq OWNED BY public.assignments.assignment_id;


--
-- Name: asignacion_id_miembro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.asignacion_id_miembro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.asignacion_id_miembro_seq OWNER TO postgres;

--
-- Name: asignacion_id_miembro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asignacion_id_miembro_seq OWNED BY public.assignments.member_id;


--
-- Name: progress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.progress (
    progress_id integer NOT NULL,
    assignment_id integer NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.progress OWNER TO postgres;

--
-- Name: avance_id_asignacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.avance_id_asignacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.avance_id_asignacion_seq OWNER TO postgres;

--
-- Name: avance_id_asignacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.avance_id_asignacion_seq OWNED BY public.progress.assignment_id;


--
-- Name: avance_id_avance_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.avance_id_avance_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.avance_id_avance_seq OWNER TO postgres;

--
-- Name: avance_id_avance_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.avance_id_avance_seq OWNED BY public.progress.progress_id;


--
-- Name: classes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classes (
    class_id integer NOT NULL,
    classname character varying(20) NOT NULL,
    module_id integer NOT NULL
);


ALTER TABLE public.classes OWNER TO postgres;

--
-- Name: clase_id_clase_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clase_id_clase_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clase_id_clase_seq OWNER TO postgres;

--
-- Name: clase_id_clase_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clase_id_clase_seq OWNED BY public.classes.class_id;


--
-- Name: clase_id_modulo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clase_id_modulo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clase_id_modulo_seq OWNER TO postgres;

--
-- Name: clase_id_modulo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clase_id_modulo_seq OWNED BY public.classes.module_id;


--
-- Name: submit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.submit (
    submit_id integer NOT NULL,
    deadline date NOT NULL,
    task_id integer NOT NULL,
    submit_type_id integer NOT NULL
);


ALTER TABLE public.submit OWNER TO postgres;

--
-- Name: entregable_id_actividad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entregable_id_actividad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.entregable_id_actividad_seq OWNER TO postgres;

--
-- Name: entregable_id_actividad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entregable_id_actividad_seq OWNED BY public.submit.task_id;


--
-- Name: entregable_id_entregable_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entregable_id_entregable_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.entregable_id_entregable_seq OWNER TO postgres;

--
-- Name: entregable_id_entregable_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entregable_id_entregable_seq OWNED BY public.submit.submit_id;


--
-- Name: entregable_id_tipo_entregable_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entregable_id_tipo_entregable_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.entregable_id_tipo_entregable_seq OWNER TO postgres;

--
-- Name: entregable_id_tipo_entregable_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entregable_id_tipo_entregable_seq OWNED BY public.submit.submit_type_id;


--
-- Name: states; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.states (
    state_id integer NOT NULL,
    state_desc character varying(20) NOT NULL
);


ALTER TABLE public.states OWNER TO postgres;

--
-- Name: estado_id_estado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estado_id_estado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estado_id_estado_seq OWNER TO postgres;

--
-- Name: estado_id_estado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estado_id_estado_seq OWNED BY public.states.state_id;


--
-- Name: member; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.member (
    member_id integer NOT NULL,
    person_id integer NOT NULL,
    profile_id integer NOT NULL,
    project_id integer NOT NULL
);


ALTER TABLE public.member OWNER TO postgres;

--
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu (
    menu_id integer NOT NULL,
    module_id integer NOT NULL
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- Name: menu_id_menu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_id_menu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_id_menu_seq OWNER TO postgres;

--
-- Name: menu_id_menu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_id_menu_seq OWNED BY public.menu.menu_id;


--
-- Name: menu_id_modulo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_id_modulo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_id_modulo_seq OWNER TO postgres;

--
-- Name: menu_id_modulo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_id_modulo_seq OWNED BY public.menu.module_id;


--
-- Name: methods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.methods (
    method_id integer NOT NULL,
    method_name character varying(50) NOT NULL,
    class_id integer NOT NULL
);


ALTER TABLE public.methods OWNER TO postgres;

--
-- Name: profile_methods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile_methods (
    method_id integer NOT NULL,
    profile_id integer NOT NULL,
    profile_methods_id integer NOT NULL
);


ALTER TABLE public.profile_methods OWNER TO postgres;

--
-- Name: metodo-perfil_id_metodo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."metodo-perfil_id_metodo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."metodo-perfil_id_metodo_seq" OWNER TO postgres;

--
-- Name: metodo-perfil_id_metodo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."metodo-perfil_id_metodo_seq" OWNED BY public.profile_methods.method_id;


--
-- Name: metodo-perfil_id_perfil_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."metodo-perfil_id_perfil_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."metodo-perfil_id_perfil_seq" OWNER TO postgres;

--
-- Name: metodo-perfil_id_perfil_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."metodo-perfil_id_perfil_seq" OWNED BY public.profile_methods.profile_id;


--
-- Name: metodo_id_clase_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metodo_id_clase_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.metodo_id_clase_seq OWNER TO postgres;

--
-- Name: metodo_id_clase_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metodo_id_clase_seq OWNED BY public.methods.class_id;


--
-- Name: metodo_id_metodo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metodo_id_metodo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.metodo_id_metodo_seq OWNER TO postgres;

--
-- Name: metodo_id_metodo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metodo_id_metodo_seq OWNED BY public.methods.method_id;


--
-- Name: metodo_perfil_profile_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metodo_perfil_profile_methods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.metodo_perfil_profile_methods_id_seq OWNER TO postgres;

--
-- Name: metodo_perfil_profile_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metodo_perfil_profile_methods_id_seq OWNED BY public.profile_methods.profile_methods_id;


--
-- Name: miembro_id_miembro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.miembro_id_miembro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.miembro_id_miembro_seq OWNER TO postgres;

--
-- Name: miembro_id_miembro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.miembro_id_miembro_seq OWNED BY public.member.member_id;


--
-- Name: miembro_id_perfil_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.miembro_id_perfil_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.miembro_id_perfil_seq OWNER TO postgres;

--
-- Name: miembro_id_perfil_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.miembro_id_perfil_seq OWNED BY public.member.profile_id;


--
-- Name: miembro_id_persona_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.miembro_id_persona_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.miembro_id_persona_seq OWNER TO postgres;

--
-- Name: miembro_id_persona_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.miembro_id_persona_seq OWNED BY public.member.person_id;


--
-- Name: miembro_id_proyecto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.miembro_id_proyecto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.miembro_id_proyecto_seq OWNER TO postgres;

--
-- Name: miembro_id_proyecto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.miembro_id_proyecto_seq OWNED BY public.member.project_id;


--
-- Name: module_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.module_profile (
    module_profile_id integer NOT NULL,
    module_id integer NOT NULL,
    profile_id integer NOT NULL
);


ALTER TABLE public.module_profile OWNER TO postgres;

--
-- Name: modules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modules (
    module_id integer NOT NULL,
    module_desc character varying(70) NOT NULL
);


ALTER TABLE public.modules OWNER TO postgres;

--
-- Name: modulo_id_modulo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.modulo_id_modulo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.modulo_id_modulo_seq OWNER TO postgres;

--
-- Name: modulo_id_modulo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modulo_id_modulo_seq OWNED BY public.modules.module_id;


--
-- Name: modulo_perfil_id_modulo_perfil_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.modulo_perfil_id_modulo_perfil_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.modulo_perfil_id_modulo_perfil_seq OWNER TO postgres;

--
-- Name: modulo_perfil_id_modulo_perfil_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modulo_perfil_id_modulo_perfil_seq OWNED BY public.module_profile.module_profile_id;


--
-- Name: modulo_perfil_id_modulo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.modulo_perfil_id_modulo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.modulo_perfil_id_modulo_seq OWNER TO postgres;

--
-- Name: modulo_perfil_id_modulo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modulo_perfil_id_modulo_seq OWNED BY public.module_profile.module_id;


--
-- Name: modulo_perfil_id_perfil_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.modulo_perfil_id_perfil_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.modulo_perfil_id_perfil_seq OWNER TO postgres;

--
-- Name: modulo_perfil_id_perfil_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modulo_perfil_id_perfil_seq OWNED BY public.module_profile.profile_id;


--
-- Name: objective; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.objective (
    objective_id integer NOT NULL,
    objective_desc text NOT NULL,
    project_id integer NOT NULL,
    deadline date,
    objective_name character varying(100) NOT NULL
);


ALTER TABLE public.objective OWNER TO postgres;

--
-- Name: objetivo_id_objetivo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.objetivo_id_objetivo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.objetivo_id_objetivo_seq OWNER TO postgres;

--
-- Name: objetivo_id_objetivo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.objetivo_id_objetivo_seq OWNED BY public.objective.objective_id;


--
-- Name: objetivo_id_proyecto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.objetivo_id_proyecto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.objetivo_id_proyecto_seq OWNER TO postgres;

--
-- Name: objetivo_id_proyecto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.objetivo_id_proyecto_seq OWNED BY public.objective.project_id;


--
-- Name: option_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.option_profile (
    option_id integer NOT NULL,
    profile_id integer NOT NULL,
    option_profile_id integer NOT NULL
);


ALTER TABLE public.option_profile OWNER TO postgres;

--
-- Name: opcion-perfil_id_opcion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."opcion-perfil_id_opcion_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."opcion-perfil_id_opcion_seq" OWNER TO postgres;

--
-- Name: opcion-perfil_id_opcion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."opcion-perfil_id_opcion_seq" OWNED BY public.option_profile.option_id;


--
-- Name: opcion-perfil_id_perfil_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."opcion-perfil_id_perfil_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."opcion-perfil_id_perfil_seq" OWNER TO postgres;

--
-- Name: opcion-perfil_id_perfil_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."opcion-perfil_id_perfil_seq" OWNED BY public.option_profile.profile_id;


--
-- Name: opcion-perfil_option_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."opcion-perfil_option_profile_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."opcion-perfil_option_profile_id_seq" OWNER TO postgres;

--
-- Name: opcion-perfil_option_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."opcion-perfil_option_profile_id_seq" OWNED BY public.option_profile.option_profile_id;


--
-- Name: options; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.options (
    option_id integer NOT NULL,
    "desc" character varying(30) NOT NULL
);


ALTER TABLE public.options OWNER TO postgres;

--
-- Name: opcion_id_opcion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.opcion_id_opcion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.opcion_id_opcion_seq OWNER TO postgres;

--
-- Name: opcion_id_opcion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.opcion_id_opcion_seq OWNED BY public.options.option_id;


--
-- Name: profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile (
    profile_id integer NOT NULL,
    profile_desc character varying(70) NOT NULL,
    profile_type_id integer NOT NULL
);


ALTER TABLE public.profile OWNER TO postgres;

--
-- Name: perfil_id_perfil_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.perfil_id_perfil_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.perfil_id_perfil_seq OWNER TO postgres;

--
-- Name: perfil_id_perfil_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.perfil_id_perfil_seq OWNED BY public.profile.profile_id;


--
-- Name: perfil_id_tipo_perfil_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.perfil_id_tipo_perfil_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.perfil_id_tipo_perfil_seq OWNER TO postgres;

--
-- Name: perfil_id_tipo_perfil_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.perfil_id_tipo_perfil_seq OWNED BY public.profile.profile_type_id;


--
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    person_id integer NOT NULL,
    name character varying(40) NOT NULL,
    lastname character varying(50) NOT NULL,
    ident character varying(19) NOT NULL
);


ALTER TABLE public.person OWNER TO postgres;

--
-- Name: persona_id_persona_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.persona_id_persona_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.persona_id_persona_seq OWNER TO postgres;

--
-- Name: persona_id_persona_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.persona_id_persona_seq OWNED BY public.person.person_id;


--
-- Name: task-predecessor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."task-predecessor" (
    predecessor_id integer NOT NULL,
    task_id integer NOT NULL
);


ALTER TABLE public."task-predecessor" OWNER TO postgres;

--
-- Name: prelacion-actividad_id_actividad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."prelacion-actividad_id_actividad_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."prelacion-actividad_id_actividad_seq" OWNER TO postgres;

--
-- Name: prelacion-actividad_id_actividad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."prelacion-actividad_id_actividad_seq" OWNED BY public."task-predecessor".task_id;


--
-- Name: prelacion-actividad_id_prelacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."prelacion-actividad_id_prelacion_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."prelacion-actividad_id_prelacion_seq" OWNER TO postgres;

--
-- Name: prelacion-actividad_id_prelacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."prelacion-actividad_id_prelacion_seq" OWNED BY public."task-predecessor".predecessor_id;


--
-- Name: profile_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile_type (
    profile_type_id integer NOT NULL,
    type_desc character varying(50) NOT NULL
);


ALTER TABLE public.profile_type OWNER TO postgres;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    project_id integer NOT NULL,
    project_name character varying(60) NOT NULL,
    type text NOT NULL,
    state_id integer NOT NULL,
    start_date date,
    end_date date
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- Name: proyecto_id_estado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.proyecto_id_estado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.proyecto_id_estado_seq OWNER TO postgres;

--
-- Name: proyecto_id_estado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proyecto_id_estado_seq OWNED BY public.projects.state_id;


--
-- Name: proyecto_id_proyecto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.proyecto_id_proyecto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.proyecto_id_proyecto_seq OWNER TO postgres;

--
-- Name: proyecto_id_proyecto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proyecto_id_proyecto_seq OWNED BY public.projects.project_id;


--
-- Name: submit_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.submit_type (
    submit_type_id integer NOT NULL,
    submit_type_desc character varying(40)
);


ALTER TABLE public.submit_type OWNER TO postgres;

--
-- Name: tipo_entregable_id_tipo_entregable_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_entregable_id_tipo_entregable_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipo_entregable_id_tipo_entregable_seq OWNER TO postgres;

--
-- Name: tipo_entregable_id_tipo_entregable_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_entregable_id_tipo_entregable_seq OWNED BY public.submit_type.submit_type_id;


--
-- Name: tipo_perfil_id_tipo_perfil_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_perfil_id_tipo_perfil_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipo_perfil_id_tipo_perfil_seq OWNER TO postgres;

--
-- Name: tipo_perfil_id_tipo_perfil_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_perfil_id_tipo_perfil_seq OWNED BY public.profile_type.profile_type_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    users_id integer NOT NULL,
    password character varying(150) NOT NULL,
    username character varying(30) NOT NULL,
    person_id integer NOT NULL,
    resetpasswordtoken character varying(150),
    resetpasswordexpires bigint,
    email character varying(50) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_profile (
    user_id integer NOT NULL,
    profile_id integer NOT NULL,
    users_profile_id integer NOT NULL
);


ALTER TABLE public.users_profile OWNER TO postgres;

--
-- Name: usuario-perfil_id_perfil_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."usuario-perfil_id_perfil_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."usuario-perfil_id_perfil_seq" OWNER TO postgres;

--
-- Name: usuario-perfil_id_perfil_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."usuario-perfil_id_perfil_seq" OWNED BY public.users_profile.profile_id;


--
-- Name: usuario-perfil_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."usuario-perfil_id_usuario_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."usuario-perfil_id_usuario_seq" OWNER TO postgres;

--
-- Name: usuario-perfil_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."usuario-perfil_id_usuario_seq" OWNED BY public.users_profile.user_id;


--
-- Name: usuario_id_persona_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_persona_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_id_persona_seq OWNER TO postgres;

--
-- Name: usuario_id_persona_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_persona_seq OWNED BY public.users.person_id;


--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_id_usuario_seq OWNER TO postgres;

--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.users.users_id;


--
-- Name: usuario_perfil_users_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_perfil_users_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_perfil_users_profile_id_seq OWNER TO postgres;

--
-- Name: usuario_perfil_users_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_perfil_users_profile_id_seq OWNED BY public.users_profile.users_profile_id;


--
-- Name: assignments assignment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments ALTER COLUMN assignment_id SET DEFAULT nextval('public.asignacion_id_asignacion_seq'::regclass);


--
-- Name: assignments task_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments ALTER COLUMN task_id SET DEFAULT nextval('public.asignacion_id_actividad_seq'::regclass);


--
-- Name: assignments member_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments ALTER COLUMN member_id SET DEFAULT nextval('public.asignacion_id_miembro_seq'::regclass);


--
-- Name: classes class_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classes ALTER COLUMN class_id SET DEFAULT nextval('public.clase_id_clase_seq'::regclass);


--
-- Name: classes module_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classes ALTER COLUMN module_id SET DEFAULT nextval('public.clase_id_modulo_seq'::regclass);


--
-- Name: member member_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member ALTER COLUMN member_id SET DEFAULT nextval('public.miembro_id_miembro_seq'::regclass);


--
-- Name: member person_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member ALTER COLUMN person_id SET DEFAULT nextval('public.miembro_id_persona_seq'::regclass);


--
-- Name: member profile_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member ALTER COLUMN profile_id SET DEFAULT nextval('public.miembro_id_perfil_seq'::regclass);


--
-- Name: member project_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member ALTER COLUMN project_id SET DEFAULT nextval('public.miembro_id_proyecto_seq'::regclass);


--
-- Name: menu menu_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu ALTER COLUMN menu_id SET DEFAULT nextval('public.menu_id_menu_seq'::regclass);


--
-- Name: menu module_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu ALTER COLUMN module_id SET DEFAULT nextval('public.menu_id_modulo_seq'::regclass);


--
-- Name: methods method_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.methods ALTER COLUMN method_id SET DEFAULT nextval('public.metodo_id_metodo_seq'::regclass);


--
-- Name: methods class_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.methods ALTER COLUMN class_id SET DEFAULT nextval('public.metodo_id_clase_seq'::regclass);


--
-- Name: module_profile module_profile_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.module_profile ALTER COLUMN module_profile_id SET DEFAULT nextval('public.modulo_perfil_id_modulo_perfil_seq'::regclass);


--
-- Name: module_profile module_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.module_profile ALTER COLUMN module_id SET DEFAULT nextval('public.modulo_perfil_id_modulo_seq'::regclass);


--
-- Name: module_profile profile_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.module_profile ALTER COLUMN profile_id SET DEFAULT nextval('public.modulo_perfil_id_perfil_seq'::regclass);


--
-- Name: modules module_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modules ALTER COLUMN module_id SET DEFAULT nextval('public.modulo_id_modulo_seq'::regclass);


--
-- Name: objective objective_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.objective ALTER COLUMN objective_id SET DEFAULT nextval('public.objetivo_id_objetivo_seq'::regclass);


--
-- Name: objective project_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.objective ALTER COLUMN project_id SET DEFAULT nextval('public.objetivo_id_proyecto_seq'::regclass);


--
-- Name: option_profile option_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.option_profile ALTER COLUMN option_id SET DEFAULT nextval('public."opcion-perfil_id_opcion_seq"'::regclass);


--
-- Name: option_profile profile_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.option_profile ALTER COLUMN profile_id SET DEFAULT nextval('public."opcion-perfil_id_perfil_seq"'::regclass);


--
-- Name: option_profile option_profile_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.option_profile ALTER COLUMN option_profile_id SET DEFAULT nextval('public."opcion-perfil_option_profile_id_seq"'::regclass);


--
-- Name: options option_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.options ALTER COLUMN option_id SET DEFAULT nextval('public.opcion_id_opcion_seq'::regclass);


--
-- Name: person person_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN person_id SET DEFAULT nextval('public.persona_id_persona_seq'::regclass);


--
-- Name: profile profile_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile ALTER COLUMN profile_id SET DEFAULT nextval('public.perfil_id_perfil_seq'::regclass);


--
-- Name: profile profile_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile ALTER COLUMN profile_type_id SET DEFAULT nextval('public.perfil_id_tipo_perfil_seq'::regclass);


--
-- Name: profile_methods method_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_methods ALTER COLUMN method_id SET DEFAULT nextval('public."metodo-perfil_id_metodo_seq"'::regclass);


--
-- Name: profile_methods profile_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_methods ALTER COLUMN profile_id SET DEFAULT nextval('public."metodo-perfil_id_perfil_seq"'::regclass);


--
-- Name: profile_methods profile_methods_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_methods ALTER COLUMN profile_methods_id SET DEFAULT nextval('public.metodo_perfil_profile_methods_id_seq'::regclass);


--
-- Name: profile_type profile_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_type ALTER COLUMN profile_type_id SET DEFAULT nextval('public.tipo_perfil_id_tipo_perfil_seq'::regclass);


--
-- Name: progress progress_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.progress ALTER COLUMN progress_id SET DEFAULT nextval('public.avance_id_avance_seq'::regclass);


--
-- Name: progress assignment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.progress ALTER COLUMN assignment_id SET DEFAULT nextval('public.avance_id_asignacion_seq'::regclass);


--
-- Name: projects project_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects ALTER COLUMN project_id SET DEFAULT nextval('public.proyecto_id_proyecto_seq'::regclass);


--
-- Name: projects state_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects ALTER COLUMN state_id SET DEFAULT nextval('public.proyecto_id_estado_seq'::regclass);


--
-- Name: states state_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states ALTER COLUMN state_id SET DEFAULT nextval('public.estado_id_estado_seq'::regclass);


--
-- Name: submit submit_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.submit ALTER COLUMN submit_id SET DEFAULT nextval('public.entregable_id_entregable_seq'::regclass);


--
-- Name: submit task_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.submit ALTER COLUMN task_id SET DEFAULT nextval('public.entregable_id_actividad_seq'::regclass);


--
-- Name: submit submit_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.submit ALTER COLUMN submit_type_id SET DEFAULT nextval('public.entregable_id_tipo_entregable_seq'::regclass);


--
-- Name: submit_type submit_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.submit_type ALTER COLUMN submit_type_id SET DEFAULT nextval('public.tipo_entregable_id_tipo_entregable_seq'::regclass);


--
-- Name: task-predecessor predecessor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."task-predecessor" ALTER COLUMN predecessor_id SET DEFAULT nextval('public."prelacion-actividad_id_prelacion_seq"'::regclass);


--
-- Name: task-predecessor task_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."task-predecessor" ALTER COLUMN task_id SET DEFAULT nextval('public."prelacion-actividad_id_actividad_seq"'::regclass);


--
-- Name: tasks task_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks ALTER COLUMN task_id SET DEFAULT nextval('public.actividad_id_actividad_seq'::regclass);


--
-- Name: tasks obj_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks ALTER COLUMN obj_id SET DEFAULT nextval('public.actividad_id_objetivo_seq'::regclass);


--
-- Name: users users_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN users_id SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);


--
-- Name: users person_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN person_id SET DEFAULT nextval('public.usuario_id_persona_seq'::regclass);


--
-- Name: users_profile user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profile ALTER COLUMN user_id SET DEFAULT nextval('public."usuario-perfil_id_usuario_seq"'::regclass);


--
-- Name: users_profile profile_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profile ALTER COLUMN profile_id SET DEFAULT nextval('public."usuario-perfil_id_perfil_seq"'::regclass);


--
-- Name: users_profile users_profile_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profile ALTER COLUMN users_profile_id SET DEFAULT nextval('public.usuario_perfil_users_profile_id_seq'::regclass);


--
-- Data for Name: assignments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assignments (assignment_id, task_id, member_id) FROM stdin;
\.


--
-- Data for Name: classes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classes (class_id, classname, module_id) FROM stdin;
1	Project	1
2	Objectives	1
3	Members	1
4	Task	1
5	Objectives	1
6	Members	1
7	Task	1
8	Objectives	1
9	Members	1
10	Task	1
11	Objectives	1
12	Members	1
13	Task	1
14	Objectives	1
15	Members	1
16	Task	1
17	Objectives	1
18	Members	1
19	Task	1
\.


--
-- Data for Name: member; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.member (member_id, person_id, profile_id, project_id) FROM stdin;
4	5	9	10
5	6	11	10
7	7	7	12
8	5	9	12
9	6	11	12
12	5	7	15
13	6	11	15
14	7	12	15
\.


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu (menu_id, module_id) FROM stdin;
\.


--
-- Data for Name: methods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.methods (method_id, method_name, class_id) FROM stdin;
1	createProject	1
2	updateProject	1
3	deleteProject	1
4	getProjectsbyPersone	1
5	createObjective	2
6	getObjectives	2
7	deleteObjective	2
8	updateObjective	2
9	newMember	3
10	getMembers	3
11	deleteMembers	3
12	createTask	4
13	getTask	4
14	deleteTask	4
15	updateTask	4
16	sendAdvance	4
\.


--
-- Data for Name: module_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.module_profile (module_profile_id, module_id, profile_id) FROM stdin;
6	1	7
7	1	8
8	1	9
9	1	10
10	1	11
11	1	12
12	1	13
\.


--
-- Data for Name: modules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.modules (module_id, module_desc) FROM stdin;
1	Proyecto
2	Administracion
\.


--
-- Data for Name: objective; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.objective (objective_id, objective_desc, project_id, deadline, objective_name) FROM stdin;
3	Descripcion de parametros necesarios	12	2024-07-23	Parametrizacion
4	Realizacion de la leche deslactosada... si	12	2024-08-10	Produccion del producto
\.


--
-- Data for Name: option_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.option_profile (option_id, profile_id, option_profile_id) FROM stdin;
\.


--
-- Data for Name: options; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.options (option_id, "desc") FROM stdin;
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.person (person_id, name, lastname, ident) FROM stdin;
5	Marlon	Urdaneta	30763460
6	Merlon	Perez	12345567
7	Alberto	Rodriguez	23456987
\.


--
-- Data for Name: profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile (profile_id, profile_desc, profile_type_id) FROM stdin;
7	Project Manager	6
8	Desarrollador	6
9	Arquitecto Software	6
10	Programador	6
11	Documentista	6
12	Analista	6
13	Recurso	6
16	Basico	6
\.


--
-- Data for Name: profile_methods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile_methods (method_id, profile_id, profile_methods_id) FROM stdin;
1	7	10
2	7	11
3	7	12
4	7	13
5	7	14
6	7	15
7	7	16
8	7	17
9	7	18
10	7	19
11	7	20
12	7	21
13	7	22
14	7	23
15	7	24
16	7	25
1	8	26
2	8	27
6	8	28
10	8	29
12	8	30
13	8	31
14	8	32
15	8	33
16	8	34
1	9	35
2	9	36
5	9	37
6	9	38
7	9	39
8	9	40
10	9	41
12	9	42
13	9	43
14	9	44
15	9	45
16	9	46
1	10	47
2	10	48
6	10	49
10	10	50
14	10	51
16	10	52
1	11	53
2	11	54
6	11	55
10	11	56
14	11	57
16	11	58
1	12	59
2	12	60
6	12	61
7	12	62
10	12	63
12	12	64
13	12	65
14	12	66
15	12	67
16	12	68
4	16	70
\.


--
-- Data for Name: profile_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile_type (profile_type_id, type_desc) FROM stdin;
5	Sistema
6	Proyecto
\.


--
-- Data for Name: progress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.progress (progress_id, assignment_id, quantity) FROM stdin;
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (project_id, project_name, type, state_id, start_date, end_date) FROM stdin;
7	Ing. Software	Planeacion	1	2024-04-28	2024-09-28
8	Paralelepipedo	Geometria	1	2024-01-01	2024-02-01
9	Pastorales	Ganaderia	1	2024-01-01	2024-02-01
6	Cachapas	Tecnologia	2	2024-06-20	2024-08-20
10	Vacas II	Ganaderia	1	2024-01-01	2024-02-01
11	Vacas II	Ganaderia	1	2024-01-01	2024-02-01
12	Vacas II	Ganaderia	1	2024-01-01	2024-02-01
13	Bienestar	Psicologia	1	2024-01-01	2024-02-01
14	Bienestar	Psicologia	1	2024-01-01	2024-02-01
15	Bienestar	Psicologia	1	2024-01-01	2024-02-01
\.


--
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.states (state_id, state_desc) FROM stdin;
1	Por empezar
2	En Progreso
3	Finalizado
\.


--
-- Data for Name: submit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.submit (submit_id, deadline, task_id, submit_type_id) FROM stdin;
\.


--
-- Data for Name: submit_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.submit_type (submit_type_id, submit_type_desc) FROM stdin;
\.


--
-- Data for Name: task-predecessor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."task-predecessor" (predecessor_id, task_id) FROM stdin;
\.


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tasks (task_id, task_desc, obj_id, start_date, deadline, task_name) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (users_id, password, username, person_id, resetpasswordtoken, resetpasswordexpires, email) FROM stdin;
2	$2a$10$qQNqBJqZx4BJQqeTDLNEieZKGnUflpxht5.o8DwnUBw1r6UvmI1iK	Merlon	6	\N	\N	Mgabrielur@gmail.com
3	$2a$10$uYVpy4Qaf7.gvkF4m/UrGuKf5IPinontt.mXUmc6MswjmxABqh4AS	Albert	7	\N	\N	AlbertoJ@gmail.com
1	$2a$10$BtxtgRPR2fUiXlPEGjhihePqC/8wVwp1iU6368SUvA0uW1WcXwRcS	ILevizzz	5	\N	\N	MGUR2025pro@gmail.com
\.


--
-- Data for Name: users_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_profile (user_id, profile_id, users_profile_id) FROM stdin;
\.


--
-- Name: actividad_id_actividad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actividad_id_actividad_seq', 1, false);


--
-- Name: actividad_id_objetivo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actividad_id_objetivo_seq', 1, false);


--
-- Name: asignacion_id_actividad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asignacion_id_actividad_seq', 1, false);


--
-- Name: asignacion_id_asignacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asignacion_id_asignacion_seq', 1, false);


--
-- Name: asignacion_id_miembro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asignacion_id_miembro_seq', 1, false);


--
-- Name: avance_id_asignacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.avance_id_asignacion_seq', 1, false);


--
-- Name: avance_id_avance_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.avance_id_avance_seq', 1, false);


--
-- Name: clase_id_clase_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clase_id_clase_seq', 19, true);


--
-- Name: clase_id_modulo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clase_id_modulo_seq', 1, false);


--
-- Name: entregable_id_actividad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entregable_id_actividad_seq', 1, false);


--
-- Name: entregable_id_entregable_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entregable_id_entregable_seq', 1, false);


--
-- Name: entregable_id_tipo_entregable_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entregable_id_tipo_entregable_seq', 1, false);


--
-- Name: estado_id_estado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estado_id_estado_seq', 3, true);


--
-- Name: menu_id_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_id_menu_seq', 1, false);


--
-- Name: menu_id_modulo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_id_modulo_seq', 1, false);


--
-- Name: metodo-perfil_id_metodo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."metodo-perfil_id_metodo_seq"', 1, false);


--
-- Name: metodo-perfil_id_perfil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."metodo-perfil_id_perfil_seq"', 1, false);


--
-- Name: metodo_id_clase_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metodo_id_clase_seq', 1, false);


--
-- Name: metodo_id_metodo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metodo_id_metodo_seq', 16, true);


--
-- Name: metodo_perfil_profile_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metodo_perfil_profile_methods_id_seq', 70, true);


--
-- Name: miembro_id_miembro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.miembro_id_miembro_seq', 14, true);


--
-- Name: miembro_id_perfil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.miembro_id_perfil_seq', 1, false);


--
-- Name: miembro_id_persona_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.miembro_id_persona_seq', 1, false);


--
-- Name: miembro_id_proyecto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.miembro_id_proyecto_seq', 1, false);


--
-- Name: modulo_id_modulo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modulo_id_modulo_seq', 2, true);


--
-- Name: modulo_perfil_id_modulo_perfil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modulo_perfil_id_modulo_perfil_seq', 12, true);


--
-- Name: modulo_perfil_id_modulo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modulo_perfil_id_modulo_seq', 1, false);


--
-- Name: modulo_perfil_id_perfil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modulo_perfil_id_perfil_seq', 1, false);


--
-- Name: objetivo_id_objetivo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.objetivo_id_objetivo_seq', 4, true);


--
-- Name: objetivo_id_proyecto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.objetivo_id_proyecto_seq', 1, false);


--
-- Name: opcion-perfil_id_opcion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."opcion-perfil_id_opcion_seq"', 1, false);


--
-- Name: opcion-perfil_id_perfil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."opcion-perfil_id_perfil_seq"', 1, false);


--
-- Name: opcion-perfil_option_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."opcion-perfil_option_profile_id_seq"', 1, false);


--
-- Name: opcion_id_opcion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.opcion_id_opcion_seq', 1, false);


--
-- Name: perfil_id_perfil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.perfil_id_perfil_seq', 16, true);


--
-- Name: perfil_id_tipo_perfil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.perfil_id_tipo_perfil_seq', 1, false);


--
-- Name: persona_id_persona_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.persona_id_persona_seq', 7, true);


--
-- Name: prelacion-actividad_id_actividad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."prelacion-actividad_id_actividad_seq"', 1, false);


--
-- Name: prelacion-actividad_id_prelacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."prelacion-actividad_id_prelacion_seq"', 1, false);


--
-- Name: proyecto_id_estado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proyecto_id_estado_seq', 1, false);


--
-- Name: proyecto_id_proyecto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proyecto_id_proyecto_seq', 15, true);


--
-- Name: tipo_entregable_id_tipo_entregable_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_entregable_id_tipo_entregable_seq', 1, false);


--
-- Name: tipo_perfil_id_tipo_perfil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_perfil_id_tipo_perfil_seq', 6, true);


--
-- Name: usuario-perfil_id_perfil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."usuario-perfil_id_perfil_seq"', 1, false);


--
-- Name: usuario-perfil_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."usuario-perfil_id_usuario_seq"', 1, false);


--
-- Name: usuario_id_persona_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_persona_seq', 1, false);


--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 3, true);


--
-- Name: usuario_perfil_users_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_perfil_users_profile_id_seq', 2, true);


--
-- Name: person persona_ident_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT persona_ident_key UNIQUE (ident);


--
-- Name: tasks pk_actividad; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT pk_actividad PRIMARY KEY (task_id);


--
-- Name: assignments pk_asignacion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT pk_asignacion PRIMARY KEY (assignment_id);


--
-- Name: progress pk_avance; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.progress
    ADD CONSTRAINT pk_avance PRIMARY KEY (progress_id);


--
-- Name: classes pk_clase; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classes
    ADD CONSTRAINT pk_clase PRIMARY KEY (class_id);


--
-- Name: submit pk_entregable; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.submit
    ADD CONSTRAINT pk_entregable PRIMARY KEY (submit_id);


--
-- Name: states pk_estado; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT pk_estado PRIMARY KEY (state_id);


--
-- Name: menu pk_menu; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT pk_menu PRIMARY KEY (menu_id);


--
-- Name: methods pk_metodo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.methods
    ADD CONSTRAINT pk_metodo PRIMARY KEY (method_id);


--
-- Name: profile_methods pk_metodo_perfil; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_methods
    ADD CONSTRAINT pk_metodo_perfil PRIMARY KEY (profile_methods_id);


--
-- Name: member pk_miembro; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member
    ADD CONSTRAINT pk_miembro PRIMARY KEY (member_id);


--
-- Name: modules pk_modulo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modules
    ADD CONSTRAINT pk_modulo PRIMARY KEY (module_id);


--
-- Name: module_profile pk_modulo_perfil; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.module_profile
    ADD CONSTRAINT pk_modulo_perfil PRIMARY KEY (module_profile_id);


--
-- Name: objective pk_objetivo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.objective
    ADD CONSTRAINT pk_objetivo PRIMARY KEY (objective_id);


--
-- Name: options pk_opcion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.options
    ADD CONSTRAINT pk_opcion PRIMARY KEY (option_id);


--
-- Name: option_profile pk_opcion-perfil; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.option_profile
    ADD CONSTRAINT "pk_opcion-perfil" PRIMARY KEY (option_profile_id);


--
-- Name: profile pk_perfil; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT pk_perfil PRIMARY KEY (profile_id);


--
-- Name: person pk_persona; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT pk_persona PRIMARY KEY (person_id);


--
-- Name: projects pk_proyecto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT pk_proyecto PRIMARY KEY (project_id);


--
-- Name: submit_type pk_tipo_entregable; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.submit_type
    ADD CONSTRAINT pk_tipo_entregable PRIMARY KEY (submit_type_id);


--
-- Name: profile_type pk_tipo_perfil; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_type
    ADD CONSTRAINT pk_tipo_perfil PRIMARY KEY (profile_type_id);


--
-- Name: users pk_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT pk_usuario PRIMARY KEY (users_id);


--
-- Name: users_profile pk_usuario_perfil; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profile
    ADD CONSTRAINT pk_usuario_perfil PRIMARY KEY (users_profile_id);


--
-- Name: tasks fk_actividad_objetivo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT fk_actividad_objetivo FOREIGN KEY (obj_id) REFERENCES public.objective(objective_id);


--
-- Name: assignments fk_asignacion_actividad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT fk_asignacion_actividad FOREIGN KEY (task_id) REFERENCES public.tasks(task_id);


--
-- Name: assignments fk_asignacion_miembro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT fk_asignacion_miembro FOREIGN KEY (member_id) REFERENCES public.member(member_id);


--
-- Name: progress fk_avance_asignacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.progress
    ADD CONSTRAINT fk_avance_asignacion FOREIGN KEY (assignment_id) REFERENCES public.assignments(assignment_id);


--
-- Name: classes fk_clase_modulo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classes
    ADD CONSTRAINT fk_clase_modulo FOREIGN KEY (module_id) REFERENCES public.modules(module_id);


--
-- Name: submit fk_entregable_actividad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.submit
    ADD CONSTRAINT fk_entregable_actividad FOREIGN KEY (task_id) REFERENCES public.tasks(task_id);


--
-- Name: submit fk_entregable_tipo_entregable; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.submit
    ADD CONSTRAINT fk_entregable_tipo_entregable FOREIGN KEY (submit_type_id) REFERENCES public.submit_type(submit_type_id);


--
-- Name: menu fk_menu_modulo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT fk_menu_modulo FOREIGN KEY (module_id) REFERENCES public.modules(module_id);


--
-- Name: profile_methods fk_metodo-perfil_metodo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_methods
    ADD CONSTRAINT "fk_metodo-perfil_metodo" FOREIGN KEY (method_id) REFERENCES public.methods(method_id);


--
-- Name: profile_methods fk_metodo-perfil_perfil; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_methods
    ADD CONSTRAINT "fk_metodo-perfil_perfil" FOREIGN KEY (profile_id) REFERENCES public.profile(profile_id);


--
-- Name: methods fk_metodo_clase; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.methods
    ADD CONSTRAINT fk_metodo_clase FOREIGN KEY (class_id) REFERENCES public.classes(class_id);


--
-- Name: member fk_miembro_perfil; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member
    ADD CONSTRAINT fk_miembro_perfil FOREIGN KEY (profile_id) REFERENCES public.profile(profile_id);


--
-- Name: member fk_miembro_persona; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member
    ADD CONSTRAINT fk_miembro_persona FOREIGN KEY (person_id) REFERENCES public.person(person_id);


--
-- Name: member fk_miembro_proyecto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member
    ADD CONSTRAINT fk_miembro_proyecto FOREIGN KEY (project_id) REFERENCES public.projects(project_id);


--
-- Name: module_profile fk_modulo_perfil_modulo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.module_profile
    ADD CONSTRAINT fk_modulo_perfil_modulo FOREIGN KEY (module_id) REFERENCES public.modules(module_id);


--
-- Name: module_profile fk_modulo_perfil_perfil; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.module_profile
    ADD CONSTRAINT fk_modulo_perfil_perfil FOREIGN KEY (profile_id) REFERENCES public.profile(profile_id);


--
-- Name: objective fk_objetivo_proyecto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.objective
    ADD CONSTRAINT fk_objetivo_proyecto FOREIGN KEY (project_id) REFERENCES public.projects(project_id);


--
-- Name: option_profile fk_opcion-perfil_opcion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.option_profile
    ADD CONSTRAINT "fk_opcion-perfil_opcion" FOREIGN KEY (option_id) REFERENCES public.options(option_id);


--
-- Name: option_profile fk_opcion-perfil_perfil; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.option_profile
    ADD CONSTRAINT "fk_opcion-perfil_perfil" FOREIGN KEY (profile_id) REFERENCES public.profile(profile_id);


--
-- Name: profile fk_perfil_tipo_perfil; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT fk_perfil_tipo_perfil FOREIGN KEY (profile_type_id) REFERENCES public.profile_type(profile_type_id);


--
-- Name: task-predecessor fk_prelacion-actividad_actividad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."task-predecessor"
    ADD CONSTRAINT "fk_prelacion-actividad_actividad" FOREIGN KEY (predecessor_id) REFERENCES public.tasks(task_id);


--
-- Name: task-predecessor fk_prelacion-actividad_actividad_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."task-predecessor"
    ADD CONSTRAINT "fk_prelacion-actividad_actividad_0" FOREIGN KEY (task_id) REFERENCES public.tasks(task_id);


--
-- Name: projects fk_proyecto_estado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT fk_proyecto_estado FOREIGN KEY (state_id) REFERENCES public.states(state_id);


--
-- Name: users_profile fk_usuario-perfil_perfil; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profile
    ADD CONSTRAINT "fk_usuario-perfil_perfil" FOREIGN KEY (profile_id) REFERENCES public.profile(profile_id);


--
-- Name: users_profile fk_usuario-perfil_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profile
    ADD CONSTRAINT "fk_usuario-perfil_usuario" FOREIGN KEY (user_id) REFERENCES public.users(users_id);


--
-- Name: users fk_usuario_persona; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_usuario_persona FOREIGN KEY (person_id) REFERENCES public.person(person_id);


--
-- PostgreSQL database dump complete
--

