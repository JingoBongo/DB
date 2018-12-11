create or alter trigger ex5 on database
	for create_table, alter_table, drop_table
	as
	set nocount on
	declare @currentTime time
	set @currentTime = convert(time, getdate())
	if @currentTime < convert(time, '08:00:00') or @currentTime > convert(time, '12:00:00') 
	begin
		raiserror('You can only modify tables in working hours', 16,1)
		rollback
	end
	go
	create table BLABLA(id int)

	go 
