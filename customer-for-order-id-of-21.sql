-- who is the customer for order.id = 21?
select c.name
from orders o
join customers c
	on c.id = o.CustomerId
where o.Id = 21