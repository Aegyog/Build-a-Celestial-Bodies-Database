psql --username=freecodecamp --dbname=postgres

CREATE DATABASE universe;

\c universe;

CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL UNIQUE,
  age_in_millions_of_years INT,
  is_spherical BOOLEAN NOT NULL,
  description TEXT
);

INSERT INTO galaxy (name, age_in_millions_of_years, is_spherical, description) 
VALUES 
('Milky Way', 13000, TRUE, 'A barred spiral galaxy'),
('Andromeda', 10000, TRUE, 'A spiral galaxy located near the Milky Way'),
('Triangulum', 12000, TRUE, 'A small spiral galaxy'),
('Sombrero', 15000, TRUE, 'A spiral galaxy with a prominent dust lane'),
('Whirlpool', 9000, TRUE, 'A spiral galaxy known for its striking appearance');

CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL UNIQUE,
  galaxy_id INT REFERENCES galaxy(galaxy_id),
  size NUMERIC NOT NULL,
  has_planets BOOLEAN,
  age_in_millions_of_years INT
);

INSERT INTO star (name, galaxy_id, size, has_planets, age_in_millions_of_years)
VALUES 
('Sun', 1, 1.989 * 10^30, TRUE, 4600),
('Sirius', 1, 4.02 * 10^30, TRUE, 230),
('Alpha Centauri', 2, 2.18 * 10^30, FALSE, 5000),
('Betelgeuse', 3, 1.20 * 10^31, FALSE, 800),
('Rigel', 4, 3.75 * 10^31, TRUE, 7000);

CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL UNIQUE,
  star_id INT REFERENCES star(star_id),
  distance_from_sun NUMERIC,
  has_life BOOLEAN,
  size NUMERIC
);

INSERT INTO planet (name, star_id, distance_from_sun, has_life, size)
VALUES 
('Earth', 1, 149.6, TRUE, 1.0),
('Mars', 1, 227.9, FALSE, 0.532),
('Venus', 1, 108.2, FALSE, 0.95),
('Jupiter', 1, 778.3, FALSE, 318),
('Saturn', 1, 1427, FALSE, 95),
('Neptune', 1, 4495, FALSE, 17.2),
('Mercury', 1, 57.9, FALSE, 0.055),
('Uranus', 1, 2871, FALSE, 14.5),
('Gliese 581g', 3, 20.3, TRUE, 1.2),
('Kepler-22b', 2, 620, TRUE, 2.4),
('HD 40307g', 4, 40.5, TRUE, 1.8),
('Proxima Centauri b', 3, 0.048, TRUE, 1.3);

CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL UNIQUE,
  planet_id INT REFERENCES planet(planet_id),
  size NUMERIC,
  is_illuminated BOOLEAN
);

INSERT INTO moon (name, planet_id, size, is_illuminated)
VALUES 
('Moon', 1, 3.674, TRUE),
('Phobos', 2, 0.037, TRUE),
('Deimos', 2, 0.021, FALSE),
('Io', 3, 0.25, TRUE),
('Europa', 3, 0.24, TRUE),
('Titan', 4, 0.40, TRUE),
('Rhea', 4, 0.53, TRUE),
('Callisto', 3, 0.44, TRUE),
('Ganymede', 3, 0.52, TRUE),
('Triton', 6, 0.354, TRUE),
('Charon', 7, 0.17, TRUE),
('Mimas', 5, 0.04, FALSE),
('Enceladus', 5, 0.50, TRUE),
('Titania', 5, 0.80, FALSE),
('Oberon', 5, 0.76, TRUE),
('Umbriel', 5, 0.53, FALSE),
('Miranda', 5, 0.23, TRUE),
('Ariel', 5, 0.56, TRUE),
('Calypso', 4, 0.07, TRUE);
