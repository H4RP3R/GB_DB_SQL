DROP DATABASE IF EXISTS lesson_2;

CREATE DATABASE lesson_2;

USE lesson_2;

DROP TABLE IF EXISTS movies;

CREATE TABLE movies (
    -- id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    title_eng VARCHAR(50),
    year_movie DATE NOT NULL,
    count_min INT UNSIGNED,
    storyline TEXT
);

DESCRIBE movies;