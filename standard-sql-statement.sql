select Name, CONCAT(City, ', ', State) as 'City,State', Sales as 'Qtr Sales' 
from Customers
where city = 'Cincinnati' and sales >= 30000
order by sales desc;