-- Question 1:

select first_name, last_name, district
from customer
inner join address
on customer.address_id = address.address_id
where district = 'Texas';

-- Question 2:

select first_name, last_name, amount
from customer
inner join payment
on customer.customer_id = payment.customer_id
where amount > 6.99;

-- Question 3:
select first_name, last_name, sum(amount)
from customer
inner join payment
on customer.customer_id = payment.customer_id
where customer.customer_id in (
	select customer_id 
	from payment
	group by customer_id
	having sum(amount) > 175
)
group by customer.customer_id
order by sum(amount) desc;

-- Question 4:

select first_name, last_name, country
from customer
full join address
on customer.address_id = address.address_id
full join city
on city.city_id = address.city_id
full join country
on country.country_id = city.country_id
where country = 'Nepal';

-- Question 5:

select first_name, last_name, count(*)
from staff
full join rental
on rental.staff_id = staff.staff_id
group by staff.staff_id
order by count desc;

-- Question 6:

select rating, count(film_id) as "Number of Films"
from film
group by rating
order by rating asc;

-- Question 7:

select first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	where amount > 6.99
)
group by customer_id
order by last_name asc;

-- Question 8:

select count(amount)
from payment
where amount is null or amount = 0






