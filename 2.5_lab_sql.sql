USE sakila;

-- Select all the actors with the first name Scarlett.
-- How many films (movies) are available for rent and how many films have been rented?
-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
-- What's the average movie duration expressed in format (hours, minutes)?
-- How many distinct (different) actors' last names are there?
-- Since how many days has the company been operating (check DATEDIFF() function)?
-- Show rental info with additional columns month and weekday. Get 20 results.
-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
-- Get release years.
-- Get all films with ARMAGEDDON in the title.
-- Get all films which title ends with APOLLO.
-- Get 10 the longest films.
-- How many films include Behind the Scenes content?


-- Select all the actors with the first name 'Scarlett'.


SELECT first_name
FROM actor
WHERE first_name = 'Scarlett'


-- 2-How many films (movies) are available for rent and how many films have been rented?


SELECT COUNT(rental_id) as available_for_rent
FROM rental
WHERE rental_date is NULL;

   --- 16044 movies are for rent.

SELECT count(inventory_id) as rented
FROM rental
where rental_date > 0;


-- 3-What are the shortest and longest movie duration? 
-- 3-Name the values max_duration and min_duration.

SELECT min(length)
FROM film
--- answer is 46 for the shortest film

SELECT max(length) as longest
FROM film;

--- answer is 185 for the longest.

-- 4-What's the average movie duration expressed in format(hours,minutes)?

SELECT sec_to_time(avg(length)*60) as 'hours and minutes'
FROM film;

      ---01:55:16.3200

-- 5-How many distinct (different) actors' last names are there?

SELECT count(distinct(last_name))FROM actor
-- There are 121

-- 6-Since how many days has the company been operating (check DATEDIFF() function)?

SELECT DATEDIFF(MAX(rental_date),MIN(rental_date))
FROM rental;
--- 266 days

-- 7- Show rental info with additional columns month and weekday. Get 20 results.

select* from rental 
limit 20

alter table rental
ADD column month INT NOT NULL;


alter table rental
ADD column weekday INT NOT NULL;


-- 8-Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
       
alter table rental
add column day_type INT NOT null;


insert into rental(day_type,weekday)
values ('weekend','workday');
---Still have to work on this one
       
-- 9-Get release years.

select (release_year) as years
FROM film
group by years

-- 10- Get all films with ARMAGEDDON in the title.
    
SELECT title,count(film_id) as number_of_films
FROM film 
Where title LIKE 'ARMAGEDDON%'
GROUP BY title
--- answer ARMAGEDDON LOST

-- 11- Get all films which title ends with APOLLO.
   
SELECT title
FROM film 
Where title LIKE '%LO';

 --SALUTE APOLLO
 --SCORPION APOLLO
 --TEEN APOLLO
 --WEDDING APOLLO
 --WILD APOLLO

-- 12- Get 10 the longest films.

SELECT length
FROM film
ORDER BY length DESC
LIMIT 10

-- 13- How many films include Behind the Scenes content?

SELECT title,special_features as special_feature
FROM film
WHERE special_features = 'Behind the Scenes'