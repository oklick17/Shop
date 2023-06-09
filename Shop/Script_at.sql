PGDMP                         {            Shop2    15.1    15.1 =    @           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            A           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            B           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            C           1262    24739    Shop2    DATABASE     {   CREATE DATABASE "Shop2" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "Shop2";
                postgres    false            �            1259    24741    category    TABLE     [   CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    24740    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          postgres    false    215            D           0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public          postgres    false    214            �            1259    24748    image    TABLE     ~   CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);
    DROP TABLE public.image;
       public         heap    postgres    false            �            1259    24747    image_id_seq    SEQUENCE     �   CREATE SEQUENCE public.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.image_id_seq;
       public          postgres    false    217            E           0    0    image_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;
          public          postgres    false    216            �            1259    24820    order_person    TABLE     �   CREATE TABLE public.order_person (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL
);
     DROP TABLE public.order_person;
       public         heap    postgres    false            �            1259    24819    order_person_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.order_person_id_seq;
       public          postgres    false    227            F           0    0    order_person_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.order_person_id_seq OWNED BY public.order_person.id;
          public          postgres    false    226            �            1259    24755    orders    TABLE       CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    24754    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    219            G           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    218            �            1259    24762    person    TABLE       CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(100),
    password character varying(255),
    role character varying(255),
    email character varying(255),
    name_user character varying(255),
    phone_number character varying(255)
);
    DROP TABLE public.person;
       public         heap    postgres    false            �            1259    24761    person_id_seq    SEQUENCE     �   CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.person_id_seq;
       public          postgres    false    221            H           0    0    person_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;
          public          postgres    false    220            �            1259    24771    product    TABLE     �  CREATE TABLE public.product (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    24781    product_cart    TABLE     m   CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);
     DROP TABLE public.product_cart;
       public         heap    postgres    false            �            1259    24780    product_cart_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.product_cart_id_seq;
       public          postgres    false    225            I           0    0    product_cart_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.product_cart_id_seq OWNED BY public.product_cart.id;
          public          postgres    false    224            �            1259    24770    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    223            J           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    222            �           2604    24744    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    24751    image id    DEFAULT     d   ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);
 7   ALTER TABLE public.image ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    24823    order_person id    DEFAULT     r   ALTER TABLE ONLY public.order_person ALTER COLUMN id SET DEFAULT nextval('public.order_person_id_seq'::regclass);
 >   ALTER TABLE public.order_person ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    227    227            �           2604    24758 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    24765 	   person id    DEFAULT     f   ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);
 8   ALTER TABLE public.person ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            �           2604    24774 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    24784    product_cart id    DEFAULT     r   ALTER TABLE ONLY public.product_cart ALTER COLUMN id SET DEFAULT nextval('public.product_cart_id_seq'::regclass);
 >   ALTER TABLE public.product_cart ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            1          0    24741    category 
   TABLE DATA                 public          postgres    false    215   ?C       3          0    24748    image 
   TABLE DATA                 public          postgres    false    217   �C       =          0    24820    order_person 
   TABLE DATA                 public          postgres    false    227   AI       5          0    24755    orders 
   TABLE DATA                 public          postgres    false    219   TJ       7          0    24762    person 
   TABLE DATA                 public          postgres    false    221   �K       9          0    24771    product 
   TABLE DATA                 public          postgres    false    223   !M       ;          0    24781    product_cart 
   TABLE DATA                 public          postgres    false    225   .d       K           0    0    category_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.category_id_seq', 3, true);
          public          postgres    false    214            L           0    0    image_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.image_id_seq', 60, true);
          public          postgres    false    216            M           0    0    order_person_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.order_person_id_seq', 3, true);
          public          postgres    false    226            N           0    0    orders_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.orders_id_seq', 7, true);
          public          postgres    false    218            O           0    0    person_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.person_id_seq', 5, true);
          public          postgres    false    220            P           0    0    product_cart_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.product_cart_id_seq', 10, true);
          public          postgres    false    224            Q           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 12, true);
          public          postgres    false    222            �           2606    24746    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    215            �           2606    24753    image image_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.image DROP CONSTRAINT image_pkey;
       public            postgres    false    217            �           2606    24825    order_person order_person_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.order_person
    ADD CONSTRAINT order_person_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.order_person DROP CONSTRAINT order_person_pkey;
       public            postgres    false    227            �           2606    24760    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    219            �           2606    24769    person person_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.person DROP CONSTRAINT person_pkey;
       public            postgres    false    221            �           2606    24786    product_cart product_cart_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT product_cart_pkey;
       public            postgres    false    225            �           2606    24779    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    223            �           2606    24788 $   product uk_qka6vxqdy1dprtqnx9trdd47c 
   CONSTRAINT     `   ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);
 N   ALTER TABLE ONLY public.product DROP CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c;
       public            postgres    false    223            �           2606    24794 "   orders fk1b0m4muwx1t377w9if3w6wwqn    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn;
       public          postgres    false    3218    219    221            �           2606    24804 #   product fk1mtsbur82frn64de7balymq9s    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);
 M   ALTER TABLE ONLY public.product DROP CONSTRAINT fk1mtsbur82frn64de7balymq9s;
       public          postgres    false    3212    215    223            �           2606    24799 "   orders fk787ibr3guwp6xobrpbofnv7le    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk787ibr3guwp6xobrpbofnv7le;
       public          postgres    false    223    219    3220            �           2606    24826 (   order_person fkep8v4imh31iqqdxnt5isiuhq2    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_person
    ADD CONSTRAINT fkep8v4imh31iqqdxnt5isiuhq2 FOREIGN KEY (person_id) REFERENCES public.person(id);
 R   ALTER TABLE ONLY public.order_person DROP CONSTRAINT fkep8v4imh31iqqdxnt5isiuhq2;
       public          postgres    false    227    221    3218            �           2606    24789 !   image fkgpextbyee3uk9u6o2381m7ft1    FK CONSTRAINT     �   ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);
 K   ALTER TABLE ONLY public.image DROP CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1;
       public          postgres    false    3220    217    223            �           2606    24814 (   product_cart fkhpnrxdy3jhujameyod08ilvvw    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw;
       public          postgres    false    223    3220    225            �           2606    24809 (   product_cart fksgnkc1ko2i1o9yr2p63ysq3rn    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn;
       public          postgres    false    3218    225    221            1      x���v
Q���W((M��L�KN,IM�/�T��L�Q�K�M�Ts�	uV�0�QP�0����x��uMk.OҌ01���ۀ�2�01�b�Ŧ�.l���b����b녽v\�1�� �6VG      3   c  x�����]7E{��b�@)�D�.�W�iL`'F��n�3���YG��"y���ݏ?�����ۗ���sz�\?��������?�������ۗ��_�߿=�7�_����w?�^s~{�&KZ9L�Yc ]��j0Z��k4{�߿|���M�|���� 鼺�کrW�)����jm#H���aHr���B�B�)c"�8%��!j�P�)=�@����BY"���S6/�y�>�J���a��{*эR�BZ$P�#��j6���>��-]Č��3�7��ʠ��2&�_�I�ȸ;c( io9�@|���T�*�K�+>�H���׹\�,P$�dq�m��q���@J7�Εr�(����d�8�#4����#�Q�����0�,�i�u����s�Ob��*۶
l�)��ݧ�4�񙛙��[?�<�`��z#�5ɹOZ�������s��O�=��*Q�6�N�q��)7)~E�����n���T�L�g�pA�<��<F��w�Sf��Zޑ�7����b.nW��#�~R+y<Y��+�Ef�ΆW\a����O9F��N�+ʱ�����4<-K��i�.���b�����܌��Q�P��<i�a~%���S��R��&z�2W�Ajƈu�^�����C5]��V���2WJ��Ѥ�i�*������K�"+S�&��c��%'�bu��c��m�1{Y-$�����ўK���S������#�}���ܝB((�{ނ�r�xG�����#�}�w4)��F�=�P�!;���4�ʼ��#u�gδR�J!68��D+�B��4DR�W|Α�>��QK���u��2�
>���5=1��7�a�����e�u����t+�F<s[lW�Αwy�6��o�BI���f�����)W�Α�@l��b��+H6�=�m6��T^"t����
�@�
.�%"�l�cꃋ�^:G�T54lx��I3�ۃBa֎�(gm����c��R\��J1EK���Ff��-,��� ����K��{���P2�("6��=��5d�MF��x!C�vμ�eY]����sf�OA����6�v�z�9"���m+�cn���͕܈VCf�Ap��ͫ�13��j���pd�1j�J`|	>���9�j+����;��1�
� aH9eo�=
�M4ԅ��I�u�^W���Xm�/!��蜙��;nƴ�b����S&��3�_Ԏb�~I�9s�h�'VhX]�"ۋu���$�F���]�?33��to	L�h����R�A*�=(���DQ�T�ϊi�{�9t��.衫��蜹M�;�መR��ٰ���ZF��=�� u�������%k%��w�`��{�^�*�;�z�:��W���~ի      =     x����j�@E{�v�A#vggg�J� 8;i��aĶ����VJ�n.ܙ[Ns<�΢9�?Ű��>��1���8�ob��B�nN��_S!n�է��؇\����)�u��q/~�?�'�S�آD� �P\cU��jb��__9i��8F �%8�:V�J9���N��9a�o��e��īM��D&����N��(0�W
�ڤ�%��)�2U�B�Ky�3��K$��W�QQp� Ȕ��D�K��G�8^�ïBr���f�֓�      5   #  x����j1 �O��
�%��d���B�Pm����+���7Z�I�o�df���z�]}��z�{�)|w���Xt���Nc%R;���s%N�1�硋%���8]JXJ���Zs�4ű������s������P��6���Z ����W�L�٦$�%�UQ�V���J�FR�vT	^����!�#��T���J�ml��$�I^b�(�� ������U�+�_B�=�`� �c���w���!�����AH�g�Q�,(IGVI��lRަ]�H����l����      7   �  x����N�@ �=_1�J��� n��X��R�`�/� �K�.���&>�a�#��&.�8���w�E5���@����.^F!���,�� v��M�iG��7p<���������y��p]\ �Cd7L�ǳ�qƁ2t�/;y����8.�y�7��b��	�>9х���Z�kH.��oj��f6R/{oh�18������ ��U� W�<�G�E��(�
_��)��u���M��ߜz;n�Zv�ND/�'r�;FL�NMZ�Ln-OOG)�V�P�۶����Ӧ�fAV����&����<���ܼ]��,.�Ԝ �%:��W;5�M]�������ɽ�F�b�)�.��p�$���dԩ:s]O8�~U��j��˽?H�0      9      x��\[oWr~���<��wf8���X���/�/�"/E"beːh~�E�
eӒx���ڛ $���s%��������N���J �!��>������o�w����7�~����O��������ݽ�ɭ�����Zr����ow�?ܒ��ߺ�����ݏj����oɳ�[w�lݫ%;�;w���yo��~r_~�%/���{��v����o_���%WZ���f��|�޺�h$���V}����Xo�֗_�O�?�i~����lwv�\��4�Ͽ�?O�n&k+��l��<�_[If�|�����S��4�%�$���Yg����8��tv��䟶|�8с��3ʳ$�]�dw��3̖g|�Øiy��.I��Ύe���(�粊����42�,^V1��bR}%?�W�I~��f���2�Tv�پ����\f�� ���Au��NR��<�/�����ž':2V��L��c�7��'��_�:��Lx������<{�����p��l/?�GSg��O��P�z �N��s�f����u�Q&o��AWz"�Ձ��	�CM����$"8.U_��u�]��T�;�D9{<��Rn�E�V��Nޣ��Jw�'�BM��R��#3�|���<�N3��y��ߗ��ꎻ�qy�2-���4C_���gH!�N�\>��Q���*�*�����P\���e�TOWlD�ǁ뗆�Rʒ�P����8vU�B�h�!��O��#	���T~�J��oץ����<2ސF�Q��]}^Qt�2F~8��E�	��j-c�`��H?R�pzy�|,�TCJ�3ZW{9�%�̳��{��kZ��a|ύ��ȐX"߱�TV턺+�cq�f|����e	,��(KI�^o���S3;���d��-!ƋF�ʿ���`�]N1��=��C%u�OH����R��px{�o�%�Z��g��c�T�����.�T��x��E�_FK���j���_�⍇�֗ ����j�5�7����`Oa�Uꇺc?�/UrXi1��rk���X��}[�-�;�%�j�pɟ�;�����J��Q�Pd��a'��ԎZ�'��u�ݠ`��	$(>���<:��lOx�����`��<��Oy�,i�b\��>������|7�1�FV?����/S��Tu�0`�Ot�^�Xşou��o��YO�M����{
(WB�S'4t���Ŕk��gD]�ܘ��
��Oa�CטC�, @3,��l��O��Y��gX0D%£�}c˘l�7���!IH�&e�rӿ�cZ����2/ъIь*j���У1�R��W܆���L�p���	Ԍ�D��҆��`J�l���s��h��� �SŴ b�0��	 .C��%5�����x3i4��cȥ+dqyc���q�)&תFs�W//�J ��!(A�����3����Ye �W���7~Q��R������rs��ެ���$�^����+��@�����Ȝ�J�Ƀ�"L~Jr�v��D�G�Y���M̔��Ϝ-v7 �s��������� μ�8aC<5����.:<�](�����h���6�	��=)�;�rݱ�p�
��yD�j�>��$�	W��O-�Qvp�9�,t�`��X��6�S	�j��S��*��M���e��ù��똔�Q�-��`��y�b.]�1��֖��ٌU�j|�2��J�RlR���g�V���e���q��ӂ+Eڪ:��k��Mȷ��shX�XW!#��U�Q��d�8H�3{��༪͌V��D��O��d�a�)�"�M��-��5�,�[�"�	z<�6짭�lZ���J ݇�c�gl��-�Zo;��/���H�Pij̪���Y>}@��ò��lII�>ݷEf&i�EA��f�`t�d���c��\q`���I����E���8`]���	���8TX����B��/B����E!q����U��1[ ��"cX����E�Ey3B��lS�10�minR9k'�����P|{�K�L�^�����M����<y��@�)�Pg�yrBDa�
	�mI�Ŕ�J��9B���b�(�|��j�1��Pf ��F3�֔����Ñ�8�k�MZ�p�D�'��i�)/�{��S� W��ǒƞ�ͳ�%��EÅG*���/z��gJ�'BY�7U2EȘ.
�*�	qcm�~�.xe��h	=���o�5��5M����ƒP��J�� ��P;�ڢ�@�ŗ�����o��Y��\^^Z�Xn4V�̯ª:������9�Ax#B?�6��8��)� 0�a�hOG0@�<��X���Ȃ"��)�)h���<��\*��>S��0�IL_5�3���:�~�.pE��F�G3>q'��C����=s c|(t��w��0�31ؓ�2fB�T_5���!1�m$�u�N�7C�,넸��1�8�3(����O��߿��a-1+¼5,x�+���)G%j^�� �6���#�P"뙊�>"J�q��ތI�B�u=������]����}< uAla�!�J��߽��X�����,��4eP]�� ����/^�����$W��ux���*�.��p-�Wt�1�������>���O=�1K�c%���ֵS�L�4qq\s6���C��I~K^�9l{�pE��!�lV��]+ؘ����=��na�1���i_͋�SF,����m{��`P&Rbl[I���J�e�!/�£C�tD-�_����|h)�?+��N�J��r�!ϩ��"bl?V�L�soP�a����C�Ӭ"{��b�;e��<A��s�`g"1$I�a?B�����st�S����!���2�=�d4�P�ĉiC�����e���&�R��b#x�t,2�I�ECE�H��\)�y�����R�t9��/5yS��XL���J<�g��ebX��^l)͘�mie�����ܼ��z�hC�3a��ƛR�D�^�$������O�5�riǜ�1V��8��R�� �A�&��ٶEq#�iH�l��`�Y�~�
y�Ez�������2�Bmc�W��ZQ�K���������'�v�^�+/a��_���ϱ�Fc��Zj46V�X�C�N�h+���J*5�0��0)�eb�e�Ι�x�-�_ ^'�#+3��o0g��J3T�!� �?Xz*��|��0-�Y��=�i��t&;��6�z��!J2�|�|j2+�U�2��"�����D��!A�3��g?7���TX�'?�����'i��-w�J�T��k!2-.�H{2�����h��S�E��"��1�Q� �9�"}�����	�,�렧8>K(X��\�sˤ���<D�����+Ga�D�"9TCk�*�:m&��t,��$g ��j!� ?�O�<�]����Ӟ&Ά�B����d	6�"o��Q7hE�Sk��!%[��Y�����(c4M�ѹ�ç<�V��(�{˜��}��X���֊�,!L����"��MҶ-��Z��2M�(�)�@#?%������9�p��'<�8D�GR;n%�V��QA�]�B|�yh1��-ZS��w��)��EAI���3e�|^�k��V�]�*s@uA�O���ݵ�
E�tm��fs�
�����(%����ǦU̖�lw=Hw0�]�()�!K� 6�4�M�O=s��}?�%Z�Q��D��9�R�����W�L�Zl�R��:����$����,_XD̖ �)",A�;���wհ|�()ٍ7i�|�ӂ�К��2����ݝ������"L�!N��iy����}@�X淗��"d"���E�K}��!���2��=U�R�0���%X�������BR%tL
���~hy��y�H�]�"Lʩ��)3����Xz�zЅ��<��D)�I�pa���7��`m�@S֍F��b˟
��W�K� �A��}��������7�+R��4
ר�k���rc���j4�t����n�Ʀ��0H92+��*�^�&6zl0��R��nf���5MªІ�������}#�!�o��y�ߨ�D��Q"E�+�C�V'����g�w{G' �  C�h����X�s�����'1F>9���)4Q�tt�6x��wv�n��3U��t���>�"�V�i��M �-��Z��,b�O
:�6��gQ;qC �p�"��ٚJ+R��<҅�x��.��� T��}5[�u�3tv�i0.�v�͝���OD�FK�*}�4xh�ְ�3s�ݰR~;����?2��ʐ�[j��1c�a�D����Q���֐����b���c�����r�>��]��c,�^9"U*�).O�ikK�^��sַ�4�_B��K�������b��3p���Il�a�8#Nt�E��C��L])�L5h�rfI�Ab�z]�L��� ��{?�9<��h�䢝������d�a���eD��#
e1�gc���8
�ED�E�)_��;ƫMqB��R�<R}c�����;7�m�!@��~L�X�g��߼�ӷjɕ����o�w����{�Ƽw[�\�XZ[]�h�O=a6?���gx����a�ϩ�Ӄ#z肙놺�yl/jQ����Œ���;�F�RK�ӓ�r@:��W �u�e�ɕIb��`�H�D�TS�9�`(�njE�:�>>C�f�`D-�v���6�^Y<��Lvw���<������Ґ�Q����g$\�k�ͻ��(]z'9�&宑f��\K֓�}�"/{N��^�r�!�l� ���Ί.���(M-a?�Gqn�P���	s��i�o��vQ�x�-�p2��v;,�C9=����4�[)�c��H��̈́����B�hq��%�N<��мB�y��J�.y��*f�SH\�ES����!s �<h�#��Z��%�-���Wg�yKW ���;Ϻ�z�6�S�!	[9�����k��y�?��Sm���Y���fl�y�fV��S�x�$�ss�ݺ���O�&��*����Hxѧ/��i��������r��j���*�&���_}��7_�}��CrF6r]��\���Wd��\9ŨO8��m9���5�zn0�Ѫ)AsT����D	X�HLl����m�SO}ԩFF܇% ������VF1?4�4t��S|����[���1���z�1�>$0X^̳S�����xyFޤ����L��K<�v�/Lz�>��.7�g�"s���U�ƻO5D ��\΋&p��lH#X��'�*c������'�,�φ>$�c�����t)4�T;ӫraN��M��cV�x��d�,d��Yv��+�;ӂ�dծ�̋n'8&�����>�,+��`�CW��:���U�o��u~��,���g~�-d�n;�)��֘.�8����(�;���
���YW#��K�ή6V�OV�8�<P��[�_[�'�N�F�Z����U�֒�?x�͟�<$a�ly�����@g�B�$�k����#�xtCW��U�#���ٱh��y��q\��<tu��$!@����!�KPъ+eو������G�.��";�&xvuG>�r�گ0��o;��?����u�Ew/�ULv�N23.���>RP�I��?�V�;+�E�i-`Q��^�rY"�:�$��V?)�E��[UD�t��o����QoL�c�Rw��<����7�L�A^֏n��]	�ý|,��]-5�Z^	�Y�>��ٱ���qV��S���E�B��H�+�m��i�-n�t��=��}ʞu��=p�:&̷�T<�@�?� ��o��WrK�y�0��>JC~��t&���z��RX�~�K�^Iy����,���s_"Q�Z_�9�9��j=�?wD>��;\���ɯ�����.      ;   
   x���         