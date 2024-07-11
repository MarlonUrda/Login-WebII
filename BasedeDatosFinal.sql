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
-- Name: actividad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actividad (
    id_actividad integer NOT NULL,
    desc_actividad text NOT NULL,
    id_objetivo integer NOT NULL
);


ALTER TABLE public.actividad OWNER TO postgres;

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

ALTER SEQUENCE public.actividad_id_actividad_seq OWNED BY public.actividad.id_actividad;


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

ALTER SEQUENCE public.actividad_id_objetivo_seq OWNED BY public.actividad.id_objetivo;


--
-- Name: asignacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asignacion (
    id_asignacion integer NOT NULL,
    desc_asignacion text NOT NULL,
    id_actividad integer NOT NULL,
    id_miembro integer NOT NULL
);


ALTER TABLE public.asignacion OWNER TO postgres;

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

ALTER SEQUENCE public.asignacion_id_actividad_seq OWNED BY public.asignacion.id_actividad;


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

ALTER SEQUENCE public.asignacion_id_asignacion_seq OWNED BY public.asignacion.id_asignacion;


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

ALTER SEQUENCE public.asignacion_id_miembro_seq OWNED BY public.asignacion.id_miembro;


--
-- Name: avance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.avance (
    id_avance integer NOT NULL,
    cantidad character varying(5) NOT NULL,
    id_asignacion integer NOT NULL
);


ALTER TABLE public.avance OWNER TO postgres;

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

ALTER SEQUENCE public.avance_id_asignacion_seq OWNED BY public.avance.id_asignacion;


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

ALTER SEQUENCE public.avance_id_avance_seq OWNED BY public.avance.id_avance;


--
-- Name: clase; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clase (
    id_clase integer NOT NULL,
    nombre_clase character varying(20) NOT NULL,
    id_modulo integer NOT NULL
);


ALTER TABLE public.clase OWNER TO postgres;

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

ALTER SEQUENCE public.clase_id_clase_seq OWNED BY public.clase.id_clase;


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

ALTER SEQUENCE public.clase_id_modulo_seq OWNED BY public.clase.id_modulo;


--
-- Name: entregable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entregable (
    id_entregable integer NOT NULL,
    fecha_entrega date NOT NULL,
    id_actividad integer NOT NULL,
    id_tipo_entregable integer NOT NULL
);


ALTER TABLE public.entregable OWNER TO postgres;

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

ALTER SEQUENCE public.entregable_id_actividad_seq OWNED BY public.entregable.id_actividad;


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

ALTER SEQUENCE public.entregable_id_entregable_seq OWNED BY public.entregable.id_entregable;


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

ALTER SEQUENCE public.entregable_id_tipo_entregable_seq OWNED BY public.entregable.id_tipo_entregable;


--
-- Name: estado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estado (
    id_estado integer NOT NULL,
    desc_estado character varying(20) NOT NULL
);


ALTER TABLE public.estado OWNER TO postgres;

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

ALTER SEQUENCE public.estado_id_estado_seq OWNED BY public.estado.id_estado;


