begin transaction

	update customers set sales = 200 where name like 'Greg%';

commit

select * from customers where name like 'Greg%';