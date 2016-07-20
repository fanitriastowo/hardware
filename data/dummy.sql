--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

-- Started on 2016-07-20 19:57:25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE penjualanhardware;
--
-- TOC entry 2236 (class 1262 OID 16543)
-- Name: penjualanhardware; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE penjualanhardware WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE penjualanhardware OWNER TO postgres;

\connect penjualanhardware

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 16750)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 1 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2237 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 188 (class 1259 OID 16841)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 16752)
-- Name: master_brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE master_brand (
    id integer NOT NULL,
    deskripsi text,
    nama character varying(255)
);


ALTER TABLE master_brand OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 16760)
-- Name: master_kategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE master_kategori (
    id integer NOT NULL,
    deskripsi text,
    nama character varying(255)
);


ALTER TABLE master_kategori OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 16768)
-- Name: master_produk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE master_produk (
    id integer NOT NULL,
    deskripsi text,
    detail_produk text,
    harga bigint,
    image character varying(255),
    jumlah_terbeli integer DEFAULT 0,
    nama character varying(255),
    spesifikasi text,
    stok integer,
    brand_id integer,
    kategori_id integer
);


ALTER TABLE master_produk OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16777)
-- Name: master_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE master_role (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE master_role OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16782)
-- Name: master_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE master_user (
    id integer NOT NULL,
    enabled boolean,
    jeniskelamin character varying(255),
    nama character varying(255),
    password character varying(255),
    phone character varying(255),
    tanggallahir date,
    username character varying(255),
    role_id integer
);


ALTER TABLE master_user OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16790)
-- Name: transaksi_pemesanan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE transaksi_pemesanan (
    id integer NOT NULL,
    alamatpengiriman character varying(255),
    jumlahitems integer,
    namaitem character varying(255),
    namapenerima character varying(255),
    pemesananid integer,
    phonepenerima character varying(255),
    tanggalpemesanan date,
    totalharga bigint,
    transfer boolean,
    produk_id integer,
    user_id integer
);


ALTER TABLE transaksi_pemesanan OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16798)
-- Name: transaksi_pengiriman; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE transaksi_pengiriman (
    id integer NOT NULL,
    alamatpengiriman character varying(255),
    jneid character varying(255),
    statuspengiriman character varying(255),
    tanggalpengiriman date,
    pemesanan_id integer,
    user_id integer
);


ALTER TABLE transaksi_pengiriman OWNER TO postgres;

--
-- TOC entry 2155 (class 2613 OID 16635)
-- Name: 16635; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16635');


ALTER LARGE OBJECT 16635 OWNER TO postgres;

--
-- TOC entry 2156 (class 2613 OID 16636)
-- Name: 16636; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16636');


ALTER LARGE OBJECT 16636 OWNER TO postgres;

--
-- TOC entry 2157 (class 2613 OID 16637)
-- Name: 16637; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16637');


ALTER LARGE OBJECT 16637 OWNER TO postgres;

--
-- TOC entry 2158 (class 2613 OID 16638)
-- Name: 16638; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16638');


ALTER LARGE OBJECT 16638 OWNER TO postgres;

--
-- TOC entry 2159 (class 2613 OID 16639)
-- Name: 16639; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16639');


ALTER LARGE OBJECT 16639 OWNER TO postgres;

--
-- TOC entry 2160 (class 2613 OID 16640)
-- Name: 16640; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16640');


ALTER LARGE OBJECT 16640 OWNER TO postgres;

--
-- TOC entry 2161 (class 2613 OID 16641)
-- Name: 16641; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16641');


ALTER LARGE OBJECT 16641 OWNER TO postgres;

--
-- TOC entry 2162 (class 2613 OID 16642)
-- Name: 16642; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16642');


ALTER LARGE OBJECT 16642 OWNER TO postgres;

--
-- TOC entry 2163 (class 2613 OID 16643)
-- Name: 16643; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16643');


ALTER LARGE OBJECT 16643 OWNER TO postgres;

--
-- TOC entry 2164 (class 2613 OID 16644)
-- Name: 16644; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16644');