--
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu (
    id_menu integer NOT NULL,
    id_modulo integer NOT NULL
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

ALTER SEQUENCE public.menu_id_menu_seq OWNED BY public.menu.id_menu;


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

ALTER SEQUENCE public.menu_id_modulo_seq OWNED BY public.menu.id_modulo;


--
-- Name: metodo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metodo (
    id_metodo integer NOT NULL,
    nombre_metodo integer,
    id_clase integer NOT NULL
);


ALTER TABLE public.metodo OWNER TO postgres;

--
-- Name: metodo-perfil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."metodo-perfil" (
    "id_metodo-perfil" integer NOT NULL,
    id_metodo integer NOT NULL,
    id_perfil integer NOT NULL
);


ALTER TABLE public."metodo-perfil" OWNER TO postgres;

--
-- Name: metodo-perfil_id_metodo-perfil_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."metodo-perfil_id_metodo-perfil_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."metodo-perfil_id_metodo-perfil_seq" OWNER TO postgres;

--
-- Name: metodo-perfil_id_metodo-perfil_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."metodo-perfil_id_metodo-perfil_seq" OWNED BY public."metodo-perfil"."id_metodo-perfil";


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

ALTER SEQUENCE public."metodo-perfil_id_metodo_seq" OWNED BY public."metodo-perfil".id_metodo;


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

ALTER SEQUENCE public."metodo-perfil_id_perfil_seq" OWNED BY public."metodo-perfil".id_perfil;


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

ALTER SEQUENCE public.metodo_id_clase_seq OWNED BY public.metodo.id_clase;


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

ALTER SEQUENCE public.metodo_id_metodo_seq OWNED BY public.metodo.id_metodo;


--
-- Name: miembro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.miembro (
    id_miembro integer NOT NULL,
    id_persona integer NOT NULL,
    id_perfil integer NOT NULL,
    id_proyecto integer NOT NULL
);


ALTER TABLE public.miembro OWNER TO postgres;

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

ALTER SEQUENCE public.miembro_id_miembro_seq OWNED BY public.miembro.id_miembro;


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

ALTER SEQUENCE public.miembro_id_perfil_seq OWNED BY public.miembro.id_perfil;


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

ALTER SEQUENCE public.miembro_id_persona_seq OWNED BY public.miembro.id_persona;


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

ALTER SEQUENCE public.miembro_id_proyecto_seq OWNED BY public.miembro.id_proyecto;


--
-- Name: modulo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modulo (
    id_modulo integer NOT NULL,
    desc_modulo character varying(70) NOT NULL
);


ALTER TABLE public.modulo OWNER TO postgres;

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

ALTER SEQUENCE public.modulo_id_modulo_seq OWNED BY public.modulo.id_modulo;


--
-- Name: modulo_perfil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modulo_perfil (
    id_modulo_perfil integer NOT NULL,
    id_modulo integer NOT NULL,
    id_perfil integer NOT NULL
);


ALTER TABLE public.modulo_perfil OWNER TO postgres;

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

ALTER SEQUENCE public.modulo_perfil_id_modulo_perfil_seq OWNED BY public.modulo_perfil.id_modulo_perfil;


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

ALTER SEQUENCE public.modulo_perfil_id_modulo_seq OWNED BY public.modulo_perfil.id_modulo;


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

ALTER SEQUENCE public.modulo_perfil_id_perfil_seq OWNED BY public.modulo_perfil.id_perfil;


--
-- Name: objetivo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.objetivo (
    id_objetivo integer NOT NULL,
    desc_objetivo character varying(40) NOT NULL,
    id_proyecto integer NOT NULL
);


ALTER TABLE public.objetivo OWNER TO postgres;

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

ALTER SEQUENCE public.objetivo_id_objetivo_seq OWNED BY public.objetivo.id_objetivo;


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

ALTER SEQUENCE public.objetivo_id_proyecto_seq OWNED BY public.objetivo.id_proyecto;


--
-- Name: opcion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.opcion (
    id_opcion integer NOT NULL,
    desc_opcion character varying(30) NOT NULL
);


ALTER TABLE public.opcion OWNER TO postgres;

--
-- Name: opcion-perfil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."opcion-perfil" (
    "id_opcion-perfil" integer NOT NULL,
    id_opcion integer NOT NULL,
    id_perfil integer NOT NULL
);


ALTER TABLE public."opcion-perfil" OWNER TO postgres;

--
-- Name: opcion-perfil_id_opcion-perfil_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."opcion-perfil_id_opcion-perfil_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."opcion-perfil_id_opcion-perfil_seq" OWNER TO postgres;

--
-- Name: opcion-perfil_id_opcion-perfil_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."opcion-perfil_id_opcion-perfil_seq" OWNED BY public."opcion-perfil"."id_opcion-perfil";


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

ALTER SEQUENCE public."opcion-perfil_id_opcion_seq" OWNED BY public."opcion-perfil".id_opcion;


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

ALTER SEQUENCE public."opcion-perfil_id_perfil_seq" OWNED BY public."opcion-perfil".id_perfil;


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

ALTER SEQUENCE public.opcion_id_opcion_seq OWNED BY public.opcion.id_opcion;


--
-- Name: perfil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.perfil (
    id_perfil integer NOT NULL,
    desc_perfil character varying(70) NOT NULL,
    id_tipo_perfil integer NOT NULL
);


ALTER TABLE public.perfil OWNER TO postgres;

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

ALTER SEQUENCE public.perfil_id_perfil_seq OWNED BY public.perfil.id_perfil;


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

ALTER SEQUENCE public.perfil_id_tipo_perfil_seq OWNED BY public.perfil.id_tipo_perfil;


--
-- Name: persona; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.persona (
    id_persona integer NOT NULL,
    nombre_persona character varying(40) NOT NULL,
    email_persona character varying(50) NOT NULL,
    telefono character varying(16) NOT NULL,
    apellido_persona character varying(50) NOT NULL
);


ALTER TABLE public.persona OWNER TO postgres;

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

ALTER SEQUENCE public.persona_id_persona_seq OWNED BY public.persona.id_persona;


--
-- Name: prelacion-actividad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."prelacion-actividad" (
    id_prelacion integer NOT NULL,
    id_actividad integer NOT NULL
);


ALTER TABLE public."prelacion-actividad" OWNER TO postgres;

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

ALTER SEQUENCE public."prelacion-actividad_id_actividad_seq" OWNED BY public."prelacion-actividad".id_actividad;


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

ALTER SEQUENCE public."prelacion-actividad_id_prelacion_seq" OWNED BY public."prelacion-actividad".id_prelacion;


--
-- Name: proyecto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proyecto (
    id_proyecto integer NOT NULL,
    nombre_proyecto character varying(60) NOT NULL,
    desc_proyecto text NOT NULL,
    id_estado integer NOT NULL
);


ALTER TABLE public.proyecto OWNER TO postgres;

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

ALTER SEQUENCE public.proyecto_id_estado_seq OWNED BY public.proyecto.id_estado;


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

ALTER SEQUENCE public.proyecto_id_proyecto_seq OWNED BY public.proyecto.id_proyecto;


--
-- Name: tipo_entregable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_entregable (
    id_tipo_entregable integer NOT NULL,
    desc_tipo_entregable character varying(40)
);


ALTER TABLE public.tipo_entregable OWNER TO postgres;

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

ALTER SEQUENCE public.tipo_entregable_id_tipo_entregable_seq OWNED BY public.tipo_entregable.id_tipo_entregable;


--
-- Name: tipo_perfil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_perfil (
    id_tipo_perfil integer NOT NULL,
    desc_tipo_perfil character varying(50) NOT NULL
);


ALTER TABLE public.tipo_perfil OWNER TO postgres;

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

ALTER SEQUENCE public.tipo_perfil_id_tipo_perfil_seq OWNED BY public.tipo_perfil.id_tipo_perfil;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    "contrase├â┬▒a_usuario" character varying(150) NOT NULL,
    nombre_usuario character varying(30) NOT NULL,
    id_persona integer NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- Name: usuario-perfil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."usuario-perfil" (
    id_usuario_perfil integer NOT NULL,
    id_usuario integer NOT NULL,
    id_perfil integer NOT NULL
);


ALTER TABLE public."usuario-perfil" OWNER TO postgres;

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

ALTER SEQUENCE public."usuario-perfil_id_perfil_seq" OWNED BY public."usuario-perfil".id_perfil;


--
-- Name: usuario-perfil_id_usuario_perfil_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."usuario-perfil_id_usuario_perfil_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."usuario-perfil_id_usuario_perfil_seq" OWNER TO postgres;

--
-- Name: usuario-perfil_id_usuario_perfil_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."usuario-perfil_id_usuario_perfil_seq" OWNED BY public."usuario-perfil".id_usuario_perfil;


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

ALTER SEQUENCE public."usuario-perfil_id_usuario_seq" OWNED BY public."usuario-perfil".id_usuario;


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

ALTER SEQUENCE public.usuario_id_persona_seq OWNED BY public.usuario.id_persona;


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

ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;


--
-- Name: actividad id_actividad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actividad ALTER COLUMN id_actividad SET DEFAULT nextval('public.actividad_id_actividad_seq'::regclass);


--
-- Name: actividad id_objetivo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actividad ALTER COLUMN id_objetivo SET DEFAULT nextval('public.actividad_id_objetivo_seq'::regclass);


--
-- Name: asignacion id_asignacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asignacion ALTER COLUMN id_asignacion SET DEFAULT nextval('public.asignacion_id_asignacion_seq'::regclass);


--
-- Name: asignacion id_actividad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asignacion ALTER COLUMN id_actividad SET DEFAULT nextval('public.asignacion_id_actividad_seq'::regclass);


--
-- Name: asignacion id_miembro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asignacion ALTER COLUMN id_miembro SET DEFAULT nextval('public.asignacion_id_miembro_seq'::regclass);


--
-- Name: avance id_avance; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avance ALTER COLUMN id_avance SET DEFAULT nextval('public.avance_id_avance_seq'::regclass);


--
-- Name: avance id_asignacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avance ALTER COLUMN id_asignacion SET DEFAULT nextval('public.avance_id_asignacion_seq'::regclass);


--
-- Name: clase id_clase; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clase ALTER COLUMN id_clase SET DEFAULT nextval('public.clase_id_clase_seq'::regclass);


--
-- Name: clase id_modulo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clase ALTER COLUMN id_modulo SET DEFAULT nextval('public.clase_id_modulo_seq'::regclass);


--
-- Name: entregable id_entregable; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entregable ALTER COLUMN id_entregable SET DEFAULT nextval('public.entregable_id_entregable_seq'::regclass);


--
-- Name: entregable id_actividad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entregable ALTER COLUMN id_actividad SET DEFAULT nextval('public.entregable_id_actividad_seq'::regclass);


--
-- Name: entregable id_tipo_entregable; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entregable ALTER COLUMN id_tipo_entregable SET DEFAULT nextval('public.entregable_id_tipo_entregable_seq'::regclass);


--
-- Name: estado id_estado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado ALTER COLUMN id_estado SET DEFAULT nextval('public.estado_id_estado_seq'::regclass);


--
-- Name: menu id_menu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu ALTER COLUMN id_menu SET DEFAULT nextval('public.menu_id_menu_seq'::regclass);


--
-- Name: menu id_modulo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu ALTER COLUMN id_modulo SET DEFAULT nextval('public.menu_id_modulo_seq'::regclass);


--
-- Name: metodo id_metodo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metodo ALTER COLUMN id_metodo SET DEFAULT nextval('public.metodo_id_metodo_seq'::regclass);


--
-- Name: metodo id_clase; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metodo ALTER COLUMN id_clase SET DEFAULT nextval('public.metodo_id_clase_seq'::regclass);


--
-- Name: metodo-perfil id_metodo-perfil; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."metodo-perfil" ALTER COLUMN "id_metodo-perfil" SET DEFAULT nextval('public."metodo-perfil_id_metodo-perfil_seq"'::regclass);


--
-- Name: metodo-perfil id_metodo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."metodo-perfil" ALTER COLUMN id_metodo SET DEFAULT nextval('public."metodo-perfil_id_metodo_seq"'::regclass);


--
-- Name: metodo-perfil id_perfil; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."metodo-perfil" ALTER COLUMN id_perfil SET DEFAULT nextval('public."metodo-perfil_id_perfil_seq"'::regclass);


--
-- Name: miembro id_miembro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miembro ALTER COLUMN id_miembro SET DEFAULT nextval('public.miembro_id_miembro_seq'::regclass);


--
-- Name: miembro id_persona; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miembro ALTER COLUMN id_persona SET DEFAULT nextval('public.miembro_id_persona_seq'::regclass);


--
-- Name: miembro id_perfil; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miembro ALTER COLUMN id_perfil SET DEFAULT nextval('public.miembro_id_perfil_seq'::regclass);


--
-- Name: miembro id_proyecto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miembro ALTER COLUMN id_proyecto SET DEFAULT nextval('public.miembro_id_proyecto_seq'::regclass);


--
-- Name: modulo id_modulo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modulo ALTER COLUMN id_modulo SET DEFAULT nextval('public.modulo_id_modulo_seq'::regclass);


--
-- Name: modulo_perfil id_modulo_perfil; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modulo_perfil ALTER COLUMN id_modulo_perfil SET DEFAULT nextval('public.modulo_perfil_id_modulo_perfil_seq'::regclass);


--
-- Name: modulo_perfil id_modulo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modulo_perfil ALTER COLUMN id_modulo SET DEFAULT nextval('public.modulo_perfil_id_modulo_seq'::regclass);


--
-- Name: modulo_perfil id_perfil; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modulo_perfil ALTER COLUMN id_perfil SET DEFAULT nextval('public.modulo_perfil_id_perfil_seq'::regclass);


--
-- Name: objetivo id_objetivo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.objetivo ALTER COLUMN id_objetivo SET DEFAULT nextval('public.objetivo_id_objetivo_seq'::regclass);


--
-- Name: objetivo id_proyecto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.objetivo ALTER COLUMN id_proyecto SET DEFAULT nextval('public.objetivo_id_proyecto_seq'::regclass);


--
-- Name: opcion id_opcion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opcion ALTER COLUMN id_opcion SET DEFAULT nextval('public.opcion_id_opcion_seq'::regclass);


--
-- Name: opcion-perfil id_opcion-perfil; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."opcion-perfil" ALTER COLUMN "id_opcion-perfil" SET DEFAULT nextval('public."opcion-perfil_id_opcion-perfil_seq"'::regclass);


--
-- Name: opcion-perfil id_opcion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."opcion-perfil" ALTER COLUMN id_opcion SET DEFAULT nextval('public."opcion-perfil_id_opcion_seq"'::regclass);


--
-- Name: opcion-perfil id_perfil; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."opcion-perfil" ALTER COLUMN id_perfil SET DEFAULT nextval('public."opcion-perfil_id_perfil_seq"'::regclass);


--
-- Name: perfil id_perfil; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfil ALTER COLUMN id_perfil SET DEFAULT nextval('public.perfil_id_perfil_seq'::regclass);


--
-- Name: perfil id_tipo_perfil; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfil ALTER COLUMN id_tipo_perfil SET DEFAULT nextval('public.perfil_id_tipo_perfil_seq'::regclass);


--
-- Name: persona id_persona; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona ALTER COLUMN id_persona SET DEFAULT nextval('public.persona_id_persona_seq'::regclass);


--
-- Name: prelacion-actividad id_prelacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."prelacion-actividad" ALTER COLUMN id_prelacion SET DEFAULT nextval('public."prelacion-actividad_id_prelacion_seq"'::regclass);


--
-- Name: prelacion-actividad id_actividad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."prelacion-actividad" ALTER COLUMN id_actividad SET DEFAULT nextval('public."prelacion-actividad_id_actividad_seq"'::regclass);


--
-- Name: proyecto id_proyecto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proyecto ALTER COLUMN id_proyecto SET DEFAULT nextval('public.proyecto_id_proyecto_seq'::regclass);


--
-- Name: proyecto id_estado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proyecto ALTER COLUMN id_estado SET DEFAULT nextval('public.proyecto_id_estado_seq'::regclass);


--
-- Name: tipo_entregable id_tipo_entregable; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_entregable ALTER COLUMN id_tipo_entregable SET DEFAULT nextval('public.tipo_entregable_id_tipo_entregable_seq'::regclass);


--
-- Name: tipo_perfil id_tipo_perfil; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_perfil ALTER COLUMN id_tipo_perfil SET DEFAULT nextval('public.tipo_perfil_id_tipo_perfil_seq'::regclass);


--
-- Name: usuario id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);


