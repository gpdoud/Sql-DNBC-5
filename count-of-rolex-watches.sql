select c.Name as 'Customer', count(*) as 'Rolex watches ordered'
from orderlines ol
join orders o
	on ol.OrdersId = o.Id
join customers c
	on o.CustomerId = c.Id
where ol.description = 'Rolex'
group by c.Name
order by c.Name