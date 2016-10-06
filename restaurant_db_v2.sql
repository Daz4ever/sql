--list the reviews for a given restaurant(filter by name or id)
select * from review where restaurant_id = 6;

--list the reviews for a given reviewer (filter by his/her name or id)

select * from review where reviewer_id = 1;

--list each review along with the restaurant they were written for. Select just the restaurant name and the review text

select
    *
from
  review
inner join restaurant
on review.restaurant_id =
restaurant.id
where
  restaurant.name = 'Natalie Thai';






select
    *
from
    review,
    restaurant
where
    review.restaurant_id =
    restaurant.id and restaurant.name = 'Natalie Thai';


select
    *
from
    review
inner join restaurant
    on review.restaurant_id = restaurant.id
where
    restaurant.name = 'Natalie Thai';

;


--get the average stars by restaurant. (restaurant name, average star rating)

select
    avg(review.stars),
    restaurant.name
from
review
inner join restaurant
on review.restaurant_id =
restaurant.id group by
restaurant.name;

--get the number of reviews written for each restaurant. Select the restaurant name and the review count

select
  count(*),
  restaurant.name
  from
  review
  inner join restaurant
  on review.restaurant_id =
  restaurant.id group by
  restaurant.name;



--list each review along with the restaurant and the reviewer's name. Select the restaurant name, the review text, and the reviewers name

select
    restaurant.name,
    review.review,
    reviewer.name
from
    restaurant, review, reviewer
where
    review.restaurant_id = restaurant.id and review.reviewer_id = reviewer.id;