--
-- Name: usuario id_persona; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id_persona SET DEFAULT nextval('public.usuario_id_persona_seq'::regclass);


--
-- Name: usuario-perfil id_usuario_perfil; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."usuario-perfil" ALTER COLUMN id_usuario_perfil SET DEFAULT nextval('public."usuario-perfil_id_usuario_perfil_seq"'::regclass);


--
-- Name: usuario-perfil id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."usuario-perfil" ALTER COLUMN id_usuario SET DEFAULT nextval('public."usuario-perfil_id_usuario_seq"'::regclass);


--
-- Name: usuario-perfil id_perfil; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."usuario-perfil" ALTER COLUMN id_perfil SET DEFAULT nextval('public."usuario-perfil_id_perfil_seq"'::regclass);


--
-- Data for Name: actividad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actividad (id_actividad, desc_actividad, id_objetivo) FROM stdin;
\.


--
-- Data for Name: asignacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asignacion (id_asignacion, desc_asignacion, id_actividad, id_miembro) FROM stdin;
\.


--
-- Data for Name: avance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.avance (id_avance, cantidad, id_asignacion) FROM stdin;
\.


--
-- Data for Name: clase; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clase (id_clase, nombre_clase, id_modulo) FROM stdin;
\.


--
-- Data for Name: entregable; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entregable (id_entregable, fecha_entrega, id_actividad, id_tipo_entregable) FROM stdin;
\.


