--
-- PostgreSQL database cluster dump
--

-- Started on 2021-07-27 12:32:45

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE daniel;
ALTER ROLE daniel WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:dXdByskN9A3KqJF5GAZ7vA==$tWvfvxnMSSG06d/Kk1kednCiDvR4YyezJ8X4BUVT4f4=:62+Ftq7JZm7yKx14qSsXKNqLEnCN+ZPWkm+Y0f1EKJ0=';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:qlvhRxcpiHfxlxPMCxzpcw==$PquJC1bowyk7JnHuEGXXsjoljf/jx2LWe2yTf3vWlOk=:l5OnyUgH71ZGTPQDi9X/gdKlaE0W4c250i75x17h3IM=';
CREATE ROLE professores;
ALTER ROLE professores WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS CONNECTION LIMIT 10 PASSWORD 'SCRAM-SHA-256$4096:Vw2VZg10jRPzUT8d1lpelw==$hd9bVyngMXeaoZy175XOg47tpK3d6yRIdFGZc+3mQ84=:9Z8qQxAikbv0R/iYvitEy6PgxsNZRidxRvQen5G+Hdo=';






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

-- Started on 2021-07-27 12:32:45

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

-- Completed on 2021-07-27 12:32:46

--
-- PostgreSQL database dump complete
--

--
-- Database "auladb" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

-- Started on 2021-07-27 12:32:46

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
-- TOC entry 2985 (class 1262 OID 16394)
-- Name: auladb; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE auladb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Portuguese_Brazil.1252';


ALTER DATABASE auladb OWNER TO postgres;

\connect auladb

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
-- TOC entry 200 (class 1259 OID 16398)
-- Name: teste; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teste (
    nome character varying
);


ALTER TABLE public.teste OWNER TO postgres;

--
-- TOC entry 2979 (class 0 OID 16398)
-- Dependencies: 200
-- Data for Name: teste; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teste (nome) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 0)
-- Dependencies: 200
-- Name: TABLE teste; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.teste TO professores;


-- Completed on 2021-07-27 12:32:46

--
-- PostgreSQL database dump complete
--

--
-- Database "financas" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

-- Started on 2021-07-27 12:32:46

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
-- TOC entry 3048 (class 1262 OID 16418)
-- Name: financas; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE financas WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Portuguese_Brazil.1252';


ALTER DATABASE financas OWNER TO postgres;

\connect financas

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
-- TOC entry 201 (class 1259 OID 16426)
-- Name: agencia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agencia (
    banco_numero integer NOT NULL,
    numero integer NOT NULL,
    nome character varying(80) NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    data_criacao timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.agencia OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16419)
-- Name: banco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.banco (
    numero integer NOT NULL,
    nome character varying(50) NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    data_criacao timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.banco OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16440)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    numero bigint NOT NULL,
    nome character varying(120) NOT NULL,
    email character varying(250) NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    data_criacao timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16438)
-- Name: cliente_numero_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_numero_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_numero_seq OWNER TO postgres;

--
-- TOC entry 3049 (class 0 OID 0)
-- Dependencies: 202
-- Name: cliente_numero_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_numero_seq OWNED BY public.cliente.numero;


--
-- TOC entry 208 (class 1259 OID 16477)
-- Name: cliente_transacoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente_transacoes (
    id bigint NOT NULL,
    banco_numero integer NOT NULL,
    agencia_numero integer NOT NULL,
    conta_corrente_numero bigint NOT NULL,
    conta_corrente_digito smallint NOT NULL,
    cliente_numero bigint NOT NULL,
    tipo_transacao_id smallint NOT NULL,
    valor numeric(15,2),
    data_criacao timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.cliente_transacoes OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16475)
-- Name: cliente_transacoes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_transacoes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_transacoes_id_seq OWNER TO postgres;

--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 207
-- Name: cliente_transacoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_transacoes_id_seq OWNED BY public.cliente_transacoes.id;


--
-- TOC entry 204 (class 1259 OID 16448)
-- Name: conta_corrente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conta_corrente (
    banco_numero integer NOT NULL,
    agencia_numero integer NOT NULL,
    numero bigint NOT NULL,
    digito smallint NOT NULL,
    cliente_numero bigint NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    data_criacao timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.conta_corrente OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16467)
-- Name: tipo_transacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_transacao (
    id smallint NOT NULL,
    nome character varying(50) NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    data_criacao timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.tipo_transacao OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16465)
-- Name: tipo_transacao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_transacao_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_transacao_id_seq OWNER TO postgres;

--
-- TOC entry 3051 (class 0 OID 0)
-- Dependencies: 205
-- Name: tipo_transacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_transacao_id_seq OWNED BY public.tipo_transacao.id;


--
-- TOC entry 2878 (class 2604 OID 16443)
-- Name: cliente numero; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN numero SET DEFAULT nextval('public.cliente_numero_seq'::regclass);


