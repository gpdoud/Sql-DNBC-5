alter procedure helloworld
as
BEGIN
print 'Hello, World! from the .Net Boot Camp SQL Server topic';
select 'This is from SELECT';

DECLARE @counter int;
SET @counter = 88;
select @counter;
DECLARE @message nvarchar(80) = 'This is the message text';
PRINT @message;
END
go
exec helloworld;
go