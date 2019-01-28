/*
	Assignment:

	Insert a customer named MAX Technical Training 
	in Mason, OH with sales of 100,000 and active is 1

	Add an order to Max for Date of August 1, 2018
	with description of "The first max order for widgets"

	Add a order line for 1 Echo at 99.99 to the order

	Add another order line for 1 Echo Dot at 39.99 to 
	the order
*/

insert into orders
(CustomerId, Date, Description)
values
(select id from customers where name like 'MAX%', 
'2018-08-01', 'Assignment order');

/*
insert into orderlines
(OrdersId, Product, Quantity, Price)
values
(29, 'Echo', 1, 99.99);

insert into orderlines
(OrdersId, Product, Quantity, Price)
values
(29, 'Echo Dot', 1, 39.99);

insert into orders
(CustomerId, Date, Description)
values
(40, '2018-08-01', 'Assignment order');


insert into orders
(CustomerId, Date, Description)
values
(36, '2019-01-24', 'My first real order');


insert into customers 
	(Name, City, state, Sales)
	values
	('MAX Technical Training', 'Mason', 'OH', 100000.00);

select * from customers;

select * from orders;

select * from orderlines;
*/