-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  planet_name TEXT NOT NULL PRIMARY KEY,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around_star TEXT NOT NULL,
  galaxy TEXT NOT NULL
);

INSERT INTO planets
  (planet_name, orbital_period_in_years, orbits_around_star, galaxy)
VALUES
  ('Earth', 1.00, 'The Sun', 'Milky Way'),
  ('Mars', 1.88, 'The Sun', 'Milky Way'),
  ('Venus', 0.62, 'The Sun', 'Milky Way'),
  ('Neptune', 164.8, 'The Sun', 'Milky Way'),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way'),
  ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way');

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  moon_name TEXT NOT NULL,
  orbits_around_planet TEXT NOT NULL,
  CONSTRAINT fk_orbits_around_planet FOREIGN KEY(orbits_around_planet) REFERENCES planets(planet_name)
);

INSERT INTO moons
  (moon_name, orbits_around_planet)
VALUES
  ('The Moon', 'Earth'),
  ('Phobos', 'Mars'),
  ('Deimos', 'Mars'),
  ('Naiad', 'Neptune'), 
  ('Thalassa', 'Neptune'), 
  ('Despina', 'Neptune'), 
  ('Galatea', 'Neptune'), 
  ('Larissa', 'Neptune'), 
  ('S/2004 N 1', 'Neptune'), 
  ('Proteus', 'Neptune'), 
  ('Triton', 'Neptune'), 
  ('Nereid', 'Neptune'), 
  ('Halimede', 'Neptune'), 
  ('Sao', 'Neptune'), 
  ('Laomedeia', 'Neptune'), 
  ('Psamathe', 'Neptune'), 
  ('Neso', 'Neptune')
  
