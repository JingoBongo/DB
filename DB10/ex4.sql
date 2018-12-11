

create or alter trigger ex4 on database
	for alter_table
	as
	set nocount on
	declare @column_name varchar(10)
	select @column_name = EVENTDATA().value('(/EVENT_INSTANCE/AlterTableActionList/*/Columns/Name)[1]', 'nvarchar(max)')
	if @column_name='Id_Disciplina'
	begin
		raiserror('You can`t modify Id_Disciplina!', 16,1)
		rollback
	end

	go

	alter table test11
	alter column name char(50)