--
-- TOC entry 2886 (class 2604 OID 16480)
-- Name: cliente_transacoes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_transacoes ALTER COLUMN id SET DEFAULT nextval('public.cliente_transacoes_id_seq'::regclass);


--
-- TOC entry 2883 (class 2604 OID 16470)
-- Name: tipo_transacao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_transacao ALTER COLUMN id SET DEFAULT nextval('public.tipo_transacao_id_seq'::regclass);


--
-- TOC entry 3035 (class 0 OID 16426)
-- Dependencies: 201
-- Data for Name: agencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agencia (banco_numero, numero, nome, ativo, data_criacao) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 16419)
-- Dependencies: 200
-- Data for Name: banco; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.banco (numero, nome, ativo, data_criacao) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 16440)
-- Dependencies: 203
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (numero, nome, email, ativo, data_criacao) FROM stdin;
\.


--
-- TOC entry 3042 (class 0 OID 16477)
-- Dependencies: 208
-- Data for Name: cliente_transacoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente_transacoes (id, banco_numero, agencia_numero, conta_corrente_numero, conta_corrente_digito, cliente_numero, tipo_transacao_id, valor, data_criacao) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 16448)
-- Dependencies: 204
-- Data for Name: conta_corrente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conta_corrente (banco_numero, agencia_numero, numero, digito, cliente_numero, ativo, data_criacao) FROM stdin;
\.


--
-- TOC entry 3040 (class 0 OID 16467)
-- Dependencies: 206
-- Data for Name: tipo_transacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_transacao (id, nome, ativo, data_criacao) FROM stdin;
\.


--
-- TOC entry 3052 (class 0 OID 0)
-- Dependencies: 202
-- Name: cliente_numero_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_numero_seq', 1, false);


--
-- TOC entry 3053 (class 0 OID 0)
-- Dependencies: 207
-- Name: cliente_transacoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_transacoes_id_seq', 1, false);


--
-- TOC entry 3054 (class 0 OID 0)
-- Dependencies: 205
-- Name: tipo_transacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_transacao_id_seq', 1, false);


--
-- TOC entry 2891 (class 2606 OID 16432)
-- Name: agencia agencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agencia
    ADD CONSTRAINT agencia_pkey PRIMARY KEY (banco_numero, numero);


--
-- TOC entry 2889 (class 2606 OID 16425)
-- Name: banco banco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banco
    ADD CONSTRAINT banco_pkey PRIMARY KEY (numero);


--
-- TOC entry 2893 (class 2606 OID 16447)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (numero);


--
-- TOC entry 2899 (class 2606 OID 16483)
-- Name: cliente_transacoes cliente_transacoes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_transacoes
    ADD CONSTRAINT cliente_transacoes_pkey PRIMARY KEY (id);


--
-- TOC entry 2895 (class 2606 OID 16454)
-- Name: conta_corrente conta_corrente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conta_corrente
    ADD CONSTRAINT conta_corrente_pkey PRIMARY KEY (banco_numero, agencia_numero, numero, digito, cliente_numero);


--
-- TOC entry 2897 (class 2606 OID 16474)
-- Name: tipo_transacao tipo_transacao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_transacao
    ADD CONSTRAINT tipo_transacao_pkey PRIMARY KEY (id);


--
-- TOC entry 2900 (class 2606 OID 16433)
-- Name: agencia agencia_banco_numero_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agencia
    ADD CONSTRAINT agencia_banco_numero_fkey FOREIGN KEY (banco_numero) REFERENCES public.banco(numero);


--
-- TOC entry 2903 (class 2606 OID 16484)
-- Name: cliente_transacoes cliente_transacoes_banco_numero_agencia_numero_conta_corre_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_transacoes
    ADD CONSTRAINT cliente_transacoes_banco_numero_agencia_numero_conta_corre_fkey FOREIGN KEY (banco_numero, agencia_numero, conta_corrente_numero, conta_corrente_digito, cliente_numero) REFERENCES public.conta_corrente(banco_numero, agencia_numero, numero, digito, cliente_numero);


--
-- TOC entry 2901 (class 2606 OID 16455)
-- Name: conta_corrente conta_corrente_banco_numero_agencia_numero_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conta_corrente
    ADD CONSTRAINT conta_corrente_banco_numero_agencia_numero_fkey FOREIGN KEY (banco_numero, agencia_numero) REFERENCES public.agencia(banco_numero, numero);


--
-- TOC entry 2902 (class 2606 OID 16460)
-- Name: conta_corrente conta_corrente_cliente_numero_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conta_corrente
    ADD CONSTRAINT conta_corrente_cliente_numero_fkey FOREIGN KEY (cliente_numero) REFERENCES public.cliente(numero);


-- Completed on 2021-07-27 12:32:46

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

-- Started on 2021-07-27 12:32:46

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
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 2980 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


-- Completed on 2021-07-27 12:32:46

--
-- PostgreSQL database dump complete
--

-- Completed on 2021-07-27 12:32:46

--
-- PostgreSQL database cluster dump complete
--

