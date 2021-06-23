USE albums_db;

describe albums;

select * from albums;

## 31 rows

SELECT DISTINCT artist from `albums`;
## 23 distinct

SHOW KEYS FROM albums WHERE Key_name = 'PRIMARY';

select * from albums;

SELECT NAME, MIN(release_date) As 'Oldest Release Date'
FROM `albums`
Group by NAME;

## group by oldest release date and name

select * from albums;

SELECT DISTINCT 'Pink Floyd', name FROM albums;
## all albums

select * from albums;

SELECT DISTINCT name, release_date From albums;
## shows the year

select * from albums;


Select * from `albums` where name = 'Nevermind';
## grunge, alternative rock

select * from albums;

select * from albums where release_date between 1990 and 1999;
## release date 
select * from albums;

select * from albums where sales < 20;
# less then 20 mil

## All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
## looking for a particular string