--
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estado (id_estado, desc_estado) FROM stdin;
\.


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu (id_menu, id_modulo) FROM stdin;
\.


--
-- Data for Name: metodo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metodo (id_metodo, nombre_metodo, id_clase) FROM stdin;
\.


--
-- Data for Name: metodo-perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."metodo-perfil" ("id_metodo-perfil", id_metodo, id_perfil) FROM stdin;
\.


--
-- Data for Name: miembro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.miembro (id_miembro, id_persona, id_perfil, id_proyecto) FROM stdin;
\.


--
-- Data for Name: modulo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.modulo (id_modulo, desc_modulo) FROM stdin;
\.


--
-- Data for Name: modulo_perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.modulo_perfil (id_modulo_perfil, id_modulo, id_perfil) FROM stdin;
\.


--
-- Data for Name: objetivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.objetivo (id_objetivo, desc_objetivo, id_proyecto) FROM stdin;
\.


--
-- Data for Name: opcion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.opcion (id_opcion, desc_opcion) FROM stdin;
\.


--
-- Data for Name: opcion-perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."opcion-perfil" ("id_opcion-perfil", id_opcion, id_perfil) FROM stdin;
\.


--
-- Data for Name: perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.perfil (id_perfil, desc_perfil, id_tipo_perfil) FROM stdin;
\.


