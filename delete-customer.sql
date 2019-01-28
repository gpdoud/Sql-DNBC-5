alter procedure DeleteCustomer
	@Id int = -1
AS
BEGIN
	IF @Id = -1 BEGIN
		PRINT 'Id is required';
		return 1;
	END
	-- This checks for the existence of the row to be deleted
	IF NOT EXISTS(SELECT Name FROM CUSTOMERS WHERE Id = @Id) BEGIN
		PRINT 'Id does not exist';
		return 2;
	END
	DELETE From Customers
		WHERE Id = @id
	IF @@ROWCOUNT != 1 BEGIN
		PRINT 'The delete failed!';
		return 3;
	END
	PRINT 'Delete Successful!';
	return 0;
END
go
EXEC DeleteCustomer 41
go