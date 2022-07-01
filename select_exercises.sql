USE albums_db;
SHOW tables;
SELECT * FROM albums;

/* How many rows are in the albums table?
	- 31
*/

SELECT DISTINCT artist
FROM albums;

/* How many unique artist names are on the albums table?
 	23
What is the primary key for the albums table?
	id
What is the oldest release date for any album
in the albums table?
	1967
What is the most recent release date?
	2011
*/

SELECT * FROM albums WHERE artist = 'Pink Floyd';

-- albums are 'The Dark Side of the Moon' and 'The Wall'

SELECT release_date FROM albums WHERE name = 'Sgt. Pepper''s Lonely Hearts Club Band';

SELECT genre FROM albums WHERE name = 'Nevermind';

SELECT * FROM albums WHERE release_date BETWEEN 1990 AND 1999;

SELECT * FROM albums WHERE sales < 20.0;

SELECT * FROM albums WHERE genre = 'Rock';
/* Hard Rock and Progressive Rock are not included because 
the = symbol looks for equivalent values. */