--
-- Data for Name: persona; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.persona (id_persona, nombre_persona, email_persona, telefono, apellido_persona) FROM stdin;
\.


--
-- Data for Name: prelacion-actividad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."prelacion-actividad" (id_prelacion, id_actividad) FROM stdin;
\.


--
-- Data for Name: proyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proyecto (id_proyecto, nombre_proyecto, desc_proyecto, id_estado) FROM stdin;
\.


--
-- Data for Name: tipo_entregable; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_entregable (id_tipo_entregable, desc_tipo_entregable) FROM stdin;
\.


--
-- Data for Name: tipo_perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_perfil (id_tipo_perfil, desc_tipo_perfil) FROM stdin;
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id_usuario, "contrase├â┬▒a_usuario", nombre_usuario, id_persona) FROM stdin;
\.


--
-- Data for Name: usuario-perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."usuario-perfil" (id_usuario_perfil, id_usuario, id_perfil) FROM stdin;
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

SELECT pg_catalog.setval('public.clase_id_clase_seq', 1, false);


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

SELECT pg_catalog.setval('public.estado_id_estado_seq', 1, false);


--
-- Name: menu_id_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_id_menu_seq', 1, false);


--
-- Name: menu_id_modulo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_id_modulo_seq', 1, false);


--
-- Name: metodo-perfil_id_metodo-perfil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."metodo-perfil_id_metodo-perfil_seq"', 1, false);


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

