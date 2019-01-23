-- list lines for order.id = 24

select *
from orders o
join orderlines ol
	on ol.OrdersId = o.Id
where o.id = 24