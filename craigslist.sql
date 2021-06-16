--psql < craigslist.sql

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

-- Part Two: Craigslist
-- Design a schema for Craigslist! Your schema should keep track of the following

-- The region of the craigslist post (San Francisco, Atlanta, Seattle, etc)
-- Users and preferred region
-- Posts: contains title, text, the user who has posted, the location of the posting, the region of the posting
-- Categories that each post belongs to

CREATE TABLE regions 
(
    id SERIAL PRIMARY KEY,
    region varchar(25) NOT NULL
);

CREATE TABLE locations 
(
    id SERIAL PRIMARY KEY,
    location varchar(50) NOT NULL
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY, 
    username varchar(30) NOT NULL,
    preferred_region varchar(25),
    preferred_region_id INTEGER,
    constraint fk_preferred_region_id FOREIGN KEY(preferred_region_id) REFERENCES regions(id)
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY, 
    title varchar(80) NOT NULL,
    text_field TEXT NOT NULL, 
    user_id INTEGER NOT NULL,
    location_field varchar(50) NOT NULL,
    location_field_id INTEGER NOT NULL,
    region_id INTEGER NOT NULL,
    constraint fk_user_id FOREIGN KEY(user_id) REFERENCES users(id),
    constraint fk_region_id FOREIGN KEY(region_id) REFERENCES regions(id),
    constraint fk_location_field_id FOREIGN KEY(location_field_id) REFERENCES locations(id)
);