ALTER LARGE OBJECT 16644 OWNER TO postgres;

--
-- TOC entry 2165 (class 2613 OID 16645)
-- Name: 16645; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16645');


ALTER LARGE OBJECT 16645 OWNER TO postgres;

--
-- TOC entry 2166 (class 2613 OID 16739)
-- Name: 16739; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16739');


ALTER LARGE OBJECT 16739 OWNER TO postgres;

--
-- TOC entry 2167 (class 2613 OID 16740)
-- Name: 16740; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16740');


ALTER LARGE OBJECT 16740 OWNER TO postgres;

--
-- TOC entry 2168 (class 2613 OID 16741)
-- Name: 16741; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16741');


ALTER LARGE OBJECT 16741 OWNER TO postgres;

--
-- TOC entry 2169 (class 2613 OID 16742)
-- Name: 16742; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16742');


ALTER LARGE OBJECT 16742 OWNER TO postgres;

--
-- TOC entry 2170 (class 2613 OID 16743)
-- Name: 16743; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16743');


ALTER LARGE OBJECT 16743 OWNER TO postgres;

--
-- TOC entry 2171 (class 2613 OID 16744)
-- Name: 16744; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16744');


ALTER LARGE OBJECT 16744 OWNER TO postgres;

--
-- TOC entry 2172 (class 2613 OID 16745)
-- Name: 16745; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16745');


ALTER LARGE OBJECT 16745 OWNER TO postgres;

--
-- TOC entry 2173 (class 2613 OID 16746)
-- Name: 16746; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16746');


ALTER LARGE OBJECT 16746 OWNER TO postgres;

--
-- TOC entry 2174 (class 2613 OID 16747)
-- Name: 16747; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16747');


ALTER LARGE OBJECT 16747 OWNER TO postgres;

--
-- TOC entry 2175 (class 2613 OID 16748)
-- Name: 16748; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16748');


ALTER LARGE OBJECT 16748 OWNER TO postgres;

--
-- TOC entry 2176 (class 2613 OID 16749)
-- Name: 16749; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16749');


ALTER LARGE OBJECT 16749 OWNER TO postgres;

--
-- TOC entry 2177 (class 2613 OID 16843)
-- Name: 16843; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16843');


ALTER LARGE OBJECT 16843 OWNER TO postgres;

--
-- TOC entry 2178 (class 2613 OID 16844)
-- Name: 16844; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16844');


ALTER LARGE OBJECT 16844 OWNER TO postgres;

--
-- TOC entry 2179 (class 2613 OID 16845)
-- Name: 16845; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16845');


ALTER LARGE OBJECT 16845 OWNER TO postgres;

--
-- TOC entry 2180 (class 2613 OID 16846)
-- Name: 16846; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16846');


ALTER LARGE OBJECT 16846 OWNER TO postgres;

--
-- TOC entry 2181 (class 2613 OID 16847)
-- Name: 16847; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16847');


ALTER LARGE OBJECT 16847 OWNER TO postgres;

--
-- TOC entry 2182 (class 2613 OID 16848)
-- Name: 16848; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16848');


ALTER LARGE OBJECT 16848 OWNER TO postgres;

--
-- TOC entry 2183 (class 2613 OID 16849)
-- Name: 16849; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16849');


ALTER LARGE OBJECT 16849 OWNER TO postgres;

--
-- TOC entry 2184 (class 2613 OID 16850)
-- Name: 16850; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16850');


ALTER LARGE OBJECT 16850 OWNER TO postgres;

--
-- TOC entry 2185 (class 2613 OID 16851)
-- Name: 16851; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16851');


ALTER LARGE OBJECT 16851 OWNER TO postgres;

--
-- TOC entry 2186 (class 2613 OID 16852)
-- Name: 16852; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16852');


ALTER LARGE OBJECT 16852 OWNER TO postgres;

--
-- TOC entry 2187 (class 2613 OID 16853)
-- Name: 16853; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16853');


ALTER LARGE OBJECT 16853 OWNER TO postgres;

--
-- TOC entry 2188 (class 2613 OID 16854)
-- Name: 16854; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16854');


