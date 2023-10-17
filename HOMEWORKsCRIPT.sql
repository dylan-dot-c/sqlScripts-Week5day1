--1. How many actors are there with the last name ‘Wahlberg’?
-- ANSWER: 2
select COUNT(*) from actor where last_name = 'Wahlberg';

--2. How many payments were made between $3.99 and $5.99?
-- ANSWER: 5607
select COUNT(*) from payment where amount between 3.99 AND 5.99;

--3. What films have exactly 7 copies? (search in inventory)
-- ANSWER: 116 is the total amount...
select film_id , count(*)  from inventory group by film_id having count(*) = 7;
--4. How many customers have the first name ‘Willie’?
-- ANSWER: 2
select count(*) from customer where first_name = 'Willie';
--
--5. What store employee (get the id) sold the most rentals (use the rental table)?
-- Store Employee staff_id 1

select staff_id, count(inventory_id) from rental group by staff_id ;
--6. How many unique district names are there?
--ANSWER: 378
select count(distinct  district) from address group by district;
--
--7. What film has the most actors in it? (use film_actor table and get film_id)
-- film id 508
select film_id, count(actor_id) as num from film_actor group by film_id order by num desc limit 1 ;
--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
-- ANS is 21
select count(last_name) from customer where last_name like '%es' ;
--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)
-- ANSWER = 3
-- wasnt sure which id excatly... so I used customer id if that makes sense
select amount, count(amount) from payment where 
customer_id between 380 and 430 group by amount  having count(amount) > 250 ; 

--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?
-- There are 5 rating CATEGORIES
select distinct rating from film;
-- 
select count(film_id) as num, category_id  from film_category group by category_id;
-- ANSWER: CATEGORY 15