SELECT pg_catalog.setval('public.metodo_id_metodo_seq', 1, false);


--
-- Name: miembro_id_miembro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.miembro_id_miembro_seq', 1, false);


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

SELECT pg_catalog.setval('public.modulo_id_modulo_seq', 1, false);


--
-- Name: modulo_perfil_id_modulo_perfil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modulo_perfil_id_modulo_perfil_seq', 1, false);


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

SELECT pg_catalog.setval('public.objetivo_id_objetivo_seq', 1, false);


--
-- Name: objetivo_id_proyecto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.objetivo_id_proyecto_seq', 1, false);


--
-- Name: opcion-perfil_id_opcion-perfil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."opcion-perfil_id_opcion-perfil_seq"', 1, false);


--
-- Name: opcion-perfil_id_opcion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."opcion-perfil_id_opcion_seq"', 1, false);


--
-- Name: opcion-perfil_id_perfil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."opcion-perfil_id_perfil_seq"', 1, false);


--
-- Name: opcion_id_opcion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.opcion_id_opcion_seq', 1, false);


--
-- Name: perfil_id_perfil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.perfil_id_perfil_seq', 1, false);


--
-- Name: perfil_id_tipo_perfil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.perfil_id_tipo_perfil_seq', 1, false);


--
-- Name: persona_id_persona_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.persona_id_persona_seq', 1, false);


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

SELECT pg_catalog.setval('public.proyecto_id_proyecto_seq', 1, false);


--
-- Name: tipo_entregable_id_tipo_entregable_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_entregable_id_tipo_entregable_seq', 1, false);


--
-- Name: tipo_perfil_id_tipo_perfil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_perfil_id_tipo_perfil_seq', 1, false);


--
-- Name: usuario-perfil_id_perfil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."usuario-perfil_id_perfil_seq"', 1, false);


--
-- Name: usuario-perfil_id_usuario_perfil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."usuario-perfil_id_usuario_perfil_seq"', 1, false);


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

SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 1, false);


--
-- Name: actividad pk_actividad; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actividad
    ADD CONSTRAINT pk_actividad PRIMARY KEY (id_actividad);


--
-- Name: asignacion pk_asignacion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asignacion
    ADD CONSTRAINT pk_asignacion PRIMARY KEY (id_asignacion);


