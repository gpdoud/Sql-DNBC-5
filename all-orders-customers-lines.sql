--select * from customers where id = 1;
--select * from orders where customerid = 1;
--update orders set customerid = 999 where id = 1;
select o.Date as 'Order Date', o.Description as 'Description', c.name as 'Customer Name',
		ol.Product, ol.Description, ol.Price, ol.Quantity
from orders o
join customers c
on o.customerid = c.id 
join orderlines ol
on ol.OrdersId = o.Id
--where orders.id = 1;
order by o.customerid;

