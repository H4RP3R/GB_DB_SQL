USE lesson_2;

-- 1
RENAME TABLE movies TO cinema;

-- 2
ALTER TABLE cinema
ADD COLUMN status_active BIT DEFAULT b'1',
    ADD COLUMN genre_id BIGINT UNSIGNED
AFTER title_eng;

-- 3
ALTER TABLE cinema DROP COLUMN status_active;

-- 4
DROP TABLE actors;

-- 5
ALTER TABLE cinema
ADD CONSTRAINT cin_gen_id 
FOREIGN KEY (genre_id) REFERENCES genres(id)
ON UPDATE CASCADE ON DELETE SET NULL;

-- 6
-- DELETE FROM genres;
-- ALTER TABLE genres AUTO_INCREMENT = 1;
ALTER TABLE cinema
DROP FOREIGN KEY cin_gen_id;

TRUNCATE TABLE genres; 