ALTER LARGE OBJECT 16854 OWNER TO postgres;

--
-- TOC entry 2189 (class 2613 OID 16855)
-- Name: 16855; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16855');


ALTER LARGE OBJECT 16855 OWNER TO postgres;

--
-- TOC entry 2190 (class 2613 OID 16856)
-- Name: 16856; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16856');


ALTER LARGE OBJECT 16856 OWNER TO postgres;

--
-- TOC entry 2191 (class 2613 OID 16857)
-- Name: 16857; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16857');


ALTER LARGE OBJECT 16857 OWNER TO postgres;

--
-- TOC entry 2192 (class 2613 OID 16858)
-- Name: 16858; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16858');


ALTER LARGE OBJECT 16858 OWNER TO postgres;

--
-- TOC entry 2193 (class 2613 OID 16859)
-- Name: 16859; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16859');


ALTER LARGE OBJECT 16859 OWNER TO postgres;

--
-- TOC entry 2194 (class 2613 OID 16860)
-- Name: 16860; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16860');


ALTER LARGE OBJECT 16860 OWNER TO postgres;

--
-- TOC entry 2195 (class 2613 OID 16861)
-- Name: 16861; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16861');


ALTER LARGE OBJECT 16861 OWNER TO postgres;

--
-- TOC entry 2196 (class 2613 OID 16862)
-- Name: 16862; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16862');


ALTER LARGE OBJECT 16862 OWNER TO postgres;

--
-- TOC entry 2197 (class 2613 OID 16863)
-- Name: 16863; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16863');


ALTER LARGE OBJECT 16863 OWNER TO postgres;

--
-- TOC entry 2198 (class 2613 OID 16864)
-- Name: 16864; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16864');


ALTER LARGE OBJECT 16864 OWNER TO postgres;

--
-- TOC entry 2199 (class 2613 OID 16865)
-- Name: 16865; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16865');


ALTER LARGE OBJECT 16865 OWNER TO postgres;

--
-- TOC entry 2200 (class 2613 OID 16866)
-- Name: 16866; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16866');


ALTER LARGE OBJECT 16866 OWNER TO postgres;

--
-- TOC entry 2201 (class 2613 OID 16867)
-- Name: 16867; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16867');


ALTER LARGE OBJECT 16867 OWNER TO postgres;

--
-- TOC entry 2202 (class 2613 OID 16868)
-- Name: 16868; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16868');


ALTER LARGE OBJECT 16868 OWNER TO postgres;

--
-- TOC entry 2203 (class 2613 OID 16869)
-- Name: 16869; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16869');


ALTER LARGE OBJECT 16869 OWNER TO postgres;

--
-- TOC entry 2204 (class 2613 OID 16870)
-- Name: 16870; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16870');


ALTER LARGE OBJECT 16870 OWNER TO postgres;

--
-- TOC entry 2205 (class 2613 OID 16871)
-- Name: 16871; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16871');


ALTER LARGE OBJECT 16871 OWNER TO postgres;

--
-- TOC entry 2206 (class 2613 OID 16872)
-- Name: 16872; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16872');


ALTER LARGE OBJECT 16872 OWNER TO postgres;

--
-- TOC entry 2207 (class 2613 OID 16873)
-- Name: 16873; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16873');


ALTER LARGE OBJECT 16873 OWNER TO postgres;

--
-- TOC entry 2208 (class 2613 OID 16874)
-- Name: 16874; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16874');


ALTER LARGE OBJECT 16874 OWNER TO postgres;

--
-- TOC entry 2209 (class 2613 OID 16875)
-- Name: 16875; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16875');


ALTER LARGE OBJECT 16875 OWNER TO postgres;

--
-- TOC entry 2210 (class 2613 OID 16876)
-- Name: 16876; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16876');


ALTER LARGE OBJECT 16876 OWNER TO postgres;

--
-- TOC entry 2211 (class 2613 OID 16877)
-- Name: 16877; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16877');


ALTER LARGE OBJECT 16877 OWNER TO postgres;

--
-- TOC entry 2212 (class 2613 OID 16878)
-- Name: 16878; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16878');


