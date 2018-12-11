CREATE or alter  TRIGGER Ex6 ON DATABASE
FOR ALTER_TABLE
AS
DECLARE @col_name varchar(10);
DECLARE @command varchar(500);
DECLARE @replacer varchar(500);
DECLARE @table_name varchar(50);
set @col_name=EVENTDATA().value('(/EVENT_INSTANCE/AlterTableActionList/*/Columns/Name)[1]','nvarchar(max)')
IF @col_name = 'Id_Profesor'
BEGIN
	set @command = EVENTDATA().value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]','nvarchar(max)')
	set @table_name = EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]','nvarchar(max)')
	print 'PRINT COMMAND    '+@command+ ' END' ;
	print 'OBJECT NAME (table)'+@table_name+'END';

	set @replacer = REPLACE(@command, @table_name, 'studenti_reusita');EXECUTE (@replacer)
			print '123       '+@replacer+ ' END' ;
	set @replacer = REPLACE(@command, @table_name, 'grupe');EXECUTE (@replacer)
			print '456       '+@replacer+ ' END' ;
	set @replacer = REPLACE(@command, @table_name, 'profesori');EXECUTE (@replacer)
			print '789       '+@replacer+ ' END' ;
	PRINT 'Types were modified'
END





go


go
alter table test11 
alter column id int