--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-01-26 00:46:50

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
-- TOC entry 830 (class 1247 OID 24577)
-- Name: roluri; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.roluri AS ENUM (
    'neinregistrat',
    'moderator',
    'inregistrat'
);


ALTER TYPE public.roluri OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 24658)
-- Name: accesari; Type: TABLE; Schema: public; Owner: postgres
--

--
-- TOC entry 210 (class 1259 OID 16412)
-- Name: Produs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.Produs (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(400),
    price numeric NOT NULL,
    imag character varying,
    category character varying,
    size character varying,
    stock integer,
    added_on date,
    color character varying,
    materials character varying[],
    is_imported boolean DEFAULT false NOT NULL,
    sold numeric DEFAULT 0
);


ALTER TABLE public.Produs OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16411)
-- Name: produse_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.Produs ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.produse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 212 (class 1259 OID 24643)
-- Name: utilizator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilizator (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    nume character varying(100) NOT NULL,
    prenume character varying(100) NOT NULL,
    parola character varying(500) NOT NULL,
    rol public.roluri DEFAULT 'comun'::public.roluri NOT NULL,
    email character varying(100) NOT NULL,
    culoare_chat character varying(50) DEFAULT 'black'::character varying NOT NULL,
    data_adaugare timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    cod character varying(200),
    confirmat_mail boolean DEFAULT false,
    tema_site character varying(50),
    imagine character varying(50),
    ip character varying(100) NOT NULL,
);


ALTER TABLE public.utilizator OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 24642)
-- Name: utilizatori_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utilizatori_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utilizatori_id_seq OWNER TO postgres;

--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 211
-- Name: utilizatori_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utilizatori_id_seq OWNED BY public.utilizator.id;


--
-- TOC entry 3183 (class 2604 OID 24661)
-- Name: accesari id; Type: DEFAULT; Schema: public; Owner: postgres
--

--
-- TOC entry 3178 (class 2604 OID 24646)
-- Name: utilizator id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilizator ALTER COLUMN id SET DEFAULT nextval('public.utilizatori_id_seq'::regclass);


--
-- TOC entry 3338 (class 0 OID 24658)
-- Dependencies: 214
-- Data for Name: accesari; Type: TABLE DATA; Schema: public; Owner: postgres
--


