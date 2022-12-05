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


-- How many films (movies) are available for rent and how many films have been rented?


SELECT COUNT(*) FROM rental;
SELECT count(*)  FROM film;

-- What are the shortest and longest movie duration? 
-- Name the values max_duration and min_duration.

SELECT min(length) as shortest
FROM film;

SELECT max(length) as longest
FROM film;

-- What's the average movie duration expressed in format(hours,minutes)?

SELECT sec_to_time(avg(length)*60) as 'hours and minutes'
FROM film;


-- How many distinct (different) actors' last names are there?

SELECT count(distinct(last_name))FROM actor
-- There are 121

-- Since how many days has the company been operating (check DATEDIFF() function)?

SELECT DATEDIFF(MAX(rental_date),MIN(rental_date))
FROM rental;

