create or alter trigger end_my_suffering on studenti
after insert 
as
begin

    declare c cursor for select Id_Student from inserted


    OPEN c
    declare @currentId int

    FETCH NEXT FROM c
    INTO @currentId 

    while @@FETCH_STATUS = 0
    begin

        INSERT INTO studenti_reusita(Id_Disciplina, Id_Grupa,Id_Student,Id_Profesor,Data_Evaluare,Tip_Evaluare,Nota) 
        VALUES (101,2,@currentId,105,'2018-12-01','Testul 3',8);

    FETCH NEXT FROM c
    INTO @currentId
    end
    CLOSE c;
    DEALLOCATE c;
end


go
insert into studenti (Nume_Student, Prenume_Student) values ('test4','student4')

--drop trigger ens_my_sufferingcreate or alter trigger end_my_suffering on studenti
after insert 
as
begin

    declare c cursor for select Id_Student from inserted


    OPEN c
    declare @currentId int

    FETCH NEXT FROM c
    INTO @currentId 

    while @@FETCH_STATUS = 0
    begin

        INSERT INTO studenti_reusita(Id_Disciplina, Id_Grupa,Id_Student,Id_Profesor,Data_Evaluare,Tip_Evaluare,Nota) 
        VALUES (101,2,@currentId,105,'2018-12-01','Testul 3',8);

    FETCH NEXT FROM c
    INTO @currentId
    end
    CLOSE c;
    DEALLOCATE c;
end


go
insert into studenti (Nume_Student, Prenume_Student) values ('test4','student4')

--drop trigger ens_my_suffering