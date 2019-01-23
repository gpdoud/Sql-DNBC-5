select top 3 Description, count(*) as 'Nbr Sold', sum(Quantity * Price) as 'Revenue'
from orderlines
group by Description
order by sum(Quantity * Price) desc