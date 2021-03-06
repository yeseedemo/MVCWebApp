PGDMP                         v            ddp    10.4    10.3 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    16749    ddp    DATABASE     �   CREATE DATABASE ddp WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Chinese (Traditional)_Taiwan.950' LC_CTYPE = 'Chinese (Traditional)_Taiwan.950';
    DROP DATABASE ddp;
             bbp_user    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1                       1259    17160    account    TABLE     �   CREATE TABLE public.account (
    "STR_userid" character varying(20) NOT NULL,
    "STR_passwd" character varying(64) NOT NULL,
    "STR_permission" character varying(10) NOT NULL,
    "STR_email" character varying(60) NOT NULL
);
    DROP TABLE public.account;
       public         bbp_user    false    3            �            1259    16950    apilog    TABLE     �  CREATE TABLE public.apilog (
    bint_apilogid bigint NOT NULL,
    str_apiname character varying(50) NOT NULL,
    chr_direction character(1) NOT NULL,
    chr_devicetype character(3) NOT NULL,
    str_http character varying(200) NOT NULL,
    str_messagebody character varying(1000) NOT NULL,
    str_guid character varying(36) NOT NULL,
    create_date timestamp(6) without time zone,
    create_id character varying(20)
);
    DROP TABLE public.apilog;
       public         bbp_user    false    3            �            1259    16948    apilog_bint_apilogid_seq    SEQUENCE     �   CREATE SEQUENCE public.apilog_bint_apilogid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.apilog_bint_apilogid_seq;
       public       bbp_user    false    3    236            �           0    0    apilog_bint_apilogid_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.apilog_bint_apilogid_seq OWNED BY public.apilog.bint_apilogid;
            public       bbp_user    false    235                       1259    17088    coupon_item_relation    TABLE     ;  CREATE TABLE public.coupon_item_relation (
    bint_couponevtid bigint NOT NULL,
    str_companyid character varying(10) NOT NULL,
    str_itemno character varying(13) NOT NULL,
    str_dishname character varying(100) NOT NULL,
    create_date timestamp(6) without time zone,
    create_id character varying(20)
);
 (   DROP TABLE public.coupon_item_relation;
       public         bbp_user    false    3                       1259    17093    coupon_store_relation    TABLE     
  CREATE TABLE public.coupon_store_relation (
    bint_couponevtid bigint NOT NULL,
    str_companyid character varying(10) NOT NULL,
    str_storeno character varying(8) NOT NULL,
    create_date timestamp(6) without time zone,
    create_id character varying(20)
);
 )   DROP TABLE public.coupon_store_relation;
       public         bbp_user    false    3                       1259    17078    couponevt_member_condition    TABLE     �  CREATE TABLE public.couponevt_member_condition (
    bint_couponevtid bigint NOT NULL,
    chr_choicetype character(1) NOT NULL,
    str_memtype character varying(50),
    str_memlevel character varying(2),
    str_membtdm character varying(50),
    str_memgen character varying(2),
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 .   DROP TABLE public.couponevt_member_condition;
       public         bbp_user    false    3                       1259    17083    couponevt_member_relation    TABLE     �  CREATE TABLE public.couponevt_member_relation (
    bint_couponevtid bigint NOT NULL,
    str_memberid character varying(20) NOT NULL,
    chr_choicetype character(1) NOT NULL,
    str_memtype character varying(50),
    str_memlevel character varying(2),
    str_membtdm character varying(2),
    str_memgen character varying(2),
    create_date timestamp(6) without time zone,
    create_id character varying(20)
);
 -   DROP TABLE public.couponevt_member_relation;
       public         bbp_user    false    3            	           1259    17118    demo    TABLE     �   CREATE TABLE public.demo (
    int_seq integer NOT NULL,
    str_fisrt character(10),
    str_last character(10),
    int_age integer NOT NULL,
    str_street character varying(255),
    str_city character varying(255)
);
    DROP TABLE public.demo;
       public         bbp_user    false    3            �            1259    16873    dish_subtag    TABLE     �  CREATE TABLE public.dish_subtag (
    str_companyid character varying(10) NOT NULL,
    int_tagid integer NOT NULL,
    int_subtagid integer NOT NULL,
    str_explain character varying(50),
    num_price numeric(14,1),
    str_itemno character varying(13),
    int_tastno integer,
    bool_enabled boolean,
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
    DROP TABLE public.dish_subtag;
       public         bbp_user    false    3            �            1259    16868    dish_tag    TABLE     �  CREATE TABLE public.dish_tag (
    str_companyid character varying(10) NOT NULL,
    int_tagid integer NOT NULL,
    int_tastcd integer,
    chr_choicemode character(1) NOT NULL,
    str_explain character varying(20) NOT NULL,
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
    DROP TABLE public.dish_tag;
       public         bbp_user    false    3            �            1259    16878    dish_tag_relation    TABLE       CREATE TABLE public.dish_tag_relation (
    bint_dishid bigint NOT NULL,
    int_subtagid integer NOT NULL,
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 %   DROP TABLE public.dish_tag_relation;
       public         bbp_user    false    3            �            1259    16893 
   flownumber    TABLE     t  CREATE TABLE public.flownumber (
    str_companyid character varying(10) NOT NULL,
    str_storeno character varying(8) NOT NULL,
    str_key character varying(50) NOT NULL,
    int_value integer NOT NULL,
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
    DROP TABLE public.flownumber;
       public         bbp_user    false    3            �            1259    17012    money_activity    TABLE       CREATE TABLE public.money_activity (
    str_companyid character varying(10) NOT NULL,
    str_activityid character varying(30) NOT NULL,
    str_subject character varying(50) NOT NULL,
    str_explain character varying(200),
    num_price numeric(14,1) NOT NULL,
    int_points integer NOT NULL,
    dtm_start date NOT NULL,
    dtm_end date NOT NULL,
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 "   DROP TABLE public.money_activity;
       public         bbp_user    false    3            �            1259    16898 	   numberlog    TABLE     .  CREATE TABLE public.numberlog (
    str_companyid character varying(10) NOT NULL,
    str_storeno character varying(8) NOT NULL,
    str_memberid character varying(20) NOT NULL,
    str_prefix character varying(4) NOT NULL,
    int_number integer,
    create_datetime timestamp(6) without time zone
);
    DROP TABLE public.numberlog;
       public         bbp_user    false    3            �            1259    16888    order_seat_relation    TABLE     �  CREATE TABLE public.order_seat_relation (
    str_companyid character varying(10) NOT NULL,
    str_storeno character varying(8) NOT NULL,
    str_preorderno character varying(16) NOT NULL,
    str_tableno character varying(4) NOT NULL,
    dtm_orderdate date NOT NULL,
    chr_ordertimestart character(4) NOT NULL,
    dtm_booktime timestamp(6) without time zone NOT NULL,
    dtm_booktimeend timestamp(6) without time zone NOT NULL,
    int_peoplenum integer NOT NULL,
    chr_biztimestart character(4) NOT NULL,
    chr_biztimeend character(4),
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 '   DROP TABLE public.order_seat_relation;
       public         bbp_user    false    3            �            1259    16908    orderlogserial    SEQUENCE     �   CREATE SEQUENCE public.orderlogserial
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
    CYCLE;
 %   DROP SEQUENCE public.orderlogserial;
       public       bbp_user    false    3            �            1259    17030    point_changeevt    TABLE     �  CREATE TABLE public.point_changeevt (
    bint_evtid bigint NOT NULL,
    str_companyid character varying(10) NOT NULL,
    str_storeno character varying(8) NOT NULL,
    str_subject character varying(50) NOT NULL,
    str_mmcd character varying(6) NOT NULL,
    chr_type character(1) NOT NULL,
    int_point integer NOT NULL,
    num_sirate numeric(10,1),
    str_channel character varying(20),
    str_machine character varying(20),
    chr_sts character(1) NOT NULL,
    chr_kind character(1) NOT NULL,
    chr_online character(1) NOT NULL,
    str_content character varying(100) NOT NULL,
    dtm_evtstart timestamp(6) without time zone NOT NULL,
    dtm_evtend timestamp(6) without time zone NOT NULL,
    bool_ischannel boolean,
    bool_isstore boolean,
    bool_isitemlimit boolean,
    bool_isonce boolean,
    bool_isexclusivity boolean,
    str_cancelnote character varying(100),
    bool_acctype boolean,
    bool_isfixed boolean,
    str_fixedkey character varying(7),
    str_imgpath character varying(200),
    dtm_canceltime timestamp(6) without time zone,
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 #   DROP TABLE public.point_changeevt;
       public         bbp_user    false    3            �            1259    17028    point_changeevt_bint_evtid_seq    SEQUENCE     �   CREATE SEQUENCE public.point_changeevt_bint_evtid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.point_changeevt_bint_evtid_seq;
       public       bbp_user    false    3    251            �           0    0    point_changeevt_bint_evtid_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.point_changeevt_bint_evtid_seq OWNED BY public.point_changeevt.bint_evtid;
            public       bbp_user    false    250            �            1259    17019    point_mapping    TABLE     F  CREATE TABLE public.point_mapping (
    bint_pointevtid bigint NOT NULL,
    str_pointevtname character varying(50) NOT NULL,
    str_companyid character varying(10) NOT NULL,
    str_storeno character varying(8) NOT NULL,
    str_channel character varying(20),
    str_machine character varying(20),
    chr_sts character(1) NOT NULL,
    chr_kind character(1) NOT NULL,
    chr_online character(1) NOT NULL,
    str_content character varying(100) NOT NULL,
    int_count integer NOT NULL,
    dtm_evtstart timestamp(6) without time zone NOT NULL,
    dtm_evtend timestamp(6) without time zone NOT NULL,
    str_mmcd character(6) NOT NULL,
    chr_type character(1) NOT NULL,
    num_sirate numeric(10,1) NOT NULL,
    bool_ischannel boolean,
    bool_isstore boolean,
    bool_isitemlimit boolean,
    bool_isonce boolean,
    bool_isexclusivity boolean,
    str_cancelnote character varying(100),
    bool_acctype boolean,
    bool_isfixed boolean,
    str_fixedkey character varying(7),
    str_imgpath character varying(200),
    int_point integer,
    str_usedate character varying(20),
    str_memberid character varying(20),
    dtm_canceltime timestamp(6) without time zone,
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 !   DROP TABLE public.point_mapping;
       public         bbp_user    false    3            �            1259    17017 !   point_mapping_bint_pointevtid_seq    SEQUENCE     �   CREATE SEQUENCE public.point_mapping_bint_pointevtid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.point_mapping_bint_pointevtid_seq;
       public       bbp_user    false    3    249            �           0    0 !   point_mapping_bint_pointevtid_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.point_mapping_bint_pointevtid_seq OWNED BY public.point_mapping.bint_pointevtid;
            public       bbp_user    false    248            �            1259    17044    pointevt_item_relation    TABLE     7  CREATE TABLE public.pointevt_item_relation (
    bint_evtid bigint NOT NULL,
    str_companyid character varying(10) NOT NULL,
    str_itemno character varying(13) NOT NULL,
    str_dishname character varying(100) NOT NULL,
    create_date timestamp(6) without time zone,
    create_id character varying(20)
);
 *   DROP TABLE public.pointevt_item_relation;
       public         bbp_user    false    3            �            1259    17039    pointevt_store_relation    TABLE       CREATE TABLE public.pointevt_store_relation (
    bint_evtid bigint NOT NULL,
    str_companyid character varying(10) NOT NULL,
    str_storeno character varying(13) NOT NULL,
    create_date timestamp(6) without time zone,
    create_id character varying(20)
);
 +   DROP TABLE public.pointevt_store_relation;
       public         bbp_user    false    3            �            1259    16932    points_activity    TABLE     0  CREATE TABLE public.points_activity (
    str_companyid character varying(10) NOT NULL,
    str_activityid character varying(30) NOT NULL,
    str_subject character varying(50) NOT NULL,
    str_explain character varying(200),
    num_price numeric(14,1) NOT NULL,
    int_points integer NOT NULL,
    dtm_start date NOT NULL,
    dtm_end date NOT NULL,
    str_imgpath character varying(255),
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 #   DROP TABLE public.points_activity;
       public         bbp_user    false    3                        1259    17057    pushevt_member_condition    TABLE     �  CREATE TABLE public.pushevt_member_condition (
    bint_pushevtid bigint NOT NULL,
    chr_choicetype character(1) NOT NULL,
    str_memtype character varying(50),
    str_memlevel character varying(2),
    str_membtdm character varying(2),
    str_memgen character varying(2),
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 ,   DROP TABLE public.pushevt_member_condition;
       public         bbp_user    false    3                       1259    17062    pushevt_member_relation    TABLE     �  CREATE TABLE public.pushevt_member_relation (
    bint_pushevtid bigint NOT NULL,
    str_memberid character varying(20) NOT NULL,
    chr_choicetype character(1) NOT NULL,
    str_memtype character varying(50),
    str_memlevel character varying(2),
    str_membtdm character varying(2),
    str_memgen character varying(2),
    create_date timestamp(6) without time zone,
    create_id character varying(20)
);
 +   DROP TABLE public.pushevt_member_relation;
       public         bbp_user    false    3            �            1259    16883    store_advertising    TABLE     �  CREATE TABLE public.store_advertising (
    str_companyid character varying(10) NOT NULL,
    str_adid character varying(30) NOT NULL,
    str_explain character varying(200),
    dtm_start date NOT NULL,
    dtm_end date NOT NULL,
    str_imgpath character varying(200),
    bool_enabled boolean,
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 %   DROP TABLE public.store_advertising;
       public         bbp_user    false    3            �            1259    16837    store_batch    TABLE     �  CREATE TABLE public.store_batch (
    bint_batchid bigint NOT NULL,
    str_content character varying(200),
    dtm_exe timestamp(6) without time zone,
    dtm_finish timestamp(6) without time zone,
    str_status character varying(4),
    str_exefile character varying(255),
    str_exelog character varying(1000),
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
    DROP TABLE public.store_batch;
       public         bbp_user    false    3            �            1259    16835    store_batch_bint_batchid_seq    SEQUENCE     �   CREATE SEQUENCE public.store_batch_bint_batchid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.store_batch_bint_batchid_seq;
       public       bbp_user    false    3    214            �           0    0    store_batch_bint_batchid_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.store_batch_bint_batchid_seq OWNED BY public.store_batch.bint_batchid;
            public       bbp_user    false    213                       1259    17069    store_couponevt    TABLE     �  CREATE TABLE public.store_couponevt (
    bint_couponevtid bigint NOT NULL,
    str_companyid character varying(10) NOT NULL,
    str_storeno character varying(8) NOT NULL,
    str_channel character varying(20),
    str_machine character varying(20),
    str_ecamid character varying(50) NOT NULL,
    str_couponname character varying(50) NOT NULL,
    chr_sts character(1) NOT NULL,
    chr_kind character(1) NOT NULL,
    chr_online character(1) NOT NULL,
    str_content character varying(100) NOT NULL,
    int_count integer NOT NULL,
    dtm_evtstart timestamp(6) without time zone NOT NULL,
    dtm_evtend timestamp(6) without time zone NOT NULL,
    str_mmcd character(6) NOT NULL,
    chr_type character(1) NOT NULL,
    num_sirate numeric(10,1),
    bool_ischannel boolean,
    bool_isstore boolean,
    bool_isitemlimit boolean,
    bool_ismemlimit boolean,
    bool_ismembtd boolean,
    str_membtdm character varying(30),
    bool_isonce boolean,
    bool_isexclusivity boolean,
    str_cancelnote character varying(100),
    bool_acctype boolean,
    bool_isfixed boolean,
    str_fixedkey character varying(7),
    str_imgpath character varying(200),
    int_point integer,
    dtm_gendate date,
    bool_isexe boolean,
    dtm_canceltime timestamp(6) without time zone,
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 #   DROP TABLE public.store_couponevt;
       public         bbp_user    false    3                       1259    17067 $   store_couponevt_bint_couponevtid_seq    SEQUENCE     �   CREATE SEQUENCE public.store_couponevt_bint_couponevtid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.store_couponevt_bint_couponevtid_seq;
       public       bbp_user    false    259    3            �           0    0 $   store_couponevt_bint_couponevtid_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.store_couponevt_bint_couponevtid_seq OWNED BY public.store_couponevt.bint_couponevtid;
            public       bbp_user    false    258                       1259    17098    store_couponlog    TABLE     c  CREATE TABLE public.store_couponlog (
    bint_couponevtid bigint NOT NULL,
    str_coupon character varying(40) NOT NULL,
    str_memberid character varying(20),
    bool_enabled boolean,
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 #   DROP TABLE public.store_couponlog;
       public         bbp_user    false    3            �            1259    16959    store_discount    TABLE     F  CREATE TABLE public.store_discount (
    str_companyid character varying(10) NOT NULL,
    str_storeno character varying(8) NOT NULL,
    str_mmcd character(6) NOT NULL,
    str_mmname character varying(40) NOT NULL,
    chr_type character(1),
    num_sirate numeric(10,1),
    str_itemno character varying(13),
    dtm_efftimestart date NOT NULL,
    dtm_efftimeend date NOT NULL,
    int_delflag integer NOT NULL,
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 "   DROP TABLE public.store_discount;
       public         bbp_user    false    3            �            1259    16858    store_dish_main    TABLE     E  CREATE TABLE public.store_dish_main (
    bint_dishid bigint NOT NULL,
    str_storeno character varying(8) NOT NULL,
    str_companyid character varying(10) NOT NULL,
    int_type integer NOT NULL,
    str_itemno character varying(13) NOT NULL,
    str_dishname character varying(100) NOT NULL,
    str_unit character varying(10) NOT NULL,
    str_dishexplain character varying(200),
    str_bcls character varying(4) NOT NULL,
    str_mcls character varying(4) NOT NULL,
    str_scls character varying(4) NOT NULL,
    str_sercd character varying(10),
    num_price numeric(14,1),
    dtm_validstart date,
    dtm_validend date,
    str_imgpath character varying(255),
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 #   DROP TABLE public.store_dish_main;
       public         bbp_user    false    3            �            1259    16856    store_dish_main_bint_dishid_seq    SEQUENCE     �   CREATE SEQUENCE public.store_dish_main_bint_dishid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.store_dish_main_bint_dishid_seq;
       public       bbp_user    false    3    218            �           0    0    store_dish_main_bint_dishid_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.store_dish_main_bint_dishid_seq OWNED BY public.store_dish_main.bint_dishid;
            public       bbp_user    false    217            �            1259    16964    store_dishbcls    TABLE     V  CREATE TABLE public.store_dishbcls (
    str_companyid character varying(10) NOT NULL,
    str_bcls character varying(4) NOT NULL,
    str_name character varying(50) NOT NULL,
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 "   DROP TABLE public.store_dishbcls;
       public         bbp_user    false    3            �            1259    16969    store_dishmcls    TABLE     �  CREATE TABLE public.store_dishmcls (
    str_companyid character varying(10) NOT NULL,
    str_bcls character varying(4) NOT NULL,
    str_mcls character varying(4) NOT NULL,
    str_name character varying(50) NOT NULL,
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 "   DROP TABLE public.store_dishmcls;
       public         bbp_user    false    3            �            1259    16974    store_dishscls    TABLE     �  CREATE TABLE public.store_dishscls (
    str_companyid character varying(10) NOT NULL,
    str_bcls character varying(4) NOT NULL,
    str_mcls character varying(4) NOT NULL,
    str_scls character varying(4) NOT NULL,
    str_name character varying(50) NOT NULL,
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 "   DROP TABLE public.store_dishscls;
       public         bbp_user    false    3            �            1259    16979    store_dishseries    TABLE     Z  CREATE TABLE public.store_dishseries (
    str_companyid character varying(10) NOT NULL,
    str_sercd character varying(10) NOT NULL,
    str_name character varying(50) NOT NULL,
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 $   DROP TABLE public.store_dishseries;
       public         bbp_user    false    3            �            1259    16846    store_dishset    TABLE     7  CREATE TABLE public.store_dishset (
    bint_dishsetid bigint NOT NULL,
    bint_dishid bigint NOT NULL,
    str_dishname character varying(50),
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 !   DROP TABLE public.store_dishset;
       public         bbp_user    false    3            �            1259    16851    store_dishset_cand    TABLE     c  CREATE TABLE public.store_dishset_cand (
    bint_dishsetid bigint NOT NULL,
    bint_dishid bigint NOT NULL,
    bint_dishcandid bigint NOT NULL,
    num_candprice numeric(14,1) NOT NULL,
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 &   DROP TABLE public.store_dishset_cand;
       public         bbp_user    false    3            �            1259    16791    store_holiday    TABLE     �  CREATE TABLE public.store_holiday (
    str_storeno character varying(8) NOT NULL,
    str_companyid character varying(10) NOT NULL,
    str_mode character varying(4) NOT NULL,
    dtm_holiday date NOT NULL,
    str_content character varying(200),
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 !   DROP TABLE public.store_holiday;
       public         bbp_user    false    3            �            1259    16750 
   store_main    TABLE     �  CREATE TABLE public.store_main (
    str_companyid character varying(10) NOT NULL,
    str_storename character varying(100),
    chr_uninumber character(8),
    str_privacy character varying(8000),
    str_startpageimg character varying(255),
    str_bannerimg character varying(255),
    str_defaultimg character varying(255),
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
    DROP TABLE public.store_main;
       public         bbp_user    false    3            �            1259    16801    store_numberlog    TABLE       CREATE TABLE public.store_numberlog (
    str_storeno character varying(8) NOT NULL,
    str_companyid character varying(10) NOT NULL,
    dtm_date date NOT NULL,
    chr_biztimestart character(4) NOT NULL,
    chr_biztimeend character(4) NOT NULL,
    str_prefix character varying(4) NOT NULL,
    int_init integer,
    int_current integer,
    int_release integer,
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 #   DROP TABLE public.store_numberlog;
       public         bbp_user    false    3            �            1259    16796    store_numsetting    TABLE     �  CREATE TABLE public.store_numsetting (
    str_storeno character varying(8) NOT NULL,
    str_companyid character varying(10) NOT NULL,
    str_prefix character varying(4) NOT NULL,
    str_content character varying(200),
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 $   DROP TABLE public.store_numsetting;
       public         bbp_user    false    3            �            1259    16910    store_orderlog    TABLE     �  CREATE TABLE public.store_orderlog (
    bint_orderlogid bigint DEFAULT nextval('public.orderlogserial'::regclass) NOT NULL,
    str_companyid character varying(10) NOT NULL,
    str_storeno character varying(8) NOT NULL,
    str_orderno character varying(16) NOT NULL,
    bint_dishid bigint NOT NULL,
    str_dishname character varying(50) NOT NULL,
    chr_type character(1) NOT NULL,
    int_dishtype integer NOT NULL,
    str_unit character varying(10) NOT NULL,
    int_amount integer NOT NULL,
    bint_parentid bigint,
    num_price numeric(14,1) NOT NULL,
    create_date timestamp(6) without time zone,
    create_id character varying(20)
);
 "   DROP TABLE public.store_orderlog;
       public         bbp_user    false    227    3            �            1259    16903    store_orderlog_main    TABLE     y  CREATE TABLE public.store_orderlog_main (
    str_companyid character varying(10) NOT NULL,
    str_storeno character varying(8) NOT NULL,
    str_orderno character varying(16) NOT NULL,
    str_preorderno character varying(16),
    chr_ordertime character(14) NOT NULL,
    dtm_takeawaytime timestamp(6) without time zone,
    str_memberid character varying(20) NOT NULL,
    str_memberphone character varying(20),
    dtm_canceltime timestamp(6) without time zone,
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 '   DROP TABLE public.store_orderlog_main;
       public         bbp_user    false    3            �            1259    16916    store_orderlog_subtag    TABLE     !  CREATE TABLE public.store_orderlog_subtag (
    bint_orderlogid bigint NOT NULL,
    int_subtagid integer NOT NULL,
    str_explain character varying(20) NOT NULL,
    num_price numeric(14,1) NOT NULL,
    create_date timestamp(6) without time zone,
    create_id character varying(20)
);
 )   DROP TABLE public.store_orderlog_subtag;
       public         bbp_user    false    3            �            1259    16771    store_preorder    TABLE     �  CREATE TABLE public.store_preorder (
    str_storeno character varying(8) NOT NULL,
    str_companyid character varying(10) NOT NULL,
    chr_biztimestart character(4) NOT NULL,
    chr_biztimeend character(4) NOT NULL,
    int_peoplenum integer NOT NULL,
    str_content character varying(200),
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 "   DROP TABLE public.store_preorder;
       public         bbp_user    false    3            �            1259    16786    store_preorderex    TABLE     �  CREATE TABLE public.store_preorderex (
    str_storeno character varying(8) NOT NULL,
    str_companyid character varying(10) NOT NULL,
    dtm_exdate date NOT NULL,
    chr_biztimestart character(4) NOT NULL,
    chr_biztimeend character(4) NOT NULL,
    str_content character varying(200),
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 $   DROP TABLE public.store_preorderex;
       public         bbp_user    false    3            �            1259    16781    store_preorderlog    TABLE       CREATE TABLE public.store_preorderlog (
    str_storeno character varying(8) NOT NULL,
    str_companyid character varying(10) NOT NULL,
    str_preorderno character varying(16) NOT NULL,
    dtm_orderdate date NOT NULL,
    str_ordertime character varying(4) NOT NULL,
    dtm_booktime timestamp(6) without time zone NOT NULL,
    dtm_booktimeend timestamp(6) without time zone NOT NULL,
    int_adultnum integer,
    int_childnum integer,
    str_memberid character varying(20) NOT NULL,
    str_memberphone character varying(10) NOT NULL,
    str_content character varying(200),
    dtm_canceltime timestamp(6) without time zone,
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 %   DROP TABLE public.store_preorderlog;
       public         bbp_user    false    3            �            1259    17051    store_pushevt    TABLE     �  CREATE TABLE public.store_pushevt (
    bint_pushevtid bigint NOT NULL,
    str_companyid character varying(10) NOT NULL,
    str_content character varying(200) NOT NULL,
    dtm_evtexe timestamp(6) without time zone NOT NULL,
    chr_isexe character(1) NOT NULL,
    chr_status character(1) NOT NULL,
    chr_devicetype character(2) NOT NULL,
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 !   DROP TABLE public.store_pushevt;
       public         bbp_user    false    3            �            1259    17049     store_pushevt_bint_pushevtid_seq    SEQUENCE     �   CREATE SEQUENCE public.store_pushevt_bint_pushevtid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.store_pushevt_bint_pushevtid_seq;
       public       bbp_user    false    3    255            �           0    0     store_pushevt_bint_pushevtid_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.store_pushevt_bint_pushevtid_seq OWNED BY public.store_pushevt.bint_pushevtid;
            public       bbp_user    false    254            �            1259    16923    store_pushtoken    TABLE     v  CREATE TABLE public.store_pushtoken (
    bint_pushtokenid bigint NOT NULL,
    str_companyid character varying(10) NOT NULL,
    str_pushtoken character varying(200) NOT NULL,
    str_memberid character varying(20),
    chr_devicetype character(2) NOT NULL,
    str_deviceid character varying(100) NOT NULL,
    str_endpointarn character varying(300),
    str_subscribearn character varying(300),
    chr_isregister character(1),
    chr_actioncode character(1),
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 #   DROP TABLE public.store_pushtoken;
       public         bbp_user    false    3            �            1259    16921 $   store_pushtoken_bint_pushtokenid_seq    SEQUENCE     �   CREATE SEQUENCE public.store_pushtoken_bint_pushtokenid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.store_pushtoken_bint_pushtokenid_seq;
       public       bbp_user    false    231    3            �           0    0 $   store_pushtoken_bint_pushtokenid_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.store_pushtoken_bint_pushtokenid_seq OWNED BY public.store_pushtoken.bint_pushtokenid;
            public       bbp_user    false    230            �            1259    16830    store_qfeedback    TABLE     h  CREATE TABLE public.store_qfeedback (
    bint_qoptionid bigint NOT NULL,
    bint_questionid bigint NOT NULL,
    bint_questid bigint NOT NULL,
    str_memberid character varying(20) NOT NULL,
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 #   DROP TABLE public.store_qfeedback;
       public         bbp_user    false    3            �            1259    16808    store_qmain    TABLE     �  CREATE TABLE public.store_qmain (
    bint_questid bigint NOT NULL,
    str_storeno character varying(8) NOT NULL,
    str_companyid character varying(10) NOT NULL,
    str_content character varying(200) NOT NULL,
    dtm_start date,
    dtm_end date,
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
    DROP TABLE public.store_qmain;
       public         bbp_user    false    3            �            1259    16806    store_qmain_bint_questid_seq    SEQUENCE     �   CREATE SEQUENCE public.store_qmain_bint_questid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.store_qmain_bint_questid_seq;
       public       bbp_user    false    3    207            �           0    0    store_qmain_bint_questid_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.store_qmain_bint_questid_seq OWNED BY public.store_qmain.bint_questid;
            public       bbp_user    false    206            �            1259    16824    store_qoptions    TABLE     f  CREATE TABLE public.store_qoptions (
    bint_qoptionid bigint NOT NULL,
    bint_questionid bigint NOT NULL,
    int_code integer NOT NULL,
    str_codevalue character varying(200) NOT NULL,
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 "   DROP TABLE public.store_qoptions;
       public         bbp_user    false    3            �            1259    16822 !   store_qoptions_bint_qoptionid_seq    SEQUENCE     �   CREATE SEQUENCE public.store_qoptions_bint_qoptionid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.store_qoptions_bint_qoptionid_seq;
       public       bbp_user    false    3    211            �           0    0 !   store_qoptions_bint_qoptionid_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.store_qoptions_bint_qoptionid_seq OWNED BY public.store_qoptions.bint_qoptionid;
            public       bbp_user    false    210            �            1259    16816    store_questions    TABLE     p  CREATE TABLE public.store_questions (
    bint_questionid bigint NOT NULL,
    bint_questid bigint NOT NULL,
    str_type character varying(4) NOT NULL,
    str_content character varying(200) NOT NULL,
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 #   DROP TABLE public.store_questions;
       public         bbp_user    false    3            �            1259    16814 #   store_questions_bint_questionid_seq    SEQUENCE     �   CREATE SEQUENCE public.store_questions_bint_questionid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.store_questions_bint_questionid_seq;
       public       bbp_user    false    3    209            �           0    0 #   store_questions_bint_questionid_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.store_questions_bint_questionid_seq OWNED BY public.store_questions.bint_questionid;
            public       bbp_user    false    208            �            1259    16776 
   store_seat    TABLE     �  CREATE TABLE public.store_seat (
    str_storeno character varying(8) NOT NULL,
    str_companyid character varying(10) NOT NULL,
    str_tableno character varying(4) NOT NULL,
    int_seat integer NOT NULL,
    str_content character varying(200),
    bool_enabled boolean,
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
    DROP TABLE public.store_seat;
       public         bbp_user    false    3            �            1259    16763 	   store_sub    TABLE     ]  CREATE TABLE public.store_sub (
    str_storeno character varying(8) NOT NULL,
    str_companyid character varying(10) NOT NULL,
    str_storename character varying(100),
    str_city character varying(10),
    str_area character varying(10),
    int_zipcode integer,
    str_address character varying(100),
    dbl_lat numeric(10,6),
    dbl_lng numeric(10,6),
    dtm_opendt date NOT NULL,
    dtm_closdt date NOT NULL,
    str_bizhours character varying(100),
    str_bizhoursdesc character varying(200),
    str_tel character varying(100),
    str_fax character varying(20),
    str_parking character varying(200),
    str_trans character varying(500),
    str_content character varying(500),
    int_preorderdays integer,
    int_nextordertime integer,
    int_cancelordertime integer,
    str_ordernotes character varying(200),
    str_ordersuccess character varying(200),
    int_nextnumbertime integer,
    str_numbernotes character varying(200),
    str_numsuccess character varying(200),
    str_takedishmode character varying(4),
    int_takeawaytime integer,
    str_orderdishnotes character varying(200),
    str_orderdishsuccess character varying(200),
    str_imgpath character varying(255),
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
    DROP TABLE public.store_sub;
       public         bbp_user    false    3            �            1259    16989    sy_function    TABLE     .  CREATE TABLE public.sy_function (
    function_id character varying(10) NOT NULL,
    parent_function_id character varying(10),
    function_name character varying(50),
    level_seq numeric(2,0),
    seq numeric(2,0),
    is_visible character varying(5),
    is_function character varying(5),
    single_login character varying(5),
    function_type character varying(5),
    create_date date,
    create_id character varying(20),
    upd_date date,
    upd_id character varying(20),
    program_id character varying(60),
    path character varying(500)
);
    DROP TABLE public.sy_function;
       public         bbp_user    false    3            �            1259    16997    sy_group_permission    TABLE     �  CREATE TABLE public.sy_group_permission (
    group_function_id integer NOT NULL,
    group_id character varying(10) NOT NULL,
    function_id character varying(10) NOT NULL,
    can_create character varying(5),
    can_search character varying(5),
    can_update character varying(5),
    can_delete character varying(5),
    can_print character varying(5),
    create_date date,
    create_id character varying(20),
    upd_date date,
    upd_id character varying(20)
);
 '   DROP TABLE public.sy_group_permission;
       public         bbp_user    false    3            �            1259    17002    sy_group_set    TABLE     �   CREATE TABLE public.sy_group_set (
    group_id character varying(20) NOT NULL,
    group_name character varying(20),
    create_date date,
    create_id character varying(20),
    upd_date date,
    upd_id character varying(20)
);
     DROP TABLE public.sy_group_set;
       public         bbp_user    false    3            �            1259    17007    sy_user_group_relation    TABLE       CREATE TABLE public.sy_user_group_relation (
    user_group_id integer NOT NULL,
    user_id character varying(10) NOT NULL,
    group_id character varying(10) NOT NULL,
    create_date date,
    create_id character varying(20),
    upd_date date,
    upd_id character varying(20)
);
 *   DROP TABLE public.sy_user_group_relation;
       public         bbp_user    false    3            �            1259    16984    sy_user_profile    TABLE     H  CREATE TABLE public.sy_user_profile (
    user_id character varying(10) NOT NULL,
    user_corp character varying(10) NOT NULL,
    user_name character varying(20),
    user_dept character varying(30),
    user_empno character varying(10),
    user_email character varying(60),
    user_pwd character varying(50),
    eff_date_from date,
    eff_date_to date,
    user_alert_pwd character varying(1),
    user_level character varying(1),
    onuse character varying(5),
    create_date date,
    create_id character varying(20),
    upd_date date,
    upd_id character varying(20)
);
 #   DROP TABLE public.sy_user_profile;
       public         bbp_user    false    3            �            1259    16758    sys_code_param    TABLE     f  CREATE TABLE public.sys_code_param (
    category character varying(50) NOT NULL,
    code character varying(4) NOT NULL,
    explain character varying(20),
    parentid character varying(4),
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 "   DROP TABLE public.sys_code_param;
       public         bbp_user    false    3            
           1259    17126    test_db    TABLE     p  CREATE TABLE public.test_db (
    int_seq integer NOT NULL,
    str_first character varying(20),
    str_last character varying(20),
    int_age integer,
    str_street character varying(255),
    str_city character varying(255),
    str_state character(10),
    int_zip integer,
    str_dollar character(10),
    str_pick character(10),
    str_date character(10)
);
    DROP TABLE public.test_db;
       public         bbp_user    false    3            �            1259    16942    trans_points_log    TABLE     �  CREATE TABLE public.trans_points_log (
    bint_transid bigint NOT NULL,
    int_serialno integer NOT NULL,
    str_companyid character varying(10) NOT NULL,
    str_storeno character varying(8) NOT NULL,
    str_terminalno character varying(2) NOT NULL,
    str_memberid character varying(20) NOT NULL,
    str_orderno character varying(16) NOT NULL,
    num_price numeric(14,1) NOT NULL,
    int_points integer NOT NULL,
    str_rwpsid character varying(32),
    str_activityid character varying(30) NOT NULL,
    int_status integer NOT NULL,
    dtm_canceltime timestamp(6) without time zone,
    create_date timestamp(6) without time zone,
    create_id character varying(20),
    upd_date timestamp(6) without time zone,
    upd_id character varying(20)
);
 $   DROP TABLE public.trans_points_log;
       public         bbp_user    false    3            �            1259    16940 !   trans_points_log_bint_transid_seq    SEQUENCE     �   CREATE SEQUENCE public.trans_points_log_bint_transid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.trans_points_log_bint_transid_seq;
       public       bbp_user    false    3    234            �           0    0 !   trans_points_log_bint_transid_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.trans_points_log_bint_transid_seq OWNED BY public.trans_points_log.bint_transid;
            public       bbp_user    false    233            �           2604    16953    apilog bint_apilogid    DEFAULT     |   ALTER TABLE ONLY public.apilog ALTER COLUMN bint_apilogid SET DEFAULT nextval('public.apilog_bint_apilogid_seq'::regclass);
 C   ALTER TABLE public.apilog ALTER COLUMN bint_apilogid DROP DEFAULT;
       public       bbp_user    false    236    235    236            �           2604    17033    point_changeevt bint_evtid    DEFAULT     �   ALTER TABLE ONLY public.point_changeevt ALTER COLUMN bint_evtid SET DEFAULT nextval('public.point_changeevt_bint_evtid_seq'::regclass);
 I   ALTER TABLE public.point_changeevt ALTER COLUMN bint_evtid DROP DEFAULT;
       public       bbp_user    false    251    250    251            �           2604    17022    point_mapping bint_pointevtid    DEFAULT     �   ALTER TABLE ONLY public.point_mapping ALTER COLUMN bint_pointevtid SET DEFAULT nextval('public.point_mapping_bint_pointevtid_seq'::regclass);
 L   ALTER TABLE public.point_mapping ALTER COLUMN bint_pointevtid DROP DEFAULT;
       public       bbp_user    false    248    249    249            ~           2604    16840    store_batch bint_batchid    DEFAULT     �   ALTER TABLE ONLY public.store_batch ALTER COLUMN bint_batchid SET DEFAULT nextval('public.store_batch_bint_batchid_seq'::regclass);
 G   ALTER TABLE public.store_batch ALTER COLUMN bint_batchid DROP DEFAULT;
       public       bbp_user    false    213    214    214            �           2604    17072     store_couponevt bint_couponevtid    DEFAULT     �   ALTER TABLE ONLY public.store_couponevt ALTER COLUMN bint_couponevtid SET DEFAULT nextval('public.store_couponevt_bint_couponevtid_seq'::regclass);
 O   ALTER TABLE public.store_couponevt ALTER COLUMN bint_couponevtid DROP DEFAULT;
       public       bbp_user    false    258    259    259                       2604    16861    store_dish_main bint_dishid    DEFAULT     �   ALTER TABLE ONLY public.store_dish_main ALTER COLUMN bint_dishid SET DEFAULT nextval('public.store_dish_main_bint_dishid_seq'::regclass);
 J   ALTER TABLE public.store_dish_main ALTER COLUMN bint_dishid DROP DEFAULT;
       public       bbp_user    false    218    217    218            �           2604    17054    store_pushevt bint_pushevtid    DEFAULT     �   ALTER TABLE ONLY public.store_pushevt ALTER COLUMN bint_pushevtid SET DEFAULT nextval('public.store_pushevt_bint_pushevtid_seq'::regclass);
 K   ALTER TABLE public.store_pushevt ALTER COLUMN bint_pushevtid DROP DEFAULT;
       public       bbp_user    false    255    254    255            �           2604    16926     store_pushtoken bint_pushtokenid    DEFAULT     �   ALTER TABLE ONLY public.store_pushtoken ALTER COLUMN bint_pushtokenid SET DEFAULT nextval('public.store_pushtoken_bint_pushtokenid_seq'::regclass);
 O   ALTER TABLE public.store_pushtoken ALTER COLUMN bint_pushtokenid DROP DEFAULT;
       public       bbp_user    false    230    231    231            {           2604    16811    store_qmain bint_questid    DEFAULT     �   ALTER TABLE ONLY public.store_qmain ALTER COLUMN bint_questid SET DEFAULT nextval('public.store_qmain_bint_questid_seq'::regclass);
 G   ALTER TABLE public.store_qmain ALTER COLUMN bint_questid DROP DEFAULT;
       public       bbp_user    false    207    206    207            }           2604    16827    store_qoptions bint_qoptionid    DEFAULT     �   ALTER TABLE ONLY public.store_qoptions ALTER COLUMN bint_qoptionid SET DEFAULT nextval('public.store_qoptions_bint_qoptionid_seq'::regclass);
 L   ALTER TABLE public.store_qoptions ALTER COLUMN bint_qoptionid DROP DEFAULT;
       public       bbp_user    false    211    210    211            |           2604    16819    store_questions bint_questionid    DEFAULT     �   ALTER TABLE ONLY public.store_questions ALTER COLUMN bint_questionid SET DEFAULT nextval('public.store_questions_bint_questionid_seq'::regclass);
 N   ALTER TABLE public.store_questions ALTER COLUMN bint_questionid DROP DEFAULT;
       public       bbp_user    false    208    209    209            �           2604    16945    trans_points_log bint_transid    DEFAULT     �   ALTER TABLE ONLY public.trans_points_log ALTER COLUMN bint_transid SET DEFAULT nextval('public.trans_points_log_bint_transid_seq'::regclass);
 L   ALTER TABLE public.trans_points_log ALTER COLUMN bint_transid DROP DEFAULT;
       public       bbp_user    false    234    233    234            �          0    17160    account 
   TABLE DATA               \   COPY public.account ("STR_userid", "STR_passwd", "STR_permission", "STR_email") FROM stdin;
    public       bbp_user    false    267   �      �          0    16950    apilog 
   TABLE DATA               �   COPY public.apilog (bint_apilogid, str_apiname, chr_direction, chr_devicetype, str_http, str_messagebody, str_guid, create_date, create_id) FROM stdin;
    public       bbp_user    false    236   �      �          0    17088    coupon_item_relation 
   TABLE DATA               �   COPY public.coupon_item_relation (bint_couponevtid, str_companyid, str_itemno, str_dishname, create_date, create_id) FROM stdin;
    public       bbp_user    false    262   *�      �          0    17093    coupon_store_relation 
   TABLE DATA               u   COPY public.coupon_store_relation (bint_couponevtid, str_companyid, str_storeno, create_date, create_id) FROM stdin;
    public       bbp_user    false    263   G�      �          0    17078    couponevt_member_condition 
   TABLE DATA               �   COPY public.couponevt_member_condition (bint_couponevtid, chr_choicetype, str_memtype, str_memlevel, str_membtdm, str_memgen, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    260   d�      �          0    17083    couponevt_member_relation 
   TABLE DATA               �   COPY public.couponevt_member_relation (bint_couponevtid, str_memberid, chr_choicetype, str_memtype, str_memlevel, str_membtdm, str_memgen, create_date, create_id) FROM stdin;
    public       bbp_user    false    261   ��      �          0    17118    demo 
   TABLE DATA               [   COPY public.demo (int_seq, str_fisrt, str_last, int_age, str_street, str_city) FROM stdin;
    public       bbp_user    false    265   ��      �          0    16873    dish_subtag 
   TABLE DATA               �   COPY public.dish_subtag (str_companyid, int_tagid, int_subtagid, str_explain, num_price, str_itemno, int_tastno, bool_enabled, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    220   �      �          0    16868    dish_tag 
   TABLE DATA               �   COPY public.dish_tag (str_companyid, int_tagid, int_tastcd, chr_choicemode, str_explain, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    219   ��      �          0    16878    dish_tag_relation 
   TABLE DATA               p   COPY public.dish_tag_relation (bint_dishid, int_subtagid, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    221   ��      �          0    16893 
   flownumber 
   TABLE DATA               ~   COPY public.flownumber (str_companyid, str_storeno, str_key, int_value, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    224   E�      �          0    17012    money_activity 
   TABLE DATA               �   COPY public.money_activity (str_companyid, str_activityid, str_subject, str_explain, num_price, int_points, dtm_start, dtm_end, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    247   b�      �          0    16898 	   numberlog 
   TABLE DATA               v   COPY public.numberlog (str_companyid, str_storeno, str_memberid, str_prefix, int_number, create_datetime) FROM stdin;
    public       bbp_user    false    225   �      �          0    16888    order_seat_relation 
   TABLE DATA                 COPY public.order_seat_relation (str_companyid, str_storeno, str_preorderno, str_tableno, dtm_orderdate, chr_ordertimestart, dtm_booktime, dtm_booktimeend, int_peoplenum, chr_biztimestart, chr_biztimeend, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    223   ��      �          0    17030    point_changeevt 
   TABLE DATA               �  COPY public.point_changeevt (bint_evtid, str_companyid, str_storeno, str_subject, str_mmcd, chr_type, int_point, num_sirate, str_channel, str_machine, chr_sts, chr_kind, chr_online, str_content, dtm_evtstart, dtm_evtend, bool_ischannel, bool_isstore, bool_isitemlimit, bool_isonce, bool_isexclusivity, str_cancelnote, bool_acctype, bool_isfixed, str_fixedkey, str_imgpath, dtm_canceltime, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    251   ��      �          0    17019    point_mapping 
   TABLE DATA               �  COPY public.point_mapping (bint_pointevtid, str_pointevtname, str_companyid, str_storeno, str_channel, str_machine, chr_sts, chr_kind, chr_online, str_content, int_count, dtm_evtstart, dtm_evtend, str_mmcd, chr_type, num_sirate, bool_ischannel, bool_isstore, bool_isitemlimit, bool_isonce, bool_isexclusivity, str_cancelnote, bool_acctype, bool_isfixed, str_fixedkey, str_imgpath, int_point, str_usedate, str_memberid, dtm_canceltime, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    249   ֆ      �          0    17044    pointevt_item_relation 
   TABLE DATA               }   COPY public.pointevt_item_relation (bint_evtid, str_companyid, str_itemno, str_dishname, create_date, create_id) FROM stdin;
    public       bbp_user    false    253   �      �          0    17039    pointevt_store_relation 
   TABLE DATA               q   COPY public.pointevt_store_relation (bint_evtid, str_companyid, str_storeno, create_date, create_id) FROM stdin;
    public       bbp_user    false    252   �      �          0    16932    points_activity 
   TABLE DATA               �   COPY public.points_activity (str_companyid, str_activityid, str_subject, str_explain, num_price, int_points, dtm_start, dtm_end, str_imgpath, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    232   -�      �          0    17057    pushevt_member_condition 
   TABLE DATA               �   COPY public.pushevt_member_condition (bint_pushevtid, chr_choicetype, str_memtype, str_memlevel, str_membtdm, str_memgen, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    256   �      �          0    17062    pushevt_member_relation 
   TABLE DATA               �   COPY public.pushevt_member_relation (bint_pushevtid, str_memberid, chr_choicetype, str_memtype, str_memlevel, str_membtdm, str_memgen, create_date, create_id) FROM stdin;
    public       bbp_user    false    257   8�      �          0    16883    store_advertising 
   TABLE DATA               �   COPY public.store_advertising (str_companyid, str_adid, str_explain, dtm_start, dtm_end, str_imgpath, bool_enabled, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    222   U�      �          0    16837    store_batch 
   TABLE DATA               �   COPY public.store_batch (bint_batchid, str_content, dtm_exe, dtm_finish, str_status, str_exefile, str_exelog, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    214   2�      �          0    17069    store_couponevt 
   TABLE DATA               !  COPY public.store_couponevt (bint_couponevtid, str_companyid, str_storeno, str_channel, str_machine, str_ecamid, str_couponname, chr_sts, chr_kind, chr_online, str_content, int_count, dtm_evtstart, dtm_evtend, str_mmcd, chr_type, num_sirate, bool_ischannel, bool_isstore, bool_isitemlimit, bool_ismemlimit, bool_ismembtd, str_membtdm, bool_isonce, bool_isexclusivity, str_cancelnote, bool_acctype, bool_isfixed, str_fixedkey, str_imgpath, int_point, dtm_gendate, bool_isexe, dtm_canceltime, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    259   O�      �          0    17098    store_couponlog 
   TABLE DATA               �   COPY public.store_couponlog (bint_couponevtid, str_coupon, str_memberid, bool_enabled, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    264   ۊ      �          0    16959    store_discount 
   TABLE DATA               �   COPY public.store_discount (str_companyid, str_storeno, str_mmcd, str_mmname, chr_type, num_sirate, str_itemno, dtm_efftimestart, dtm_efftimeend, int_delflag, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    237   ��      �          0    16858    store_dish_main 
   TABLE DATA                 COPY public.store_dish_main (bint_dishid, str_storeno, str_companyid, int_type, str_itemno, str_dishname, str_unit, str_dishexplain, str_bcls, str_mcls, str_scls, str_sercd, num_price, dtm_validstart, dtm_validend, str_imgpath, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    218   �      �          0    16964    store_dishbcls 
   TABLE DATA               u   COPY public.store_dishbcls (str_companyid, str_bcls, str_name, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    238   �      �          0    16969    store_dishmcls 
   TABLE DATA                  COPY public.store_dishmcls (str_companyid, str_bcls, str_mcls, str_name, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    239   u�      �          0    16974    store_dishscls 
   TABLE DATA               �   COPY public.store_dishscls (str_companyid, str_bcls, str_mcls, str_scls, str_name, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    240   ��      �          0    16979    store_dishseries 
   TABLE DATA               x   COPY public.store_dishseries (str_companyid, str_sercd, str_name, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    241   ��      �          0    16846    store_dishset 
   TABLE DATA               |   COPY public.store_dishset (bint_dishsetid, bint_dishid, str_dishname, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    215   A�      �          0    16851    store_dishset_cand 
   TABLE DATA               �   COPY public.store_dishset_cand (bint_dishsetid, bint_dishid, bint_dishcandid, num_candprice, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    216   g�                0    16791    store_holiday 
   TABLE DATA               �   COPY public.store_holiday (str_storeno, str_companyid, str_mode, dtm_holiday, str_content, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    203   ١      x          0    16750 
   store_main 
   TABLE DATA               �   COPY public.store_main (str_companyid, str_storename, chr_uninumber, str_privacy, str_startpageimg, str_bannerimg, str_defaultimg, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    196   �      �          0    16801    store_numberlog 
   TABLE DATA               �   COPY public.store_numberlog (str_storeno, str_companyid, dtm_date, chr_biztimestart, chr_biztimeend, str_prefix, int_init, int_current, int_release, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    205   �      �          0    16796    store_numsetting 
   TABLE DATA               �   COPY public.store_numsetting (str_storeno, str_companyid, str_prefix, str_content, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    204   ��      �          0    16910    store_orderlog 
   TABLE DATA               �   COPY public.store_orderlog (bint_orderlogid, str_companyid, str_storeno, str_orderno, bint_dishid, str_dishname, chr_type, int_dishtype, str_unit, int_amount, bint_parentid, num_price, create_date, create_id) FROM stdin;
    public       bbp_user    false    228   *�      �          0    16903    store_orderlog_main 
   TABLE DATA               �   COPY public.store_orderlog_main (str_companyid, str_storeno, str_orderno, str_preorderno, chr_ordertime, dtm_takeawaytime, str_memberid, str_memberphone, dtm_canceltime, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    226   G�      �          0    16916    store_orderlog_subtag 
   TABLE DATA               ~   COPY public.store_orderlog_subtag (bint_orderlogid, int_subtagid, str_explain, num_price, create_date, create_id) FROM stdin;
    public       bbp_user    false    229   d�      {          0    16771    store_preorder 
   TABLE DATA               �   COPY public.store_preorder (str_storeno, str_companyid, chr_biztimestart, chr_biztimeend, int_peoplenum, str_content, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    199   ��      ~          0    16786    store_preorderex 
   TABLE DATA               �   COPY public.store_preorderex (str_storeno, str_companyid, dtm_exdate, chr_biztimestart, chr_biztimeend, str_content, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    202   x�      }          0    16781    store_preorderlog 
   TABLE DATA                 COPY public.store_preorderlog (str_storeno, str_companyid, str_preorderno, dtm_orderdate, str_ordertime, dtm_booktime, dtm_booktimeend, int_adultnum, int_childnum, str_memberid, str_memberphone, str_content, dtm_canceltime, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    201   a�      �          0    17051    store_pushevt 
   TABLE DATA               �   COPY public.store_pushevt (bint_pushevtid, str_companyid, str_content, dtm_evtexe, chr_isexe, chr_status, chr_devicetype, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    255   ~�      �          0    16923    store_pushtoken 
   TABLE DATA               �   COPY public.store_pushtoken (bint_pushtokenid, str_companyid, str_pushtoken, str_memberid, chr_devicetype, str_deviceid, str_endpointarn, str_subscribearn, chr_isregister, chr_actioncode, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    231   ��      �          0    16830    store_qfeedback 
   TABLE DATA               �   COPY public.store_qfeedback (bint_qoptionid, bint_questionid, bint_questid, str_memberid, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    212   ��      �          0    16808    store_qmain 
   TABLE DATA               �   COPY public.store_qmain (bint_questid, str_storeno, str_companyid, str_content, dtm_start, dtm_end, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    207   չ      �          0    16824    store_qoptions 
   TABLE DATA               �   COPY public.store_qoptions (bint_qoptionid, bint_questionid, int_code, str_codevalue, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    211   �      �          0    16816    store_questions 
   TABLE DATA               �   COPY public.store_questions (bint_questionid, bint_questid, str_type, str_content, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    209   �      |          0    16776 
   store_seat 
   TABLE DATA               �   COPY public.store_seat (str_storeno, str_companyid, str_tableno, int_seat, str_content, bool_enabled, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    200   ,�      z          0    16763 	   store_sub 
   TABLE DATA                 COPY public.store_sub (str_storeno, str_companyid, str_storename, str_city, str_area, int_zipcode, str_address, dbl_lat, dbl_lng, dtm_opendt, dtm_closdt, str_bizhours, str_bizhoursdesc, str_tel, str_fax, str_parking, str_trans, str_content, int_preorderdays, int_nextordertime, int_cancelordertime, str_ordernotes, str_ordersuccess, int_nextnumbertime, str_numbernotes, str_numsuccess, str_takedishmode, int_takeawaytime, str_orderdishnotes, str_orderdishsuccess, str_imgpath, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    198   D�      �          0    16989    sy_function 
   TABLE DATA               �   COPY public.sy_function (function_id, parent_function_id, function_name, level_seq, seq, is_visible, is_function, single_login, function_type, create_date, create_id, upd_date, upd_id, program_id, path) FROM stdin;
    public       bbp_user    false    243   |�      �          0    16997    sy_group_permission 
   TABLE DATA               �   COPY public.sy_group_permission (group_function_id, group_id, function_id, can_create, can_search, can_update, can_delete, can_print, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    244   ��      �          0    17002    sy_group_set 
   TABLE DATA               f   COPY public.sy_group_set (group_id, group_name, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    245   ��      �          0    17007    sy_user_group_relation 
   TABLE DATA               |   COPY public.sy_user_group_relation (user_group_id, user_id, group_id, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    246   ��      �          0    16984    sy_user_profile 
   TABLE DATA               �   COPY public.sy_user_profile (user_id, user_corp, user_name, user_dept, user_empno, user_email, user_pwd, eff_date_from, eff_date_to, user_alert_pwd, user_level, onuse, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    242   ��      y          0    16758    sys_code_param 
   TABLE DATA               u   COPY public.sys_code_param (category, code, explain, parentid, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    197   �      �          0    17126    test_db 
   TABLE DATA               �   COPY public.test_db (int_seq, str_first, str_last, int_age, str_street, str_city, str_state, int_zip, str_dollar, str_pick, str_date) FROM stdin;
    public       bbp_user    false    266   �      �          0    16942    trans_points_log 
   TABLE DATA                 COPY public.trans_points_log (bint_transid, int_serialno, str_companyid, str_storeno, str_terminalno, str_memberid, str_orderno, num_price, int_points, str_rwpsid, str_activityid, int_status, dtm_canceltime, create_date, create_id, upd_date, upd_id) FROM stdin;
    public       bbp_user    false    234   �      �           0    0    apilog_bint_apilogid_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.apilog_bint_apilogid_seq', 1, false);
            public       bbp_user    false    235            �           0    0    orderlogserial    SEQUENCE SET     =   SELECT pg_catalog.setval('public.orderlogserial', 1, false);
            public       bbp_user    false    227            �           0    0    point_changeevt_bint_evtid_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.point_changeevt_bint_evtid_seq', 1, false);
            public       bbp_user    false    250            �           0    0 !   point_mapping_bint_pointevtid_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.point_mapping_bint_pointevtid_seq', 1, false);
            public       bbp_user    false    248            �           0    0    store_batch_bint_batchid_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.store_batch_bint_batchid_seq', 1, false);
            public       bbp_user    false    213            �           0    0 $   store_couponevt_bint_couponevtid_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.store_couponevt_bint_couponevtid_seq', 5, true);
            public       bbp_user    false    258            �           0    0    store_dish_main_bint_dishid_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.store_dish_main_bint_dishid_seq', 196, true);
            public       bbp_user    false    217            �           0    0     store_pushevt_bint_pushevtid_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.store_pushevt_bint_pushevtid_seq', 1, false);
            public       bbp_user    false    254            �           0    0 $   store_pushtoken_bint_pushtokenid_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.store_pushtoken_bint_pushtokenid_seq', 1, false);
            public       bbp_user    false    230            �           0    0    store_qmain_bint_questid_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.store_qmain_bint_questid_seq', 1, false);
            public       bbp_user    false    206            �           0    0 !   store_qoptions_bint_qoptionid_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.store_qoptions_bint_qoptionid_seq', 1, false);
            public       bbp_user    false    210            �           0    0 #   store_questions_bint_questionid_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.store_questions_bint_questionid_seq', 1, false);
            public       bbp_user    false    208            �           0    0 !   trans_points_log_bint_transid_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.trans_points_log_bint_transid_seq', 1, false);
            public       bbp_user    false    233            �           2606    17228    account account_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY ("STR_userid");
 >   ALTER TABLE ONLY public.account DROP CONSTRAINT account_pkey;
       public         bbp_user    false    267            �           2606    16958    apilog apilog_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.apilog
    ADD CONSTRAINT apilog_pkey PRIMARY KEY (bint_apilogid);
 <   ALTER TABLE ONLY public.apilog DROP CONSTRAINT apilog_pkey;
       public         bbp_user    false    236            �           2606    17092 .   coupon_item_relation coupon_item_relation_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.coupon_item_relation
    ADD CONSTRAINT coupon_item_relation_pkey PRIMARY KEY (bint_couponevtid, str_companyid, str_itemno);
 X   ALTER TABLE ONLY public.coupon_item_relation DROP CONSTRAINT coupon_item_relation_pkey;
       public         bbp_user    false    262    262    262            �           2606    17097 0   coupon_store_relation coupon_store_relation_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.coupon_store_relation
    ADD CONSTRAINT coupon_store_relation_pkey PRIMARY KEY (bint_couponevtid, str_companyid, str_storeno);
 Z   ALTER TABLE ONLY public.coupon_store_relation DROP CONSTRAINT coupon_store_relation_pkey;
       public         bbp_user    false    263    263    263            �           2606    17082 :   couponevt_member_condition couponevt_member_condition_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.couponevt_member_condition
    ADD CONSTRAINT couponevt_member_condition_pkey PRIMARY KEY (bint_couponevtid, chr_choicetype);
 d   ALTER TABLE ONLY public.couponevt_member_condition DROP CONSTRAINT couponevt_member_condition_pkey;
       public         bbp_user    false    260    260            �           2606    17087 8   couponevt_member_relation couponevt_member_relation_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.couponevt_member_relation
    ADD CONSTRAINT couponevt_member_relation_pkey PRIMARY KEY (bint_couponevtid, str_memberid);
 b   ALTER TABLE ONLY public.couponevt_member_relation DROP CONSTRAINT couponevt_member_relation_pkey;
       public         bbp_user    false    261    261            �           2606    17125    demo demo_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.demo
    ADD CONSTRAINT demo_pkey PRIMARY KEY (int_seq);
 8   ALTER TABLE ONLY public.demo DROP CONSTRAINT demo_pkey;
       public         bbp_user    false    265            �           2606    16877    dish_subtag dish_subtag_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.dish_subtag
    ADD CONSTRAINT dish_subtag_pkey PRIMARY KEY (str_companyid, int_tagid, int_subtagid);
 F   ALTER TABLE ONLY public.dish_subtag DROP CONSTRAINT dish_subtag_pkey;
       public         bbp_user    false    220    220    220            �           2606    16872    dish_tag dish_tag_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.dish_tag
    ADD CONSTRAINT dish_tag_pkey PRIMARY KEY (str_companyid, int_tagid);
 @   ALTER TABLE ONLY public.dish_tag DROP CONSTRAINT dish_tag_pkey;
       public         bbp_user    false    219    219            �           2606    16882 (   dish_tag_relation dish_tag_relation_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.dish_tag_relation
    ADD CONSTRAINT dish_tag_relation_pkey PRIMARY KEY (bint_dishid, int_subtagid);
 R   ALTER TABLE ONLY public.dish_tag_relation DROP CONSTRAINT dish_tag_relation_pkey;
       public         bbp_user    false    221    221            �           2606    16897    flownumber flownumber_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.flownumber
    ADD CONSTRAINT flownumber_pkey PRIMARY KEY (str_companyid, str_storeno, str_key);
 D   ALTER TABLE ONLY public.flownumber DROP CONSTRAINT flownumber_pkey;
       public         bbp_user    false    224    224    224            �           2606    17016 "   money_activity money_activity_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.money_activity
    ADD CONSTRAINT money_activity_pkey PRIMARY KEY (str_companyid, str_activityid);
 L   ALTER TABLE ONLY public.money_activity DROP CONSTRAINT money_activity_pkey;
       public         bbp_user    false    247    247            �           2606    16902    numberlog numberlog_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.numberlog
    ADD CONSTRAINT numberlog_pkey PRIMARY KEY (str_companyid, str_storeno, str_memberid, str_prefix);
 B   ALTER TABLE ONLY public.numberlog DROP CONSTRAINT numberlog_pkey;
       public         bbp_user    false    225    225    225    225            �           2606    16892 ,   order_seat_relation order_seat_relation_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.order_seat_relation
    ADD CONSTRAINT order_seat_relation_pkey PRIMARY KEY (str_companyid, str_storeno, str_preorderno, str_tableno);
 V   ALTER TABLE ONLY public.order_seat_relation DROP CONSTRAINT order_seat_relation_pkey;
       public         bbp_user    false    223    223    223    223            �           2606    17038 $   point_changeevt point_changeevt_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.point_changeevt
    ADD CONSTRAINT point_changeevt_pkey PRIMARY KEY (bint_evtid);
 N   ALTER TABLE ONLY public.point_changeevt DROP CONSTRAINT point_changeevt_pkey;
       public         bbp_user    false    251            �           2606    17027     point_mapping point_mapping_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.point_mapping
    ADD CONSTRAINT point_mapping_pkey PRIMARY KEY (bint_pointevtid);
 J   ALTER TABLE ONLY public.point_mapping DROP CONSTRAINT point_mapping_pkey;
       public         bbp_user    false    249            �           2606    17048 2   pointevt_item_relation pointevt_item_relation_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.pointevt_item_relation
    ADD CONSTRAINT pointevt_item_relation_pkey PRIMARY KEY (bint_evtid, str_companyid, str_itemno);
 \   ALTER TABLE ONLY public.pointevt_item_relation DROP CONSTRAINT pointevt_item_relation_pkey;
       public         bbp_user    false    253    253    253            �           2606    17043 4   pointevt_store_relation pointevt_store_relation_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.pointevt_store_relation
    ADD CONSTRAINT pointevt_store_relation_pkey PRIMARY KEY (bint_evtid, str_companyid, str_storeno);
 ^   ALTER TABLE ONLY public.pointevt_store_relation DROP CONSTRAINT pointevt_store_relation_pkey;
       public         bbp_user    false    252    252    252            �           2606    16939 $   points_activity points_activity_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.points_activity
    ADD CONSTRAINT points_activity_pkey PRIMARY KEY (str_companyid, str_activityid);
 N   ALTER TABLE ONLY public.points_activity DROP CONSTRAINT points_activity_pkey;
       public         bbp_user    false    232    232            �           2606    17061 6   pushevt_member_condition pushevt_member_condition_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.pushevt_member_condition
    ADD CONSTRAINT pushevt_member_condition_pkey PRIMARY KEY (bint_pushevtid, chr_choicetype);
 `   ALTER TABLE ONLY public.pushevt_member_condition DROP CONSTRAINT pushevt_member_condition_pkey;
       public         bbp_user    false    256    256            �           2606    17066 4   pushevt_member_relation pushevt_member_relation_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.pushevt_member_relation
    ADD CONSTRAINT pushevt_member_relation_pkey PRIMARY KEY (bint_pushevtid, str_memberid);
 ^   ALTER TABLE ONLY public.pushevt_member_relation DROP CONSTRAINT pushevt_member_relation_pkey;
       public         bbp_user    false    257    257            �           2606    16887 (   store_advertising store_advertising_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.store_advertising
    ADD CONSTRAINT store_advertising_pkey PRIMARY KEY (str_companyid, str_adid);
 R   ALTER TABLE ONLY public.store_advertising DROP CONSTRAINT store_advertising_pkey;
       public         bbp_user    false    222    222            �           2606    16845    store_batch store_batch_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.store_batch
    ADD CONSTRAINT store_batch_pkey PRIMARY KEY (bint_batchid);
 F   ALTER TABLE ONLY public.store_batch DROP CONSTRAINT store_batch_pkey;
       public         bbp_user    false    214            �           2606    17077 $   store_couponevt store_couponevt_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.store_couponevt
    ADD CONSTRAINT store_couponevt_pkey PRIMARY KEY (bint_couponevtid);
 N   ALTER TABLE ONLY public.store_couponevt DROP CONSTRAINT store_couponevt_pkey;
       public         bbp_user    false    259            �           2606    17102 $   store_couponlog store_couponlog_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.store_couponlog
    ADD CONSTRAINT store_couponlog_pkey PRIMARY KEY (bint_couponevtid, str_coupon);
 N   ALTER TABLE ONLY public.store_couponlog DROP CONSTRAINT store_couponlog_pkey;
       public         bbp_user    false    264    264            �           2606    16963 "   store_discount store_discount_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.store_discount
    ADD CONSTRAINT store_discount_pkey PRIMARY KEY (str_companyid, str_storeno, str_mmcd);
 L   ALTER TABLE ONLY public.store_discount DROP CONSTRAINT store_discount_pkey;
       public         bbp_user    false    237    237    237            �           2606    16866 $   store_dish_main store_dish_main_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.store_dish_main
    ADD CONSTRAINT store_dish_main_pkey PRIMARY KEY (bint_dishid);
 N   ALTER TABLE ONLY public.store_dish_main DROP CONSTRAINT store_dish_main_pkey;
       public         bbp_user    false    218            �           2606    16968 "   store_dishbcls store_dishbcls_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.store_dishbcls
    ADD CONSTRAINT store_dishbcls_pkey PRIMARY KEY (str_companyid, str_bcls);
 L   ALTER TABLE ONLY public.store_dishbcls DROP CONSTRAINT store_dishbcls_pkey;
       public         bbp_user    false    238    238            �           2606    16973 "   store_dishmcls store_dishmcls_pkey 
   CONSTRAINT        ALTER TABLE ONLY public.store_dishmcls
    ADD CONSTRAINT store_dishmcls_pkey PRIMARY KEY (str_companyid, str_bcls, str_mcls);
 L   ALTER TABLE ONLY public.store_dishmcls DROP CONSTRAINT store_dishmcls_pkey;
       public         bbp_user    false    239    239    239            �           2606    16978 "   store_dishscls store_dishscls_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.store_dishscls
    ADD CONSTRAINT store_dishscls_pkey PRIMARY KEY (str_companyid, str_bcls, str_mcls, str_scls);
 L   ALTER TABLE ONLY public.store_dishscls DROP CONSTRAINT store_dishscls_pkey;
       public         bbp_user    false    240    240    240    240            �           2606    16983 &   store_dishseries store_dishseries_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.store_dishseries
    ADD CONSTRAINT store_dishseries_pkey PRIMARY KEY (str_companyid, str_sercd);
 P   ALTER TABLE ONLY public.store_dishseries DROP CONSTRAINT store_dishseries_pkey;
       public         bbp_user    false    241    241            �           2606    16855 *   store_dishset_cand store_dishset_cand_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.store_dishset_cand
    ADD CONSTRAINT store_dishset_cand_pkey PRIMARY KEY (bint_dishsetid, bint_dishid, bint_dishcandid);
 T   ALTER TABLE ONLY public.store_dishset_cand DROP CONSTRAINT store_dishset_cand_pkey;
       public         bbp_user    false    216    216    216            �           2606    16850     store_dishset store_dishset_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.store_dishset
    ADD CONSTRAINT store_dishset_pkey PRIMARY KEY (bint_dishsetid, bint_dishid);
 J   ALTER TABLE ONLY public.store_dishset DROP CONSTRAINT store_dishset_pkey;
       public         bbp_user    false    215    215            �           2606    16795     store_holiday store_holiday_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.store_holiday
    ADD CONSTRAINT store_holiday_pkey PRIMARY KEY (str_storeno, str_companyid, str_mode, dtm_holiday);
 J   ALTER TABLE ONLY public.store_holiday DROP CONSTRAINT store_holiday_pkey;
       public         bbp_user    false    203    203    203    203            �           2606    16757    store_main store_main_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.store_main
    ADD CONSTRAINT store_main_pkey PRIMARY KEY (str_companyid);
 D   ALTER TABLE ONLY public.store_main DROP CONSTRAINT store_main_pkey;
       public         bbp_user    false    196            �           2606    16805 $   store_numberlog store_numberlog_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.store_numberlog
    ADD CONSTRAINT store_numberlog_pkey PRIMARY KEY (str_storeno, str_companyid, dtm_date, chr_biztimestart, str_prefix);
 N   ALTER TABLE ONLY public.store_numberlog DROP CONSTRAINT store_numberlog_pkey;
       public         bbp_user    false    205    205    205    205    205            �           2606    16800 &   store_numsetting store_numsetting_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.store_numsetting
    ADD CONSTRAINT store_numsetting_pkey PRIMARY KEY (str_storeno, str_companyid, str_prefix);
 P   ALTER TABLE ONLY public.store_numsetting DROP CONSTRAINT store_numsetting_pkey;
       public         bbp_user    false    204    204    204            �           2606    16907 ,   store_orderlog_main store_orderlog_main_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.store_orderlog_main
    ADD CONSTRAINT store_orderlog_main_pkey PRIMARY KEY (str_companyid, str_storeno, str_orderno);
 V   ALTER TABLE ONLY public.store_orderlog_main DROP CONSTRAINT store_orderlog_main_pkey;
       public         bbp_user    false    226    226    226            �           2606    16915 "   store_orderlog store_orderlog_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.store_orderlog
    ADD CONSTRAINT store_orderlog_pkey PRIMARY KEY (bint_orderlogid);
 L   ALTER TABLE ONLY public.store_orderlog DROP CONSTRAINT store_orderlog_pkey;
       public         bbp_user    false    228            �           2606    16920 0   store_orderlog_subtag store_orderlog_subtag_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.store_orderlog_subtag
    ADD CONSTRAINT store_orderlog_subtag_pkey PRIMARY KEY (bint_orderlogid, int_subtagid);
 Z   ALTER TABLE ONLY public.store_orderlog_subtag DROP CONSTRAINT store_orderlog_subtag_pkey;
       public         bbp_user    false    229    229            �           2606    16775 "   store_preorder store_preorder_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.store_preorder
    ADD CONSTRAINT store_preorder_pkey PRIMARY KEY (str_storeno, str_companyid, chr_biztimestart);
 L   ALTER TABLE ONLY public.store_preorder DROP CONSTRAINT store_preorder_pkey;
       public         bbp_user    false    199    199    199            �           2606    16790 &   store_preorderex store_preorderex_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.store_preorderex
    ADD CONSTRAINT store_preorderex_pkey PRIMARY KEY (str_storeno, str_companyid, dtm_exdate, chr_biztimestart);
 P   ALTER TABLE ONLY public.store_preorderex DROP CONSTRAINT store_preorderex_pkey;
       public         bbp_user    false    202    202    202    202            �           2606    16785 (   store_preorderlog store_preorderlog_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.store_preorderlog
    ADD CONSTRAINT store_preorderlog_pkey PRIMARY KEY (str_storeno, str_companyid, str_preorderno);
 R   ALTER TABLE ONLY public.store_preorderlog DROP CONSTRAINT store_preorderlog_pkey;
       public         bbp_user    false    201    201    201            �           2606    17056     store_pushevt store_pushevt_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.store_pushevt
    ADD CONSTRAINT store_pushevt_pkey PRIMARY KEY (bint_pushevtid);
 J   ALTER TABLE ONLY public.store_pushevt DROP CONSTRAINT store_pushevt_pkey;
       public         bbp_user    false    255            �           2606    16931 $   store_pushtoken store_pushtoken_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.store_pushtoken
    ADD CONSTRAINT store_pushtoken_pkey PRIMARY KEY (bint_pushtokenid);
 N   ALTER TABLE ONLY public.store_pushtoken DROP CONSTRAINT store_pushtoken_pkey;
       public         bbp_user    false    231            �           2606    16834 $   store_qfeedback store_qfeedback_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.store_qfeedback
    ADD CONSTRAINT store_qfeedback_pkey PRIMARY KEY (bint_qoptionid);
 N   ALTER TABLE ONLY public.store_qfeedback DROP CONSTRAINT store_qfeedback_pkey;
       public         bbp_user    false    212            �           2606    16813    store_qmain store_qmain_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.store_qmain
    ADD CONSTRAINT store_qmain_pkey PRIMARY KEY (bint_questid);
 F   ALTER TABLE ONLY public.store_qmain DROP CONSTRAINT store_qmain_pkey;
       public         bbp_user    false    207            �           2606    16829 "   store_qoptions store_qoptions_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.store_qoptions
    ADD CONSTRAINT store_qoptions_pkey PRIMARY KEY (bint_qoptionid);
 L   ALTER TABLE ONLY public.store_qoptions DROP CONSTRAINT store_qoptions_pkey;
       public         bbp_user    false    211            �           2606    16821 $   store_questions store_questions_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.store_questions
    ADD CONSTRAINT store_questions_pkey PRIMARY KEY (bint_questionid);
 N   ALTER TABLE ONLY public.store_questions DROP CONSTRAINT store_questions_pkey;
       public         bbp_user    false    209            �           2606    16780    store_seat store_seat_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.store_seat
    ADD CONSTRAINT store_seat_pkey PRIMARY KEY (str_storeno, str_companyid, str_tableno);
 D   ALTER TABLE ONLY public.store_seat DROP CONSTRAINT store_seat_pkey;
       public         bbp_user    false    200    200    200            �           2606    16770    store_sub store_sub_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.store_sub
    ADD CONSTRAINT store_sub_pkey PRIMARY KEY (str_storeno, str_companyid);
 B   ALTER TABLE ONLY public.store_sub DROP CONSTRAINT store_sub_pkey;
       public         bbp_user    false    198    198            �           2606    16996    sy_function sy_function_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.sy_function
    ADD CONSTRAINT sy_function_pkey PRIMARY KEY (function_id);
 F   ALTER TABLE ONLY public.sy_function DROP CONSTRAINT sy_function_pkey;
       public         bbp_user    false    243            �           2606    17001 ,   sy_group_permission sy_group_permission_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.sy_group_permission
    ADD CONSTRAINT sy_group_permission_pkey PRIMARY KEY (group_id, function_id);
 V   ALTER TABLE ONLY public.sy_group_permission DROP CONSTRAINT sy_group_permission_pkey;
       public         bbp_user    false    244    244            �           2606    17006    sy_group_set sy_group_set_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.sy_group_set
    ADD CONSTRAINT sy_group_set_pkey PRIMARY KEY (group_id);
 H   ALTER TABLE ONLY public.sy_group_set DROP CONSTRAINT sy_group_set_pkey;
       public         bbp_user    false    245            �           2606    17011 2   sy_user_group_relation sy_user_group_relation_pkey 
   CONSTRAINT        ALTER TABLE ONLY public.sy_user_group_relation
    ADD CONSTRAINT sy_user_group_relation_pkey PRIMARY KEY (user_id, group_id);
 \   ALTER TABLE ONLY public.sy_user_group_relation DROP CONSTRAINT sy_user_group_relation_pkey;
       public         bbp_user    false    246    246            �           2606    16988 $   sy_user_profile sy_user_profile_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.sy_user_profile
    ADD CONSTRAINT sy_user_profile_pkey PRIMARY KEY (user_id);
 N   ALTER TABLE ONLY public.sy_user_profile DROP CONSTRAINT sy_user_profile_pkey;
       public         bbp_user    false    242            �           2606    16762 "   sys_code_param sys_code_param_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.sys_code_param
    ADD CONSTRAINT sys_code_param_pkey PRIMARY KEY (category, code);
 L   ALTER TABLE ONLY public.sys_code_param DROP CONSTRAINT sys_code_param_pkey;
       public         bbp_user    false    197    197            �           2606    17133    test_db test_db_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.test_db
    ADD CONSTRAINT test_db_pkey PRIMARY KEY (int_seq);
 >   ALTER TABLE ONLY public.test_db DROP CONSTRAINT test_db_pkey;
       public         bbp_user    false    266            �           2606    16947 &   trans_points_log trans_points_log_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.trans_points_log
    ADD CONSTRAINT trans_points_log_pkey PRIMARY KEY (bint_transid);
 P   ALTER TABLE ONLY public.trans_points_log DROP CONSTRAINT trans_points_log_pkey;
       public         bbp_user    false    234            �           1259    16867    dishmain_unique    INDEX     ~   CREATE UNIQUE INDEX dishmain_unique ON public.store_dish_main USING btree (str_storeno, str_companyid, int_type, str_itemno);
 #   DROP INDEX public.dishmain_unique;
       public         bbp_user    false    218    218    218    218            �   ~   x���1� �� �.�әXXh�cgC�c��#f���X�z���|9�P�r���Jp\�8�e�g�Vb�$�J(�!��v1�bIAjP�~�ު��o4���dO=7ܭ��8�W;�W�n��p4Z�#^9�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   9   x�3��MLU� N�Լ�Ԓ�̈�?#%Q�)�4'�,�(�ӱ8717#��+F��� �v      �   �  x����J#A���S�2.U��di6�Wn
iTh�I�� 0؊��1��b��2��OcuW���O�Z|��t�M�c[�����v4Gaf�*�)sG�=�9a�@��Is̱����ؗ2�3�A����-�a���D6L��Oe���p� Y>I�w1�k�p@�ud���1 �W��)�@,z>��(ĭF|��痪T�A�:P�*��������v�D Js���gi@���_�XP�]"S�9���#�=��D~���<�4M`�P�i�b8�7���|y�싊��Y�\��O:��*�����@-��o�����vV�\$�#x����v�x;�z��j����R��d�9��&�hIE�����U6>�����zm��p�֮�n��#TG�I�P�|��$�^|�S���F�r!mȿ�[�>]��fj&��d�L&�      �   �   x�3��0735162�4���v�~�k��������������������������giqj�!A\�� F?�2��FC�~�h�Ӊ��u�9a����@6u�1A�����6�\����m���b��i�Nn|ѳ�io��-��k�Ď��>�7G���	/���ϳ��/��h��W����y��=�/w�|�eլ����� @]��      �   �  x����MC1E�uR��㱝Z�� ��� �������s�#�-n������[�뚯��sD���������B��$�A(I(�P�4�K#�4�K#�4�K#�4�K#��� ��� ��n�t���$�$�&I�_$�Ӯ0�+�8�
#�)���0B�� o6��B�q ��D�057Cp7Sp7cp7sp7�p7�p7�paH��<P��<P�����I�#�)��0(Q��FԼ0���N�t��@��0��}(���0W�a�D�\���oG��i<���i<���i<���i<���<���e<^��e<^��e<^��e<^��<^��m<���m<���m<���m<���<���4��4��4��4��4��4��4��4������:���D�y6��琗Dy?p@B������o6      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   �   x��ӻ�0�ڙ��~�Y��	

(�(�����()����1��I�Q$���Ο�;�Ϝ5Z1��������s�*�6G %a2IZ��JE���@N.ה���s���w��$40t��=�*G���K�T��a"�	�#��:����a#�C���05��E�vp����*��890^Ӑ��T;�����cG}#�Q��U�$�=[��      �      x������ � �      �      x������ � �      �   �   x����
�0�s�����iӺ=� �sND����j=n��C�|���y��,CAŪ�PL���(��6ƶ4�CK�lY����q�6�b�x��j}����͡6л�V�>���3��P:��j�_?d�5���_��RFYY��ɭ6Y��'��V��f�6�Z]��+8�����q���j-.ol���OV��kqm��n��Y:˲3���	      �      x������ � �      �   |  x����J�@ ���)�Iff�I�U���SAD�"bB�zn)*
��A��AA<	EP��Ӥ��+����Z��R�&!�2˗a	p&k��L��A 0[X�/������w��_?}�Ձ��i�;���]�?�� F.ʪH*�b.:�s�rv0�/�@�z2�yp�=æ�:9]7I��Ƃ5��W�m{eM�\�?�W\�\Z^����S�uuҶ��Ck
�a���T�3D9�rjdIb��R�~MP8]������x�(���4����IY�t+ﭗ�V�d�پwR�W���DD'���bbmf��!a�£n��f�}���R��q�fFdf%�MU��d�������l�o6�y�����&}5��h�[����5{\��pEMQ�O�{��      �      x������ � �      �      x������ � �      �      x�͝[sI�ǟ5������u׼�9��9+�0�1��X��j�����	��ז�W@�c���c�˸o�b�T�RK�R�{J:��3b~�U���ꮄ�u�_��;��C���H�������q�4���/��/�����A1!	����Q�BZ�i��|�ƅ��J9��-��k>~�'�������f���
�7C������?�ݕL�B_W������2YY��'e��t��>7��;������wݑ��7�H���}�����7~�m������v���~FnP�U��9�v�o��"�Y�-�yD=�<��;��Xyd�y�<���δ�auZ�\SO�;���;�;R"!�d��C�__��;}�}g[�>�( a4 a�vy�B ����o��,�sRʊ���� �]�|��.DP">��$*myC+��O��U��eLr��d�YR��DR�Y��A��!Uv��٣:'�Ι�ĉ(�D�g����Z��Hu�a�>�vִ���䴓x���\���K�))�O����l�/1ԗ�O�?֎�k�B7�n����������N3G��gߍy�ӽ�ϯ9��� �qyH�/���JqI2(J���<���L%����Ŭzp`��9�!��s�,�{ ��U�h�����x[�[ �7�F����y�$p?䤔�jP�^ }����ͷ;@H@�C">���.��kNȊ0G��̉Y1-���V����cc㊻�2��.��>�E�{��R���A!�E�,`kݬ��A��t_�1QZ@����ڧ}�Ey�&e)!r=�R���/Ay��jZT0��Z���%mw�X�,�����l�AQQ��0�gi>%��ۏ2��G�d,t<�t`QoȺ4��q�<~[_��z�����g1�U*�^�G#�㈊XP:u���>RA*�z%(�[>֨�E=c�9c��X�����VZ�g�����qR��6���]c�<�����7kceWT���n_ՍQc��䃃�DB�HC��P���x3�(k<Tg��m���u�����:5��怬#@u,�_��Χ��)�o�"�5��Q���8��z�@u,��M((��MX1e�����N�GU����7�c;T[�By�-�V�т"�)�<$IIh�Pa�z��W�2�(�*`a|�Ӟ�SS��5���j�sRF��[]EP�o�8�ʺ��z�$I?�W��Z���Xx`6��c�D�,(���gA	��zJ��3��XxPƛR�� �?`aQ���ה՘8!�$�1�!gLT���J�3�5EG[�$�Ў��~���(�d%C�Y����Í*XP>�([|���u�DU,j �������s��)�1���'ؒ�m���`�+�Z)�jX��P+фT��=��(����J�ib��E`al\i+/-�?��*����жN��meV�|n���9���~T�t��RT���6��V��-&f��I	����!�!Q���W@2^<!T~��X�7߾�OV�H~��b�-!D�,j����X�U�Ж7`��O�����2q�!k����-��0�IVf�=ZN6���9Q���8�����*j\��N����ڀ�Z,����ժ>5f�����S�7'K��aTf�B9�~8�������;AI�%4�HTq���8�k�Kv*O	����n+9);T���^U����c��7aTn�69ڦ#�[��2[JTn��2�C2�$�:`a̮3#P�9eQ��nc@Q�z��ױ2�+�F`A��jPiqپx�J5�q��yQ	��e]�&��>)����A`Q�:P���:����jD{�[XM���VT����1�2�ޗEP�p��
���u��l_;,���GyHH��nC�t�DZ3CQ=�èvxNO����B�-o`�F�	,��5��;5_PǋU�[I9!���؈�uxQuztd�uBQ�4�e}@A�	,�S�zZ���f�%�]T��B)^�>QW�ԍ#}��:���vp0U���&m�b޼��e����f��3#x�WLY_@�
,j�(#��(*WQ}��IQ-hT��`�	 �tE�	,`��W��9�I�Ya��Q���2=���G�U\��g}.E5
,�/�j�� ��!9����Y+VU,��]>�kk���B�P�($��T����Ш|���o~� W��OAz�Пl��N��Џ�����
�GR"��0��>��Ա��2T�����X�1�K��$��Y�~J�tvho&������eQ?^m�7�ځE�7�-s�eo���B˱c�聅kꌞ�������>.���t�@,\���c��.l��&��$X������զ�������p==?�`��1TDc�[�C߳h�nX'�*�`Ql��z`G��%��殠2��ع���4ÜW�p�+��#��LG�,\�V��g�L.̉Qeq5��C7�+�#��`q}Q$[�7�Ռ"'�.\�L%���wc�I,���,bC:��f���d�*}%q����=%����1�daS"Y��ˑ|7&����k'��33���T�X8(I�m�X�y�ݘ����1m��_L�)`�F,,<;P<G
h=%�`�¢�W;�l�R��X؃l�s���E����I�NI۳�ў��櫮m��օ��� ���yP�P����g;6��R6��ON*x����'���Ku}�~�c|��N�¶M����Hz�np����[^~�h;
b�� M�Ԙ~p�t��⁬����2��� ���ʙ�zF�(�.���#�F���T��P#/.?�SO/�
����~0��hGb�퇱4�<�G���Kŉ�t?�E2YnPVz��|8PY�f��.
���
�g)TF�1<��`˘��O/ԉ�����*-X���ƯmwF}�����W�wrwd��܏bJ�f�k�p��I;Njx���p��td�����/�hC��B��=�I������L�����/�M�k��f{WP	�ǁ�wW�Sࣝ=���|��Z��~zr
$��%?�5�x��ظ���ݴ�c�����6����bu����[��n�<�O���A��n)�t"9T��~Kx(��'�6-٫�-@�@��7������ ����@ħ�՟�\���-k�)be�*�hO>@�.�w0N�Iw1ujE�="7�r)�M�<�hG>�%t΀���s+��v�r��m�	��5�\A�G_dQ��ZW��Y�	J�_�VkBT��~'a~!d�N��`�e��L;��~�I��{tY7���> <��>=�ʛ�磕�'AR�29w��3��C��;�✱���Q���f>Ĩ�m��VO��a����eU髳���,�ҹ,wGrk$��z�4��oS�lHO-j�=ϼ�)*I����巿j"oA�W��q�i��y�X�x�cT�B��%��%�T�>oC�-ZWmn+r&KZ�z�)̥�%����0�i�@
)E��Oa _2*��Ee�\��]0w����|*3�GH�o�E�ښ��@��ܕ�g��kof����|��6�C {kO���x�Xڳ�컏D�ߑ�BV&�2B:��eZ_Т]H�P�g�NS���~<Bw�\�fI�X���׺c~�v!�Ca��m�L�$	��mV��#څ�E|�҈1�ɘ���3!���S��WJ��)�v ��m��W��s�lO-�swŌP.r��C9!]�`�9�v"�C jGK��muYݝі�ן?���6EC�CZ��Y�l�̘81���e��e�Ƹ-A�JH��zJT�¼�X���i��1�w��TN��7���ԆQG��ܳ��"O��?T�z�>1%Ji�H���*8 +}�0�"�H�������k�����[Υ�ڴ�P]
����v\�~}כּo+b:�$70Ϫ�y��6,��a7�Uu��z��~�I�'r������1�R��ɤՊW�����Kxr��
��#�a�;w��	.��$O]��;�g�������Zz��u\_\���/��}c�z��>͓ �  �af�_\_�'�<ߒ�K<��'��cPè'��Ko��hg>[��o�Oԉ<ӱa�2P��8ވ�V_�2&F�k�,�b^�]W�����o��YmsD�Yb�󩇪q$�#�Åu�>��	��HȧN)A�3"��%E�t���
�H��# l��;ݔ��8*�uo��;j�y�-|$�ӏ���#r_���py�$�6d�#vOO���ϓSMu�C�1
���Q��� V̧>�t�����3��:z�-�%T��~P�e8��<o*/� $�}�ɺ�;"�(18T� ӫ��+��ى9��ɽ����U{� �ӣa}�AӴ�=���6
M�шϼ�Q��q����%�m	O���},h��������^l�ϣ�ϋ/,����C{��1H���d��Z�7�W�ݙ6��)=�����9����k��c~������ߐg���<�|r��=(�y~e,,맠�.*�.h'>��o^ꛏ���T���&!|��m��y��4�4�0o��S�jh[��LOn}���iʑ׶!YT�w�+��6߾�V^v����3L�\��+��ڽ�b�xq�ޜ0�[�& |�����@�8������x�.��1��C<�ogyv�p����}�7��۸�Ʋ�fƁhQ��D������҈��<�ҘZN��rm�c?�^jS�G�,�7�+�Uؘ��{6بe���3�p�:ѫ�m������o�	H��      �   Z   x�3��0735162�4�|�c��e�/��<�������B��L��H��������@�����Ȍ��8�Ȑ�.��F�O�N�dL����� !�.�      �   	  x���MJ�@����)�@���=�[/��7H*2�HC��R�����i��a�7����Ν�	o;��0�GF�﹎�(�F��g����0vF��c���R�����%���E��T�`�(��c�O��W:l��[Q���U��|���w���@>k����m�e�@{ �J.=�>(�pZ蘿�i= ��C������c��W�.%�v�>,�����B�>�=N#�<�v��q�}�R�-��2+��Z<�#O·�e���Q�      �      x������ � �      �   �   x�3��0735162�4�|���tΤg����X�|���9�-t�t���̭L��M��8K�S�	*�2@�`���uǋ���:��m��tҴ�SR�c�g�[����tǎg�V����|�T��$F��� ٱ]/      �     x���[N�@����U���9C�E���� ���5h�������5�&����]0�1���'��;g2�� 1 }02ǟ:l���tO�ۻ�rwd|	�a�e���b�u�U0�}�o�������E���;�ZQL:4�X�y6&���SV��p@.��l���ǁ|�)����j��������r^Ӽ�nC�}�����)J�v��0�E����-L%J� d�˰x�L']y>�IDs���)�}n権��9I�U�d�wO��@I�βSqg� �`      �   b   x��ϱ�0C�ڞ�������B�p�=�zݻ/l&�!�j�Q����gXEOx��:N���$�`�]��������`&l\p��� ��j         �  x���=N�@�z}
.������Yh� �P"� $�BEt4 ��ib�܂���`,�y�R�^}����8��mS�"�cǁ�Sv�պ[_o��ׇny�[�Wk�|@4e�J&�����1�{C���crp��Gw��yq��=�.M�$_��x������T�^~�[>��b�i���Q�i�'ܺ�Ԃ���If�'L	L2�/U��b���Z�iy�f�&��IqZ��I%�aZ����'ȯ8�_6{EբU��jf��Vp��p�$��3)�l*��5VUN�ZH�����V� M��i$-mVO�$-[����QG�j���u�A6�@ՊU�Q�f�'��Z��D����y�<A~�D��+#�Q��j	�٤��e�S�j28�f��j�U'�j���Yu�����pVU�����      x      x��ZYo#G�~�-��[j����a��0�`���B��ǽ�Qn�ycQ�x�"�<Z)Q�AQO�/��ffU=�/�Y��ы^�ѠȬ<"����Z���~�՗_�X���^����r�����~e%�<4�n���������=<��j�_^���+���oW�Fɩ�P���ܱ�7���X��,&Eb/�٨w6�$�Vٮ�����Ʌ����o�۴�m�D�_W��Y�3Ql�����^..��~x�������+�?/���_���?��eum��j�?^����������_~�y��W_��|�����ʛ����J���L�G�6���H]:˜˿�_�["y㔫�iDzKn�d�&�dm�_e.�\%��7�6ߋ�h<��q>�������|h?Z�t��/���,�G݂�H5���,��b����#�[F�lo���}l+,5�x���^ZD����GD+�D#v��+��u�����~���8���a��ҮOl���4���#BƂN5$�Y��:���^�Me�YW0�S�=��֝hD'�X��]b:����]ϫa~�x�OWS��G'��syI���:I���k���Vb4(b̨[�1|�\TD1�S��m�ev1�%܃c�|&�1�����i����79Q���Ԗ��a8��1Ä�A׺�	�tE�D��b3ɟ�Fn���M�_���T�vsC`����i�����a�X�d�5xbc���y���3�OD��\>�ҙ�����E�;�-x]=B��`ݿV�0z��c��66
�� ��þ0M,�&��R^�9�ו�s續����܎��Q�WQp�2��S2cAN0����e�9)$��(��=�a�n��-/�M��06�A���S͹�����r>�ڎm���vU�s.��
��y�y�\��d�4�n�h�P��[n���~���m�N�X׀�r�Ԧ�pY>+z4�3��=AP��D��}-��*+cO2��*&s�k����h%�Y7x8��0F�(�����4�+��MG�r"�4�`��a>��-�־�yvP���vz�>�zo5�A�ߝ�:"����:���}��G`Ng�Q4��e�(�������y>R81QE+� ���n��"\;q� ��eͩƥ�5�f�^޹��P:�!#�r�Lf�i ��ҍ��0_�҆5��G����9'��1��=l�F�M}�b�vݔ�ySE���b����������d���'�G��)v�F b�c�(h<���=��Cn�jҽ��#�����l��4��"�t�^׾J̙��g'��]�H%�t�Q�G���9�kyQ�牅 �K����9��I��J��R��'��
�2c��V���v��s8%� b(�әex�vŻ�
�H�S#��H�ZN�a�gh��<FQ2;�)���>�/"�4�_�6�R�N��)�z�����@1��s�'@	`�k�Q'F9�H�jW��"��$�ӈFÜ}����@ک!ohf8YG=�Zu��.9������ �sR�}oE�K�rP�s�����t�� ��������	�B�Շ_��j�1�T�9g//k'�/8C��(�i�c�|�>6vv�2�obmj���U�a$�ǹ�i6�=�Eb\�:�AR$���9��1(�,��f%4��������1q�5�����a�ҙ��IiN(�_��7�<�a��ݱ*T*ã^�%+���P���>(�C�қO��q�lA$Q��),nǛ�3������;ᨧh�A����/�O!����k�a�9?a0`�8=OŧGs.�M�UK[Jو@�<Ȇ�HYl\S?(� �y��id�ڊ��2ٳKJ���J�`R��h2�o�^���*�R(V	=��B�vQN58zL���5���Ȁ���p=z%~S�U�Mw��ٝ���hk*J�I�L�p�1Q�(]���8�G�?�X�z��u��<t�g��-�U;�Nn䔢��lkԣb�ozbɓ��Ԑ�G'*y�I;[��3���짞So�]���C�%�,�j�����[� ����������:>�zG�(}����G��O���T��N0̯L��ȻŚ{ֲ\ٌ�P���*2TΔ�};RB1H37N�:͙}��9B%��ؘ�S������'$����#M�f�`�e�]���g�(��gR�-��RPǏX�[(Q)�"�)��>ƹ����N�%�y����jL�:�Sdk:ƌvↅN�ND�i��Z��&���&�'1��U�rj4��@}�BƱh�u��柖�\eq��U���3|�N��T���7=���5�aڏfS�z��v��F���g�,�R,3Ըa/A`�`�i�ՐLE+aߥ�	��A����~<q�.���DK���w�^	U���d�Ɠ��d��c�N�\E��T�i���B�i��_W9��83���7� �jf����i�`Z��y7S�Ϊ�N��6����X�X�,?^����5s�'�|@*�z��'���f�솓�m��A�"�\�ͺ�bhL	�_.��W��q���挮u���Dh�(T��EqJ�T8�涶8�� ���*������)sy�Tr��G��Xx��=�hď�s�>Zߧ��|{��8�������&�D�!�B�bN��Ǖ_��c�����c�^0G{e�T�D��8�<lO$cUV*��c -�I@���!�C�>RD,J̷84u"/�ݛz�)��f��!�&?+��\N�W��&�|0]1�
P�3��Fv(�s�s����E+
udN[��Z���
tg�W�Z�n2�<]���35+�1������:�� ��-�ߧ;�]��QpH�7]A��A!���w�=�Z���^��r�7��c����*۝F��k�f�Ad�H�>/��N�o2b�������p��npS�w����r��`�̃j�ދ�8O0�q]5%��_���uV�~�C�b�;w��{��njv!Xy|�5�����w�qVv'�d��*H�5w!���X1��(����b��5���z��v�FrH�~Sw�R������n�^�Rp��4e/D��!5�Xm1��أ��g���آ���Mg%	��2�G�=��*��5�Onkz}Lu��� �7R��>Ja����%^����u�3���L�)A��h>��^�1�ҩ��e����<�g�׹S�5��"+}���>l}�	5�+@�Ӊ�[&͸�!�`�HF�v�S��df��pQ��ъ�'Y7���V0)4e&K}d�0�U��>ԑS��"�ۄ��r��겲B���c:I�,A���-��'�(U�B�sR�V[0���C1f��SPD�e��yw u
=��t٢
��#~�Gbt.D�}��U�A�@9�"���{$��m����wԞM5^�bM<!�#i`Pe��!*)w�����礗j*V�55�^�T�@F�mRƞ���`��ֵSC;4�f&���K���B�l�d���ki>U[fИ�����y��+��j�e�	L��8-^rC�8���:�4�HY_�E6����C�En��ǩ%�1^�Kȥ����̛T� ��Udj���f�m/}[�krF��;��s]Ʋ2��	��*cuWB�
���\��[|��r��E��l�ƹ9%F 7��lŪ���u�~<Oퟚ�&N�%��	5��!ag�3�x���GȣT*�}އ�Еv�e|�N�����a���A�>#�F�w���{����-p���W��Ҙ��w>�.��B��3�(����<_�cf]�!H@��^iJ�=�k�]��������8*�D��]�O|9A�B�hN�ݻ�43�3�9�����0��[�Z2w�|�桁�R9b5��Ihܘi������5�8�=�����������c��џ/�%۸�O􈍏�B���|�j������n!��ʔ!G���"�����$������W����:�q�%B#�X�M$f8�Rz��u��7�Z~�|�{�f��e4?5 s  ��Gt?x�+��,��}�g�r�M�Nu�*�.Jk���{���,(&z��w���:���:�ooO���X8��&Jߚ�@�}��G�"i�BA�^�ne>Cz��7�4��"�M�j+��%O���F,u��/$e�mb�k�����}�@T��Ʒ�|����]�ܭb�ڌ�>E<�e�N���hd¢�[缣�b�M�A�o��]h�E�,���� Dm7����]I!��I'B*�g�q*�t�(��>;K՞Rw���v��0��j؞����lT�]�֯�����k�[���7݆��ѳ|����D�&��b3��ݞ�iX��y8��u"�6��U�A�-=y�[j�J6����áy�J�E}ͣ��zY.���4���_PM�㑩��/��4�qhŎ��h�_���Ǚ�����x�J=z��w�ʋrV�2�?w�L�a5�P�r��)�ԙ�Y4/E��PT�&@5��Z<�j�v���J`�������7ϟ�\z����^|��ً����ӏ���{�h�}�fm���\z�??��c����Օ���|����/?z�X\��o_��ŋ���7�_��⳥��Zz��7�x����^�~̘O�}�駟��"�@      �   �   x���1�@Ek�^`3��a��LzO���x���yP 3o hA�y�j}Q��C�f�����r����׬z"G�أ����q���B�oΩ��h&��nEwwZ8}}�1���ܜS;����Y�k��p.]J�&ʉE      �      x�30 CNKs3Sc#CNGNC]�'{{9�-t�t���̭L��M��8K�S�	*�2�0܉�XׄV�;s��~�{�]Բ���AcDˠ1�u��2h�уƔV�;s�Q3hb���� e��d      �      x������ � �      �      x������ � �      �      x������ � �      {   �   x��Խ
�0 �9y
_�����Y\}�]��`QA�$�.]
�M��[�X��c�!��w����$���M��0떥>_�j�O�>����]M�no���Z]�?.ys/��� ��h��A�I1VH��&S���a�R��#Tb�D�+E�(`@�+�����3TdQ�g��z�/��Iz��d%�p%�_(��D�9J��3�T%����)�(5@a*�IW�q�9Vo5      ~   �   x����
�0 �s��@G��m{����#�"xD<y�>|���������Rrh
MBx��"��;K�07@��@qh�����ծ]_�뭿���X:�0z������^�0ǿ��m��Sh9��}s޴�UB��~'^�$}GFQ��џ�4:� GFa�'��i�KLAځ�v9EN���$֧$���b���LFa����+,V��1ҧ#��������      }      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      |     x��׹�0��X��`�)��BJ5у�>P*H�{��^��C����7-Z��s�^ۣ܊���Խ�N�(�rЖj�ܯ��<a�/�p�q!p!�}2T��`��d�d�����sp<ӎg��L��i/�
.t��&a��:e	>���Z�\+lM��<�FC%Kt�Xq'�'�'|�yg� ������
H�>�b�O��tl������
+.���J�FνA�>K�7��{#��H�7r�Z@~��7�K�˲���y      z      x��YoKv�ٟ�I`�*#"#��'� �1f�~h��b��g�F��*��(nEq��"EREJ�.ŝI��̬���
'"���ʪ�庯'.l�XU"+~<q�,����?4�;�eR�`4�����zλx뮮�/w���|��x�{������yٙ��M�׏Ƽ�S�����}6�.N�!�s�޺[�דݫJ�;c����8da�A�rư���N4�8�?a������r���k�k��/u]Ø�9�Nx����������5��SK�ۿ��?����/��b�������O��~{����Z��Y��_ys�ԫ��B���������^�}w=?F�1G3���Ⴛu���}�[^w�?x�{S/����yq�ވ}3����=]b�<bo��.��;���6{��zѝ�s���<	���ܻ]c+�S��8��7���]d�Dg����_v��_�}}��x����~��L��~������_�������h/�|w������}�����q�_��/�dQ�ͱ���=����p�t��bǝ��~Xpo[���n�ggb��}ƀ ��?#��WW���	
���cP�5lL�|�߾h�o���� �u�N�����e\���fX���K?B����JBH� bw��1�~�����ǖ�C��nn�=�&Åȸ �ǅ"�}Z�pq���89%L�3[��+wj�}���mY�F)��������?��?�������2F&g����< URdHv��{w�%[w��{<�V4��"�0�M�]6b��!�QtQ��`��F#0C�0�C"��E){'�^�
�_ݻ���5U�.��nw�~��ݽ�>�����\�tggaww[�n�AL�ۉ�ƣ�m�ö󏓓bCu�=���c}��j�}k�!���d��v���L��>�U�������׍�^��v���+�s�ͽAH�����h{mf��� ���1ߪۺf���M-���Oi�+����/����_vo��w��~��f��p�1a�M㿶XmZ���Mc�^n�y����۾
�{�`��Ȁ�W�f�O�7��s5d.���.���j��V�<@��/ ��[��to.�4�¿r� ��@R��O1�0���5|H�˼�����ܢ�8/ܮ805ؿg�A��o�1D�x0��x|���C6��
�cdTÃ���-��p�ۑg��,y[���m�׷�	ot�7.qW�3�������x�� ��;���!V���}犘H�-d�9�H���4)z�m�W�s��B\�'!EIy�t��DNftu�P֩E���6r,��\�*$�,{3���&�	2%ᢐ��*tG�� �dg�i�n�R���8�~�����V�p������{��}w�Bl�i�i����#�徽 �pk����d,غ�o���|�@H
A�}��N!��Cw��;�n��bޭ�U��d�-�����jL������<M9H�J���"�d�����d��(�/�Ć���cZb��Q��?G��gL�����M�/��M9�%	D��|�������eCD[��P�aS�B�(����������<��n3�U!�T~L$+(��W:0��ww���pW�cƃ����5��EL���21��Kw�yg�4��ۏ
�!��LȎD �=�RG���YF8~��H�����w1���X	RƬ����nX��Am��-X9�b����w��(���xJ�� h��E���Q?|��[���d�+�vBw4۱ �������n)q@67�� �j4�)���0O�����h�@ �Y�I�r���&'0�O�y�,0`~AĽ��`
�op��Fr=Tz�k 0.��8~�m툽g�}�io�w������X���YUNg���������a�ՌE0��A<�9���D)��S%���%3�]Q'�����Y(pEU�kxR��g��$�sH+�}v���~UI�d]w�B��MU�U���d�OFaf|��ݫ��Bԑ��GZ0���$U�|U�!�=��Kw:�4ln�;��bi�K|R�$�v��T�o"���`�RdTJ��ŀ�W��\��ض�ᡧ����?y�²,��t`ɗ�b$*�+᭿���`P�$*K���D�l��Ɉ�'&��M���$3-���6�=x<�P21o�&�"�1�'����O�s��ɪ�j��#���־u��:�����ޛ))��q�Cf�P?q��0�'�����r�+��f��1���5b�aC���#�P��G�e��6ߛ|�{���	�KߑdxP�3��i!U������]=�y���+����""��� 	sH�`�����*�$"����B��?y�F�#4�r/��T-yj`Ď��Ÿ�y�'�0��L��â"�Vۋ2tbp�TN�בƛd��%�f�A9�2� [��G������=O�:�oB--SU�o=�ؙ�~�R�O�^����5�z�2+)�(*�L�t��ɠ��$�#/�pТ��#�}����R�J}�Xr�f�Q�ۗ-�Q_ $&Ѫ�!���&+��&���sp�-f˥(*�i�my����&6����z�*B͑��r4���"R�BGAB����|��#�
H�U��ѷ�5�&zvY(2�'��հ`HQK�Z�y����W 1%��"AH<B������)U��7Z
<�o|�0'q��ЉXM-�~�lC�[��z,!u$TKNg�;�{�姹�yx��H@e�5!+y�QN�p�B8��9z�k�&��d�(�Ŧ� �9��C�)ix�L�D�z(�7L���G(�6TY�����X���p�0̵^��aՀ�$A>5FJ�̣��f"��uQ��B��Ȅ�v
�N����1M�?}���b#�`[n��:P��)��.�W�S�j��pV��=<̭a��7/u&-�,N5'��(n���ʰ��(O����(I���B5���Ш�����{�nh�⻪\|��Z�2C��9����ف C�#b�z?OU!R��t���i����8��)��f�m3�z���������x�!A�4�w��8&�����@2�</�/�ⱏ��86 ���[)���MP
�a��c�K���G�j��-o�%�Q�5����t�p�B�5��Պ�a��c�;� 7��1O���b1]�J�n�N �66gc�H(۶�%���9_�%XH�}5�%E������L0"	��Ԧ�lz�h���xD��Q2�)T�M��A���EH�L��@GF����}�!
aޑ��T�u~�L�H��j�s6�L��̡쀈Xb��eո2JpB��4ߛ���6�����s�9�a�_�~�iV?c�Fw>�t��'Ԯ��,��[���>��de�P�� "�{n-x�� "�U`�Be�#�[��
�D�r#!�7���n��PW�a����}؄��A��KIg����K� ���B��C�
I��,����P鏊�'tRu�2$�Zy!���G�E	R\B������fn	���{3s�������:���K:�{���:94�<�o�;�S��
��D�IG��B86�1��8���vx���䷿����n�(Ȓ&S����
�yP�e9���=e��Dg;����4�-�j�ZJK�Zt�@��A����}U�+�,��3���c��J�x)uXf�8(��B��W_���Jf�0���"��?��"㽍}w�%{?wv�}Ww/��}�h0<pu����W��	�ۉ>�=�T��m�o�?2�L�,�Dp��Ё�9��4�Y3�r��'%�s*p#Y��!L�Ҷ�m��\qN���88���n���<ӈ�{�dx�ӎ���FZ�H0���;Ob������9ܩj����\c:���[���w�c3��F�Җ"BD���^�M��s� �����9�
��������Oݥ�Z�τ�E���RH&c
�t�2,H�QhjF��S5]�ZR,=MJ���R�I�k0����2- �h�_��OH`��a    A	F��ɷ#lC�0�D����b��DGa��¢>,���S��"/ɉ�
��/%�3z��j�a{�>JR���B!�}�6�<(�
�&�؁��Q�/ٕkC�[��t:xP���=7���V�ټ�2)n.��X�;�����T�(5u�_5��G�ϩ�~�'�b(�!y.'lCj�K�zpudV4,�c� 
ΙAEn̺ ����IH�^{����ܻ���"�W�V k����Uc͸��Er��i)��ZF���I�5�f�Z��5F]���*SdX8�zZN�{��G�X�NɆ��D��BH��C��AV�.����h�!���Y��v'=�P��r�����!�������6U�]�~�r�����=�M��z�[�~�0��Z���+ˠ��9C��+�a"�������b���|�����V��fr C�=�q�����	5B,$��$��V�Ð<����R�P�Vr�Ic���y��G�|H���~�=Zε1B�!����;���]K�FH�C-!EPi㭝
��O�f��{O{o���D_���!cT$$�HHe�[!d"uJ�Ȑ}��\t�	+�ly�/����K�tE(��	�B�N.�ΰ=]`�4
CL�\%f���w���w���,���H�ĵC0"�F�F��3> �n$���@I���<';�Kn�H_\(��¥Z\��*�Hn�U��P��
["�*���kx������-R�8�'�A�t9����iޗ�an��g��s��M������}{Aj����;D3q�S���p�4��<Nd.���Q�*P��v;��;R�	�����m9X�MR��X�V�e��6��I �W0d�V�i��ǌ�?,pc?�F�
���IT���S��CYՏ��<�Hb��9��6*(R#)�Rֳ��XCUV� p����!�!@	�;w�OIJ��e!��-�(T���>���Mw�I6bd��Q�K(�{�F<�>��@tMq3,74����dX-U��KWB�r�όX���u�ճU#SR���r�]��V���?�h�W#����IͲlU�X# V���6��J�d@:+��
�^j>�4�*��DZ%},��.JDy35��}��{�(�`+�?���L*#E����lm��ѐc��-��$�x,,j���,B����\���;��*[^�֎�FIww[?%-4F�����r<�݄B���<0¯��m{76�ft��xW����)[#�v�ʦPҦPM���j��G4�+��YP1a�GE��A�XkhƜ���}��65�v�@Ū��ih�����@#V�#���h��(4b��E���L�VK�!=0ج�Ӈ"-�g�մ)U
'۲�����"�6EF�\�$l�f���P�eٲ��%5����GӘ�b������6N:�g���k3���l�h���IM���(����+�B��-zDO�|�{��hs�?
u��'��
'�!����0�B+-9P���;!��� cΰ?HA�����d'�41\O��^r�܈uG#v�G��a9��r���#�D�AVI=���c�|Jp-Ϣ�!�f#��C5�"w�w)I���Y���}��=*H�-C�U����JՉ���\���ν`����(����Ī�>�b�O�"�/rӇ��ا��{���4/���x�ǑS ^����	7�xY�>��7\V�ߊ�~(��ؑ�\�.�B�|�F�P�5
�����+�:�=��`�Çj�c*/�F|p���6O���'p�L���]�
e[쭃V$GpHd�
{��h��>s��R\��g[�v�[Zf����9���x[�n���|��{b�#��k��+�R#@Fں�?A-?�!�$b��/+��d�q��*�I	Nw�=T#�X�#���8����e`���]Z�=�b	;��2Q�PL�ұu�ϩW��66̌;T{��69�!��v$Q�O(rj�EHt8��!7R��ƈ�q
��2v�:��h��ą'��$���8��8M�Md��F��Sp�OCW](u�dg�t��{���/�Tg�&���W�v��U�f��fY*�W'9r9�֎��}��O��LT^�&�$=�%х���}ك"3i��E4D��e+n�s��47BY,���29��F~2}�`�=MU7~����摻�"��?�\��,����ϝL	vQ��gabi�v&5b���kN4`;��3����UXe�:ð\�U�g���Pc��d��Y谏I��(��b�Ȱ���8��=�4�N0����_y{;��~�M��ن�u.'ݯ{�/׍�(O��b����"Mli�(�T��`B3L��ig�q����V8��^&T4�=�Mf#&�0Ր��t�jq0�8�[����
�A�����/����Dl8���z�:�iO���9���r(:�EJ�cKeأ��{�6R'!v��]x����{�,^��@�9�D����ii��4��a���5�ͩ�i�49��"����]������:����6��?��S�o��\�ɸ
�!a!z�uq�޺���_�B��S4����P:9��z�ۚ�t_3[���-�(�b$��f��l�Wv�ǈX��2iܜV���/�����YJܖ�c2~��N�0I������ǖ�|Z��_ްS�����5Q��f<���0���m�q9ε0bX�jLTѓ�<W@�5������������HJ5�;���;Ґa�^�!�ɀ�j���=-C ��L��=�(u����Z�cc�����$�MS��w�Z-jd�L3�{���r�_����eY���J�������������z�--�s���7���~$j��5w�d8)�i3f">�q�˳G���}�J��N�R���f�ä�����c~./dI	Af�d]�ޭ���*AX-vq@�a��0�˴�G:P̮e�|��ô��	�ה
�6[s�"u�
�|��rx��X��e�J��#'����@����!5
�ZL=�ʤb)i+#�)���L�z��4\>(�?s�ض��wj�A(�Z�_J�$0w��k��0;������c�J)�M��d��d����bIUGB�[ާ�������)�~�+ʰ���ճ�·D?{�;z�lu�N�-88!x#֯Q�su����z�o+��/�o���އ���81� #q����Вw������uN&-s��00<p�xaϺ�kl㠗���d �u�Kө�"�5RC3��z˾�h:T?��:(b*p6I�\rS\l�1���,��`&��:UY<��^�½���=ZN`ß�7z޵BU���yt_��j`G�����j�!fچ����l��+�����O�"y�j�Qa�����4O������-wi�Y��ۗ��ʌ�\�Xh�^N9��*�����UUc�����������H̏�F����IA+�9T0t�=w�{�����w�9��/G<�R� H�h�3�+$L��R4��J0e��Yd.��?7TOs�D���b�BbϬF<�@{Ś�8*9P�,c�������*+(ɽ��������f��@���#�9�v�@�j�ۭ|>N�x�e�-2}�؀�~w_�3���$�MT�g��$��;��r���pv�.�������c��1L�=�u��xCx<~���!� l�|�%ӷ����h�S_�w��ۜ�q}�T� t�cP��aX�6(AlZ�I�]���h�e����*�q V0d����� IŬ+sb-�)9SD�af8��+)�����W�f�2��Đ��vrI�7� �pUS�Hm�X�cfћ��k?�
��T�
�G��Nvg	?#��0>L�Ve$5�a'�<��2S�2���9�fU���bhY�G܀Dx8��7�*<j��I�!p��z[�s���Rsn�@�K���Z��������@A4?���;_���}l��&r"�sB=�'��ȭ�D��E#�kq�����M,�*���U���ۜV�0$Gڮv����፻����gbN��i�AK*�E��>���C|���{��Nһ����ѵ{�� �<���듾�TYM��n��tn[    �ɗt�^<l;_�^jNZv�Sc�A�{[�`��Y-A-�h����p!���@B�w�'9�@��1k$�L������y��$��3B�϶���N����r�y��EM�?"O���\������d�#�A:�=�
e�17<4V�i���&��;�e��,�R�B9Ӊ.J!�%����
Z��I��BedTdm�fK01��*�)�U�yT��LMԏ�╇�PB�5�$�����n��n��G�:Ո������ƍ���FE��BC"d�Y�NF�D���~ÿ]�]�#P����L�Bx[�ݥ����N׏Ŏ��!��*EUmT�����*�'EU��|H����<����R3p����ʤ���|�Ǝ�نj���d�#���
�s +�E��Y�R�x ��u1�lF,K���!QX�`A2�����<,�
f8,�t��.��k;*��*rxHrٮ�ڋ))_���p�*4'�^���
�3��2�Qo�[��<�>��T8��{-(�v��J>���.�-�M��!-�|���i�:l�v��+�%
\��'��%�dޤس~ƿ#9p��9�u����w}�{"�uJWBÙ�0,yL���i�R��{k��W�j����UX:��EU}J��$����I3+'����Z$�C�2?�Q@��b*5R�,ld{������/_)*PO!Ȏ�9��!�̨��z� tT3���3�&`!�J&���ش-��DY����4!�Ít{�D����{�	{���JJ�F/B0m�ٶ�F��J$	!�s��;x����|��mNCJ�.S�䗳����Y�'�Ԑ=��o���G�\��>�K�h!q
Eٰ�I���S��F�-%.6�3b|�jJJTXź�l��(��a i�깵��Xq6RA�d �}�-�Bƶ���S+8F�������<p�
���5^�pdb�����T@�F6h/���ǹl��*\҉I6E�Nh`�5�}��c�F��抓!9139I%yR�@�g���������:�qF����������>���m������x�-�6�t.���-1a˟2l�Hb�xL��I����9��{t�Wb$&�z�WR��pT��\�-�.��rjj�E�����xG���cR)�����yK�饆ݛ��~F��45R"Ey;+��7)S���_Ą�;3���x%�e(�6Kc�
��ǆ#�w�d��,�G��iS7�qݬdF�5t[C:��*d
##���>v�V��m�� p��<�+�g�l�n�aƣ���<P��N�橡5�'R8�ᗦ4��ٓ���f�"�\��a	�	����ǎX�Kl.`_RC4�f�����Pc��i��٭���;��@|6���˨b\FBz6Y���ط���ɤ7�%�t��(U�[1<F�t�3�9��y�姸�u3��瓬��@)�%ɨa����k���`hk�;��ǐX!j!�\�c�ő���vg~
�T����F�2[>����A+bA�����W��WT�-����B�5�	�-�¸ 
�$Q�#w���KPI"�?��}����.�Ĉ�Du�xwo����D H���۞��A}0�W�����P�8���	c[E�
���4\���_�&���BU��t���q!���mduހ�59��G�"�d�)���=r���Ud��Do"�ݫ+Z,�'������m�?��)�bW)?������fR�%��1�|�ဂ�lr�@���/�ʔ\�,txD����1佫����M&L�Ԉ�4�+& )��v�7�����K@��]o.=�"�>9D2A��LSUHո�R�6��r��`$q�����F�_��V�t3�8��@����h�Jm�V�Z!iFD -����y��[����ak�(�)�p���H����{q���Xq�&���(�3��
�J��i �_`���@�!�y�T2bw���L���yP���U�A�Ԙ	j`���+o�]�x��qX���.,a*�|d�A2�>�_���t�P���䘚CM� ):�{�>���jӏ�vZ�8��gו����S�E�SnW�5�0m�X��Z- ��/��.�B����ݹg'�h��^A ���0��+�쫭1��T˜S�D�HH����΋s����N�����y- r�����/8}��,� (wB��5�1�>`�<�I r9�s	p\#`�+~��^H��B�LL�ԋ$~"�"�2�����@dQB���v��i6$���e��#���Oe�A�ur��\ 
[���i���_i�O�*� ���2rk�!$�9D3��dHL��)3�%a���d;�&L�<:gg�U��:(��.���i��ڨdl��HqU����\�����p�>"���B�N�B�(����)�ڻ������[�LqR3��5f����{�;Yr'��Yok�m7���x�����eY1�
��HVBa��v�Q��2�z�����d� �T2��N;t�A	�{!�Fa6�(��>�i�h���_'
D�a��(b�fIT�CâB���L?f�{�^���>v$��E5۱U��Z��4HBNR	Bs��d8"�����Z����[�t}b���ШaF�M4~Be�j�G�}=]�m>�9��
|�%�y2����G����������ܦ�>P MX�?v�d���eo{G<��-�`+��ƾM�q�2X�8�dܗ�2��Z��̿���#��c	�Z:a�6���������+okǯfJR?b�@?�lN@�;&EDA9%��@�ک;=�G�w�
���b�I)nr�����eNP�4���^-ɘ0� R�����^��~x�~J&$�@�R	e��	�0����̉��t���9R�z��L1�gN4{Gd9*1]#!����A˛�@���s��>Z3s��|X��'!1yt�`��y��]~u^B���qY��H'2=���d�{����{{"�	l�E�N��D�G������$��lѱf����Ȇ����4�~5�:��lkx�?��3�{�ӱ�R��?���A"9�g=��׭	c��jbL��XY������@(��}<����U��BF���&@{��(�;��pGd<`���lR��0����j�tF'��a5�NB�4!ݽ���$��{8u�J���x��A�,6(�4���ب�"�c;�>Ae��[!c������~om��0����ӕ�����)��t�H�l�b��#Ġ�n���ȯz����"'�9{��]?w\~��_��L�}��u�}�0��P�_�������0�O�!X��h�Z��il�ϐY��-FI<�j����l#Ql,�ȝ���OUL�0!����E�@<4����KhF5��U�A��W�
I�TP���ϴZ*��� i��Wyl�W^ �H%������DBJ5��v�ACwt
��4��,ԉ�<_l����|Q1p]|h��ǇXQUG+)����?N�	���С@��&Ds�n��F�d�dl�����w�{�l9(Wr�Z0�i{%��Xe2�l����~@�	o;�j)��j���J���yȾ=�ILU��ĥ�� >�,�%e�J�:ְ� M�,u��H�\";��}?���fd�w�06s[�`h���P�V�H�h���<
U�<�M5B�q���@v������c��?�* Fɓ&�#�`�f��f:*pZ�R���n�3���_�D�t�}���Z��E�cK<43%��)�/��b�0q+�cD��!b�Em��E4R>���9�~J:���x,���[v���*����t&������:��}Porۻ]��A��p��T�0��x��{�N��YH9�u�@��{v&�~�:@d_$�xh����@q�� �b\`������Ԥ�:q��V���Y��Zº�g7��!| .?0$Q��Y,�#SG�iuJ�ȑ\�����<��K��S�xY<���˼a���u}�c��&�tJ�,�y�*b}��{�<Q~&�������p���X�G�d�&��X1�Fm5�NL� �ՙ��¥Z��?��c�zX�`Dv|�(���I$*�   z�wL�#�44�eBjd�N\�����Eg�ǡ�0�Vx�جH��f�q� ��~�ʂM�![G����߹��z�݋�9��Qa+��BD7dݗSʿiTX�$�f)�^?�^�y[��IS�F�kr��0%�R}U�7y7�\��Pv�8VY��*V%�\�զ�q��\D�Vѱ"���� �jAMb[�K\�cǋ/���������}$7k�����\�v�ר�[��0��_��`�BUsg��7���L�\T���MT��NnHF�~=�y�/v/V0Ϥ�Ny���f�"%�jχ�s#m+��M���(az�T��s�>�	[��(rB�#n'�.]xe�a[f��,G�Q����,vg~t�]%�x&���p57pHIdBl[3�"ӑ����f^wtK����1�d�?�[�~�]�|�%�l�?�B�ه�k4�-^��x�;sٝ�o톹��[�t���HB#6�ZZ�Jl�E�U�[�9������yw�ez����J5�F��tY����T^Y�X��j�q^�W��D�i�B����0r��y��b�/�a� �^Y�/?��!0���+p�(�j ��Yo{ս��A!���S��CUN\v�l�n�ԜG�_��ԓa��3Q�>�=�9*�͘����$�Z���I�Tq`PJ�k�R���T�t�mg�G��}O�L
�+D�&�&k�lh�A�T�?�^�g�����)bF����1LD4G���DH�wm?�n�z�?�= �_�9��`n��)"�J�[�&�ڃ5����:� j�0)2j#CVa凅�ۏp��#x�GX�);�/��OF�Sp9~.gPa5�Z{[���.)n˾C�`�m��^�BQ,
+D�&\��X��-�!��{��v�kk������v�����V&���5�E���֟l��A'Of�HI��2�>o�Ԙ�*��/D���Bq�Sw�ٛi�m��(��f�Fm�jUF5�<b�7Ԉ��A�5�D��z����ɖM��R�N����~8��R��Q������}N�@�(L鰥��2 �ZIE� "B�����:��¬P#t,����o�{�A���z����`p�-J�뒐��D�{ueT�Tz�sx�1`�Qɐ%Ef��_��o�׿���.��I�t�tܽq������c�Ҙed&�1e�JZ��I�N�#C`#�LG�[j�H�����������ߒ�M�I�q{�Vt&�ĺ�g��p��[�3�#�����f�+6yZ��b@�jXbfi��k�.2�U�0,�����M���c���a��?�_!j��|����F-uW�u!E@�˟@�����*�� 0���bUP���!��g�B�>����O�Í	}�Co�A`�����R�0g+ǰF8�tCT�E�k�+ �U��%��/%fd�E��
�j�@�/��{���7�*����Ne}��-�`�t�ʾj�v;+�1�4E�:�Ǣ�b��ЫI��_u�x`T����:��I�{������рJ�>m*�ͧ���SH�'��kM�m=���M��8��
�b�i-�^�jt��n����v���m5U�g�;/E	�^z�ϻϞ�-��9�,�J׀فRrN���=p,���})*r����?z'��vq���`�{uE���I��I}0,��)sQ#RԱ��|���/r^�&:(��^��3�h��V"[951����vz/��� ri�X/͵��v9�9!2�q7�34T�5Bt��{R\�B�m����(Q����"���Bnز�X���2�9��{v@�?�(��2ѽ���7��a�{.7�syi0������7{�T���x�Ӑ3{��*��s�Ю�9N)�D"��+�%�Y�ˣ�����#��;��y���Ƭ�s<�C �f۪��F =���}�ʪ��k��:>������U���6�X3kp����!w_� ?}�؞ϥ���]1����Y`�2������;��NT��G3QƁ�������̘rГw9�=���ZŜ��D���	�D�鐡4�v��ݗ��A�Op:P�ˑ�k�ܳQE����H�+e���hbZ$��l�T��Ȋ,�y��\�Ќ�].t/ކ�!Rz���:�Zsh:}������B��鵻��}mC�{���c ��(iO����W����D3�MEKe��:��7�~��T-l�ˈՁ��xL	�mYU��(�5�X�n�HB� ����� w��d[O=U�� 	|��0�(Θ4�����'Xv'ϖ���0���PR��'c��`����d�\<�d:T#&I�7�}��W�N':�����l����;�͵�빨.�}F��|���Ϥ�5�"-j�n�<�I������3IR�;]��n�.���������-��~����\nz��y�������"��K��"���*�*�r� 55�D�ۯ
9���Й�ҹ�t�>���n^�ie�ԣ�(!z�9�1*�Y
����T�J�Kuw������\��'�
D���}�T����btgg"ɦ�νŮ�1�!9�������<G���,^U���
�\EuI�� Y�s�]|�џ�#���VSU���+R����h�_Q��w[�"���c1#4�M��_f���k$bޣ�k��XscGcB���)ת��e	�T�X��q*R���I��H*}X�n���g˽�C�gT�� ��'s���(B�!DK���HX�*5T������p�fga���Y�rE����6������2���m ޼����65jd43+6*c��(S>z�����6L���%�
�TP
L�A�2�"�a�� �_Y�r/��V�Ԕ3���T��j ��.BX��׸�(�c�՗H�a�/ɖ�a?�m�i]Be ��[6� k���W��H�n"4�2_���q�$�Q���M�>�/N,���T�]�f鎺Ը�FF��ڌ�E�f��*Z��j��D���Ȃ'�8鴟��7��7C�����N{�[;��W'P�`0�d	�R4�C��!咤�r��C`̇:D��(cZP����81-h;�~�����Um	��-�"�!�����m�dY��ق�a�B&_Q�ܠ��	�P��.���.�5�W�]ģ�h9�������<TTN�&m�-�@��f�]�l����۫��o��|�=�Y��������f' i�Nx[��X_.7�����M��
w���̬r�B�n���Y@IGo���=�+lp}�w�U�����3dD7���6�)�?���y���6�y;�-v)d{[����j�x~�T0;!�z�\@�VZ*�\�������/�įS�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      y   �  x����nc����O�}`�w����n�F`;�v�E�"F�i�(��&R%J�f�)�E���a��-rNݢ�	���Z��V��ԩ�߾��͗��AB6���/��f��?I����㳔�������t������_��K~��=�������㔘烥=Y�# `���Q8��L1鷂V� ;��6\,� �v���4E�����JL!W۲XC���b��&2 KȓsY)� �G��M�?F\5E�9�Q�&Z�C��G� {мj0 IZ��` �u���
8B�jA�Ȯ�Y�(]g��H]g�<�8�T�� �"ή�B ����� "�T��1`��ב�k0�%�F7<�� ���| s��W0�'�$�������E,C�A s���@�tqu2^�l��r��,G�]@ �A�!e��/����Ep��Ei?�-��OQ�-� &KrT�� �Vt�@�l���
�6a r[����{���f�p����:^ك�Q�~�8ג��� �a)�%�����kδԣ�V�ob�k7�	���!�����|��"<�'�(^�a �w�^��5g��l�8ݕ��/�t�P�.�P�H�-ߐ�A���l0��3U"� �/H�(Lnƭ]�m�����1J�9�X��O�t��Jq4��
2��))���v�c4[��W�?��X���I��E �u|��gǂ ����T` %��ɺpE\�G�/0 9��29ذ)�{��0R�M�Q� 6i�ۆ}�h���)"Ǩ]e���*%9@!��Ca� �L=-��:̘��P6U��C l�j�� ��ǥ`ԂȢ����)m�)� �����F�R�}�X��u��@ |Lw-�=��G'�! W��e��$1p�}Nx�o7s�R�4|��`���L>Ql�}@�B&���]�r}! ��L9X�l�2d` ��"��x"�ۍ�K0 �Z�<Bܔ�4v[  ����ಀZd�TI�@r���O.` [ٛ�*���@1f>�=� �0_� $h�/�5H�6݈�[��de1�\���(���2D��i���4Q]�Ka�[�w`���#dtW�޹�<59@�����Ɠ+��a ���>{� ($��K2(�ͥ2A�0�M�Td��"W��50M>=��G0��4h� E�^ʁ��G��a Op�U�|%�{ -���.��.�va ڦ�;��^Z6''�-�����y��3�TP�p�,U�؄��ǘ- �ۖrԖ�**夦v�	 x"�����4
��,�l57۲=�(��w���@�G����u�g��U�f�m�8<FL�K'�a6K��"�U�:P ���fGH��s?���d:9���Ƀ�����f��9�J�}�8��Ĺ�[�nur��[G��ǻ6K��x�5(�$4�p��Uz	��R��V���<�|�%ޯ��A��U�,�ɡi���ĩ4T�f~�T�)MPN%�6��n���ݭ�$�ܥRNv�!�B��|��R��"�\�����;j�pι��*nS�{���Z��gd��o #��:�8��[��r5:�:$��r��Q�_�G����˵��i��'d�	B��k����^� .`�\�}��E�����CG i�~�s�NDp��N
i1�(	>k�I?#�b�V���I����+_B y�?�q�`���U�yJ�V�ԩ�4e� pG��Z���#�S�i�!X*)�\�����%�W��R1:. f)1�6����0#���՚.K5 7�\�H���Z���2��a�`���k��ɺ|9�͒���qWD����B G�a'Z,��N���N$.�
�0Ku�Ȝ��r�D�=�����UpU�`2m�9�J�N����n����%�@�u��a1[Ƚ=(����x� $����~�`���v� �.�~����c�-f��b1����V׺aiE N��R��=��P�?��f�q��#����K�>�.H�ȗ<=D*>����\�4��N��Fr���\z(�0��-���$
F0��F�e��QW�Zc�B�!pG�EݏC ����%�d���U���FZwL�T��fq2���qQ6q6�2E�3
�q���\��=u'���K��i�Ү](���HvC6����N�*-3�8yd�Τ��TS'��pGy��� B��"�ގ��P��R�U7�0 y|+q;v�QaC���,i���l?oL�7�@�C�<���ZidA�x���%vO���Tk{u�B*؝�8�Vui�3A��[�Y�GH�� +����9��u&�N���C���`�0�%{Ǹo �wY��!09��2n�q
�F�xgG�U"1�l�!�UO}D� P�w�H���w8��@���^y3�S~JE�
���������Z�����r�#�p����|Dv>M�@���s�e�#t?��>7K!-�f�v%OVa�܍�r)
��KQ�	 $�.Y��*#�J��|![T!�ib:�^j��6��`r��(;PvB �G���G��i_�-�����iE(���3d�p/�;l����z��G �7h{0_�~�0G0َ"ׁb��r3���?Y8���\�!܀0h����������A��q����C��3�c'8BR(�/�CGA�BG���lZ�!�EXɅ�E�7P4:u�������q�����i�	B0A�(�h��O��)�`qe٪�������x�a�i�8�_����4E��������Sd����4t�MS$>�n>@�n���3�`	9|�2`rJk|FP�Y�lGP�M�|C$pz�����N��Bi�j����K&n�"��:pv
_:�o��*m<N�,@ �z>y�	CHZk�(B ��ߜ������Y�q�A�v�"(�����ɵ;!������!�DTr��?�@6�9��a�M/5C�frR' ��ROu���p� ��4'6��[�7�Ĵ����6���I�]qj� -gM~ru-�ΡT��u]��˴&����6!i�!��JߩJ�R��k����Cp����  $��_�i��r�W������	hJer�"�`���N&G0Ue����,4�e�h�V�I+����;|&����'����A4K�=�a_8��0��\C�����)fLH6�z�.�Ћ�����ٯ����;���`������ I�X��J?35�������D��a��Z�F;�����߾����_��Zf�����z���s����������ޥ�xx�T�zIvf�y����|���t%���|���^��#Ri�s�2��߼��w��~����Ծ��.:�H&������wZ�H8�׿��7���$3<~�%�O_�z�/��l      �      x�mZ[W��}�Ex6���H4�h�N��$J�\��J���.;!ƜY�f�4M�R�k��Up6���ue>Y,ح_��~9�2[]N�}�͞~��<JR����PI������u��H����<�ʬ�f�v]�T���Dw_Tk����=>�"'i��4M�0R������k?����dv��k�17feJ�(voK�\�r�2��k���He�L%�
S�{vv.��"�٣����0u�g�n�����y�֖�_|EN�D	�[FQ����]?<<��sʈ��
�H�n�W�`"b7������w���FW�����<G�9�Qg��_��)�υDh�)�mJ��3�R�~����ذ[[ve����+�Qs!D(y/jz�3�"Ƀ�]��p%S���үG���Ÿ��S��+@���+�P���'*�*�󈂧*P�񳬑�]�v�dq�t#;xpn�0�s3f�<|�J�8�Q(���#q����lWn5a2cv4�m�_~�̊=]�2,R�����W=y�S�My�#��6s<����fW1����!ϺDv�Ho�Ա����Y"d��B&!��<��<!@��s�ۮٍ�*J�������m{r��-�=>�����O�,�D/��:%ϣ��2'��C�v23hC�����U��ڽ��5{<9�<��L�H���
��"Gx�d�+�'��G�&�,��N����[���)�f:��>޿�R!%�,��<�5!o�P��كq�����,q�.fS�%P�5�ׅ��fˮN��:�LE*���E�*TǄ��zk+v��s �{���^�Ҙ������]O�"E�D
&�Z��� -��MvD�S���$�S�5 b��=����z�Oݒ�)�QL'�$�^_?�@�����5�¢��)u1��e�b�1�Yϑ�r��h�N�(��d����A���R�d����r��){w[=x������{|=%Y�|<J�
v�+���u��+W�z�ɞt5g1G�Lj3�8[��n�~�kv
����TI��88&�Q�"_�uIDz�ܒ��>La7���󥝬ܞݜ����ԉq�BvtH3���J�?�R6PupG����gz���NT�3!˩�E;W��((2`�!�Z�ʣ�.dĮl��u[�[mk
�aQ��gy�!��p�@'�f���;�Z�(���r�o�Z{j��S&�8�@w2���r/�*x �hK�n��KvW.��͗ņ�|c���u!G� �<k���O�:<ʐ��v�������;�؇3߶ɟ�՛�߳�S�%��"I�6���bz4��:]L�ѕ5E��u�nұ�ƅ�f��N��������6�6wr�_( bgM����QԿ�����5;����H��ۯ�`���D(�vI�|��9!��]�9��Um�r�i��������|e�]>B_�	g)�a�z��d�.��͐��e�wSfJr�ff~ۦ�݌̨p�L'2�00��Q���(��(��(נҊ�xW�����[�Y�-ωjX�c��ð�x�D�[���j��ց�)�hp��X����n|�90e	ӱ����ZI*�@
v����f~��q[Ƌ�،Q���S���dD3�땃4�"@o���/3~�[?��cC���~l�xO�,x�!.@fy�O�0(�
�l7zTZ蕡�{b�w��/0����=�����sƕ�	f�NpL*|�y�a��Gf�'M���җ+����c ��,L�A/�Y;]`���ͼ���L=��:҄�����.J�]ڱfo�w���Ti�����M3�ΐ��@��Pϻ�Y��Q@CNO-���ԊY�@;�)�0�?Ĺ 9*�@�K�dn��9�xuq�aWn72s�.;\�D;Q�d��'�S�,�����H��?��ym����vD���;�dBji	S�K5r��5�1����݇�O6�|�v��)�~w�!��,!��L�^�ӥf�����`骶�O~����$i�F��4��W�+$t!�.�T�a�*8�q4�o�vzр�պ�L�����+��&�Y�EY(�3�x�˯�7��� �1�C�T����$�"�
�J���7o�� ���9�3<˞�� ����P��V{����~���$_��X���HHD�ă89��_����/�޸b0�[4Ͻ�V~��eW�`v�!D��{���Ѩ $��('��c'4��v�(�~���([۝��C������c;n5��
���p��w3�wx;�f�����B��Sc�ǍU�R(JGZ��E���!�Y��K;�z�+ �o-8���1O#��,�eȳ��ɊB)s������r@C7P��雙8��F~*���#�$���I3�Y��}�7�ٛ�\A1bL�j��лëѱۮI�YB������wځ���]c&��wҨ�caZ�#�����`�'	u��ԍ��RB�ቨn����,-��������%��vo
���$�!t3�}�F\�ǳ%0R��?LsL��޸�}�fc�ߴ�T�n�q���� � ��t��͕�iF؋-,��)KB��ԍ,�Z�b$�HR�ɏ)��'�<@�nM�裑'>��;4�o;5p��.�,Bx���Fxs�.�z�K��i�R�p|�zn����uD�4݉���}�ī��1��X�����ϫ
~e[��-�̾t{���+����5�i�&$n�Xw��K71�Lh�������/����<�ik%1s��V�b�@)��	X�iwu�zg��SS�Q��<P
�"��T����in���7L��������!�6��	J��*ø?ŀ�]���b7��N-������ǫ��cD���y��(r�¸��H�$Y���>l�F��$ecC�����vvX)$e3�Oz\���{�K<�T_�5E��[�04~��qz,���5ly��S�{4e@3&4z��-i���4!��mK�ԙ�� �{�R5Z<%�X4��/>7��*�[=^[(��b,�(��M#��<��oӬ����JP���E����xs�E�"א�ݍ)D^�����.!l(`#c� L[�vn�=Ws7:��}Kջ;ف��p���f���pV�c]�z���AC��9H�K�^RJ�1�b�������&D��!�i���L�:f�)w{c�zp�
�ոk]����Kg�I��$)ڼ/T%��˃,��.Ɵ�e!T��ޮ�O_jZ��]�@s�'MJoS�}�GԄ�dd�k�Z�ݏ`�.MS؋�i��9�䐒�_��v��� �lt��.�� i�Z��U	�gϵY��²����H�q,���:����Z��4����������v��B���⣹�|��h��Q6�K�2�*Oa"c�lt���z�+v{ʅȢ��5Sޓ���)}(A�@�M�����!��jk���e�T%�Ê�"�A	��-DOI�Q���pu��=*`?��㮻W�hG!3����~(�E"��F�Vd0���.���t��+�n��M�\�gZ�'}a���k�@����LH�x��xr���T�=�Kޜ���}r��|�I��L�y���hN���m:��7�
F��g&8�Q~��}?�4� �*���}��1{�K(�v�b��ө�s���&z�<T�`п0����[��K7�t�z&=���n���u�i�tw��V;ve)o�O\x�������͟ҍ�jp�9�ˍ+��x��{h�sJe�Yh��'ڛ�n�Y�]8�)|��'_�g��ӝ��9'G���Ϥ���c(�r32�f�M@&b@�����ˉ[~��&\�{W�������@:��hÚ�E�v�w�5������.��t>�c��Y߸d��4�L����^u�X1X�'��G�wef~�0ߎ�2���2
e����e�2Hi��Uss>����S��^�u�ͱʡ��2�����a��!0�m�g��am��?�QgA�`7p�f�.N�������3@ڒ?���ٻu+��]������g�����c�vjHÐ�P���������A�7-^�"��}�7fm�ٷ��TQJ�oq�z���j˒7��zE���]|�� �  5�l�����m����vt/Q;�z���p���(g�����f�+��5���~GT��!�k�'Q(�^��ò		�t�\�-V`���S�nOol�wۉ��0���n=K�x�[@B�1h�(�c�!/)���� \���ε���s����-.�>���/:����cd��Ĭ�_�|�f�om{W}0�E��:JI%Џ�,2�2G��)ră<=ڽpw{d�kΫ��5�R�7�,��a�;�&-��NC&��t z�hD����U_oh����gǰ���)]�z�&�K�3<[�b�R"�F���h&]�;6�6k/��S��y�yԇõ(�Z�����\��	#S��IH ������^�"ڏ}~yq�G;���I!<���%{=��"pIƽINZ�fٿ� ��zpf      �      x������ � �     