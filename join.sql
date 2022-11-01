use sakila;
#Which actor has appeared in the most films?

select actor.first_name, actor.last_name, count(film_actor.film_id) as count
from actor 
join film_actor on actor.actor_id = film_actor.actor_id
group by actor.actor_id
order by count desc
limit 1;

select *
from actor 
join film_actor on actor.actor_id = film_actor.actor_id
#Most active customer (the customer that has rented the most number of films)

select c.first_name, c.last_name, count(r.rental_id) as count
from sakila.customer c
join sakila.rental r on c.customer_id = r.customer_id
group by c.customer_id
order by count desc
limit 1;

#List number of films per category.

select c.name, count(f.film_id) as count
from sakila.category c
join sakila.film_category f on c.category_id=f.category_id
group by c.category_id;

#Display the first and last names, as well as the address, of each staff member.

select s.first_name, s.last_name, a.address
from staff s
join address a using (address_id);

select s.first_name, s.last_name, a.address
from staff s
join address a on s.address_id = a.address_id;


#get films titles where the film language is either English or italian, and whose titles starts with letter "M" , sorted by title descending.alter

select f.title, l.name
from film f
join language l on f.language_id=l.language_id
where name IN ('English','italian' ) and title regexp ('^M');

#Display the total amount rung up by each staff member in August of 2005.

select s.first_name, s.last_name,sum(amount) as total_amount
from staff s
join payment a on s.staff_id=a.staff_id
where payment_date like "2005-08%"
group by s.staff_id;

#List each film and the number of actors who are listed for that film.

select actor.first_name, actor.last_name, count(film_actor.film_id) as count
from actor 
join film_actor on actor.actor_id = film_actor.actor_id
group by actor.actor_id
order by count desc
limit 1;





