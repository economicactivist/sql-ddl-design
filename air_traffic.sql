-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS passengers;
DROP TABLE IF EXISTS flights;

CREATE TABLE passengers (
    id SERIAL PRIMARY KEY,
    first_name text NOT NULL,
    last_name text NOT NULL
);


CREATE TABLE flights (
    id SERIAL PRIMARY KEY,
    departure timestamp without time zone NOT NULL,
    arrival timestamp without time zone NOT NULL,
    airline text NOT NULL,
    from_city text NOT NULL,
    from_country text NOT NULL,
    to_city text NOT NULL,
    to_country text NOT NULL
);

CREATE TABLE tickets (
    id SERIAL PRIMARY KEY,
    passenger_id int NOT NULL,
    flight_id int NOT NULL,
    CONSTRAINT flight_id  FOREIGN KEY (id) references flights(id) ON DELETE CASCADE,
    CONSTRAINT passenger_id FOREIGN KEY (id)  REFERENCES passengers(id) ON DELETE CASCADE,
    seat text NOT NULL
);



INSERT INTO passengers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Jennifer', 'Finch'),
  ('Waneta', 'Skeleton'),
  ('Thadeus', 'Gathercoal'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Berkie', 'Wycliff'),
  ('Cory', 'Squibbes');

INSERT INTO flights
  (departure, arrival, airline, from_city, from_country, to_city, to_country)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');

INSERT INTO tickets
  (passenger_id, flight_id, seat)
VALUES
  (1, 1,'33B'),
  (2, 2,'8A'),
  (3, 3,'12F'),
  (1, 4,'20A'),
  (4, 5,'23D'),
  (2, 6,'18C'),
  (5, 7,'9E'),
  (6, 8,'1A'),
  (5, 9,'32B'),
  (7, 10,'10D');