CREATE TABLE restaurant (
  id serial PRIMARY KEY,
  name varchar,
  distance_in_miles integer DEFAULT 0 CHECK (distance_in_miles >= 0),
  stars integer,
  food_category varchar,
  favorite_dish varchar,
  does_takeout varchar,
  last_time_ate_there date
);

insert into restaurant
  (id, name, distance_in_miles, stars, food_category, favorite_dish, does_takeout, last_time_ate_there) values
  (default, 'Bubba Gump', 3, 4,'seafood', 'gumbo', 'yes', '2016-09-28'),
  (default, 'Hooters', 1, 2,'american', 'hot wings', 'no', '2016-09-23'),
  (default, 'Sushi_Stop', 5, 3, 'seafood', 'Eel rolls', 'no', '2016-08-11'),
  (default, 'True Kitchen', 10, 5, 'american', 'soup', 'no', '2016-06-14'),
  (default, 'Pizza Hut', 2, 3, 'pizza', 'pepperoini pizza', 'yes', '2016-09-20'),
  (default, 'Natalie Thai', 4, 5, 'Thai', 'Pad Thai', 'yes', '2016-07-18');

  select name from restaurant where stars = 5;
  select favorite_dish from restaurant where stars = 5;
  select id from restaurant where name = 'True Kitchen';
  select name from restaurant where food_category = 'american';
  select name from restaurant where does_takeout = 'yes';
  --you can also use True and False for does_takeout
  select name from restaurant where does_takeout = 'yes' and food_category = 'american';
  select name from restaurant where distance_in_miles < 2;
  select name from restaurant where last_time_ate_there >= '2016-8-5';
  --you can use last_time_ate_there >= current_date - interval '2 weeks' or '23 hours' etc as well



  select * from restaurant order by distance_in_miles;
  select * from restaurant order by distance_in_miles limit 2;
  select * from restaurant order by stars limit 2;
  select * from restaurant where distance_in_miles < 2 order by stars desc limit 2;
  select count(*) from restaurant;
  select food_category, count(*) from restaurant group by food_category;
  select round(avg(stars), 2), food_category from restaurant group by food_category;
  select max(stars), food_category from restaurant group by food_category;


--\c restaurant_db (to connect to database)
--\d restaurant (to see table)
--SELECT * from restaurant; (to see updated table)
--drop table TABLENAME;
