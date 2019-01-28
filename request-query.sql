select r.Description, r.Status, CONCAT(u.Firstname, ' ', u.Lastname) as 'Full name',
	v.Name, p.Name, rl.Quantity, FORMAT(p.Price,'c') as 'Price', 
	FORMAT(rl.Quantity * p.Price, 'c') as 'Line Total'
from Requests r
join Users u
	on r.UsersId = u.Id
join RequestLines rl
	on r.Id = rl.RequestsId
join Products p
	on rl.ProductsId = p.Id
join Vendors v
	on p.VendorsId = v.Id
where r.Description = 'My first request'