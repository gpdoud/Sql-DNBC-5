-- display individual customers with sales
-- greater than the average of all customer sales
-- select avg(sales) from customers;

select * from customers 
	where sales > (select avg(sales) from customers)