PGDMP         !                y            financas    13.3    13.3 &    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16418    financas    DATABASE     h   CREATE DATABASE financas WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE financas;
                postgres    false            �            1259    16426    agencia    TABLE       CREATE TABLE public.agencia (
    banco_numero integer NOT NULL,
    numero integer NOT NULL,
    nome character varying(80) NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    data_criacao timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.agencia;
       public         heap    postgres    false            �            1259    16419    banco    TABLE     �   CREATE TABLE public.banco (
    numero integer NOT NULL,
    nome character varying(50) NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    data_criacao timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.banco;
       public         heap    postgres    false            �            1259    16440    cliente    TABLE       CREATE TABLE public.cliente (
    numero bigint NOT NULL,
    nome character varying(120) NOT NULL,
    email character varying(250) NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    data_criacao timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �            1259    16438    cliente_numero_seq    SEQUENCE     {   CREATE SEQUENCE public.cliente_numero_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.cliente_numero_seq;
       public          postgres    false    203            �           0    0    cliente_numero_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.cliente_numero_seq OWNED BY public.cliente.numero;
          public          postgres    false    202            �            1259    16477    cliente_transacoes    TABLE     �  CREATE TABLE public.cliente_transacoes (
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
 &   DROP TABLE public.cliente_transacoes;
       public         heap    postgres    false            �            1259    16475    cliente_transacoes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_transacoes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.cliente_transacoes_id_seq;
       public          postgres    false    208            �           0    0    cliente_transacoes_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.cliente_transacoes_id_seq OWNED BY public.cliente_transacoes.id;
          public          postgres    false    207            �            1259    16448    conta_corrente    TABLE     G  CREATE TABLE public.conta_corrente (
    banco_numero integer NOT NULL,
    agencia_numero integer NOT NULL,
    numero bigint NOT NULL,
    digito smallint NOT NULL,
    cliente_numero bigint NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    data_criacao timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
 "   DROP TABLE public.conta_corrente;
       public         heap    postgres    false            �            1259    16467    tipo_transacao    TABLE     �   CREATE TABLE public.tipo_transacao (
    id smallint NOT NULL,
    nome character varying(50) NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    data_criacao timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
 "   DROP TABLE public.tipo_transacao;
       public         heap    postgres    false            �            1259    16465    tipo_transacao_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tipo_transacao_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tipo_transacao_id_seq;
       public          postgres    false    206            �           0    0    tipo_transacao_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.tipo_transacao_id_seq OWNED BY public.tipo_transacao.id;
          public          postgres    false    205            >           2604    16443    cliente numero    DEFAULT     p   ALTER TABLE ONLY public.cliente ALTER COLUMN numero SET DEFAULT nextval('public.cliente_numero_seq'::regclass);
 =   ALTER TABLE public.cliente ALTER COLUMN numero DROP DEFAULT;
       public          postgres    false    202    203    203            F           2604    16480    cliente_transacoes id    DEFAULT     ~   ALTER TABLE ONLY public.cliente_transacoes ALTER COLUMN id SET DEFAULT nextval('public.cliente_transacoes_id_seq'::regclass);
 D   ALTER TABLE public.cliente_transacoes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    208    208            C           2604    16470    tipo_transacao id    DEFAULT     v   ALTER TABLE ONLY public.tipo_transacao ALTER COLUMN id SET DEFAULT nextval('public.tipo_transacao_id_seq'::regclass);
 @   ALTER TABLE public.tipo_transacao ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    206    206            �          0    16426    agencia 
   TABLE DATA           R   COPY public.agencia (banco_numero, numero, nome, ativo, data_criacao) FROM stdin;
    public          postgres    false    201   '1       �          0    16419    banco 
   TABLE DATA           B   COPY public.banco (numero, nome, ativo, data_criacao) FROM stdin;
    public          postgres    false    200   D1       �          0    16440    cliente 
   TABLE DATA           K   COPY public.cliente (numero, nome, email, ativo, data_criacao) FROM stdin;
    public          postgres    false    203   a1       �          0    16477    cliente_transacoes 
   TABLE DATA           �   COPY public.cliente_transacoes (id, banco_numero, agencia_numero, conta_corrente_numero, conta_corrente_digito, cliente_numero, tipo_transacao_id, valor, data_criacao) FROM stdin;
    public          postgres    false    208   ~1       �          0    16448    conta_corrente 
   TABLE DATA           {   COPY public.conta_corrente (banco_numero, agencia_numero, numero, digito, cliente_numero, ativo, data_criacao) FROM stdin;
    public          postgres    false    204   �1       �          0    16467    tipo_transacao 
   TABLE DATA           G   COPY public.tipo_transacao (id, nome, ativo, data_criacao) FROM stdin;
    public          postgres    false    206   �1       �           0    0    cliente_numero_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.cliente_numero_seq', 1, false);
          public          postgres    false    202            �           0    0    cliente_transacoes_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.cliente_transacoes_id_seq', 1, false);
          public          postgres    false    207            �           0    0    tipo_transacao_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.tipo_transacao_id_seq', 1, false);
          public          postgres    false    205            K           2606    16432    agencia agencia_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.agencia
    ADD CONSTRAINT agencia_pkey PRIMARY KEY (banco_numero, numero);
 >   ALTER TABLE ONLY public.agencia DROP CONSTRAINT agencia_pkey;
       public            postgres    false    201    201            I           2606    16425    banco banco_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.banco
    ADD CONSTRAINT banco_pkey PRIMARY KEY (numero);
 :   ALTER TABLE ONLY public.banco DROP CONSTRAINT banco_pkey;
       public            postgres    false    200            M           2606    16447    cliente cliente_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (numero);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    203            S           2606    16483 *   cliente_transacoes cliente_transacoes_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.cliente_transacoes
    ADD CONSTRAINT cliente_transacoes_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.cliente_transacoes DROP CONSTRAINT cliente_transacoes_pkey;
       public            postgres    false    208            O           2606    16454 "   conta_corrente conta_corrente_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.conta_corrente
    ADD CONSTRAINT conta_corrente_pkey PRIMARY KEY (banco_numero, agencia_numero, numero, digito, cliente_numero);
 L   ALTER TABLE ONLY public.conta_corrente DROP CONSTRAINT conta_corrente_pkey;
       public            postgres    false    204    204    204    204    204            Q           2606    16474 "   tipo_transacao tipo_transacao_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.tipo_transacao
    ADD CONSTRAINT tipo_transacao_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.tipo_transacao DROP CONSTRAINT tipo_transacao_pkey;
       public            postgres    false    206            T           2606    16433 !   agencia agencia_banco_numero_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.agencia
    ADD CONSTRAINT agencia_banco_numero_fkey FOREIGN KEY (banco_numero) REFERENCES public.banco(numero);
 K   ALTER TABLE ONLY public.agencia DROP CONSTRAINT agencia_banco_numero_fkey;
       public          postgres    false    2889    201    200            W           2606    16484 R   cliente_transacoes cliente_transacoes_banco_numero_agencia_numero_conta_corre_fkey    FK CONSTRAINT     G  ALTER TABLE ONLY public.cliente_transacoes
    ADD CONSTRAINT cliente_transacoes_banco_numero_agencia_numero_conta_corre_fkey FOREIGN KEY (banco_numero, agencia_numero, conta_corrente_numero, conta_corrente_digito, cliente_numero) REFERENCES public.conta_corrente(banco_numero, agencia_numero, numero, digito, cliente_numero);
 |   ALTER TABLE ONLY public.cliente_transacoes DROP CONSTRAINT cliente_transacoes_banco_numero_agencia_numero_conta_corre_fkey;
       public          postgres    false    204    204    2895    204    204    208    208    208    208    208    204            U           2606    16455 >   conta_corrente conta_corrente_banco_numero_agencia_numero_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.conta_corrente
    ADD CONSTRAINT conta_corrente_banco_numero_agencia_numero_fkey FOREIGN KEY (banco_numero, agencia_numero) REFERENCES public.agencia(banco_numero, numero);
 h   ALTER TABLE ONLY public.conta_corrente DROP CONSTRAINT conta_corrente_banco_numero_agencia_numero_fkey;
       public          postgres    false    204    204    201    2891    201            V           2606    16460 1   conta_corrente conta_corrente_cliente_numero_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.conta_corrente
    ADD CONSTRAINT conta_corrente_cliente_numero_fkey FOREIGN KEY (cliente_numero) REFERENCES public.cliente(numero);
 [   ALTER TABLE ONLY public.conta_corrente DROP CONSTRAINT conta_corrente_cliente_numero_fkey;
       public          postgres    false    203    2893    204            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     