--
-- Name: avance pk_avance; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avance
    ADD CONSTRAINT pk_avance PRIMARY KEY (id_avance);


--
-- Name: clase pk_clase; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clase
    ADD CONSTRAINT pk_clase PRIMARY KEY (id_clase);


--
-- Name: entregable pk_entregable; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entregable
    ADD CONSTRAINT pk_entregable PRIMARY KEY (id_entregable);


--
-- Name: estado pk_estado; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado
    ADD CONSTRAINT pk_estado PRIMARY KEY (id_estado);


--
-- Name: menu pk_menu; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT pk_menu PRIMARY KEY (id_menu);


--
-- Name: metodo pk_metodo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metodo
    ADD CONSTRAINT pk_metodo PRIMARY KEY (id_metodo);


--
-- Name: metodo-perfil pk_metodo-perfil; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."metodo-perfil"
    ADD CONSTRAINT "pk_metodo-perfil" PRIMARY KEY ("id_metodo-perfil");


--
-- Name: miembro pk_miembro; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miembro
    ADD CONSTRAINT pk_miembro PRIMARY KEY (id_miembro);


--
-- Name: modulo pk_modulo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modulo
    ADD CONSTRAINT pk_modulo PRIMARY KEY (id_modulo);


--
-- Name: modulo_perfil pk_modulo_perfil; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modulo_perfil
    ADD CONSTRAINT pk_modulo_perfil PRIMARY KEY (id_modulo_perfil);


--
-- Name: objetivo pk_objetivo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.objetivo
    ADD CONSTRAINT pk_objetivo PRIMARY KEY (id_objetivo);


--
-- Name: opcion pk_opcion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opcion
    ADD CONSTRAINT pk_opcion PRIMARY KEY (id_opcion);


--
-- Name: opcion-perfil pk_opcion-perfil; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."opcion-perfil"
    ADD CONSTRAINT "pk_opcion-perfil" PRIMARY KEY ("id_opcion-perfil");


--
-- Name: perfil pk_perfil; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfil
    ADD CONSTRAINT pk_perfil PRIMARY KEY (id_perfil);


--
-- Name: persona pk_persona; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT pk_persona PRIMARY KEY (id_persona);


--
-- Name: proyecto pk_proyecto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proyecto
    ADD CONSTRAINT pk_proyecto PRIMARY KEY (id_proyecto);


--
-- Name: tipo_entregable pk_tipo_entregable; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_entregable
    ADD CONSTRAINT pk_tipo_entregable PRIMARY KEY (id_tipo_entregable);


--
-- Name: tipo_perfil pk_tipo_perfil; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_perfil
    ADD CONSTRAINT pk_tipo_perfil PRIMARY KEY (id_tipo_perfil);


--
-- Name: usuario pk_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT pk_usuario PRIMARY KEY (id_usuario);


--
-- Name: usuario-perfil pk_usuario-perfil; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."usuario-perfil"
    ADD CONSTRAINT "pk_usuario-perfil" PRIMARY KEY (id_usuario_perfil);


--
-- Name: actividad fk_actividad_objetivo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actividad
    ADD CONSTRAINT fk_actividad_objetivo FOREIGN KEY (id_objetivo) REFERENCES public.objetivo(id_objetivo);


--
-- Name: asignacion fk_asignacion_actividad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asignacion
    ADD CONSTRAINT fk_asignacion_actividad FOREIGN KEY (id_actividad) REFERENCES public.actividad(id_actividad);


--
-- Name: asignacion fk_asignacion_miembro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asignacion
    ADD CONSTRAINT fk_asignacion_miembro FOREIGN KEY (id_miembro) REFERENCES public.miembro(id_miembro);


--
-- Name: avance fk_avance_asignacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avance
    ADD CONSTRAINT fk_avance_asignacion FOREIGN KEY (id_asignacion) REFERENCES public.asignacion(id_asignacion);


--
-- Name: clase fk_clase_modulo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clase
    ADD CONSTRAINT fk_clase_modulo FOREIGN KEY (id_modulo) REFERENCES public.modulo(id_modulo);


--
-- Name: entregable fk_entregable_actividad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entregable
    ADD CONSTRAINT fk_entregable_actividad FOREIGN KEY (id_actividad) REFERENCES public.actividad(id_actividad);


--
-- Name: entregable fk_entregable_tipo_entregable; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entregable
    ADD CONSTRAINT fk_entregable_tipo_entregable FOREIGN KEY (id_tipo_entregable) REFERENCES public.tipo_entregable(id_tipo_entregable);


