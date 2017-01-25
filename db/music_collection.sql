DROP TABLE IF EXISTS artists CASCADE;
DROP TABLE IF EXISTS albums CASCADE;

CREATE TABLE artists (
  id serial4 primary key,
  name varchar(255)
);

CREATE TABLE albums (
  id serial4 primary key,
  title varchar(255),
  genre varchar(255),
  artist_id INT4 references artists(id)
);
