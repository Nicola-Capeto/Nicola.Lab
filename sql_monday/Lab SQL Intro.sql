#Explore tables by selecting all columns from each table or using the in built review features for your client.
show columns from sakila.customer;

#Select one column from a table. Get film titles.
select film_id from sakila.film;

#Select one column from a table and alias it. Get unique list of film languages under the alias language. Note that we are not asking you to obtain the language per each film, but this is a good time to think about how you might get that information in the future.
select title from sakila.film;

select title as title_film from sakila.film;

select distinct(name) from sakila.language;

#5.1 Find out how many stores does the company have?
select count(store_id) from sakila.store;

#5.2 Find out how many employees staff does the company have?
select count(staff_id) from sakila.staff;

#5.3 Return a list of employee first names only?
select first_name from sakila.staff;

