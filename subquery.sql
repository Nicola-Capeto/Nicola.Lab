use sakila;

#List all films whose length is longer than the average of all the films.

select avg(length) from film;

select title, length from film
where length > 115.2720;

select title, length from film
	where length > (select avg(length) from film);
    
#How many copies of the film Hunchback Impossible exist in the inventory system?


#select title, count(film.film_id) as count
#from film 
#join inventory on inventory.film_id = film.film_id
#group by inventory.film_id;

select film_id from film
where title = 'Hunchback Impossible';

select count(inventory_id) from inventory
where film_id = ( select film_id from film where title = 'Hunchback Impossible')
group by film_id;

#Use subqueries to display all actors who appear in the film Alone Trip.



#select film_id from film
#where title = 'Alone Trip';


select first_name,last_name from actor
	where actor_id in (select actor_id from film_actor
where film_id = (select film_id from film
where title = 'Alone Trip'));

#Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.

select title from film
	where film_id in (select film_id from film_category
					where category_id = (select category_id from category where name ='family'));
                    
#Get name and email from customers from Canada using subqueries. Do the same with joins.
#Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.

select first_name, last_name, email from customer
where address_id in (select address_id from address 
where city_id in (select city_id from city
where country_id = (select country_id from country where country = 'Canada')));

#Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.    
    
select c.first_name, c.last_name, c.email
from customer c 
join address a using(address_id)
join city b using(city_id)
join country f using(country_id)
where country = 'Canada';

#Which are films starred by the most prolific actor?
#Most prolific actor is defined as the actor that has acted in the most number of films.
#First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.

select title from film
where film_id in (
select film_id from film_actor
where actor_id = (select actor_id from film_actor
group by actor_id
order by count(actor_id) desc))
limit 1));

#Films rented by most profitable customer.
#You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments

select title from film
where film_id in (
select film_id from film_actor
where actor_id = (select actor_id from film_actor
group by actor_id
order by count(actor_id) desc))
limit 1))