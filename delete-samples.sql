-- select * from customers2;
delete from customers2 where city = 'Cincinnati'
-- delete companies with 'BANK' in the name

delete from orders where id in (
	select o.id
	from orders o
	join customers c
		on o.CustomerId = c.Id
	where c.name like '%BANK%'
);