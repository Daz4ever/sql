
CREATE TABLE track (
  id serial PRIMARY KEY,
  name varchar,
  duration integer NOT NULL,
  album_id integer NOT NULL REFERENCES album (id), -- move to track
  song_id integer REFERENCES song(id) NOT NULL

);

CREATE TABLE songwriter (
  id serial PRIMARY KEY,
  name varchar
);

CREATE TABLE song (
  id serial PRIMARY KEY,
  name varchar,
  songwriter_id integer REFERENCES songwriter (id) NOT NULL
);


CREATE TABLE artist (
  id serial PRIMARY KEY,
  name varchar
);


CREATE TABLE plays (
  id serial PRIMARY KEY,
  instrument_id integer NOT NULL REFERENCES instrument (id), -- move to track
  artist_id integer REFERENCES artist (id) NOT NULL
);

CREATE TABLE instrument (
  id serial PRIMARY KEY,
  instrument varchar
);



CREATE TABLE album (
  id serial PRIMARY KEY,
  name varchar,
  produced_by varchar,
  release_date date,
  lead_artist_id integer NOT NULL REFERENCES artist (id),
);

CREATE TABLE participation (
  id serial PRIMARY KEY,
  album_id integer NOT NULL REFERENCES album (id), -- move to track
  artist_id integer REFERENCES artist (id) NOT NULL
);


--Queries:
select track.name, album.name from track inner join album on track.album_id = album.id where album.name = 'Are You Experienced?';

select instrument.instrument, artist.name from plays inner join instrument on plays.instrument_id = instrument.id inner join artist on plays.artist_id = artist.id order by artist.name;

select max(duration), song.name from track inner join song on track.song_id = song.id group by song.name;

select album.name, album.release_date from album where album.release_date < '2000-12-31' order by album.release_date;

select artist.name, count(album.name) from artist inner join participation on participation.artist_id = artist.id inner join album on participation.album_id = album.id where album.release_date < '1999-12-31'and album.release_date > '1990-01-01' group by artist.name;

select sum(track.duration), album.name from track inner join album on track.album_id = album.id group by album.name;

select track.name, artist.name from artist inner join album on album.lead_artist = artist.id inner join track on track.album_id = album.id order by artist.name




-- CREATE TABLE recordings (
--   id serial PRIMARY KEY,
--   produced_by varchar NOT NULL,
--   lead_artist integer NOT NULL REFERENCES artist (id) UNIQUE,
--   artist_id integer NOT NULL REFERENCES artist (id),--drop
--   songwriter_id integer REFERENCES songwriter (id) NOT NULL, --drop
--   instrument_id integer REFERENCES instrument (id),
--   track_id integer NOT NULL REFERENCES track (id) UNIQUE,
--   song_id integer NOT NULL REFERENCES song (id),
--   album_id integer NOT NULL UNIQUE REFERENCES album (id)
-- );
