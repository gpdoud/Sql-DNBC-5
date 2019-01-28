alter procedure CustomersWithSalesGTValue
	@MinSales decimal(9,2)
as
BEGIN
	SELECT * From Customers
		where Sales > @MinSales
		order by Sales desc;
END
go
exec CustomersWithSalesGTValue 60000;
go