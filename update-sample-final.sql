select * from customers where name like '%c%g%'



/*
	Find customer with names that have a 'g' after a 'c'.

	update their sales to 50000

*/
update customers set sales = 50000 where name like '%c%g%'

select * from customers where sales = 50000;