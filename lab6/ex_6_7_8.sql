select distinct Id_Disciplina, Id_Profesor, Id_Grupa
into orarul
from studenti_reusita
where Id_Grupa = 1 or Id_Grupa = 2 
alter table orarul add ora varchar(5) NULL, Auditoriu int NULL;
go

create nonclustered index NIX_task6  
    on orarul (Id_Disciplina, Id_Profesor, Id_Grupa)  
go

alter database universitatea
add file (name = FGTask6, filename = 'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\FGTask6.ndf')
to filegroup userdatafgroup1;

update orarul set ora = '08:00', Auditoriu = 202 where Id_Disciplina = 107 and Id_Grupa = 1;
update orarul set ora = '11:30', Auditoriu = 501 where Id_Disciplina = 108 and Id_Grupa = 1;
update orarul set ora = '13:00', Auditoriu = 501 where Id_Disciplina = 119 and Id_Grupa = 1;
go

update orarul set ora = '08:00', Auditoriu = 123 where Id_Disciplina = 108 and Id_Grupa = 2;
update orarul set ora = '11:30', Auditoriu = 321 where Id_Disciplina = 120 and Id_Grupa = 2;
update orarul set ora = '13:00', Auditoriu = 602 where Id_Disciplina = 107 and Id_Grupa = 2;
go

create nonclustered index NIX_task6  
    on orarul (Id_Disciplina, Id_Profesor, Id_Grupa)  
    with (DROP_EXISTING = on)  
    on userdatafgroup1; 























