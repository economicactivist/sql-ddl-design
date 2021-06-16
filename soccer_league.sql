--psql < soccer_league.sql

DROP DATABASE IF EXISTS soccer_league;
CREATE DATABASE soccer_league;

\c soccer_league

-- Design a schema for a simple sports league. Your schema should keep track of

-- All of the teams in the league
-- All of the goals scored by every player for each game
-- All of the players in the league and their corresponding teams
-- All of the referees who have been part of each game
-- All of the matches played between teams
-- All of the start and end dates for season that a league has
-- The standings/rankings of each team in the league (This doesn’t have to be its own table if the data can be captured somehow).

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    team_name varchar(40) NOT NULL,
    ranking integer not null
);

CREATE TABLE player_info
(
    id SERIAL PRIMARY KEY,
    first_name varchar(40) NOT NULL,
    last_name varchar(60) NOT NULL,
    team_id INTEGER NOT NULL,
    goals_scored INTEGER DEFAULT 0 NOT NULL CHECK(goals_scored > -1),
    CONSTRAINT fk_team_id FOREIGN KEY(team_id) REFERENCES teams(id)
);

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    team_one_id INTEGER NOT NULL,
    team_two_id INTEGER NOT NULL CHECK(team_one_id <> team_two_id),
    match_date DATE NOT NULL,
    CONSTRAINT fk_team_one_id FOREIGN KEY(team_one_id) REFERENCES teams(id),
    CONSTRAINT fk_team_two_id FOREIGN KEY(team_two_id) REFERENCES teams(id)
);

CREATE TABLE leagues
(
    id SERIAL PRIMARY KEY,
    league_name varchar(40) NOT NULL,
    season_start DATE NOT NULL,
    season_end DATE NOT NULL CHECK(season_start < season_end)
)
