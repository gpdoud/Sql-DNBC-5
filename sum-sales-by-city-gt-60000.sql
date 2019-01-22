-- sum sales by city
-- display if sum is greater than 60k
select City, sum(sales), count(*)
from customers
group by City
having sum(sales) > 600000;
