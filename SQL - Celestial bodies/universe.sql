--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: discovery; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.discovery (
    discovery_id integer NOT NULL,
    name character varying(60) NOT NULL,
    founded_in integer
);


ALTER TABLE public.discovery OWNER TO freecodecamp;

--
-- Name: discovery_discovery_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.discovery_discovery_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discovery_discovery_id_seq OWNER TO freecodecamp;

--
-- Name: discovery_discovery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.discovery_discovery_id_seq OWNED BY public.discovery.discovery_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    diameter_in_ly integer,
    distance_in_ly integer,
    discovery_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    has_water boolean,
    planet_id integer,
    mean_radius_km numeric(7,2)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    age_in_million_years integer,
    surface_gravity numeric(4,2),
    has_life boolean,
    number_of_moons integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(60) NOT NULL,
    galaxy_id integer,
    distance_in_ly numeric(4,2),
    stellar_type character varying(20),
    star_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: discovery discovery_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discovery ALTER COLUMN discovery_id SET DEFAULT nextval('public.discovery_discovery_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: discovery; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.discovery VALUES (1, 'Naked Eye', NULL);
INSERT INTO public.discovery VALUES (2, 'Hubble Telescope', 1990);
INSERT INTO public.discovery VALUES (3, 'Kepler Telescope', 2009);
INSERT INTO public.discovery VALUES (4, 'Galileo telescope', 1609);
INSERT INTO public.discovery VALUES (5, 'X-Ray telescope', 1978);
INSERT INTO public.discovery VALUES (6, 'telescope with CCD Cameras', 1976);
INSERT INTO public.discovery VALUES (7, 'Spitzer Space telescope', 2003);
INSERT INTO public.discovery VALUES (8, '3 foot telescope', 1608);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Contains our Solar System and hence Earth', 100000, 0, 4);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Similar to the appearance of Andromeda constellation', 220000, 2500000, 2);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Similar in appearance to whirlpool', 60000, 30000000, 3);
INSERT INTO public.galaxy VALUES (3, 'Tadpole', 'Gets its name because of its resemblance to a tadpole', 280000, 420000000, 6);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Similar to the appearance of sombrero', 50000, 29350000, 7);
INSERT INTO public.galaxy VALUES (5, 'LMC', 'Named after Ferdinand Magellan', 14000, 158000, 8);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, 1, 1737.40);
INSERT INTO public.moon VALUES (2, 'Phobos', true, 4, 11.27);
INSERT INTO public.moon VALUES (3, 'Deimos', true, 4, 6.20);
INSERT INTO public.moon VALUES (4, 'Io', false, 5, 1821.60);
INSERT INTO public.moon VALUES (5, 'Europa', true, 4, 1560.80);
INSERT INTO public.moon VALUES (6, 'Mimas', true, 6, 198.20);
INSERT INTO public.moon VALUES (7, 'Titan', true, 6, 2574.73);
INSERT INTO public.moon VALUES (8, 'Rhea', true, 6, 763.80);
INSERT INTO public.moon VALUES (9, 'Ganymede', true, 5, 2634.10);
INSERT INTO public.moon VALUES (10, 'Phoebe', false, 6, 106.50);
INSERT INTO public.moon VALUES (11, 'Ariel', true, 7, 578.90);
INSERT INTO public.moon VALUES (12, 'Umbriel', true, 7, 584.70);
INSERT INTO public.moon VALUES (13, 'Titania', true, 7, 788.90);
INSERT INTO public.moon VALUES (14, 'Oberon', true, 7, 761.40);
INSERT INTO public.moon VALUES (15, 'Miranda', true, 7, 235.80);
INSERT INTO public.moon VALUES (16, 'Triton', true, 8, 1353.40);
INSERT INTO public.moon VALUES (17, 'Charon', true, 9, 606.00);
INSERT INTO public.moon VALUES (18, 'Namaka', true, 12, 85.00);
INSERT INTO public.moon VALUES (19, 'Dysnomia', true, 10, 350.00);
INSERT INTO public.moon VALUES (20, 'S/2015(136472', true, 11, 87.50);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4500, 9.80, true, 1, 3);
INSERT INTO public.planet VALUES (2, 'Mercury', 4503, 3.70, false, 0, 3);
INSERT INTO public.planet VALUES (3, 'Venus', 4503, 8.87, false, 0, 3);
INSERT INTO public.planet VALUES (4, 'Mars', 4603, 3.72, false, 2, 3);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4603, 24.79, false, 80, 3);
INSERT INTO public.planet VALUES (8, 'Neptune', 4503, 11.15, false, 14, 3);
INSERT INTO public.planet VALUES (9, 'Pluto', 4500, 0.62, false, 5, 3);
INSERT INTO public.planet VALUES (6, 'Saturn', 4503, 10.44, false, 83, 3);
INSERT INTO public.planet VALUES (7, 'Uranus', 4503, 8.87, false, 27, 3);
INSERT INTO public.planet VALUES (10, 'Eris', 4503, 0.82, false, 1, 3);
INSERT INTO public.planet VALUES (11, 'Makemake', 4503, 0.50, false, 1, 3);
INSERT INTO public.planet VALUES (12, 'Haumea', 4503, 0.40, false, 2, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sirius', 1, 8.58, 'A,D', 1);
INSERT INTO public.star VALUES ('Gliese 876', 1, 15.34, 'M', 2);
INSERT INTO public.star VALUES ('Sun', 1, 0.00, 'G', 3);
INSERT INTO public.star VALUES ('Proxima Centauri', 1, 4.24, 'M', 5);
INSERT INTO public.star VALUES ('Alpha Centauri', 1, 4.37, 'M,G,K', 4);
INSERT INTO public.star VALUES ('Epsilon Eridani', 1, 10.52, 'K', 6);


--
-- Name: discovery_discovery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.discovery_discovery_id_seq', 8, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: discovery discovery_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discovery
    ADD CONSTRAINT discovery_name_key UNIQUE (name);


--
-- Name: discovery discovery_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discovery
    ADD CONSTRAINT discovery_pkey PRIMARY KEY (discovery_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_discovery_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_discovery_id_fkey FOREIGN KEY (discovery_id) REFERENCES public.discovery(discovery_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