--
-- Name: menu fk_menu_modulo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT fk_menu_modulo FOREIGN KEY (id_modulo) REFERENCES public.modulo(id_modulo);


--
-- Name: metodo-perfil fk_metodo-perfil_metodo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."metodo-perfil"
    ADD CONSTRAINT "fk_metodo-perfil_metodo" FOREIGN KEY (id_metodo) REFERENCES public.metodo(id_metodo);


--
-- Name: metodo-perfil fk_metodo-perfil_perfil; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."metodo-perfil"
    ADD CONSTRAINT "fk_metodo-perfil_perfil" FOREIGN KEY (id_perfil) REFERENCES public.perfil(id_perfil);


--
-- Name: metodo fk_metodo_clase; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metodo
    ADD CONSTRAINT fk_metodo_clase FOREIGN KEY (id_clase) REFERENCES public.clase(id_clase);


--
-- Name: miembro fk_miembro_perfil; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miembro
    ADD CONSTRAINT fk_miembro_perfil FOREIGN KEY (id_perfil) REFERENCES public.perfil(id_perfil);


--
-- Name: miembro fk_miembro_persona; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miembro
    ADD CONSTRAINT fk_miembro_persona FOREIGN KEY (id_persona) REFERENCES public.persona(id_persona);


--
-- Name: miembro fk_miembro_proyecto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miembro
    ADD CONSTRAINT fk_miembro_proyecto FOREIGN KEY (id_proyecto) REFERENCES public.proyecto(id_proyecto);


--
-- Name: modulo_perfil fk_modulo_perfil_modulo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modulo_perfil
    ADD CONSTRAINT fk_modulo_perfil_modulo FOREIGN KEY (id_modulo) REFERENCES public.modulo(id_modulo);


--
-- Name: modulo_perfil fk_modulo_perfil_perfil; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modulo_perfil
    ADD CONSTRAINT fk_modulo_perfil_perfil FOREIGN KEY (id_perfil) REFERENCES public.perfil(id_perfil);


--
-- Name: objetivo fk_objetivo_proyecto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.objetivo
    ADD CONSTRAINT fk_objetivo_proyecto FOREIGN KEY (id_proyecto) REFERENCES public.proyecto(id_proyecto);


--
-- Name: opcion-perfil fk_opcion-perfil_opcion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."opcion-perfil"
    ADD CONSTRAINT "fk_opcion-perfil_opcion" FOREIGN KEY (id_opcion) REFERENCES public.opcion(id_opcion);


--
-- Name: opcion-perfil fk_opcion-perfil_perfil; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."opcion-perfil"
    ADD CONSTRAINT "fk_opcion-perfil_perfil" FOREIGN KEY (id_perfil) REFERENCES public.perfil(id_perfil);


--
-- Name: perfil fk_perfil_tipo_perfil; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfil
    ADD CONSTRAINT fk_perfil_tipo_perfil FOREIGN KEY (id_tipo_perfil) REFERENCES public.tipo_perfil(id_tipo_perfil);


--
-- Name: prelacion-actividad fk_prelacion-actividad_actividad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."prelacion-actividad"
    ADD CONSTRAINT "fk_prelacion-actividad_actividad" FOREIGN KEY (id_prelacion) REFERENCES public.actividad(id_actividad);


--
-- Name: prelacion-actividad fk_prelacion-actividad_actividad_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."prelacion-actividad"
    ADD CONSTRAINT "fk_prelacion-actividad_actividad_0" FOREIGN KEY (id_actividad) REFERENCES public.actividad(id_actividad);


--
-- Name: proyecto fk_proyecto_estado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proyecto
    ADD CONSTRAINT fk_proyecto_estado FOREIGN KEY (id_estado) REFERENCES public.estado(id_estado);


--
-- Name: usuario-perfil fk_usuario-perfil_perfil; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."usuario-perfil"
    ADD CONSTRAINT "fk_usuario-perfil_perfil" FOREIGN KEY (id_perfil) REFERENCES public.perfil(id_perfil);


--
-- Name: usuario-perfil fk_usuario-perfil_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."usuario-perfil"
    ADD CONSTRAINT "fk_usuario-perfil_usuario" FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- Name: usuario fk_usuario_persona; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fk_usuario_persona FOREIGN KEY (id_persona) REFERENCES public.persona(id_persona);


--
-- PostgreSQL database dump complete
--
