select * 
from customers
where name in (
	select name from customers where sales > 30000 and sales < 35000
)
order by sales desc;