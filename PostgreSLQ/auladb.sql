PGDMP         !                y            auladb    13.3    13.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16394    auladb    DATABASE     f   CREATE DATABASE auladb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE auladb;
                postgres    false            �            1259    16398    teste    TABLE     :   CREATE TABLE public.teste (
    nome character varying
);
    DROP TABLE public.teste;
       public         heap    postgres    false            �           0    0    TABLE teste    ACL     0   GRANT ALL ON TABLE public.teste TO professores;
          public          postgres    false    200            �          0    16398    teste 
   TABLE DATA           %   COPY public.teste (nome) FROM stdin;
    public          postgres    false    200   \       �      x������ � �     