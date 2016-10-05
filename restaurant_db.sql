CREATE TABLE restaurant (
  id serial PRIMARY KEY,
  name varchar,
  distance_in_miles integer,
  stars integer,
  food_category varchar,
  favorite_dish varchar,
  does_takeout varchar,
  last_time_ate_there date
);

insert into restaurant values
  (name, distance_in_miles, stars, food_category, favorite_dish, does_takeout, last_time_ate_there) values
  ('Bubba Gump', '3', '4','seafood', 'gumbo', 'yes', '2016-09-28'),
  ('Hooters', '1', '2','american', 'hot wings', 'no', '2016-09-23'),
  ('Sushi_Stop', '5', '3' "seafood", 'Eel rolls' 'no' '2016-08-11'),

--\c restaurant_db (to connect to database)
--\d restaurant (to see table)
--select * from restaurant (to see updated table)
--drop table TABLENAME;