ALTER LARGE OBJECT 16878 OWNER TO postgres;

--
-- TOC entry 2213 (class 2613 OID 16879)
-- Name: 16879; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16879');


ALTER LARGE OBJECT 16879 OWNER TO postgres;

--
-- TOC entry 2214 (class 2613 OID 16880)
-- Name: 16880; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16880');


ALTER LARGE OBJECT 16880 OWNER TO postgres;

--
-- TOC entry 2215 (class 2613 OID 16881)
-- Name: 16881; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16881');


ALTER LARGE OBJECT 16881 OWNER TO postgres;

--
-- TOC entry 2216 (class 2613 OID 16882)
-- Name: 16882; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16882');


ALTER LARGE OBJECT 16882 OWNER TO postgres;

--
-- TOC entry 2217 (class 2613 OID 16883)
-- Name: 16883; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16883');


ALTER LARGE OBJECT 16883 OWNER TO postgres;

--
-- TOC entry 2218 (class 2613 OID 16884)
-- Name: 16884; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16884');


ALTER LARGE OBJECT 16884 OWNER TO postgres;

--
-- TOC entry 2219 (class 2613 OID 16885)
-- Name: 16885; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16885');


ALTER LARGE OBJECT 16885 OWNER TO postgres;

--
-- TOC entry 2220 (class 2613 OID 16886)
-- Name: 16886; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16886');


ALTER LARGE OBJECT 16886 OWNER TO postgres;

--
-- TOC entry 2221 (class 2613 OID 16887)
-- Name: 16887; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16887');


ALTER LARGE OBJECT 16887 OWNER TO postgres;

--
-- TOC entry 2222 (class 2613 OID 16888)
-- Name: 16888; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16888');


ALTER LARGE OBJECT 16888 OWNER TO postgres;

--
-- TOC entry 2223 (class 2613 OID 16889)
-- Name: 16889; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16889');


ALTER LARGE OBJECT 16889 OWNER TO postgres;

--
-- TOC entry 2224 (class 2613 OID 16890)
-- Name: 16890; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16890');


ALTER LARGE OBJECT 16890 OWNER TO postgres;

--
-- TOC entry 2225 (class 2613 OID 16891)
-- Name: 16891; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16891');


ALTER LARGE OBJECT 16891 OWNER TO postgres;

--
-- TOC entry 2226 (class 2613 OID 16892)
-- Name: 16892; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16892');


ALTER LARGE OBJECT 16892 OWNER TO postgres;

--
-- TOC entry 2227 (class 2613 OID 16893)
-- Name: 16893; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16893');


ALTER LARGE OBJECT 16893 OWNER TO postgres;

--
-- TOC entry 2228 (class 2613 OID 16894)
-- Name: 16894; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16894');


ALTER LARGE OBJECT 16894 OWNER TO postgres;

--
-- TOC entry 2229 (class 2613 OID 16895)
-- Name: 16895; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16895');


ALTER LARGE OBJECT 16895 OWNER TO postgres;

--
-- TOC entry 2230 (class 2613 OID 16896)
-- Name: 16896; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('16896');


ALTER LARGE OBJECT 16896 OWNER TO postgres;

--
-- TOC entry 2238 (class 0 OID 0)
-- Dependencies: 188
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 29, true);


--
-- TOC entry 2147 (class 0 OID 16752)
-- Dependencies: 181
-- Data for Name: master_brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO master_brand VALUES (8, '16846', 'Samsung');
INSERT INTO master_brand VALUES (9, '16847', 'Logitech');
INSERT INTO master_brand VALUES (16, '16863', 'Visipro');
INSERT INTO master_brand VALUES (21, '16876', 'AMD');
INSERT INTO master_brand VALUES (27, '16890', 'SanDisk');


--
-- TOC entry 2148 (class 0 OID 16760)
-- Dependencies: 182
-- Data for Name: master_kategori; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO master_kategori VALUES (5, '16843', 'RAM');
INSERT INTO master_kategori VALUES (6, '16844', 'Monitor');
INSERT INTO master_kategori VALUES (7, '16845', 'Hardisk');
INSERT INTO master_kategori VALUES (12, '16855', 'AMD Motherboard');
INSERT INTO master_kategori VALUES (13, '16856', 'AMD Processor');
INSERT INTO master_kategori VALUES (26, '16889', 'Flashdisk');


