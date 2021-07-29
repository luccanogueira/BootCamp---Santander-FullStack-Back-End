PGDMP     5    ;                y            financas    13.3    13.3 )    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
       public         heap    postgres    false            �            1259    16500    teste    TABLE     �   CREATE TABLE public.teste (
    cpf character varying(11) NOT NULL,
    nome character varying(50) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.teste;
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
          public          postgres    false    205            B           2604    16443    cliente numero    DEFAULT     p   ALTER TABLE ONLY public.cliente ALTER COLUMN numero SET DEFAULT nextval('public.cliente_numero_seq'::regclass);
 =   ALTER TABLE public.cliente ALTER COLUMN numero DROP DEFAULT;
       public          postgres    false    203    202    203            J           2604    16480    cliente_transacoes id    DEFAULT     ~   ALTER TABLE ONLY public.cliente_transacoes ALTER COLUMN id SET DEFAULT nextval('public.cliente_transacoes_id_seq'::regclass);
 D   ALTER TABLE public.cliente_transacoes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    208    208            G           2604    16470    tipo_transacao id    DEFAULT     v   ALTER TABLE ONLY public.tipo_transacao ALTER COLUMN id SET DEFAULT nextval('public.tipo_transacao_id_seq'::regclass);
 @   ALTER TABLE public.tipo_transacao ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    206    206            �          0    16426    agencia 
   TABLE DATA           R   COPY public.agencia (banco_numero, numero, nome, ativo, data_criacao) FROM stdin;
    public          postgres    false    201   b4       �          0    16419    banco 
   TABLE DATA           B   COPY public.banco (numero, nome, ativo, data_criacao) FROM stdin;
    public          postgres    false    200   �:       �          0    16440    cliente 
   TABLE DATA           K   COPY public.cliente (numero, nome, email, ativo, data_criacao) FROM stdin;
    public          postgres    false    203   �B       �          0    16477    cliente_transacoes 
   TABLE DATA           �   COPY public.cliente_transacoes (id, banco_numero, agencia_numero, conta_corrente_numero, conta_corrente_digito, cliente_numero, tipo_transacao_id, valor, data_criacao) FROM stdin;
    public          postgres    false    208    j       �          0    16448    conta_corrente 
   TABLE DATA           {   COPY public.conta_corrente (banco_numero, agencia_numero, numero, digito, cliente_numero, ativo, data_criacao) FROM stdin;
    public          postgres    false    204   ��       �          0    16500    teste 
   TABLE DATA           6   COPY public.teste (cpf, nome, created_at) FROM stdin;
    public          postgres    false    209   n�       �          0    16467    tipo_transacao 
   TABLE DATA           G   COPY public.tipo_transacao (id, nome, ativo, data_criacao) FROM stdin;
    public          postgres    false    206   ��       �           0    0    cliente_numero_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.cliente_numero_seq', 500, true);
          public          postgres    false    202            �           0    0    cliente_transacoes_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.cliente_transacoes_id_seq', 2018, true);
          public          postgres    false    207            �           0    0    tipo_transacao_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.tipo_transacao_id_seq', 4, true);
          public          postgres    false    205            P           2606    16432    agencia agencia_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.agencia
    ADD CONSTRAINT agencia_pkey PRIMARY KEY (banco_numero, numero);
 >   ALTER TABLE ONLY public.agencia DROP CONSTRAINT agencia_pkey;
       public            postgres    false    201    201            N           2606    16425    banco banco_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.banco
    ADD CONSTRAINT banco_pkey PRIMARY KEY (numero);
 :   ALTER TABLE ONLY public.banco DROP CONSTRAINT banco_pkey;
       public            postgres    false    200            R           2606    16447    cliente cliente_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (numero);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    203            X           2606    16483 *   cliente_transacoes cliente_transacoes_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.cliente_transacoes
    ADD CONSTRAINT cliente_transacoes_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.cliente_transacoes DROP CONSTRAINT cliente_transacoes_pkey;
       public            postgres    false    208            T           2606    16454 "   conta_corrente conta_corrente_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.conta_corrente
    ADD CONSTRAINT conta_corrente_pkey PRIMARY KEY (banco_numero, agencia_numero, numero, digito, cliente_numero);
 L   ALTER TABLE ONLY public.conta_corrente DROP CONSTRAINT conta_corrente_pkey;
       public            postgres    false    204    204    204    204    204            Z           2606    16505    teste teste_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.teste
    ADD CONSTRAINT teste_pkey PRIMARY KEY (cpf);
 :   ALTER TABLE ONLY public.teste DROP CONSTRAINT teste_pkey;
       public            postgres    false    209            V           2606    16474 "   tipo_transacao tipo_transacao_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.tipo_transacao
    ADD CONSTRAINT tipo_transacao_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.tipo_transacao DROP CONSTRAINT tipo_transacao_pkey;
       public            postgres    false    206            [           2606    16433 !   agencia agencia_banco_numero_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.agencia
    ADD CONSTRAINT agencia_banco_numero_fkey FOREIGN KEY (banco_numero) REFERENCES public.banco(numero);
 K   ALTER TABLE ONLY public.agencia DROP CONSTRAINT agencia_banco_numero_fkey;
       public          postgres    false    2894    201    200            ^           2606    16484 R   cliente_transacoes cliente_transacoes_banco_numero_agencia_numero_conta_corre_fkey    FK CONSTRAINT     G  ALTER TABLE ONLY public.cliente_transacoes
    ADD CONSTRAINT cliente_transacoes_banco_numero_agencia_numero_conta_corre_fkey FOREIGN KEY (banco_numero, agencia_numero, conta_corrente_numero, conta_corrente_digito, cliente_numero) REFERENCES public.conta_corrente(banco_numero, agencia_numero, numero, digito, cliente_numero);
 |   ALTER TABLE ONLY public.cliente_transacoes DROP CONSTRAINT cliente_transacoes_banco_numero_agencia_numero_conta_corre_fkey;
       public          postgres    false    204    204    208    208    208    204    204    208    208    2900    204            \           2606    16455 >   conta_corrente conta_corrente_banco_numero_agencia_numero_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.conta_corrente
    ADD CONSTRAINT conta_corrente_banco_numero_agencia_numero_fkey FOREIGN KEY (banco_numero, agencia_numero) REFERENCES public.agencia(banco_numero, numero);
 h   ALTER TABLE ONLY public.conta_corrente DROP CONSTRAINT conta_corrente_banco_numero_agencia_numero_fkey;
       public          postgres    false    204    201    2896    201    204            ]           2606    16460 1   conta_corrente conta_corrente_cliente_numero_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.conta_corrente
    ADD CONSTRAINT conta_corrente_cliente_numero_fkey FOREIGN KEY (cliente_numero) REFERENCES public.cliente(numero);
 [   ALTER TABLE ONLY public.conta_corrente DROP CONSTRAINT conta_corrente_cliente_numero_fkey;
       public          postgres    false    203    2898    204            �   �  x����nWFk�)X&�ޟݻ��l$E� R�YKB@D"�E�)u*�z�PI� ������1l8u���;J���o��w�f�����rؤ��a�e��67��y�����u�����x}q��ۜ���*O������v��a(�2]�sbֈ�X4b='V�8��8�G��ΉM#N��I#���Y#�-�ߊL���M�$ќ�I�;	ȓD{�'��$ PJ@�$:��DI�(���Qeѣ<���z=���,z��GY�(���Qeѣ<ʢGx�E�2�(��Q=*��"zT�GE-9�r�GxTD�
��Q=*��"zT�GE�� ���QUѣ
<��GxTE�*𨪟�Ї"ѣ
<��GxTE�*�U�Q=���*z4 �ɣ|�r2s����+�c�
3S�𘉂���<<f���1���$xx����."5Cp�	��H�\Djz�"R��������E��."53p�̦&."5/p�i��H�
\DjR�"Rs����Ԍ�E�&."5pu	5p�ـ�HM\Dj.�"RS��	���5�)�����!�Lv"�Rv"�Xv"�^v"�dv"�jv"�pv"�vv"�|�B���B���B���B���B���B���B���B���B��������������*��B��Z��r����������:Tz;���e�n�������G��rl��z�L������e3��fz��̈́a/�)�^6���l���T<vө��S9�M����Nf7�*�n:���t�=��T�v�Q5�M����N�i7�
�n:U��t*]��T�vө���SU�M�򶋞�Ո��e�ǲ�tؿ����_6�Og,O6w=H���1��]�~�z��s�����������Gg?�
N�lĦ@6BS �)����F\
d#,���J�lĤ�b��@6"R )��x�F8
d#��وE�l��@6"Q�-c*���ٸ� ���	ٸ� ���
��b��.�@66��� |61���� ��M�l�;dc�A ��؀���@6�!��!|�76#2ppqp !��!��88�Lb�(&��88�88 ����� B��c��#ppqp�!���1��88�88ǘy(��88�G����Cl���`�p��8؀�-��l!6�`q�[�S	�X"��l!6�`qpN!N��)��	88�88�'�����B���S��pp�y6��88�g�����C���s��3ppqp�!���9��88�88�g���=�zF��<�ߢ��ۘ��[��~+�XN_���<���ܾ������cs��%��^���ߟ�1��{Y��v��埰c����~5(���BaǬ_
;f�Q�1ֵ����[Fq���2� �d\I�;ȸ�w�qa)� ��R�A�u�����Mq��e�����OqW�B3�X�Ӳ_N�sj�=����ev�:��:]�٤��2Kt^�0P/�χ��e�w�$�y��P��rC��e^*7�YttC�G�6�7��/�?k~�`���f�,�`Ƣ�fl'�`�J�f�!�`��fl�`暁g�8q�B�gm8q��g�8q֒ �������o���R      �   �  x��Y�r�>k��TR�$�"������w$�D{r�"a1( ���xs��aN��̕/�%@?���\�Jc~��F�|��^'�"�dԽ�.�L��;�v���s����	Io�������?����,�Hќg����������,M1 ���Zq�?4�-XBI*[Xd��/S�@ z�Ӗb�x�J2��c���߻��[ctr���9�����h��+�23�̫�e�|��,yJ���I�ȸ̋ꗔ��n�:�r����~� ����-n۳�I���kQ0E���I���σ��	�s�7��&	�\�@�,�C��`�;��*�3L��ߠ�����t�D!1278�� 9G�*P�ڻ��B<$EI1��Y?�0���$�i���=/8`�J�f����w��-/pv�,D�y���q���N�	�H�܌��5ϱ�c��� �2�P?��3�^���"MqL��J�[���Y�5 ���||{59"|GV��RL
�qK�c]�X1Ts�cPAFk��>�������y�ȟw���bhE�_W���e�oo�zK��L"}m���W�1��=������{I_���>�g�O�DJ�P,� �����rw88A/�|����Q���W,o㝈Y�m��8�[�A�$�X�W庤/Mi~�`J�ͪ�g�.�.'�I�:6CAƝ|z�3^��珜�_ݴ��}��%��@�(svJ��(B*�|gͷ���^j�R����hN��u�d��:���L`:]����T��֎_[�sE�Ml�]�BM�oI�1le�NZt��5�A3Oi���6�iI]Q�EF��� Dv?g�����L6�-�)pq�m�[s��o�������\��ù@����J0<m����9�4��}��M�Pl�Z/���C%�����VSI1~�%�.�I�F���;�b��
>�o
؍|�1�){V�/#[2��8�Z�o��27���`l3�8�r$P�<46�	��].v�2�)�̄�ܙ��3v�QP��T�<�U�_�s��n�[��R�s�P
5�w�F�~�ˬ�1 {K��8�8�*p���o�Q���� ߁�l]�b7pXL`��& ���,Zҕ�gº�
����c���"��!15˵�qɐ� R3E"�4Q�:ɕ�]-�aM�,K=��(jZ�lO��;�a���E�Js=�j���'�F&��lÐQSSc��f����q�Lx�VTodZ���\�b��-?��G�E�4tYM�J�w���M&��rWB�]��Nn�ׯU@-q�S��I����4g}�@�u��+�o���5/����Ԏ�%�h>��&�1Q>�{&����x�ˉ��^����� �#�W����lVa�N��'"�h��4�Pz?�����{T�7��x�#�G'����2�DmEc����O6u��;�ۏ�<���7�H���`-����Z�.�pOl�&%cU��&%�or��M�6^g��$RT�n�]_�T�~�悠c���IK�T�(��!g�!��a�I�,R�F�Z��|Y����ԠˠQ����x2^N.T��4�R�k�~u	�R�^�5��D�u���Ή�ckw�=ջ�5״�8�kN�V�!Q�Ba��R�q��ɘT5��a�S�)����յ!4às��"O1k���(c0���;���~��e�m�[�7��Tf�F:4y̏
Q�*�;��|�G;����.���X?���F��p'h��v��o+̓�OwZͻ�;=|^o1��#x��[�D��(���M������~�?�|�.�:s��/�䉸�#�������p�����yW��dP����YP e�+ދ�a�~~]?��p]��Tȏ*>���%�n缾���np�A���rz��v�۬�߻>|��1	      �      x��}ˎI����+�S�AFpV�R�,	zu�J�Q �$#���ϊ[��|�]�/�Ԣ�r�P�Mm��Ǝ�{�5t�sӢ�J���fǞ��uY�F�ޕ���%��ӡ�O�����q��<�.�g�տ'ɿϳ'�r�Hҿ��JoUs�gz��g=�,��P�Vvbg���C��uq;��ӻ��e��']?�����Iĵ��v�gW�݌_;���M/�U�F����'�;�4e����g���v�Z)9���VVBn��e�1����c�H�-g��W��Iq0��܀~����jz+ZS����~�R��u�m��M��i����A_w�C3�r;�^R��w��i'�|�����Eٍ_Z�g�[5����$��7��iW��f������ĳ��,�m+gײ�� �c��q�ޭ��oc4o���ړ�U�]���tWi�'D�U]�HgTӓ��:^��=��1|�xb,��ٺ(�=^�[�������F�[�����?�]�����֒9Ŏ9�ā�����e/=�?J���/u��쵸��u�9g*ZЛj5���O|��5�*6��^�%I�25{֒�=�$L��O�t_�)�xVF]w�!���+}�u�)�An��q�����.�t�gƯۖ):�X��[�K��x�o��Iq�h4SO7C����x.>����u�֬�x�i��X����e���H������<��			�X����ܗ$"m��̝���İB�F��W]-�j���NK��(aG"N�%�&�����Nj�*��x������O~#:	}[�|s�x��*>9$��x0@=����~�'������]���lI�l�.n-M��"���}�}Mڰ��Ѵ�L��x%�W�$�>N��k���@��dΖ�U�R�m��4S��v��k��� NC��ҳ�e7 �ІU���i=�X\��6օ��$4�v�����N{�|�2hH�qvX, �cC���V���,3��~T*��m%������p�<�	������`�Z��5B6��lZ6_	O��z�g=В�f�������`E���4!�ӑr��Dk��F��0Is��xO������sqU�$��	~j�c�8���J�*E�����>O�[�{�"�X�	�Ó�~�4;ou��dT^=бkȨԆQ(��+iD���ʄ�TgaU�vNc�$yR�������q��b�k�,�3�&���#`�b_�G���{�M�����8�� g'�����_���/��p��$��:=�W�ӥ�qX��@&W�mI��`�bm�@��f�y)�Vf�+��kC���Ǒ�'d��ä"����$��yҕx7>�Q�}"#H�hQ��P�8l176L�U%���Ƅi2�L�I�"�	C��� �U%y6`��t�8����K����F��,�ytZ$�&�E���Ґ�C�Lz�EJR�6Ɨ���Yk�!o�p������I���=�H~Uÿ�H����3Y�Lz�{&ޔ��-	�S"P���r�z�U��J��Na�I���$�n�:��`��۠�&���\�֤Zf�=�J�{-�}7��-\F����/D*��u��Ð�p|#7U�R�N��Q���y_z�� �7TwP���Śh��KB5&F�VV=�?P�� e���H�MYC%SEǔ�J�!�]m�YlS_W�Q�&}�jl+ݱy3�`�4�Z�e..��>�%'-���ᑃ
��˕���~K{°Xl,������Ҙ��5A�M�z� ��ƒ��#�t�z���þ��k��0��A�p�c{�mȌ���=�0K��Ro�]���N�;V��d�W�e�xI �BN�k}�C\�
Q8C��g�o!�mIǅt�`BS�C��r�7a)>��IՒx�|�) �DÄ�V,�e#��A�m)ZŎ	_(�1<�tcm�@'�Zr��$g+��|kԆ<�~�4qV!�?��ō�i(���#ݻ�Q�v���<ג�UEV�P�_�2I&�@�&�y<����E���K&=�.O"ր8P�w&�c����A�T�䱛=�����5(�Z��ݔ��CIH���-������3_�����-���v�3h�b,��N� ��t_�兲 
�����MY�rv=�.E�������+�_֊�x%I����Jb��[��2���_igB#| ��-A4�����ą��N�<Z�?2�`f�����&�	�&k�l�l�#��Dp8��o�̮��|G���)Z���*7�v�iL�3�Ә��:��GT���!��QT ��j)^UX����?�?r �J�{V��.���f�[_��vV{r��()�"�l�B���Z����n:mQ�'Mô`LoY_M{����+?yN����h���sv����J����F��ev^v�#GA�Ht���{P
E21 F�iGge�N��f�h���'�eC�9�P $��,
��G��y*.�?���b�+��u���#Cy5t��83�;�d����K@x�I���}퍥ɹ5���{e��`;~�foIlyKI��$���J��s�B���̖�c>&��E���
9
rx�Y�*�(u�{F�?��O�������3+P
��`pS�{��s���ckf�oR�Oj鵱f�{ð�f�8R�Z�.�%gz� ��y�g���%���[ى�2�W���i�h!�p�4�$$M�dbP���TT�d��L��CW���O�Lk��]��"���K����	�(?��3�G���9�����β|�P�I��_�
A��)r^��҄�[�x��,��.~�c��,���G��w!�
�8�D;K�q��؀��=��O�S f�b�*	�5|tB��x �8���H]��֏�7d�5Hr���A%�w� ��hX�����Q�Jߓ/��j|ܓM���a���w�Ө��������
nf����Z 4LR����b�x-������0o���H�e^�╸�$�j���=j�(� <Oa2GP�#��Z��f�$	��nz��(�G.�@A�y0)H@�>/�Żi>Er��Z8!Y߶l�.h����0�a�VDj]m���m�P��� �	4������V5ڂ���34E�W�҄�xC���!�"��Ѧ��=���%�Vΐ����uiec|l�A�N0_%����t�^�$[N�T��,�wJ��|��CT<�6���r�C�_��F�խڍ_�/Z"~�����v�X�4�]$��6��f�G�OT�YsI������s��&d�S:(k�'�#i�����pJ��V�QR��1��!�rQJ�G��}�Ib�"x�������.���[�Jչ�m͔�6I�.@Yo	C�P�:K[��T\�U�F�)�CH��ȆD��	QM�����A��1�gڻ0s��)Y)����q2kc�ܱEd��r@�_S^�u�j٣�\풨�"ߟY�UP&������\+4Ѹ6 :,R�}ٴh�����Y4(��Ɛ�9���2����C��\*8y-�AT]�n��k�����q_�@�O]��8@[��������I]v���(yf�p�lg�Q���aH�2B.�$ Ƀ'�q�0,_����K�!��<��~��7��}ޖ�x�e��� )Xŵ#Wr��s�G��\��R�n@%]��d��v�>��ב^��
v�+ҭd'iwd����,ÿz!�f(���Nw -�r�u�:KA,�țJ�U�#��2�������c/ˮ��{�-S��v�ӡ����`8ߒ�a����0��e�����x�\���9���b=�U6��7�d�L6�c��"�v�ʢ��d�%���ڌ<]V���^�h�*6��V�Y"��r7~���jRT�v�Ұ���o2�+(��}��"|ygEe�G9[�r)��#�L�N�ex�������|Ҕ��µ2��2Ty�f��oRv?w�yM�\����Y�����PB�N���~�+#|�:�}�7��->��C^�4� m�I�L'Ng���G����v s̔�7��dN k:ҳg���t���%��UB��+ȸ�Ry*ތ_�Ey���     Q�A�������f�#*+.�`�\��ܩ����|I>eY��5A��İ�:�m�l��u9 ����[��E+y.�TC�����ddI�@2,�G�+2�}I�5~��YXP�N���c���aM(�f�I�L�<|�[��"[ �CO1��{:O�bB�-mZ��6��{)�N�Eg����Z�ƥr!@��M1� D�bw{g��gt�68_�a�V�yK@η�~�uC�0�����^X2g�z����a�&=lh9�7�~R�2#����#���Q��X�r�i�)gt�4�3�.�5��jyQ�ڞOםc�e5W����d�,�Z�Q�,vL�6�E\�	\�z�j.͝Z���)���Ͱ1�wq'wܫ�a��0���y"��V�d�w���sP�����x�[��{�QNMD�4ٷ�k���s@q�P{6�w`��|I�봴B|̔h���Ѯf���4؊y��u9!�w�\�~l8��ӝ�H��_���E�%j�_��4����Y9���K�)����s�^]JRÆ�����,���sx������ |����yL\�2��ޯC^����P�:�1 ق��0q�
�����I8�W.k3�K 'HEq1B��Vr��ӥKf��Mh��D�5��LpF�2s!�N�:^��p]P?.bRI]�\����؍g�_q�{�7p�fd�>�p�~2l�:Y��z �_�scP���cPwz���ZG�Zۦ�S�j��:{_sǱx��X5{�/�(Pc�	��J���^S�"�J�Q�N�*��m*�|0�cɧ��%�Hp�%�IӼ���D/"S�6~�-S��.�Nz@o��O{@�� ���r�ڻ���E t�z��\�f
!��~�FUޕ�q2�6E�u*�cƤh2OL{?)/���j�
��u��U	�r�"K⩗q
O�v���D��AP����,;�d�Y�,q�A+�֨0������҂x-$�В����)��U�����U���<�т�	�DP�r��4��,�S�m"�%�I1ڛM�S)ZU�N�����>�g����[�(�a���tn#��t2���iD'i��H��0���0�"��9>�V؎�ـ�H��ȼr��}f[���xO�!W�-�6A5��dg�X㸽��6q)z�������a�h���-�.]=�S����j^��ftX��g��Q�W�cz� *��k-6�$�'뒣��|�U�t0ȍ�NJS��%���X?�.����t����cF�ŸkC��v.��>�����=F�A��2�z�QwCKn��t �_���� �K�PCu�(}��-RS��S��3%�G��&�= �c���~�0Q���x��w�Fk3���KL��U���@)�s6��P���V�о4��쟵l�x9��4Qu4B��}���((���\[���-�MX�ų�u����M���2�ZF�U[6%@m?~!wQ(�@��	��B�%&��`C'�=�B7����x����5;O��,�_��Ĕ��Y���fٯ��Q�B!�:z�����XF$7��OeDL��咰Bu��}�$~�L���_���,@���a->�3��@,sA�������H�N,�c|�>�K���}��I�;�������lN�j�����X����_xHU�»s���_Mw �h�0Z�x�?���3��H��{y�y5�@a�8S�%,�
����+��,=�}>"�c��x�c���e;�v,�G|�<�~�L��L��5���FbY6U[��荸�M<�K�p[���:�$�i|ΞiO�D��ٮSْ�����i:5t�د9�h�,�Q����G��*y�����Ü:DT�0��|�F�(% �k�m!�ORn�ۢ�	����{�h���^��N4|�g�ҁB(ХN�<�̥M��Y�(YTj�1�Nl�D4�0�)_�ѧ��0���$L�˔g��-�Kӡt�ߦC�?����Km�Eɣ�a�����Nt�P��@$��'^�B���
�Wi{����Y�� �B^��$a�jז���.a���<�b�|��̪���5�j��P:+3nh���6���HH"��Y!���+@И
L�6��!��N��H��W��d�T��%��-�"��Е�s4�"���*����V��Cw&	te9ܲΝ�^�U.�s�1��Jh./�X2쨮VS�]��l �)z��9	�E��?�w�5=3��Ż���[|�yD����cc��d�A�!�� �y�f�D��4�*6�;\��yb���F��`�{�-��U���8d���p�	N�Uh�<�/�����lP�Cv�ځh�b�����9�򫶰�jv$[k��p|�mffP Z�8͍t���ind\�>5�:/�Q����`rS��;��%�v5MQ�]W�r��T�c����65�xN��	e@���e���|�?�2�O�S��?Ŏ ?C�&Q".I�!�&C�#�|�8"�ˀ,a�I��KP�Y:�� 9��@ǯls��k�lo���"�|�x~d��T�(;)p�K�
;���0YW���VS�ǐ�+y�4�}���wob�̚{��z �����S��^�Y�{��i�O�Ƒ��'�Ri�m!"a��qq���I��5\�^�J��zr����8��>�>4%�4�/{!	���R��Lx{�I�MF����(�Q�;K���R�����{�iD��3Ӆ���Ǚx��n��^�Q��H�my.�P4%ʹ���SA��@��m���c<���k��Q�d>�+К��n��
;�àI�9��.XU3U����z0��C�:�	�c۰����K�`ֺ2=�L1yl�M-$H
��^i�������b/�[�Q�e�L�x�9�/YN78غz{�-�ӛI�����$��Q7����``v�-! ��|�'b҆i�1#M�h�d��K��h�i���<��2�>C
��l*)߷�⁑��R�����u�Q0����zkcw w�؜��iO�b^m����-� �uq�����k0�?�n,/`k�T܌�՞g:!�VI��iN�xC�p�8��HZ2�an'9'w��K2B_9d������S1㬾�+I�ɳ�fʞK��fȞ'�F��x�L�V����[f,+`��M�q�]�#��d�c��4.���Z�h�(Ư����(��������.���]0\�,�� ��z-bqa��M��en�y��|�[;�򁍡*3S�^����혰����������x�!#3
��C�(�����;I�����\���Kɞ��8Ro�"��s���;4M��
'1~OqX����`/\k��c��[�l�����AV,I��ߡ^�(kT�:����.�y�����n�<��o+@%O|�0�L�Հ6��d8�E��e0"�@{L���N�,o�<M�|�Y.�YB�u5e	MוO82Y.mBm>u��V�dJ%��?�ˌ�$FVL��ʐ.�p���� �����j0�Ւ�������ရ�u?���$ٜG' }p�0��W��݀�E�Y��`��U�w�R��0Y'�x!�u���+KN�i'8�t�p�3���MM��6Лv!/6G�o�9[�68�iW�I��t�/�P�򼉏�#�̈dFу!=^����i{{�ԕ�ˍl��=���[m` ��*n��ȍ�<�ǲ�β�|�l%^Vkɽ/|��Zr�����s���ȩR��7���a�5���A -ѧC |�9a�Y�O�Tcs�v�+ދ�O��}R���}^[yf1���xpB.��j�|�N�0��W`�Q��ieNQ1'D��K;s��}��5.�3t�K�J6�I�Ì��b�Z�M��$P�j�jW��-��<����4&�E����z�Mv|�ڐ�ɣ��3���΍f���3 �*��r�����R�!�a��%���ʺ7��ʺωìR7w�@m�݆f�-�ex����X���TYM��[&%c�ڄٕn�y��bG�yS&�U�y�H��ޢ+���\o�����A��3v�1���{E΀*��R��U�0���UH:����IiL�t3p��S = ˤ�H�F԰5E�r�Z2��<��� >  ����󭆍<��wiYab����M8W��#����^����ؘ+D���>����xS��x1`f��Yl��̥5����ƞ��w.�y&���jѨ޳�j�������x�^C-hg��|�jJ�}Td�����eJ���ڄ���9̞a�+�QH&�cESE���j9ե��M#�}2N<�J!�c
�!��D��+Z8uϤ�S�\ԍ�1 HnY��@r�jh9��͑T<k�*���I��%������e���]U[:�D�Q\q5%F	l��hA�i��w�)��� ���0ϖ��ik�g
C����\n�{�g�X2��⹹A��0�`���QDh���)څ%A���;d~&�NT��[��1�=��LM�a��A�Ɖ�e.3���h��kB�)�7-NG�e�ӸѠ8�FmqanS�\��<��0a�0k�����\�[��>(s�ox�h�٫��\��I*�M����4�MFCN�ϐSC�;��s�Ji���kC�O����b��\mo��Ɯ���L�j!X�%a�~�8��*�$>�u~��eN��k��>�I2])f��s�����NA�"�H�#䨁�Fqka;�,Nss��>�@b����S����n0���x�pgq�e��Ax��I��݋�	x���^����y�j.��7��q>��V�:��\�G�h�1�k���e�D��4:�j��­o�V�c:�r����q���q�R�0��x9�dn�Ye��<`&7&e����mxИ���r�d��g*��{�
ڣ��5���co��4��s0���o�����^��b�o?��ehy�G	J4����4?T�i��0T�i���ӕ�~��鎚j���H{�0S̶6��iT�H7�1d��.0R�.����� 	������.8BT�ӕ�ֆv�~k�Hl���rl��݀�st�"=��z����O�\��=wa�4��h�B���6Y�w1#�t-N+����I��a�.���^�I����LV�A��W���\�z�IG{��>��f��������F0�ܾR���	��X���2�3�:��/��V¿�i�t��di�0�2>��\�7LOM';�=�2��1P�s�P��J�J>�y:p��V������?����_0Ր\d���N�e�bl� $�/[{5de���vm;3���m������K�?ĊN.2�������(�=>��s����9���4}6�[X�n���!V�Y<0�V�B�`B��yI�C�!GbHߏ+|���bW�q�rd�5�)G��J�`�d}��P�O3z��0|]F$�ek/��u�W]���l���޸c$��Ѝ�R��7��j�g��N���'�Idf�w�1|]����W�f�J���(�nP����8j�A��!F1C,�a�Q����cRSa�p>��<�+1׍xl@��VA�׊V�Wj��@�3��J�v��yL/E�EVvX����i!n`��7�����^�
tq��@͑��Yo��3Ϳ���jb�x6�i|���j��40]�̢�4_��?w��nO��;�w�-��0���WTn ?�Dy?'?�!qӱ�ĹLA�4_�ىn��l��ٳ�Wht3I�M`/�o
��_��j�Go�`�VL��������JB�Y���mӾ�d���L���t#;�f��:%�ȼ��J�-�?���-�F�ޠ=�&��Z�L���|��ҕ̲��M���a���ly�"����ҥ�q��[h�-��i:�ǖD�#h�&���*Q�I���x�1�ϴ���iV���x�k�<z�esG�ɍ]�&[.tω��ҁ��?���/�oo���      �      x���Y�H�,���s�	�}yg���c�
У�I��HwvuVh�n4�aQ(�����J+��4>�S���O����ǒ��4�߲����o��7�?s�^��)���'�3u�=g1���F>!����1l�y���z#p���m�ȹF�eΏ���O@W9A;߶�OY��]6^��n�S���x�O�%�����#����(�۰B}�6���.[b"�	����?��y�d�I���'��+�\�}Թ�e"���i�[ޔ�]*��YO��[!����{k������(��ic촸k����u��_��'��ي�$���~ǧ�)�/�[���s/i��O�O��qf�J�>nk%�����V�����*�g�Y�7�~Tm��=m�Vl7��E���O�e�.��̝W_� �8|�n��s��/{s��{;�X;0�v�}�\笣7|��Ǯ?�����R؂ڛ�<&\^��r܉8���k�:�`���R;b+���ٚ#�!��.���w-�=�G�i�l����М���g-���ɵ�������q����Ӳ�8f���}i?�;x�WyҮm`ʹ��i��5�x~�����{�,ك�rp=�S���.�e�=��#?�c�qW�M��{n��
�Nf��Ź�[�ޱ��`���4�����ư_�����sv{�};�|GҠ�O�k���^�(�?��Nկ;,W�e�#�����z�b�n�]ڮ���1�ࣅ��l��n��`�m[�x��g��l?m�=���+;<8]�;�A��O�7v��j��|���~ܒ�o>��#��g׫ٛ4:�nEr���y3ے�+�ʷ��7V��Ϭ��2z2�	�';��	��unfqZM	�5�s^����z]Cvr���U��c�qG7�|���-I��=�����Ƞiж-�t�����L�ՕjM�:��	7JImu���U�=����ew_����dpo���~^��T��-q8�%	�~M�����S�g��c��Y;��sھX��|�����Q����ٞ(�	�'�����-��^�f5������[�γ�����h�v�������d��3��`��[�#��ʌߺ����?U�%�v��7۶X�</�_~pG�+�_�ϼ�v+�ތX6�˶q3Ş:���>����	��js$3���O���xm�P�ϙ�2l3�6C�{ܧ�po,����e�p�ف4�koi�n���׸��/p�ٕ�۳-�v������g�f�F������|��'w.w^U������c�����n�`,J��%3��vp?�Ԋ���%7��,S������.|b�;����,�(��y���v�Ň�;򶵲�ˮ>?}��:���8ds�56�E���q߲�o��Ȏ����w���V���"��-Zr����U�����J�x�yܔ3|u���`��<3�C���q�v Aw�LKM�W���(lF��Zv<�s_V��6�.��C6a9�����+2��v����_��Ec�h�e���{��&��V�>��an�٪�	����3q�������3Y��� D���Fk��-��Ɏ��ô|geF`�\=�-3��Ծ��Z��pqۃ�ϗ��t��#�Ef�+�3�o-�y�"D�P�Y�����a��r�j��̆��~�΁=nJ;������������E�ُQ5#����s��>���Ў�䰠(ۏm+�����o+��Z����m;�U��7UF��Z�MN	�9���"���)	�X�P�7�a��2�ii`s�����c�U8̍��a�=ۺ������v����2Xh"��_m`���A�`)s`ϱXNn�`�V��������E~��+	j�]īb����*����۶7���$q��^;b�4�@�!�gO�����v/��s��)���ȩ_�'��v�F'����mhOs'�w��3W�[�z0�>'���:�m���Ӄ���S��vN�&f��~���g-�+K`ϑ�><���ֲ�9����:Z�wNߢI��.cÙ��j�O=/x��a��J�t����Nb�����0�r��ܙC�xn�`����ѐ :�r�#��8��- ��&�\ȑm�/;S��089V�ڑlw��_�?�����Lȓ�d�%����2Q���W��ȭ���G��	��/G�T+���T�����tIWlj��.��|��=����%�jF�|T{a�_��[�K8N��`�:M�M��D��,��ڊ0�+�=��'�D��>�)Xm0�(E���Xm�e����\Тv5"�nε�Nc$&Ҷ��w.a��P�f@Oۑg+�w����Z�g ۹���p��܌�L�۶W�s�>aUЗk�_� ��
{�1�m�u~6r��w�yAs!� �9x��U�K��}Ӈ���f�ݰ�5�3b�[�kD>�:�3�ھѪ]s�<Xm&| O��-�vFڕߊN�a�nT��`��?s�V�O�za��~�n�`�=������.Y[���ʖ�[� c@����Y��
�l0I����H��>^z[m�I�,�����r���:_���43�A�r
��gw�Zs�t6��OϢz�#o���7�ՙw��.o�Y��rM��$<�M����,�3|��Ɗ�"��oV����J�(+7T�>G�9��lҴc5���ϥ<T�xM�1��3a���3W���;~�@����>��s3#�تb�����^��]S#9Rxڑ���^-+�e�ç�vɝ7vg�*!#Pq��$7��.��]�AX�-b����U����X�֚;�9Xx#}\q>�(˙),m�!YN�A���a�#r��gwi�Q!���7�����ahq�z�Q����*d��yScYq��*�e���A���B��-s-���L
�a�S`>�u|'� ���bwl�ϛs��j��]S��\�ť�k���<q���T���f�W���{��jV�X�0�0 #��asv���>'t2O��}��od�*�:v���`����I��S�,�T�A1��|��Hד����G��b&�ȎX�9���(��M澰����)g��x&,���m�s�=�F�������J������L^� ��������$��A<ˢ ���q2C�JuaR�����P $�~ �4�����22��R� ��[�0,�����}��i&�L�4m����LD����~9�5cϱ$����eO^���E�Ǡ�l�Sll�@�)W�E���>_�*<��3KB
��\{^�վ	���d�[~*E,@2�*#����V��=9{3RvI�f��\%�g��۫l9<����Ws-��Q��6���k��S�׾\�چ}b��a5��v�.e� c�~1L V�!�={ԃ*�V&%�cϙlp���q5�go��<.�T;�����JRe�KOf*�]���#�l�̌�����YԢ�:v���+c�J�AE��G�+,`-�����I�,���eCl7WP��f���V{��N��c�L����sG�+1Kir�z����,<��u�C��n�3ѧD��ۚ���:��Ϯ��W��ӌ@G��e�&�&8L���z�6��PMIa�6�+Ŷf#׎�C�	%����̴D�C��]�uK���{BE��d>L�'�ӳw���q�ـ�9�����Q�a~q?����������Ƃ��Zz�c&��º��L�Zo��(���ݩY���-V,W���K 2p�|<�O�ÕAq��|���)�%��(Z��
��|�ᓮCO�1�_������Z%{�t��.�2Y�>�+{��\7kE��ٹD�����<���s{e���ܑR��R6�Y�+�`�cnq[�����r����̢-���6�s�-�&��R\G�{��`�k���o���t�N���>�cڎkfh����1lr\W=�,����$|)#j���RS�1M�Y�~��]�6TO;]�T���,>��E���L��ƴ����om�3��l.ZE�����F������&�U�$��R��c��?�,z;�M�Sb�EA.;}|�Tw� ��0�2xA�Kl)i��#\1���9p��(�Y���I�,�    𖵉���P2)̂��'f�E�����|i3��)|P�]�Y�t����z U���F��	��Hch����5��Xa?������K�$�Z�^W�K���l5��g�
���ƨ��s��`��B,��[u�x�P�-�U��gP����	�G�8L����ӟ~��-
�H���-B����s_
�H�J���,.��'�h����#���ׂk�"���/r� ӯd�v��l��υ������yx�7���&�)�q��^_�����լ�7+TWo��݅u�hx�>��9��E�u���P'=���e�O[�#�4��
�,���GE~l^ZD�F����(���W���N���ㆯ��mp#�G��P��_`Nc��+��?��s#����eQ���5�x�>���sn�]�����&VYm�Nd���7l�zF�6vˀ�`�Tr�8�;�53��'�g9��G�a�m��>g0禃��?�EeH�0|���"��L
M ������Í��s-�\i|۞eZD�;m�T���Q���.؁9��)���of��Pu�*$�_fK��~����K�	&�@�(�4g�0�6칹��{h�͞�x�9�_�u���v��D��;X���m�`�5� ��^���A$�`YX�H��L�T/TW�qgf`mtc���Z4��p����#'?%����Ѕ\mg�b�@�7�'H,*���%w��L�+�ŇW'z����!
}�Q��m�P���|>O�cH�yo.Ra~�n3T �E?q})3+��jo4g��y��7"u�-t,��K5^:��K5���6��8��X�퓙v��m�{���%Uo�p;��ޘg�3���xHq��{p9;����PwA�׻~�%~�?>/�n/���d���"���z�9�f�n'�;�gk��hM����X�y֛���]E����(䧰:	�|e���ݑ�W���98���ƣ�ǿ`�c���s�z����8��f?g��F�������&ĮP����t\��vuo4n�2����s<��;��_��}̖A\b ��$3�Ii�Ɵ��S�{\���"���"�>�9r�nF�X�vt�3��Q��o��m]��s8�,2$�{�B�Ye"���1�ϟ����t�y�;k���ڷo46�������5��T�o����[ ��{��A��Σ[���P�(�Zپ,-�J���?A#�Eڵ}��iև���]EDo�͈8����^�&F�5d!c���L੥=�� z&��}��)~�x� X��iH�Д�;��-T��ۿ�=_Xt>#�l|i�.��畢��G�w��`[��9Sꕊ�g=	>K����ա������s����N������?������>!V�t��-�?�R��:s*j�O�_��]o����u� ڥͳP}����K�����d��QE�s��F.���Ȧ/���"5��W{(AEd"��|-�����]/�s
^�kE�=_���Ǒ�M�z�/!�la/��I}*�з��+���#�=>I����gFU}��g���_�/�������'wt!�\0�=��R{N�#�����\�V��S,��_d'	=�ނ�f�L��w��'T�����v�.���O�Hy����eA���U.0����gų��s�?dm���W�%��Ro`},��WɝGf�ݼ�X:��r�ҫgܸ�y=~TM��I��#��ͭ'H�yG� |N�T��ah{Z����M�����"q�/ؐM�+��[�jm�WY�*c�]� �y���}ҶdFr��_oG��p�vd�����U$D��f~����;t^�I#���ăg5����^RĊW�a/��0��=�j���.!��{��k�����\¼- �(pz��G�\�H��	IZpH��xR���o>��2��ѳ�Ѣ ��pF3�������`��
�����v�hR�+*���k��f�'��o�R�h�'Ã�L�w���K�L���k�u�������~m5{���>[�j��pЂX���ϦH���m���@!X�Y�v�"��� �篻C��f[�l[!R��+��ȶ?�G����(��;�n:h	�=<{m�Ҽ�B�6C]�8�+��`��늿�:�Mƣ{2]P�k�r~ �k���9�Ⱥ���߅#a��nA������j��dVf>Cd���x���4�8 �5���L��v�Y�4��vN@ω�7`���X�,��{��@^�&�YM�9�&T|�u��
�-3)�ӱg�Ջ�#���ʔ�'�~���6l����d�ҋ�E��Q��sM�����Y3�]I��Vp@�'�-Z��j��&�Ƞg��Gp����w�LA@k�pG~��Uذ�{�^�ȷ��%�~��F��:o"����k�}3ꨞAkdy�ͶH�?��|���i�w-���G��>����[+"�g��F7���C�y�\B�}�vcO��K�,A�j�}�?[}���oL��Q&�p���ȴ�2�
|���۫�Z��*���ߵ�����g�4BϿ5��c������u�;=T� =K2Q��<�*׆?��9n�e�Q�q���q��-eM�9ܪK���u;R|�q��m��a��=�bZd�t��WPK�� e���!�ˑg�F���ͷ�Ǟ3Jl�v���|^含�|.Dq��V��bw�j��`�&��H��jnc>g������Ĺ�֠j�"L��o�
,�� ��5��9�=�a��0�լHX�����d��o�V��$2����3G�h'}����"2_H���+h�K���ٿ�R�f<��2D��s���r5�}+�}�_�]�n?��Oę����5���|N$Av<uxf=%����>�E�,�x�؝!*�0v��PF�<�}N~��~JPhܮJ��V���/z��zD	���j����#аu�O�yt{ �2���Z�W����w��R���#{�[�|�18o���j*`@�q��?���z~�f>Ι�zC!��oW�����h�`;>r�`z��v�JV}��J��{J)��T,A$��-�>��,/����[����C����.�(�T<ÑK&\\���4�"?*��Ƥt�K��"���E���(Ch�Q�۱b�CD\�i���|r@��	x{i�$lw���{�ݵ����h1�� _顢��}�oO�c�@/Es� �;�
��-"ې�yЪ Z����9Z���%G�T
�	�G��"������g
k��m���~���P�=?w�7�T�oD7Esʻ}[Īsv2�uSJr���>8V<���#�q�n���=�����,D��-dk~�**~�N3�f����`�C"'ߢ�K�@�}��z�C����07j�g�3Y���ӥuj&z%�Al��d	��/��]��sʹ�kT����ϳ�R�����ZΈ�DJ��~5�����)�Q=b��Hu�i�>�㼢�s� v�X�H�#�f^���x���P�q���P$ZѦX|^�++����x-?>��tĞ�-z./�����w .�b�Vno~�Ϯ[�ƻ��l9������Y�cd�����d��fw��5w�Nq�W�����_��~h-ϓ3|��:��D����zd�:z,�R�c�0�}�O�k�?LR<ҩ��1��o���b��6�W��Qv�ĕ��x~�*���ͣ���i7C"Hd({H� �7���m]�T��+_���>X�ϙ�^�W��bG$9{�dΏ;��\{4�\�t���t�Bރ�BRg�Pc�E��9�"���Co�n>���I|�WHJ���������ˍ����ȏ��!ǯj� ��,Kb~� ��ӺC��rW�</Bτ������2�/��}���_w�]۱�O���1�>o���&*1ďB�H�ż��6J��35�G�.�D�]��#��='�z,�i�N����sա�g)$B�)���s#�?a�1� Y3h���c�2�M�.�I�ؙ.Vs�-u�yg�V�}�Y@��x��f�3Q�����:�b��m�"&!s�"?�O�ﴌ�2���}���E��a�>GU��=�    sɉ>�*�ř��֝�Ь�f=��-xoN9��U�AL����c.,��1�m��C�_r#(�H���^G�G�9�1���1�Rln��5*h�l=)�/�j�M�������x9��|vB<Mi%V����LXNcef�{������;2�>�v~Q���ao�IYO �W��.nF��ټ���+�XG����?:{n��s ��;Ğy8}�7�hG�����d_آm�Y��m���{�@�@�s�%���Z缆T�]�]��RF7����!l��T���h���"!]�Rq����2g��`��W��j���h*��\Z�-޺e�w�}yӏ�`�^�}@�"��܂�f��t)���־��������g��� �C���"y���%�`8=�ԙ�د��Sk��:�L�}N��`�?��!��|���6����G��2"c񹇧�D��-ST�W�2�d�ɂ�l�`O[�7t�v�W�`��^��	�\̍}��&Z��"�� ����.����@=�`�s��tG������D�������٫�Cõ�� l�4�ғ�Oh�!��������w�R���tfD�w`oy�v"��.��b`}���wz�^#�l�Æ�=\�'���^^�V��Tg�p[���	���v왯2��T��.���Iw��s�d���]mq�d���C������ܻ���T9G�����,~����`m��yQ� �?p$��p�C�9�J�}��������	���ggd�k^N��8��Z�-��!��Ʌv��R��]�>��12�AW��72.����3Pv��|�&!k�h�v=D�9Œ�����p�=[�kh,�e�`��>_3�����0{�lcu�8��� �Y��b�(XW��|.�X+|
�h�@�gϋ�+�N�آ�ut��
�L�]h�_����;�����M���g�P�˴��m
�~U��- �AM�d�|��Ǣ�S�|"�k��a�s�|��2ҏ`q�_$|���;J[>�/�����,��c�2�⒮!c`qQn�:厔Þk������5��Z+����h��e�#�	����fw1+�)$xw����u�/�A�T�e�σ�g��qgÝO��<.���S ��yn9������G��R�;��U�'��%��U-�q	������h�e.��&tD�A���6�dׅ�2Lu[~�o~||`.}s�H��%���4E�Yp,G�W�V����au���b���^�S��y�������+��3�`��C�&�<X��$gW�f}^�=�K��١n�Dj|!�Aȝh�`\#d����>�w���:������"����0�	t�mR��=��*�>��~���
�
�yS�Pc�SF��t��S�U����E�v�+".D[`�z�+��RF3��q�7�h6�El�U;Y�=��mv͒��W}�t���AG�,���u�J��˯E��.��v��,�U���$�o\��γk0�g��?�'Nh-�XJ�sL�QB#p��4��g����Y�Pa9�o�&	(K�&0 ���8�^��Rc~�ś.8b�bUE�\���"e�F0��X����L>�,4�G��,2�s�ϮR���d�*or:EJ�K�Nl���� ��#��-Wt��!�a;��^]���`���eX���
a׺f�����ITk؎��5��"_�jш�w���p��k��
�n^�c�@����|�-�����z����R�P(��!:t>�����b��w�Gu��H�?�O۞R�|���#_�=k����+Z��ý��[�D��g$�3���}]O00T�N3}�H�t {��f$��+ ����{�{5o���	�{:#c��|��q_>烁=gP���oST�<'fz�H�\��!>?��g;}l���TT<�q����p�>{�V�8(����I�̃�虦1����WD�*��C/f�� Fj�_�l��N��A�l�f�E/ Ŧ�$�}��R����/Xg)�tl�E`����[b�?�A�#M���*W��g$�g'p�<X�$�hПI�%�w WEKJ��<o	��:@G���خBW'�Ǟ{�g/5;�"��&7n�}��k�s[����E-�,{��_xwne��y�	r}�h,� zMpq�Ԁ�0�9ٵ;۝�3�~^�z{��v%J*����#��\w�E���=_��^��_��"Uxfm/�tb�ά=�����(�\f���ͧ	T��'r�������J�9P��r�C �܁5Y��k��2ۗp�sP��ˌ��*�=ێP��aŌ�U���x��\�>�]"�\�������	wC�/eL��l�����v5�����щ^[�kS�gų����Kś`aګ�.��,w'�"����8_�ks~r�_�gg�1ƙX<����4rψ�W�t.i�#�����s�3'��src���ӮK�9����'�B�U�8�>��띏��N�����U�τ�����5�g� �P�>�܋Sӷ*��9�6�5�L�-!��͎��{��s�o�8�6ξ�(N�ʾ1d�+=��@�R<Y7��-��Ra�����5z���o��<T�:k�������P�eC6hF�X]c�Ⱥw�솔���@���7�B���y|v'XM���	>��N��o�D�Xz�g�Ģi����<��Ee�|�?-���J���E�f`�B��!	�+ēe:Dusu�)� �WbťH>̃T�c�K�\������]8،?w������l7�g��\��I�p@�G�$C�YXs��R�!w�q�sb��3��A*{�ӟ�w��B�7� ����^/I�E�h����f��d<�}s.���db�2R�TB�H6����^|A��x���%x�sy�?c�;{iο3��!J��F�r5m7�'=Ab��Ѯ�q�1t��`��"R�J�t�]��h����i&��
�U���	>�`���{k�C���	��h{:��\���RU�_$���jy\��ڷ�iL4�� ��+J8v��";e%�/D�>�>��Eo"o��|�����7��v�,��J����9TnK�nE�f\���LA��ϳ���9Ҏ>oק���{N,.����n_q�W�F���`^[�s�ф\�ѓX1�aꑣ�K�7��ϑ��ˤ�o<Jc�Ճ��5��*8�A�e�k>�6]�(f��zm��&r0��
jQ�ʡ�>Fb�/�
΃�gV"��GwI�u*ߞ=;����{'�����u%�!j�o�H+�E��Y���w&;�l�"]�IB�����'>YQ�W���jM���-���oj��e�VySZr��l���]���sae�~�\<�[� �6�oy��ܼN����9��1H��Gwwy�y��a^ �UF%E�a����]�O���^���'�12����}���������6[4�| jfm���h��}fD�Q���fr��*B�Y����IT)���%�^�T�=�Vו��U�t�y{�/+�w���'	����?OeDZ{�1B����_�����s�+2�wAA����wa�®��j�y���,G�~s��0�.]��g�z$(~ڊ	=+��ù�H�apy�i"X8����h��"g�M`Ń���f!�\����>0��svc���>�����ω�ui���T��%���˰`f��`��A�_~��؛$<��,�+����ٯT���v���Ӟ�3�y�G������D����㻏�Z�ct�MÊ�<ڛ�n�]�H
D/��d	G��Up�&�}&����?��q�����A���g��b�(�9�^۸�����=�����6�
�7��PebE�b8�ɉ>z��f��D��5��?�ʊ��^1K���hq�̗�Ǟ��5M��<n�'xu���E�<CF��XsE
�K�A�+2��!�f	vgB(32�]Ґ8i'Zܐ������F9�+t�f��^^��j�3=m��Vܯj�"������T��Ԫ*��'���l�T
�x�k<#�ա�^�X��۴�¦K��q�8�h4�T��r��Ӭ�A�.�K�0�;��v,��=Z84�!-)��U����    28�R#��W��ļ|6{�)�-6���_�kt��ɜ�zB�p(��4�!�Wە*�1U�vz�)q���n��gS�H%��Ԣ����v���c��?x����d��m�՝�>��;E��s� �>.��D�oG�>^���qDS�c�<����R�7�7�Ϸ(K\n�<G=�Gu�e���#����.�O�yO� ���W��W���s�n�ऀ�c�!����x�s6|�r%g�.���H���w�o}�D�C��z8��q�����sљ#�<xn篃r?���S��Q�D;|<�U���XlZ0\j}้��X.q"9+�.ȍi+�P�1y~jy��%�l�w��<(�}n>�-qՈ૦ټs�6�
Od��I/��ى߉��=[���#�:FoPe�XG�9��#u���K��Vǧq��{������l���#D�9�����3�k/Z����g�Ȯo:K�SWf�Fy!� ���O�SQ}�!��,n���ml�<�:�.������7}�b�,�{�@���3#Ԕ����bЎk6_t�8T[�����V
A%�1��߾��9qG�`��� wsI$T ��v��6��>��}�Be�س����`CT��=��Tx��}f�Тۘb�)��7����<�%Il�%������K�`Zl�AJx6��R�����o���1���t�.�n����'��2�&W��m���`Y��!'W���;��w���A��h[h*=�r�Gw�K�#���,E�أK�����^+��8;��5ޡj�_�͌�L��Xa�C�>/J�ά`X��/�4�;!/����UO���M��h����-u��q��J�bwg5�)���
���w������t��9 �xg��PX����d�]�K�.i��󋏰c���H��)���\��~=��8�lF����9{>j9�\��A�G�GE&~{ъ��������{�|�j�/ƴx�=~��5|��OI��+y�)���Ƃ��܂=u����������K���Ğ��{�)�����:�ں6(�*�%zU�$R�����"��'���ʎ*Wa���g�Ξ�Er�`qe����(�h��3(����ʩ���,F��������ɰ��+s��
�-H�'��nah�n��b�j8ώ��3��K6�`�;T���6״��0���	�=_�1��at��ϗ\p��Z�=^ƶ|�n�5�Lt�I����x�k����G"�!z�w_���y����=f����;_�̯2�"�˗
�m��̏ �l�T4[gt�z:�5���"�n/�N	>s�7%q�aB}aF�/G�ܰC���5�s�"<�]5k�K�>Semg�]�C�G�k"���/�ޮ$#��6�����|��X���w�v$�����U���L���K��e�"[P\.>��wf��_���4x}�&B�9/n��B�>�������#��أ�j��d�l�ܽN��W�
C��=ykkf��z(�Q�t����7��y�8Iv�\��^�;������<T)"�`�#�0B��)�БE{���Wa�㛆�;��j~����p��ќBA�&`�`����p�3����=m�~��Ę"�f#��L20��޵�r��
���=��&��g�'��=�q��xG����x	��s�ޭKX"o�$�w�"�8[�˱Bu@��~r����C�*��zEu�pqD�����f�1���#C��h}]��w�%ꏬx��d����}�AÈ~��TѴr*_�X��!�僊���^��וl� ����Fc�5T���dy�E��3=�H��B�	=�9��G��a��a�\
��]��"�E�X���k�z	'T�B�����C��B[��A��PS(X����Q���{W	�g*��d���5V&��U"�|<#]nպ^�߉>�(e{2���M�Y<���hۓq������+�H��U�}x7U�I�0��e�r�;ʞ�:-h�Õm	���h�IɀlNr��"�ӕ�gY��ў�_�e�\�!��q�
�hZK��1�`�!c��WI���������\��ᛏ@���ېB��Q���~��D�8X���Dۊ���t�����*�k򒰇eb-��r�9 �)h������X~\����[&��J�)�����"�V�`�~��m���E������G��;���!œ}��z^ݘ�s�.Ni|e`�_G�Gܶ���\����œG$�X�ح!�K���#�[3�} �W�s�9Qb��y�&G�� F���V��g�,�_�l۸H����\Fs����:Yt����隣��Ǚa��p̯�6t�z*K��`벩uɁD;���N���]^�`]Nץ�2�1�?uB��5����|�:����d��z��`>��6=��sfݰ���Sl*6�L�b��tb���R9`���4l�
0y��-�3z�� �#ށv&�� ��xl9X9��k�jFWiw����/����
��"}��*A��SԴ&�N�:/��5Qx��b�,��(d��a�� ٗ-ya��+��۳��|Eo���d}C���3Q?�3���S��nM-�o*�7��6��e;Hs�Y@�%W�Bh6֢��m�o3�;����4��U�B,��5.*�j�t�y�v&Q���V-K�V95��s�7�_.���K�:�������Ӝ�P�����\P��������m�:���{����?�,]E�r���ۧ��A��O�d�ǉ���c.�[�����KW���4-}f�z~��<_�o�x?���H�^iq�]�dg3�5����m-��: qɵ3Т��pN��E$��l0�a��xO����*�����1�޾�(�Y�C�ݹs9�m�q�fu����$�ȅ��H�-��E8F�KL�� 6D��z�rtl�du,�>�ݪz� AH���/�P����9U�=�u���mW���y�lJ�>��i�w����wm`�O%�4��$�L"X��jp�y�KeKg� ��hs1Ւ(�Z�K0\�V��B�o���%���+W'h�!�.#��>Ii&17����/�RْU��`t�d{n��lTB�l�(��jS�gJ�z.�h~ci?��r�����fD��i{d��PgG�މ�9�gH�W_ �'�Q&:�@�%�m@夓F��s%y>cB�ÜC�E�M�ԟ�+�/K/�Þ;2M��Ha�E����>���)/�ha�ˌ1A�2���\�}F��'�O~終w���r�PaRK�-�"�����v�����j�֘_jP��ޣMomɪ
�i�;������'�M-�_$`�@��R����73���<Z��ӎ0f"���P�jQ���O�.,�_�*�0��y�<0��p�Q�O����Hr1M2�|fxd�8
�;����|���̜�5'w�����efK��%�����v�X��f F�w��aW��L�&�-�2Iub�-\�@+���U.A�g�w�>�D�h*ݾYK���-"��?��D3L�fa��Ԉ��ܟ�07�6v�O��\�7fw��tI�ES��3�n�yÔI��(�sg`ڑ��g�?�$���^�g�U�x��&���O7i#�a�
ܿ�"����z��R���(����׽�;^�Q}^l�K�����(֭V<���G`�Wt�4G��3��>�R.R�9�=�H@Ȼ3z��"�/�����@�
��i��3@�L���̑�|̦'3������?�/�D��k�����A�m����lQ'�����??���+ D���F�8�W(��0��Q2N��E(?�d	�|U
���{�G�?�e4�[�QL�Ψ�ʾ�L���`��ɸw�Y��Tx�S�+�]:y�,�[ٗh��|��C������Q)�?���.�R����f(�oC�T1s��]��X�^��ǳ�,\ky�^����[ğ��ח	�<t�xp2�<>�>qK��W����WWm�t�A�3j:Q3խ�l�~�.n�&�~�
P�"k��4��j�9���3}�h��w}j�؋*�    C�	�U�3��D�_�S��l��F�,�����A#]��o{�Bߐb.c0٣��*e�5��b=��Do��K�}U�p}:�0�EE1%=�7��;^�۔�׻D}��;%Z�͒���W����=Z�s���B5O2��|��5C���U�g̻���ùDq����t�*d�U�)�E��-�P
z�cA���J.Ww��8O�v������Aؗ`a
��F�4��ư�~%?�+��X�_,��w������u�����A������ri��y��|*V����ų}�
��|G�m|����I�TʳZ.�"�,��P�l��47w�c1�"ئO��>f9�#�>s�2&U���O�����3׳����Pʎ��\=|vya]����[L�S)�����X-��|s�����,`�/R�D6|��~[�V�F�2�~%Wwe�܅93�����m8�*�	���}�Vn�h!�b�,�p�����p_�%�y�kfK�:-?�	'X4�(ܦ�e=]+�V_e���k�Y�����kf�̾W~5�	U�M��nix��v�=���3-��S�4	��u��#T��!t�u���R��5��F,"Z���(��B�m19��ԕ�]�_e+�=�ө���3��Ś����Δ+�+��/�R�2��p���œi��k��l4.���>�7SqX��t�϶W������Hm���UxiXBD�a���{� Z�[[�#Sս�W縻G��L�SqTF{i�'Z�{K4�&��%&�,�$��DI�h~�j�.Q�%%4�2�K'�o��
%!��9,P��]P��oRs!Cn[�OD�3�U��jO��L�>�Yf��3wD�G�)$��~r{�����,Qxи�Ծ,�ff����>�˼��ܛ���h����|'�n$ZPm@My�@���3�<�>#o�n���K�"V��V}�&g&�ĒǤ߻{��D��n�L�L	q@�w�&)L��j�-�A���q�޵�3�w�[_��YS�CVZ�H1�h��\6�Y��d��x�w�r��k�˛�kf�8c���*kf6d�m~����7pJkwf�C�L���\)C^�y>���[ݞG�]�0\O��*~�C}��K�(���u���٫>؎צ.��/�Zv�p��|�<�(���d����68+��,��}bҐiV�Kj��t{��F�9ˎA`M���Y�ܛ���t����OV�f��wb{F�W�X�w0�E�^�o��-"R��k~��H�p����TH�`PԜ�U�={,�' ?�e�x(t�J��U����⁮�`��BG��$�T�N}�"X\��o����q���(<Vb2���o��Dp������42�투7�lja���)e�-�s�"PȨ5����f�-ŝ_)�p�7T��J6Le�S�>ɗ�%�m����/D�G����e��F��}n���jU�1
����-�S��wm'�E���]���M�5t����O�;�Z�ZMo{���W������R8���N�f_l.�^�\8��O�W�����id
����U��H�@fƑ�D�P�O����^S~��)I�\���i�+O���Q2�닟.��>�]u#{���H	�'��.p���1�ʵ�F"q��i�y������` �K�Hj
�����j����.�kT�������6�  �R`R�X��������(���Y�q�F+��p0��Ҡ�^>
���n���u����7Cr���c�W��>�xIx�r�s�R����]��!��P����1"�*|��o���EXv��-@����J��m͘C�r�����t5���S��3烄1v�B���s���׿���ݐ?��붮$y7�7���h�FK�CG�YH��=�c.*�`��ɲ[fU�<��T�����I�[.��,��O+(�W;v�T��[�p�Eg[�i"��7���u������ �ը$�f� ��B�e̜�Տ�b�S�ВgX�Z�m��JH�������)���j�wl1�=��~�/�W@��#:ź���5

���Լu��4$
��h�@Hc���������E�R�⮗(�=�G�`<]v9�>�,��p�Y%
Z#�in��3�k@7fB����`udV�љCg�.1,�e��+z�?�p�[�v����y(�!c=�"�� �[l.u��X����w>�J[0��~^0JX����� �~7ۖK�P���/D��6������U��ة�o���*�W�Y�#����r�fh*�qɘ�yv���GY&�<��d6	�.�@��M�~y��0rݯS�/*�x<4-�r�5�]�]����+�s�i����I�Qf�>/���E�n�eٺ��NQp�԰��R�U��w��
�H��+ǦEj<�UqC�<~�u�+MJ4�p�C�%T2��=�"��������Q�A���s��w�q�4��R�+��^4�#�DW@�v�J�/�y�W�һ�p�q Z�ޫ�U ����F�bdT�_��.,F��p���dd�&z���#Gw~H:q�����tgޕ�m.\�Aۉ�����̷�6,p�ojW_n�6�Y=��)��-Z:�/�� ����+��9����m��z���P�M����5���̃�d'���u1�஄�p�"�̦��y$��ǛQ�V��6�p5����F�,s�g.[���H�:^-<&�A�t��aZ�%����H`�����q������M[$0��7<�c^$��_y��pe����������K�]�_-��.jg9�跔����I ໊�J�0�*��ѥ��J�'����	��9��Yv3�E*�V"|7C�{���B(ЂO�B~$  �{�ەx9��y#��m����͛>-��-*w�U��������7�Т0q� ���91����Y�^�wߒ{ۮI��uV���GU�l��p����|�� �^��Τ�ZH��-��c���`W�W8��ۙK~KZ���x8�c4.�5�̶��#P�J=������Pys�l�b�Cw1��آ��a��Ց��#��Nl�!WY���̗-D.(\}	�40�9��������	И���=��奄Z��M'`55�h�`U���f�G�R�U�i{���xe�bR�"'�C1��g�n��b-z�T������,���(M�g:\4�6�ʙ�Jk�X�1�w͖���jQ�Vf�(HAC}p�=ܷ����������u�qѥ���)S#��#╭�n�8~��:���X�(�]�W]��ב�V�8�߂Ag�0�d��e	АƬ�f�<����-%��T��'�l�Ɔ�Hn�K�(�wx���&Ms�#��mOQK���'�a�,�6�~�A�rT��E�Ã��ղ�0�p�/i��.q��`Ql��p��G��xa�,��O��.
��%ܵ���Z=�EYY��͓v�?�Q�g���6W+����r�&���Eo��jc�6�y�emt����,%?���
�[�\Z(!�f��YH���fKL�D�b�PO]�2O%��|���3m���;��M���Y��~F�2�������
_zH�h����x�
w���Ҁ����MA�#�� =��m��MT}t֖���&�x����R��K��g����*�\Y��#�nS�%	�t�E��oڭ���<7��ǔ�$��gAǩz��4�2����E��EL���PG�O7!�M9��)-��C���&����t�k����zLO�K	;\$Zz�B�Cî�J#�T������M����鴄/u���H��V.��{�YN(�1E�������MxϪ�{9�I�X�@S��_Aתz�u�j��_�F|�K�ÓEEj!c�-�>U�O����B�Y|oM�W�r�
�ς�{w��r<-�!=�/�RV٢�����)�~/��`�N���S̟��uw����/��v�E���9s= ۝v���r!��[̪�p�6�0�'*�/��V�1N*`x�_���q���ly�Y��    �A)����૓A�T6���KeHjP�)�����=$t���. �PB/��xyo�6�ru1�2��E��
�h�W�=��f�^�޸�K~&�9\�&uz5��زƒ3��!��u�;#5��j�o�GϤ�A�zЊ:/�ߞ�����0L����� ]�b(���~	)�5X�J��]�PB(mc3��y&�e�y������#��`-P�U���[.J��RS2�i���a��	҅l�y1���Oǌz�+�|����=0��b/zC�@���z
D�D�ԯ�����2T�ڣ� 댝������+]�PTz%�w���F��
�J��J��BEo�ӿ�_uP��-Ǐ�c+�u.�󌫤���_تD�"eE�{y�@Idp{*�d�T��j|�AW�\4�(<��}Х�<SOU�%���1�E�R�/��y���|Q�ڶ�t��!�&\�5��A`���,١B-��|�`�Mi���>=��6m�o,{����̜�g���gX�r���(�ڬo.�*��>=�|����#�D����Q,P�	�}� ��Uf�~���|�2ok[���b�,�R�gW���\B����桫hz�22т�ѣ��%[�tb��huw���_��)�U���I��
ۆ�I�s��5��&��4�,Ӥ��{`�*d�1̘�kn"���nm�Xv���3�ڋ"bg���̱ۂ�`�8�Fւ j������������_�
<��6��a�*^gu���泈գ�Kɗh�\*J���}���A�f����pot�����QV��JE�h���`�(������r|���^K0� -�f�8��/�6��/d(�?�>	�����z��� o�Y~�@�'���͹t"G2���Pe��M?ҷJ��=�`� ʟ=��Q= G�>\B��	2H&f���|-�>��Ւ�� ��P>;��	�u�E�t\����O�ϨL�`� ��j+'�̌;,�K#��%ͽ]c6�Yr�㖓�F.o�l�U	��ߤU��Б�E���p[��ѷJ+�����n~T���|�r�π���hǋ^ő�Dn>��Ҹ�0�3�RB�iQ��GU�GvY�[�Q�x�`ofx���L%�̦(�@P+Wʳ��y�g�������E9J�,+���i�x�@��}w�B��U����+��P����B����F�_���^xu9����[���Z}�8^���)�4��s�I`P��oG_3�B"��mS�rvG��W����V�i��x��^8k��2/9��6��> ��Y6)�i���RZ0�:���<�9�+������	�0s���r�#�G�a���3$�nqxK���p�S�M>>� ?��Y�+�WO��X���Ї_eO=�-��#$���/�bFH,m
'�6��N(n;-�:��0I.�s�9��?L�ِ_��3S°a��^�t���+#P�]N�r7v��l��n>]�p�/E��2B!U+�+	_�^]�!�'���q-9{-��4̈b�m�GaϘ�o�pr�4v��`m��R�Gh�T��̫��i���fԲeה �PW��_*�]}7#J	p�wNfu&�g�l[�QK�}�ψMG�4Έ.�_vla�h��+��;T���D���ߦ���>#ho���9'�u�@�u�}g�T(�ٸz��Z���oZ�x�,􎫋{�B��⎉�M����ti�g+��p�|�9X�s����BCu�o�BS+��������긍������ϯ�/t�ww#錒$E�G�~� ���
J��=B'fDa�a�
2']ِVz#s�H�ٟ�����Հ��۲&���˙�c�gnq!+Ze����42�2}P�M����~
]%#�K�����I�ev��o]6�Jg:�8W�X��S��+�=mڣ[���.��PW��t�V�^�s�pDl�6�Ȏr�{Ub�c�g�b!�O��ƚ�Y�#���>C%\�DG�mxP�/䞉ψ>���&l�aHt~A�#}��R�>0���N+F����Z��,�I/]W�W/&8T�-���2�����q#���?pC	a$��xY�t�׻Z0�g�F��5u���8����YDh9EvƄ绌�?��s��E�x^刻�UUg�s��ńd��R����0]bɾ�2͢.�E�ʇ@˓��C��3E?/�@Ol/m�ΐWz�jE�-+k7� �@�w��;L��=����H��y�+�1��ii25IS?�Wԫ6hO^1����m(3:�WR/�9��Ҳ=5�a�5V��X�$�������?*|շ��j�]yڮn����U�^ͫ$q������+��
�n^�\���$7�he�0��l�qjR�>w��e�U�N�<тG�^��rL��j
:�+?�� ���k˾��ǧ�6~^-7Mk��*��v�3�k/�n��/�0Q���(��k0��%�"��IT��[,�*rwh1��or,�,��,�(��,�"��w�UO�_?�?=U�`�T��P/���ی�ă��siF[���`\����]�
g��F����� �{���e����ÃK�V��>�Kȓ!�Q�q�V��Yǋ:�Õ��{g3ط��4C`�>�pm*�~�
�8�1!yish��p֏��!e?-���QDR�2UOT��A��$�Tq�y%��^F��Zxθ�Ȯ�ʇ���8X�Yg�7�/8���	Sدg��l�~����k��߱Sj��k�ï�[�+�S�~G�����7�ǋd
�q7׌��#��=�2��?ϝz�r��.�e��/�E��˶U�ta��AH �g�U���L� x*��������1�W�y�,9gR��a��Y�KU	���"����%�l�n�|������
�D�i^��N�m�T`�ճc��M��������� �b��jwy�Ƌz��E?���׏�+�CQ������.��F·<��Q+*�ۅY���cR]!3�`� �9��^�vHC��gL{��u�zy'��T>�x�yɴ���BQiP�SZ���|Y��;`�g���/	�Ɨ1�[�tHfyQ1|�������M��q1�ٲ��̿�1=����i��l�G���b$ٙ�f֠a@���xѮ <+���������ٓJ�w9l+�`�0��q�;�%qI�ϐ���Q�����=��=�9XP<f$�
��u&����>��xQ3��ڲ��λe��aք��1��a�	�C5ϨIܧX.G�NWV*_̱@m�����t�(I<�wq��şQ�@j�����
f���2 ��M��
��`����@'��ԅ����b�sz֬�J�l{�k��[8u�B+k��bQ���v��j�]d,�}Ƿ!�^���r��;n��mϤ�uqی�����o�-R�+�KJ Sxm����޴�G��[��2w+�+�[s�����D%���k�\

��	���4�hQ;_��.��tsi_�gV�/�^�⼀W�[�(K �>�d+�Y�4/�-�C�w�-�Z�)m�{A�r�W�_{�MH�����K1�W�&�����g�wՒ��W��ZV�k����w��Rt[��Hв�_�KFJ����X�*�07x9*t��a�Z'p����c��qp�f	���=0rpD��\]U�].��掂�M"w�+������e�@�š��wB���iV���M�p9w]BKl��n������m|�2 \��D?�\�apU�9I��*彨J��^Uu��1�L���B�B��*�H~&/����h`(i$�s5�¿Y����Q� ������p�W�\]�"��CZ`���U��<d��x�u5K� ����oV�.��G �7�g���G1x�v���kr_G��s�p�j;�y>3�ی��6V*��B*�nE�l�]�3QJ��|))�מg�i?����pWx^{Fx��!�������*0T�{g���uU$n*M��j�;�@�f1�,Mw�P��rԂ�D���\���bA����5�-�+�$��(�lQ�C��2 �
  u��W8�w��2�Z�
Y��!j�P��k�E+����]���M&�V��J�	�<���L��St�$~��,�����qtSL���k�����юNp�F����WV2�pIT{Ia?�?_
ϯKsi�?V�pq�R�����|��m��غ�IF�a����19��"��>^D�.:��&��پ[�'�|q�h]}}C�Q!Y1<M�$��#o�/����m_�*#��]��[ �0Q�������#d@>�����2�z'^�j�@l으$�S�U��Kwib����,��t���h�*�W�5�P�u����(L<L�3��m|k<�f��r�
��I�%�x�h�6w�N99���-*��R_�q��9A�b~��h�贱�v���OY\��B\��[Q�@5�	��kWt���Ugк�P{U�"�ErK��W�~����������6/�����g�S�4Q�`I(ٿtI��D���{s~�dv%��>PE���&;�ܕ\R�v]]w�Y૪�-�$��]�
�e��/qA\=��{�I1�'Fp#U;qlŤ4���"c����'�z	޷$)Գ��W����A!�$���
M�
�}������$ԓ�Ek����ț⡄o�މ�����Z]��?D�k�Z ��o�Ć�l&i��d�od9�R�AnI��Ox4$R��mEs�mk4�q��`�l�U�@���Y)Lk�ۗ���c� �VpM8*�IO���w�	g ￚ�C��X�☤��n�/i����1�`v'l�[����ӵ�j�ϔR6�����dS��oS
���43�z�̼ύ<;~�Z��lS����6�F���|����9	�8\�*#����{؏ot]uu���;Ě�z�N���C�y<�%$H
�\,\�)A�3�.�0��?�>� ��jw�*Dܕ�޶;�O���tD�B1����?N ���l 7m�FuA.�+v.W�z���@v��!�WȢ�fsD����|�� Z����b"m-�t��3,r����5fm��O���b�]�T�kff'^��K;?�S��7�0
��d�����a+I`���.ӘT�kGb�-ǤN6. �`s�:z���������M6�3�H۷�lŒ\��*J����ي����
_ۢ��m�n����.�e*�R9hG� �\@6�9y���L�%>2�A�dS�������M_>/�h���t;q�$u���1|���zS��+7�k�k
�ފ���ȀZ��r�4���?pv��D.}ח�"�5M�L�k�J��U���j]�v�2"gDb�C����@Q?��Ph�ܢ��?��XM���:.FVEC�Y��V.��]�v#t+�s�q������t"e�-G���k���A�m.���o�˃���^4����6�{�zv�|@b��-��H�V��}����By`c^λ�K���A��8��Q�Q�@�r�'بj��<����Q�x���p��£K0�z*\C�OcԲO�l{���
�Mbek��f>$��q�T6�e���~�(C��	9Z�7w�f�nQP)�_��������H.!EEx���[#`��~�8"x�d���h�89SD�#�����]5��钀/�gC�	[�ⵊPH+s�[��0/E�N�1l��;��B&�yY�ћ�����/��Rs�>��>�hI��1nz�&�5�j�"]d��c��b��>���@��a��#o�m�~�.��MJ���ЂU����-�ʙ-O��f�X�T��W�5�Tg;.�!h���M�o�;��=ծ4
�g�3�>*_�l֞|2cc0�)*��q���xw���_��Hc���G��2ٚ�إ�-��ޥp;Ԛ���RN���4��r��M�^��(C��r�C��<������<ۗ�2�X�>�Z��S�vtG��������xu?�f���6Po�*��9���7���@N���iuG�\���KV�����#��d�DYmTF,���d�1�@D�e���9ϫ1A:�R���!P@�e��+y�����
 ��P���\���ļ�j���m���/�K�I��U��0���{��#���c4�gRQ5��sg1�"���6�ƒ�")�����hhۤl�>͙U�L${��%�I� �D9l���WņY��C�	1�Z=�]��Тr�w�6���z�ũ�ӟޥ#�T&�"r�sǃ����a�R�vVR�\=��4��a�#�e7�Y]�cv�h�Z�ܹ]����
eo�t^�h��$Uz\wTa���w���l����O��_����
�(|B.|)�>�l��j1#S2�����c �q���zѥ�3�2
���쏗�k���R�[���6�B�	�N�r-tT��χ�+|V�3x�������y�kA��x1����sP0�ҋG{��y����$N�@Ƅ���W�曊���g��c;Q��ӹ���o�' S����jٍT�"_R���c�J7���2���ND*�3���Yѧ
��4xЄ����M�WS���._�
;lC���^D��o�{�/���5@�U���剛'��)��}�%�g#m�`��k��vӟ��3J�f$����S�4������K�e�Wֵ�W��3�����U͗>��|������?�?��V�      �      x���ٍf����ϵb��}�-2C�c������t�C2�ȍU��ճg�c��~���_+�����������������*�(�6�џ�8������k�F }�=c���_�+�o�1����-����z��~�k#���W�2����0��檫��vjPge���������v�Ӈ�"��ν�����x����:�Pgx	���#��6�F���BR4z���	/�~��Pw��A����gt>��GT�5���-�����lK׶�n��f)�o�GTu��΢=KO�/�����i��}�{��EK�B�D��+:��/�I�ܣ��.���z��U���hh����[n?��*�Tr�>O�MK���z˹��ꄈoO�=ҡ��t��^F�fwE��e��U�b��l�zl���g����@�����*eK+� *���VnEڊ%9��6��dY�X���+B?���2��P�[H�TtT����.ym��+�P7�<�ظ����_�C���m�b� �i�2V�����n����p�7�(���k^�G+�qP�
���!�XRm��0�R@}�YKK�Q��KF�6եm��5:�m����W���@HH�>B���lL��r�	����L	a��������t)��R��[6@��w�5\�Z0��"��j	�(��W&K
oBߴ��w�6Kukhټ�qt��_����r���7SRңb�oS������R�'s�����Y����2����و������W���/豏�ʽ��8���{���x�3<Zl�����C���'@�*Ĵ�g�A�қ\��wlp�񵖽tѦ��GakO��컮8:j��U9��"ޅ~� �S�Y�f!�[Z�Mv�s#23[W(� ��F/�6�6B��>��VN��Fl�N^�������B�B��B#�X��XdG�}�'E8,K����䈠jg�̞x]q�R���i6ŀZ��a~9�D�Z�ti��k���]���%b5��b�ޟ	��n>G�5�sm�N���Cʪ�]+�UXxx}�٦^�};06��ُ�6�1Sdݮ�y��@,J^UĖ�>2@�"�S�Mg�?
s)�6�0/:�A8R��
!2C�$�M�-)�1-)�U� c#��s"5
��9c�_�t��"��E�7ZA�A42v���([D^$��X����uH���v����fd�w��@|5�,Ww'���C�r���2�"2 �=[A�̧؅����F�/J @)����\Bb狸c��� A����#�5�Qq�0�?�5��v�-0�� �Z�^�_�@D�ː�;1�IK<�u��}E$懑���;���M�Є
o5�(c'���PL��db���q~+�p?L���Q��g`|vV��CQj�q�rDua�����a�E�ԒLnO�"9�����{f?��3)?
�?Pdq;�y.[1)�Xg:�� MflV�>5�
��a���7ؿ�Dk�%�2�<�A���z�V�..(���y���#�C��2�吶3�%@��Rt�  �9dc��D�u��g&�q�eUYB��Eq�3oK�����Qp��4!v����+�{K��n�e�{�Ʌo��)�l�'r7u���8���N��dM	�2�;2����2ə��dxy�u(���3Z}�OZ�%��1�2��R�(��aM�{Wy��D�S��-�
5s*�CEѦ�~FɪSE�v��&�ÛŰe�2�eV;u_B�����%.E{ɭa��Cuhr��eع0�\;�Ca:�.[a$�j�9�pa�S*��Pa�% ��Y5�[�p"��uv���~���׎��A�}q/$���*��w�SR��˄ƈNUbuEg�������{y��J�����/��XE7��@W�A��(� b'c�@���\Z!c�<zI|NCFL�w��$ǈ� ���ZH����'�퐦�5�����=D���b����.B�N'1f�*���
*���e���z_�,����藜lD�f=Ҍد��+�4e*���H�$�B@Q��$b��֩�$����-�T�i\�R ��*+�u�eD���ܰ��4N�3x��.�?��g2ƕ��s���C��:H�H־�}[�)�H��۶/��-*��+���ȶJ�0�Q��c/�^'S�v���J�|�%���B�.չ��/�>��q-c�hK82ΓdS�.����뮦�	! �R��11˸e�'9YRg^'�i@���zq�at��PS�0��_��W�u�Tn�r�	SrsY���Q"�����#�� m����?2_�ϵU6?�҄�8>�Ym�z��5�6�T)ա��r�!�[�wi[$6��Le�3�n��
ڃl}���A���N� �ipZF(�mk��m Ƚۮt��۝t5���-("���s`����b��/{���<��LQ�u�㍓�9��V���ׂ�>�%2��t�2����k$\_����l���Oh{�sƝ�DE!����썿I��u��8�-�U�\�&�*��z7='֥X
��vQ�Ey@h�e��]k=r�@:ng�)^M8�C��ҏ���� o2�7���^�Q��# t��#���a���D?�{t� *-<��^q=��dL9rQ�!ί�D����s���]�f�WvUZ��E�8/ZH��p�)�B�}�}hsE@�$��.�D�1�����{��n9��8g$d�9#vD��c�(U� �B]=-�;c�j��C���	;We����Y��z�N��_���5�C�Wr֑zr��0[�h���`���m���Q�E�!.[�f9��S��(bE�&�QD��'�U���xrz�n��8�H���
R�MQT�xr�c>�U�*�ơ�Xb��xGq��Fy��xR�B
R�|�4[�;;� �]@Y{��8_T}��v1CK���l��tclB /��+/z8���h�l���v�¾E���j�Th���֔���l=t�a�C\�Ǖ�(-�%6��ϟ$�99��æb�#}�څH8�a����z���o�q�,�5��ի8�����H�<��*����dE2���6[�N�Riܪ���վd�����X�̬�J��"XBT�"�Z+���Ҭr"8׽�����d~���Q�� MqՋfz�h�:i�Xh����J��W(����JoS�px�!�j���Gb�a��<Q7�Nh�64f�v`x#lZ�a
�BQ�c��ޥ(�cs��w���{C���C�]���k?�L�E���̧��xʆ�L����Zd^�qGj7�p��O�&-�	�a�bN�mܣ��,_g0HJ��4�N�u��Od%,�{��3��' ���B�3�k��EL�i�{=na/1�{o�3�GY/���n1W:������Q��w3�F�hc�v��3�Ȕz��$ۖ�2&]耡��kf�d�Mk��e��`H��*�@��0�❅F�/R˖,w���Uv����(:�a�d�	�L��0ү~�@�t�Cԩ?��_U;!4�����q�]����:���j�Q}�L���C{��0�>E�b3׊Bwc��G�������%����p���9���fs�O��#T�C������0��+��p���C�_�9rCo
q�W��Q=������F2���3����Ր��m`#=�BX����E]�u�dH�i�ba�>�3�n<���r��X���|B���)UD�C�~��R��9���L��eT�x�#c�X�2�6������;s�he�`6�*���\���n��Ed���2��a�v�p:�a:�c�"q�@<���MM���z6�\�*�e�x��H5s��[v�ڏZ�qj��ݚ���QH�o�m�8�a�"��[�>�̧�O]��=x>�� ��FRک�̙Q;�̰�p[�K�	���2͌�'!�4bo�3�ᡉ6/u�-3ws�=�z���({�G�z���Ś��x�4�ظ�7�Г�^R��f�s�È�4>+�q6��Zhu�Jf�g�7+���g6�Xe�����LjۋD�� �  g��x�i��'0!����y��lϝeRb��S%j�U�3M^LQ�l��(���)�g��̜��K.C�FG���-ER�ݢ5�2�Ȩ��y�=�2��t@D�r+@f�N������Dj��h��k���gڄ/y��^+Ʉ���c[�:�W��F�w(Ncx8��\u���'�O�=Vs#Y8�-ՉE�*���*�1q��	0�3�#���`PNoO�gg9#$�N{p⨅�Eq�q :��^�0�wW�e����v�Kp�_7��LP��@�׋��eKx�BCw�%�!5��7d�C��G�7X�P80r�5�g"��ڦ���x-|�
}H�>y�"��Df�5��JϘ�	�sޗ��#X�~V.u���|�����r��Ħe���B�I���T���F˰��fvcNOk�x/�d��V�#McL	�\�����ꮡLL�\�h���������C�Ճ�)/l\?I��i�-S{�*��Ȕ��1�a7��L�C�^y��D=l�A�"�6\�;��薜��o��eʊ���I�"w���@�0��D�F{�/�̘�M�N�"ߙ38�<n�cd�3�rҾ/B��Co������-D���@:M�5# ��9y���3�h��H,7M����*0p�A��c3���j[̤�H������UB��ib�Cv� ���5���|IXG���a�P$u��L�#&)[���O� �v�@O�@T��3C��N��-��E���@?[�j2�bJ�ia X�Q�����;�5O@&M���]�f��#���"fH��YN@v�TN El��:��_�n�W�|��yNu�I�ny9����~2�F�-�Is��KMA��C��2zs�	)��E����3���x����(�2�J!�8����<�Xҙ��tݎ��i� xcQ�|w^��/A����q�h=�r�?z9	i2Ї�X�LHF��-�/3��6)���$��EU�8wSfdD3��Um*�r�;!Ьcq&��L�A�H�f��σ�ҚrxKW��)�\���/ru`d��`#�/�\Z�^����#���R���B�QX�*�ͥ�*|��Х���q�L�� ��Ai��=�?=޺���n���eG���m-���л��q��.@�l?f\;�Z�(s3�kԓz�ݚ��{�4j_6��:��L��^dCd/蚢�����{ns�h��������T���7t�nJ�r��{I��Yܐ;�!��dU�LL�
oG�&;�6��A�U.�7?�6=���Ly�Mڈ���`�3�!���se �V+��J�麷����D����Raz��#��>��*O����{�Z�e��]��$tk)����Ο�p$��2/��z�3�Bu֯=$��W�r���݃�<���e^�[�O�Mg|�){
=� �#��,���Q`f=��Yݘ�[�{��jg ��8R��סi)�ͳ�g�6o�$g��_�� +O
�2ǆ,�������ӧ����u!�RdRx��r2@u��/�rɸ�ꇕx�./b$?H�X��&~�����^��cW�X��5�Vb��q�^�92G��QH�0&���>.�7�~yǺny�U{��i�ٜ����}����_���M�̹>�'���,?�:�e��+�l�A��%�ɍ�9hC��`�1Y�0��'Ӿ��M����/x��[T�[&����K�xL�A��rŏٔE��D��`+=�䞗O��S�7x��o���c,z�Zd���cQ��毚?��N����?���qgL[�iƧ}@�3�샐Ɣ���\�K����`�]��je�w��,o�c׹����m��^�<�C��c��x)^�n�r_�^�6��$�<M��T'�x :���x��_R!b ��K�w�d��[�!�f�XEYR �_O���(6H@�/���~7��0�]�߄	�~��ݾ�?��f�O�ߌ"�\c�W22�O~x&�� η�!��4Q
Pyۇz��4P-ޞ����/��De����`�yJ��I�=ukL��~�w��3�'�Z�\��KҘ[E1�F��(e��j��y�bu^+Z/���?����X��\+�K2�e����n'[6�@x2��^�Ȝ�]���yݣQ���yJR'��[�H���<Z��������)9ֆ      �   ;   x�3��45�4��06�HM)�Wp�)K,J-�4202�50�5�P0��21�20������ L �      �   ]   x�3�t9�2)�$�������P��\��B��������\�����؄ˈӹ�����9C���R���K�Lįڄ�5� hnqIf.�c����  �+     