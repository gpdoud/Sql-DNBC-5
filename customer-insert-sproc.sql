create procedure InsertCustomer
	@Name nvarchar(30),
	@City nvarchar(30),
	@State nchar(2)
as
BEGIN
	IF @State not in ('OH', 'IN', 'KY')
		BEGIN
			PRINT 'State must be OH, IN, KY';
			RETURN 1;
		END
	Insert into Customers
		(Name, City, State, Sales)
	Values
		(@Name, @City, @State, 0);
	IF @@ROWCOUNT != 1
		BEGIN
			PRINT 'The Insert failed.';
			RETURN 2;
		END
	PRINT 'Insert Successful!';
	return 0;
END
go
exec InsertCustomer 'ACME Mfg.', 'Gary', 'IN'
go