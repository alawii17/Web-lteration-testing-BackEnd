PGDMP  (    -                |            railway    16.3 (Debian 16.3-1.pgdg120+1)    16.3 -    K           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            L           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            M           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            N           1262    16384    railway    DATABASE     r   CREATE DATABASE railway WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE railway;
                postgres    false            �            1259    24649    discussions    TABLE     �   CREATE TABLE public.discussions (
    id integer NOT NULL,
    user_id integer,
    content text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.discussions;
       public         heap    postgres    false            �            1259    24655    discussions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.discussions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.discussions_id_seq;
       public          postgres    false    215            O           0    0    discussions_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.discussions_id_seq OWNED BY public.discussions.id;
          public          postgres    false    216            �            1259    24656    options    TABLE     q   CREATE TABLE public.options (
    id integer NOT NULL,
    question_id integer,
    option_text text NOT NULL
);
    DROP TABLE public.options;
       public         heap    postgres    false            �            1259    24661    options_id_seq    SEQUENCE     �   CREATE SEQUENCE public.options_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.options_id_seq;
       public          postgres    false    217            P           0    0    options_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.options_id_seq OWNED BY public.options.id;
          public          postgres    false    218            �            1259    24662 	   questions    TABLE     �   CREATE TABLE public.questions (
    id integer NOT NULL,
    numb integer NOT NULL,
    question text NOT NULL,
    answer text NOT NULL
);
    DROP TABLE public.questions;
       public         heap    postgres    false            �            1259    24667    questions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.questions_id_seq;
       public          postgres    false    219            Q           0    0    questions_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;
          public          postgres    false    220            �            1259    24668    replies    TABLE     �   CREATE TABLE public.replies (
    id integer NOT NULL,
    discussion_id integer,
    user_id integer,
    content text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.replies;
       public         heap    postgres    false            �            1259    24674    replies_id_seq    SEQUENCE     �   CREATE SEQUENCE public.replies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.replies_id_seq;
       public          postgres    false    221            R           0    0    replies_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.replies_id_seq OWNED BY public.replies.id;
          public          postgres    false    222            �            1259    24675    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    24680    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    223            S           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    224            �           2604    24681    discussions id    DEFAULT     p   ALTER TABLE ONLY public.discussions ALTER COLUMN id SET DEFAULT nextval('public.discussions_id_seq'::regclass);
 =   ALTER TABLE public.discussions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            �           2604    24682 
   options id    DEFAULT     h   ALTER TABLE ONLY public.options ALTER COLUMN id SET DEFAULT nextval('public.options_id_seq'::regclass);
 9   ALTER TABLE public.options ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217            �           2604    24683    questions id    DEFAULT     l   ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);
 ;   ALTER TABLE public.questions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219            �           2604    24684 
   replies id    DEFAULT     h   ALTER TABLE ONLY public.replies ALTER COLUMN id SET DEFAULT nextval('public.replies_id_seq'::regclass);
 9   ALTER TABLE public.replies ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221            �           2604    24685    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223            ?          0    24649    discussions 
   TABLE DATA           G   COPY public.discussions (id, user_id, content, created_at) FROM stdin;
    public          postgres    false    215   �0       A          0    24656    options 
   TABLE DATA           ?   COPY public.options (id, question_id, option_text) FROM stdin;
    public          postgres    false    217   �1       C          0    24662 	   questions 
   TABLE DATA           ?   COPY public.questions (id, numb, question, answer) FROM stdin;
    public          postgres    false    219   j4       E          0    24668    replies 
   TABLE DATA           R   COPY public.replies (id, discussion_id, user_id, content, created_at) FROM stdin;
    public          postgres    false    221   %8       G          0    24675    users 
   TABLE DATA           >   COPY public.users (id, username, email, password) FROM stdin;
    public          postgres    false    223   �8       T           0    0    discussions_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.discussions_id_seq', 44, true);
          public          postgres    false    216            U           0    0    options_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.options_id_seq', 56, true);
          public          postgres    false    218            V           0    0    questions_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.questions_id_seq', 11, true);
          public          postgres    false    220            W           0    0    replies_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.replies_id_seq', 24, true);
          public          postgres    false    222            X           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 39, true);
          public          postgres    false    224            �           2606    24687    discussions discussions_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.discussions
    ADD CONSTRAINT discussions_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.discussions DROP CONSTRAINT discussions_pkey;
       public            postgres    false    215            �           2606    24689    options options_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.options
    ADD CONSTRAINT options_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.options DROP CONSTRAINT options_pkey;
       public            postgres    false    217            �           2606    24691    questions questions_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.questions DROP CONSTRAINT questions_pkey;
       public            postgres    false    219            �           2606    24693    replies replies_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.replies
    ADD CONSTRAINT replies_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.replies DROP CONSTRAINT replies_pkey;
       public            postgres    false    221            �           2606    24695    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    223            �           2606    24697    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    223            �           2606    24699    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            postgres    false    223            �           2606    24700 $   discussions discussions_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.discussions
    ADD CONSTRAINT discussions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 N   ALTER TABLE ONLY public.discussions DROP CONSTRAINT discussions_user_id_fkey;
       public          postgres    false    215    3241    223            �           2606    24705     options options_question_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.options
    ADD CONSTRAINT options_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.questions(id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.options DROP CONSTRAINT options_question_id_fkey;
       public          postgres    false    3235    219    217            �           2606    24710 "   replies replies_discussion_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.replies
    ADD CONSTRAINT replies_discussion_id_fkey FOREIGN KEY (discussion_id) REFERENCES public.discussions(id);
 L   ALTER TABLE ONLY public.replies DROP CONSTRAINT replies_discussion_id_fkey;
       public          postgres    false    3231    215    221            �           2606    24715    replies replies_user_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.replies
    ADD CONSTRAINT replies_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 F   ALTER TABLE ONLY public.replies DROP CONSTRAINT replies_user_id_fkey;
       public          postgres    false    3241    223    221            ?   �   x�E�1n!F�N1�#��DJ�"7H�;�=k�P��Q�H��������sЎ{���/���4j���
z�}v�M�A��t�'�Y��2wz�rh=^;����o�.�岆���	�y�����蟱'/�%K\%+bx3���/�,�ɇ,)�����j���9�      A   �  x����n�0E��W��z���-��H�,��fM�DE��wH;I��F9gf8ù�&i�����6I���VV��l�ѳ�N�4����V~m�mμ�g?I�ɟ~߸,�r�L)�pŧ����$!���I��`08��'�&���{6���$+���F�wき����^���,��嫹Ҏ�t���$�w����N�M3��{���h"9jE���G>�{��F���?y+�����&e/b�`�b����DFM�I�����R�[&k=*{��D�%+|�#>���vj��!�<�oE��۟�]�?�
`��p���p�<��d�+�V����u�|�:�pq�t���"����zeۉlO��������E�L6��ľ�S,�U�<�
!(���s������Yc�H���+��y?�D���z�e�E�9�v"�&P�~*����z��i��������0���>���qo1#��S�ȩU`��;5bLf-;Ui荴�@'=B����S��5d|���wH*�%�D�<��j�a�ݓ}"��.0Ș%�糍�G�[�oC_F)����*�;�p~B�I�^KH�d�:V�`38
���!�,���-r�?�E��g��X1���MW��I�K'O�;��� �58�j�n �A�*�t��|_�H�����B�ym�      C   �  x��UMs�F=���;�:��q�Hq��֣r�wDhɥ���o�5�a�%}���p;�|��xxx _��W�L�9�vL\s������{|
�ٴI�T�ă$&ݎ��i�ʇGܺw�t��rOLOE7iY��ѢVUu[|��E��y��M������A�vi�C :2���a+��h����\����]@�膝�N���hҊ�g����GY��eEK��RNW�-� n���o� �h�q�&�5}R��`��d��Id�P&2u β�U�W���/r���w��]yS��pe�A�q� �H�4ɧe�w@�G�ȬJΞ�b�I �L���A,a���)�I�8=?���+��{�.j���t�2=�ؤ�r��aA%��Z�x�:�^��^�X�����&N�F�V.���o]A�R���ĵp�72�ue��@�Q+R����[�U�:��@iU��e[�A $��fdܰD�Ͽ-V'r�A�];�Dn�d�sj��Ż<��p��8uh�\�Fƅ@i/:q���� 8ܸ�~��R��P�f��t�fl�J��?X���Ń0Q��r�s��c��ݙ���6���^Q#u:X!.s������m˨ �Dۮ�s��9�)Эhc��EOK�p�΃�ɷ�{�Xx�2�2ρ����#-ȜN2�n���!��3���={�.^_g	��
�����P�؟S�"�<^�`�̠��X|(P����n��u�.Fi�?B��x��;d���٣n�͜y�����s�}��q
�U�uJ\'�!t4Z��4�us���gQ����h�ʲ{,.v���(�����cq�cӅJ����4 rnu�ڌ|����hѫ/����R��'�G�qo�'��c�aP=��o����Y^_@�Bۍ^r��K�6z��F�����l�,˿�Q�      E   �   x�m�1�0�:9�^��f7��;Xii�E18
n/Xhc���/�r�ȫc�˴�ӣ��R���H�g�w�z�e��v˲�kj�ͫ(Br���@�E�}�D�2uNs�*b@��l����]����Xj4��j�i�a{
��i�v���<`9D{0�}1Z�7�7�      G   Z  x�m�ɒ�@E����u"��bLP����$�@ZL*����՛������x�E\N�.�E?x/Dj�u�ƥo��M94���qɒ�5[���\+�ڤ��&ߌ+��!�sjbs�t�9�ZH��W#>{[��ΐ�y��-3E��>t;+��DY�����l��Q��4k
=�j�q�^-��4����,T��t/�� ��Ji[��a�B�v��9�&������	��Z볓&�l<$^Zmݧ�h[��+��o�k���eH����;�Q�.9A���U�JX��O�v�������"��Mr f��`(q�#��-�Ԁ�����3�z#����p�ű||��z*��̹_�c���4��Eoh^����?�j���'�L���pc��崌+63�Q���}�k�Q�� ��i��\h^�rҠk�_����d]�X��m��Vc���=<i�`��8Nz�*�_E	�"I���Z7M���e��Y�R\���)����=¦^��*N�����_<��Щ�%K��M]M;���$\����$J��W�%z��jt[.b���ު��+qIl@0-E䣮[+�FK�D_/a���ꋣ��� ���     