--
-- TOC entry 2149 (class 0 OID 16768)
-- Dependencies: 183
-- Data for Name: master_produk; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO master_produk VALUES (14, '16857', '16858', 1500000, 'produk-952521Monitor.png', 0, 'Monitor Samsung 20''', '16859', 30, 8, 6);
INSERT INTO master_produk VALUES (15, '16860', '16861', 1750000, 'produk-573576Monitor.png', 0, 'Monitor Samsung 21''', '16862', 30, 8, 6);
INSERT INTO master_produk VALUES (17, '16864', '16865', 500000, 'produk-817089RAM.jpg', 0, 'RAM Visipro 4GB DDR3', '16866', 30, 16, 5);
INSERT INTO master_produk VALUES (18, '16867', '16868', 700000, 'produk-706558RAM.jpg', 0, 'RAM Visipro 8GB DDR3', '16869', 30, 16, 5);
INSERT INTO master_produk VALUES (19, '16870', '16871', 900000, 'produk-426527SSD.JPG', 0, 'Logitech Hardisk SSD 256GB', '16872', 30, 9, 7);
INSERT INTO master_produk VALUES (20, '16873', '16874', 1300000, 'produk-612700SSD.JPG', 0, 'Logitech Hardisk SSD 512GB', '16875', 30, 9, 7);
INSERT INTO master_produk VALUES (22, '16877', '16878', 700000, 'produk-203128AMD Processor.jpg', 0, 'AMD Phenom 3.0 GHz', '16879', 30, 21, 13);
INSERT INTO master_produk VALUES (23, '16880', '16881', 1500000, 'produk-521307AMD Processor.jpg', 0, 'AMD FX 3.0 GHz 8 Core', '16882', 30, 21, 13);
INSERT INTO master_produk VALUES (24, '16883', '16884', 700000, 'produk-209984AMD Motherboard.jpg', 0, 'AMD Motherboard Phenom Processor', '16885', 30, 21, 12);
INSERT INTO master_produk VALUES (25, '16886', '16887', 1500000, 'produk-320020AMD Motherboard.jpg', 0, 'AMD Motherboard FX Processor', '16888', 30, 21, 12);
INSERT INTO master_produk VALUES (28, '16891', '16892', 150000, 'produk-163984Flashdisk.png', 0, 'SanDisk Flashdrive 16GB', '16893', 30, 27, 26);
INSERT INTO master_produk VALUES (29, '16894', '16895', 250000, 'produk-761024Flashdisk.png', 0, 'SanDisk Flashdrive 32GB', '16896', 30, 27, 26);


--
-- TOC entry 2150 (class 0 OID 16777)
-- Dependencies: 184
-- Data for Name: master_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO master_role VALUES (1, 'ROLE_ADMIN');
INSERT INTO master_role VALUES (2, 'ROLE_MEMBER');


--
-- TOC entry 2151 (class 0 OID 16782)
-- Dependencies: 185
-- Data for Name: master_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO master_user VALUES (3, true, 'lakilaki', 'admin', '$2a$10$ixxQCfMF2EXlLdJNTlQPb.dFKrdIVHZm5iAH75JHtn1Y9Cu62T1MK', '085747505359', '2016-07-20', 'admin@itsolution.com', 1);
INSERT INTO master_user VALUES (4, true, 'lakilaki', 'Angga Setyo', '$2a$10$9NFylYb..rsGfQn3wWqdSuNY3E/IaDByVGywSUIk2zsJD/pooYNjO', '087898745888', '2016-07-20', 'angga.setyo@gmail.com', 2);


--
-- TOC entry 2152 (class 0 OID 16790)
-- Dependencies: 186
-- Data for Name: transaksi_pemesanan; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2153 (class 0 OID 16798)
-- Dependencies: 187
-- Data for Name: transaksi_pengiriman; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2231 (class 0 OID 0)
-- Data for Name: BLOBS; Type: BLOBS; Schema: -; Owner: 
--