--
-- TOC entry 3334 (class 0 OID 16412)
-- Dependencies: 210
-- Data for Name: Produs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.Produs (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (10, 'Fular in carouri', 'Fular in carouri rosu si negru', 80, 'fular_carouri.jpg', '{Accesorii}', 'S', 250, '2021-12-19', 'Rosu si negru', '{Bumbac}', false);
INSERT INTO public.Produs (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (17, 'Rochie Model Floral', 'Rochie cu model floral pentru femei', 240, 'rochie.jpg', '{Rochii}', 'M', 1110, '2021-11-19', 'Alb', '{In}', false);
INSERT INTO public.Produs (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (18, 'Fular', 'Fular albastru pentru femei', 100, 'fular.jpg', '{Accesorii}', 'M', 200, '2021-10-19', 'Albastru', '{Lana}', false);
INSERT INTO public.Produs (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (19, 'Rochie', 'Rochie pentru femei', 220, 'rochie2.jpg', '{Rochii}', 'S', 2021, '2021-11-19', 'Alb', '{In}', false);
INSERT INTO public.Produs (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (6, 'Tricou', 'Tricou cu maneca scurta alb pentru femei', 210, 'tricou_alb.jpg', '{"Tricouri si Maieuri"}', 'M', 200, '2021-12-19', 'Alb', '{Bumbac}', false);
INSERT INTO public.Produs (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (7, 'Pulover', 'Pulover maro de vara pentru femei', 210, 'pulover.jpg', '{"Bluze si Pulovere"}', 'M', 200, '2021-12-13', 'Maro', '{"Fibra sintetica"}', false);
INSERT INTO public.Produs (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (9, 'Pulover Turtle-neck', 'Pulover maro tip turtle-neck', 110, 'pulover_maro.jpg', '{"Bluze si Pulovere"}', 'S', 300, '2021-12-16', 'Maro', '{Bumbac}', false);
INSERT INTO public.Produs (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (11, 'Geaca Denim', 'Geaca Denim albastra pentru femei', 180, 'geaca_blugi.jpg', '{"Hanorace si Geci"}', 'L', 320, '2021-12-19', 'Albastru', '{Denim}', false);
INSERT INTO public.Produs (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (12, 'Pulover Split-color', 'Pulover in 2 culori pentru femei', 120, 'pulover_multicolor.jpg', '{"Bluze si Pulovere"}', 'S', 360, '2021-10-19', 'Roz si Grena', '{Bumbac}', false);
INSERT INTO public.Produs (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (13, 'Palton', 'Palton rosu aprins pentru femei', 450, 'palton.jpg', '{"Hanorace si Geci"}', 'L', 125, '2021-12-19', 'Rosu', '{"Piele intoarsa",Piele}', false);
INSERT INTO public.Produs (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (14, 'Palton', 'Palton pentru femei', 180, 'palton2.jpg', '{"Hanorace si Geci"}', 'M', 2000, '2021-12-19', 'Gri', '{Lana}', false);
INSERT INTO public.Produs (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (15, 'Hanorac', 'Hanorac roz pentru femei', 150, 'hanorac.jpg', '{"Hanorace si Geci"}', 'S', 2500, '2021-12-19', 'Roz', '{Bumbac}', false);
INSERT INTO public.Produs (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (16, 'Pulover', 'Pulover verde pentru femei', 220, 'pulover2.jpg', '{"Bluze si Pulovere"}', 'M', 2020, '2021-12-20', 'Verde', '{Tricot}', false);
INSERT INTO public.Produs (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (2, 'Sapca', 'Sapca roz pentru femei', 60, 'sapca_roz.jpg', '{Accesorii}', 'M', 30, '2021-12-19', 'Roz', '{Textil}', false);
INSERT INTO public.Produs (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (3, 'Jeans Rupti', 'Jeans rupti in genunchi pentru femei', 210, 'jeans_rupti_femei.jpg', '{Pantaloni}', 'M', 200, '2021-12-19', 'Albastru', '{Denim}', false);
INSERT INTO public.Produs (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (4, 'Jeans', 'Jeans pentru femei', 200, 'jeans_rupti_femei2.jpg', '{Pantaloni}', 'M', 200, '2021-12-19', 'Albastru', '{Denim}', false);
INSERT INTO public.Produs (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (5, 'Jeans', 'Jeans albastru deschis pentru femei', 210, 'jeans_deschisi.jpg', '{Pantaloni}', 'M', 200, '2021-12-19', 'Albastru Deschis', '{Denim}', false);
INSERT INTO public.Produs (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) OVERRIDING SYSTEM VALUE VALUES (1, 'Hanorac NULL', 'Hanorac de barbati cu logo-ul NULL, 80% cotton', 120, 'hanorac_roz.jpg', '{"Hanorace si Geci"}', 'M', 100, '2021-12-19', 'Roz', '{cotton,textil}', true);


--
-- TOC entry 3336 (class 0 OID 24643)
-- Dependencies: 212
-- Data for Name: utilizator; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.utilizator (id, username, nume, prenume, parola, rol, email, culoare_chat, data_adaugare, cod, confirmat_mail, tema_site, imagine) VALUES (11, 'test1', 'Gogulescu', 'Gogu', 'f76600d797437b3476a39638c3dc8c1e4384bd214f2736fda82f82a2d7cd5a32', 'comun', 'profprofprof007@gmail.com', 'black', '2022-01-25 17:30:56.636449', '1643124656634nHnmlWlSujAXh1d4qbZnvXNMZDkvR9KAhSyX9L9SnjE7', true, NULL, './poze_uploadate/test1/poza');
INSERT INTO public.utilizator (id, username, nume, prenume, parola, rol, email, culoare_chat, data_adaugare, cod, confirmat_mail, tema_site, imagine) VALUES (12, 'test2', 'Gogulescu', 'Gogu', 'f76600d797437b3476a39638c3dc8c1e4384bd214f2736fda82f82a2d7cd5a32', 'comun', 'profprofprof007@gmail.com', 'black', '2022-01-25 17:33:17.349393', '1643124797348eJUkdwE3dOeFCxN2TFNJcP75HrxpIuHj9FyFY6nPIO6AEwPkQlW', true, NULL, './Resources/poze_uploadate/test2/poza.jpg');
INSERT INTO public.utilizator (id, username, nume, prenume, parola, rol, email, culoare_chat, data_adaugare, cod, confirmat_mail, tema_site, imagine) VALUES (3, 'prof50771', 'Gogulescu', 'Gogu', 'f76600d797437b3476a39638c3dc8c1e4384bd214f2736fda82f82a2d7cd5a32', 'comun', 'stefan.ivan334@gmail.com', 'black', '2022-01-24 03:19:25.335998', '1642987165334uGKgZn8ei39AoWbSrEr24AbiulnwmXgTuaNGz8K5hiAKIBkWSO0', true, NULL, NULL);
INSERT INTO public.utilizator (id, username, nume, prenume, parola, rol, email, culoare_chat, data_adaugare, cod, confirmat_mail, tema_site, imagine) VALUES (5, 'prof13749', 'Gogulescu', 'Gogu', 'f76600d797437b3476a39638c3dc8c1e4384bd214f2736fda82f82a2d7cd5a32', 'comun', 'cora02022003@gmail.com', 'black', '2022-01-24 03:25:32.590852', '1642987532589Hstaso5vKI113DhVPM7cNgthnVO4SRK6reFC4lqT2yAG', false, NULL, NULL);
INSERT INTO public.utilizator (id, username, nume, prenume, parola, rol, email, culoare_chat, data_adaugare, cod, confirmat_mail, tema_site, imagine) VALUES (6, 'prof57672', 'Gogulescu', 'Gogu', '95e66894cc269db7d5839db351a6d063c3367078cd82614999941bb34539db7f', 'comun', 'stefan.ivan334@gmail.com', 'blue', '2022-01-24 13:05:45.467949', '1643022345467CNTs0p8KI7LgrQCiiA2pFp6S3rlcYoRtV7YFOunqhzi', true, NULL, NULL);
INSERT INTO public.utilizator (id, username, nume, prenume, parola, rol, email, culoare_chat, data_adaugare, cod, confirmat_mail, tema_site, imagine) VALUES (7, '444', 'Stefan', 'Ivan', '9ab1002d236723fbbb741e5edec989b9c3d2145edd30d66817dd8de2fec60d5b', 'admin', 'profprofprof007@gmail.com', 'black', '2022-01-24 13:08:25.991418', '1643022505990cskZz7g6U1T1GhOlTSHdENnVsV2bVGz1hNf64iMtSn0', true, NULL, NULL);
INSERT INTO public.utilizator (id, username, nume, prenume, parola, rol, email, culoare_chat, data_adaugare, cod, confirmat_mail, tema_site, imagine) VALUES (8, 'stefan334', 'Ivan', 'Stefan-Alexandru', 'f76600d797437b3476a39638c3dc8c1e4384bd214f2736fda82f82a2d7cd5a32', 'admin', 'stefan.ivan334@gmail.com', 'black', '2022-01-24 13:11:35.955017', '1643022695954PQHIrBqazc0Jp00h0w8kqOzTfca7LpEiNuBaJ9BIZHe3GVWOBy4', true, NULL, './Resources/poze_uploadate/stefan334/poza.jpg');
INSERT INTO public.utilizator (id, username, nume, prenume, parola, rol, email, culoare_chat, data_adaugare, cod, confirmat_mail, tema_site, imagine) VALUES (13, 'admin', 'Admin', 'Admin', 'f76600d797437b3476a39638c3dc8c1e4384bd214f2736fda82f82a2d7cd5a32', 'comun', 'stefan.ivan334@gmail.com', 'black', '2022-01-25 20:26:30.185136', '1643135190183U8W7wBLmJqJ9cvGVoG8RvFDtM4sgNaCmiHCbDBAwKE', false, NULL, './poze_uploadate/admin/poza.jpg');
INSERT INTO public.utilizator (id, username, nume, prenume, parola, rol, email, culoare_chat, data_adaugare, cod, confirmat_mail, tema_site, imagine) VALUES (14, 'admin1', 'ADMIN', 'Admin', 'f76600d797437b3476a39638c3dc8c1e4384bd214f2736fda82f82a2d7cd5a32', 'comun', 'stefan.ivan334@gmail.com', 'black', '2022-01-25 20:28:17.725804', '164313529772419XWpKwjPzerUK6jFW6CNT1AJWLQnJtachfsmlnBfmNsgeDBsBh', false, NULL, './poze_uploadate/admin1/poza.jpg');
INSERT INTO public.utilizator (id, username, nume, prenume, parola, rol, email, culoare_chat, data_adaugare, cod, confirmat_mail, tema_site, imagine) VALUES (1, 'prof13223', 'Gogulescu', 'Gogu', '87872cf52f05d9261c645b6460316a74da1e03e773fbefd36ea1a21804fa8dc9', 'comun', 'stefan.ivan334@gmail.com', 'black', '2022-01-24 03:05:08.387532', 'lUilnuXHJp0t8BEdkjzJn7y2SmKg50a5dQx8uR15jRggl7g9sfb1ITAaxVwRohEC0aEIGKeRjQy4kA6AgMYsr7IlfK7IKQRMkT5s', true, NULL, NULL);
INSERT INTO public.utilizator (id, username, nume, prenume, parola, rol, email, culoare_chat, data_adaugare, cod, confirmat_mail, tema_site, imagine) VALUES (9, 'theo', 'Georgescu', 'Theodora', 'f76600d797437b3476a39638c3dc8c1e4384bd214f2736fda82f82a2d7cd5a32', 'comun', 'theogeorg@gmail.com', 'black', '2022-01-25 17:22:22.390365', '1643124142389kYfLolb17K4j8h9XYSeSxz0e2AMKZvuYjW609ECmmHeYoNzc1Q', true, NULL, NULL);
INSERT INTO public.utilizator (id, username, nume, prenume, parola, rol, email, culoare_chat, data_adaugare, cod, confirmat_mail, tema_site, imagine) VALUES (10, 'theutzzz', 'Georgescu', 'Theo', 'f76600d797437b3476a39638c3dc8c1e4384bd214f2736fda82f82a2d7cd5a32', 'comun', 'theodorageorg@gmail.com', 'black', '2022-01-25 17:25:41.080717', '1643124341079DNPhvhCH9U2NVF4NwRgPRJ2NZQfoySxNbe86T68ugDZx3ZwLbU', true, NULL, NULL);
INSERT INTO public.utilizator (id, username, nume, prenume, parola, rol, email, culoare_chat, data_adaugare, cod, confirmat_mail, tema_site, imagine) VALUES (15, 'admin2', 'Admin', 'Goguleanu', 'f76600d797437b3476a39638c3dc8c1e4384bd214f2736fda82f82a2d7cd5a32', 'comun', 'stefan.ivan334@gmail.com', 'black', '2022-01-25 20:29:12.363047', '1643135352361xeL2UnFECwSVbOLVkxjGr66iDWEvj00Ei9l5qGG6Qmb9D', true, NULL, '/Resources/poze_uploadate/admin2/poza.jpg');


--
-- TOC entry 3352 (class 0 OID 0)
-- Dependencies: 213
-- Name: accesari_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--



--
-- TOC entry 3353 (class 0 OID 0)
-- Dependencies: 209
-- Name: produse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produse_id_seq', 19, true);


--
-- TOC entry 3354 (class 0 OID 0)
-- Dependencies: 211
-- Name: utilizatori_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilizatori_id_seq', 15, true);



--
-- TOC entry 3186 (class 2606 OID 16419)
-- Name: Produs produse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.Produs
    ADD CONSTRAINT produse_pkey PRIMARY KEY (id);


--
-- TOC entry 3188 (class 2606 OID 24654)
-- Name: utilizator utilizatori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilizator
    ADD CONSTRAINT utilizatori_pkey PRIMARY KEY (id);


--
-- TOC entry 3190 (class 2606 OID 24656)
-- Name: utilizator utilizatori_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilizator
    ADD CONSTRAINT utilizatori_username_key UNIQUE (username);





--
-- TOC entry 3347 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE Produs; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.Produs TO ivan;
GRANT ALL ON TABLE public.Produs TO ivan334;


--
-- TOC entry 3348 (class 0 OID 0)
-- Dependencies: 209
-- Name: SEQUENCE produse_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.produse_id_seq TO ivan;
GRANT ALL ON SEQUENCE public.produse_id_seq TO ivan334;


--
-- TOC entry 3349 (class 0 OID 0)
-- Dependencies: 212
-- Name: TABLE utilizator; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.utilizator TO ivan;
GRANT ALL ON TABLE public.utilizator TO ivan334;


--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 211
-- Name: SEQUENCE utilizatori_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.utilizatori_id_seq TO ivan334;


-- Completed on 2022-01-26 00:46:50

--
-- PostgreSQL database dump complete
--

