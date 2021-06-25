USE albums_db;

DESCRIBE albums; -- id is primary key 

SELECT name
FROM albums; -- 31 rows

SELECT DISTINCT NAME
FROM albums;

DESCRIBE albums;

SELECT DISTINCT artist
FROM albums; -- 23 unique artists

SELECT artist
FROM albums;

SELECT * FROM albums;

SELECT name, release_date
FROM albums
ORDER BY release_date ASC; -- 1967; 2011

SELECT NAME
FROM albums
WHERE artist = 'Pink Floyd'; -- The Dark Side of the Moon; The Wall

SELECT release_date
FROM albums
WHERE name = "Sgt. Pepper's Lonely Hearts Club Band"; -- 1967

SELECT genre
FROM albums
WHERE name = 'Nevermind'; -- Grunge, Alternative rock

SELECT name , release_date
FROM albums
WHERE release_date BETWEEN 1990 and 1999; -- 11 albums were released in the 90s
FROM albums
WHERE sales < 20; -- 13 Albums had sales less than $20M

SELECT genre
FROM albums; -- "Rock" genre is not combined with "Hard rock" or "Progressive rock" in the genre column 