SET search_path = pg_catalog;

BEGIN;

SELECT pg_catalog.lo_open('16635', 131072);
SELECT pg_catalog.lowrite(0, '\x4b6f6d707574657220416e6461206c656d6f743f2042616e79616b2070726f6772616d2079616e672068616e672061746175206e6f7420726573706f6e64696e673f204d756e676b696e206d656d6f7279206b6f6d707574657220416e646120737564616820746964616b206c616769206d656e756e6a616e67206b656275747568616e20416e64612e20536161746e7961206d656e616d626168206d656d6f7279206b6f6d707574657220416e6461212054656d756b616e206265726261676169206d65726b2064616e206a656e6973206d656d6f7279206b6f6d7075746572');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16636', 131072);
SELECT pg_catalog.lowrite(0, '\x4d6f6e69746f72206164616c616820616c617420756e74756b206d656e616d70696c6b616e2074616d70696c616e2070616461206b6f6d707574657220416e64612e204a656e6973206d6f6e69746f72206b6f6d7075746572207361617420696e69206164612062616e79616b2e204164612079616e67206d656e6767756e616b616e2070616e656c20544e2064616e204950532e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16637', 131072);
SELECT pg_catalog.lowrite(0, '\x54656d7061742070656e79696d70616e616e2f73746f72616765206469206b6f6d70757465722062657266756e67736920756e74756b206d656e79696d70616e206265726261676169206d6163616d2066696c6520416e64612c20736570657274692066696c6520646f6b756d656e2c206d7573696b2c20766964656f2c2070726f6772616d2c206d617570756e2067616d6573');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16638', 131072);
SELECT pg_catalog.lowrite(0, '\x53616d73756e67206265726b656d62616e67206d656e6a616469206b6f72706f72617369206b656c61732064756e69612064656e67616e206269736e69732079616e67206d656c69707574692074656b6e6f6c6f67692063616e676769682c2073656d696b6f6e64756b746f722c206b6f6e737472756b73692070656e63616b6172206c616e6769742064616e2070616272696b2c20706574726f6b696d69612c20627573616e612c206f6261742c206b6575616e67616e2c20686f74656c2c2064616e2062616e79616b206c6167692e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16639', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f676974656368206164616c616820736562756168207065727573616861616e2053776973732079616e6720626572666f6b7573207061646120696e6f766173692064616e206b75616c697461732c204c6f676974656368206d6572616e63616e6720706572616e676b6174207072696261646920756e74756b206d656d62616e7475206d6173796172616b6174206d656e696b6d6174692070656e67616c616d616e206c65626968206261696b2064616c616d2064756e6961206469676974616c');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16640', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16641', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16642', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16643', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16644', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16645', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16739', 131072);
SELECT pg_catalog.lowrite(0, '\x4b6f6d707574657220416e6461206c656d6f743f2042616e79616b2070726f6772616d2079616e672068616e672061746175206e6f7420726573706f6e64696e673f204d756e676b696e206d656d6f7279206b6f6d707574657220416e646120737564616820746964616b206c616769206d656e756e6a616e67206b656275747568616e20416e64612e20536161746e7961206d656e616d626168206d656d6f7279206b6f6d707574657220416e6461212054656d756b616e206265726261676169206d65726b2064616e206a656e6973206d656d6f7279206b6f6d7075746572');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16740', 131072);
SELECT pg_catalog.lowrite(0, '\x4d6f6e69746f72206164616c616820616c617420756e74756b206d656e616d70696c6b616e2074616d70696c616e2070616461206b6f6d707574657220416e64612e204a656e6973206d6f6e69746f72206b6f6d7075746572207361617420696e69206164612062616e79616b2e204164612079616e67206d656e6767756e616b616e2070616e656c20544e2064616e204950532e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16741', 131072);
SELECT pg_catalog.lowrite(0, '\x54656d7061742070656e79696d70616e616e2f73746f72616765206469206b6f6d70757465722062657266756e67736920756e74756b206d656e79696d70616e206265726261676169206d6163616d2066696c6520416e64612c20736570657274692066696c6520646f6b756d656e2c206d7573696b2c20766964656f2c2070726f6772616d2c206d617570756e2067616d6573');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16742', 131072);
SELECT pg_catalog.lowrite(0, '\x53616d73756e67206265726b656d62616e67206d656e6a616469206b6f72706f72617369206b656c61732064756e69612064656e67616e206269736e69732079616e67206d656c69707574692074656b6e6f6c6f67692063616e676769682c2073656d696b6f6e64756b746f722c206b6f6e737472756b73692070656e63616b6172206c616e6769742064616e2070616272696b2c20706574726f6b696d69612c20627573616e612c206f6261742c206b6575616e67616e2c20686f74656c2c2064616e2062616e79616b206c6167692e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16743', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f676974656368206164616c616820736562756168207065727573616861616e2053776973732079616e6720626572666f6b7573207061646120696e6f766173692064616e206b75616c697461732c204c6f676974656368206d6572616e63616e6720706572616e676b6174207072696261646920756e74756b206d656d62616e7475206d6173796172616b6174206d656e696b6d6174692070656e67616c616d616e206c65626968206261696b2064616c616d2064756e6961206469676974616c');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16744', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16745', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16746', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16747', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16748', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16749', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16843', 131072);
SELECT pg_catalog.lowrite(0, '\x4b6f6d707574657220416e6461206c656d6f743f2042616e79616b2070726f6772616d2079616e672068616e672061746175206e6f7420726573706f6e64696e673f204d756e676b696e206d656d6f7279206b6f6d707574657220416e646120737564616820746964616b206c616769206d656e756e6a616e67206b656275747568616e20416e64612e20536161746e7961206d656e616d626168206d656d6f7279206b6f6d707574657220416e6461212054656d756b616e206265726261676169206d65726b2064616e206a656e6973206d656d6f7279206b6f6d7075746572');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16844', 131072);
SELECT pg_catalog.lowrite(0, '\x4d6f6e69746f72206164616c616820616c617420756e74756b206d656e616d70696c6b616e2074616d70696c616e2070616461206b6f6d707574657220416e64612e204a656e6973206d6f6e69746f72206b6f6d7075746572207361617420696e69206164612062616e79616b2e204164612079616e67206d656e6767756e616b616e2070616e656c20544e2064616e204950532e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16845', 131072);
SELECT pg_catalog.lowrite(0, '\x54656d7061742070656e79696d70616e616e2f73746f72616765206469206b6f6d70757465722062657266756e67736920756e74756b206d656e79696d70616e206265726261676169206d6163616d2066696c6520416e64612c20736570657274692066696c6520646f6b756d656e2c206d7573696b2c20766964656f2c2070726f6772616d2c206d617570756e2067616d6573');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16846', 131072);
SELECT pg_catalog.lowrite(0, '\x53616d73756e67206265726b656d62616e67206d656e6a616469206b6f72706f72617369206b656c61732064756e69612064656e67616e206269736e69732079616e67206d656c69707574692074656b6e6f6c6f67692063616e676769682c2073656d696b6f6e64756b746f722c206b6f6e737472756b73692070656e63616b6172206c616e6769742064616e2070616272696b2c20706574726f6b696d69612c20627573616e612c206f6261742c206b6575616e67616e2c20686f74656c2c2064616e2062616e79616b206c6167692e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16847', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f676974656368206164616c616820736562756168207065727573616861616e2053776973732079616e6720626572666f6b7573207061646120696e6f766173692064616e206b75616c697461732c204c6f676974656368206d6572616e63616e6720706572616e676b6174207072696261646920756e74756b206d656d62616e7475206d6173796172616b6174206d656e696b6d6174692070656e67616c616d616e206c65626968206261696b2064616c616d2064756e6961206469676974616c');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16848', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16849', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16850', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16851', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16852', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16853', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16854', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16855', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16856', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16857', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16858', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16859', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16860', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16861', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16862', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16863', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16864', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16865', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16866', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16867', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16868', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16869', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16870', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16871', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16872', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16873', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16874', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16875', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16876', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16877', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16878', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16879', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16880', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16881', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16882', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16883', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16884', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16885', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16886', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16887', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16888', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16889', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16890', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16891', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16892', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16893', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16894', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16895', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16896', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e');
SELECT pg_catalog.lo_close(0);

COMMIT;

SET search_path = public, pg_catalog;

--
-- TOC entry 2013 (class 2606 OID 16759)
-- Name: master_brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY master_brand
    ADD CONSTRAINT master_brand_pkey PRIMARY KEY (id);


--
-- TOC entry 2015 (class 2606 OID 16767)
-- Name: master_kategori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY master_kategori
    ADD CONSTRAINT master_kategori_pkey PRIMARY KEY (id);


--
-- TOC entry 2017 (class 2606 OID 16776)
-- Name: master_produk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY master_produk
    ADD CONSTRAINT master_produk_pkey PRIMARY KEY (id);


--
-- TOC entry 2019 (class 2606 OID 16781)
-- Name: master_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY master_role
    ADD CONSTRAINT master_role_pkey PRIMARY KEY (id);


--
-- TOC entry 2021 (class 2606 OID 16789)
-- Name: master_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY master_user
    ADD CONSTRAINT master_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2023 (class 2606 OID 16797)
-- Name: transaksi_pemesanan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transaksi_pemesanan
    ADD CONSTRAINT transaksi_pemesanan_pkey PRIMARY KEY (id);


--
-- TOC entry 2025 (class 2606 OID 16805)
-- Name: transaksi_pengiriman_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transaksi_pengiriman
    ADD CONSTRAINT transaksi_pengiriman_pkey PRIMARY KEY (id);


--
-- TOC entry 2028 (class 2606 OID 16816)
-- Name: fk_65meel6173nv97ahp04fybf8q; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY master_user
    ADD CONSTRAINT fk_65meel6173nv97ahp04fybf8q FOREIGN KEY (role_id) REFERENCES master_role(id);


--
-- TOC entry 2027 (class 2606 OID 16811)
-- Name: fk_6do78km2mc3omsksq3bm7sk0e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY master_produk
    ADD CONSTRAINT fk_6do78km2mc3omsksq3bm7sk0e FOREIGN KEY (kategori_id) REFERENCES master_kategori(id);


--
-- TOC entry 2029 (class 2606 OID 16821)
-- Name: fk_ai08ob6vhg4j0odgibtfr9mq; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transaksi_pemesanan
    ADD CONSTRAINT fk_ai08ob6vhg4j0odgibtfr9mq FOREIGN KEY (produk_id) REFERENCES master_produk(id);


--
-- TOC entry 2031 (class 2606 OID 16831)
-- Name: fk_dkt6i9e4ddy1dqk5w5etf8r2m; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transaksi_pengiriman
    ADD CONSTRAINT fk_dkt6i9e4ddy1dqk5w5etf8r2m FOREIGN KEY (pemesanan_id) REFERENCES transaksi_pemesanan(id);


--
-- TOC entry 2032 (class 2606 OID 16836)
-- Name: fk_en2aluscjodspkiaxas1mk4qh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transaksi_pengiriman
    ADD CONSTRAINT fk_en2aluscjodspkiaxas1mk4qh FOREIGN KEY (user_id) REFERENCES master_user(id);


--
-- TOC entry 2026 (class 2606 OID 16806)
-- Name: fk_o49v03rl5kjapwm6olj61hp2i; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY master_produk
    ADD CONSTRAINT fk_o49v03rl5kjapwm6olj61hp2i FOREIGN KEY (brand_id) REFERENCES master_brand(id);


--
-- TOC entry 2030 (class 2606 OID 16826)
-- Name: fk_qo53s65gjfi5aqerfsr92fw57; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transaksi_pemesanan
    ADD CONSTRAINT fk_qo53s65gjfi5aqerfsr92fw57 FOREIGN KEY (user_id) REFERENCES master_user(id);


-- Completed on 2016-07-20 19:57:25

--
-- PostgreSQL database dump complete
--

