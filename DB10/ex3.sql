create or alter trigger ex3 on studenti_reusita
after update 
as
begin

    declare @Id_Student int,@Id_Disciplina int,@Id_Profesor int,@Id_Grupa int,@Tip_Evaluare char(20),@NewNote int,@Data_Evaluare date;

    DECLARE db_cursor CURSOR FOR 
    SELECT Id_Student,Id_Disciplina,Id_Profesor, Id_Grupa,Tip_Evaluare, Nota, Data_Evaluare
    FROM inserted 

    OPEN db_cursor
    FETCH NEXT FROM db_cursor INTO @Id_Student,@Id_Disciplina,@Id_Profesor,@Id_Grupa,@Tip_Evaluare,@NewNote,@Data_Evaluare

    WHILE @@FETCH_STATUS = 0
    BEGIN
        if @Id_Grupa in (select Id_Grupa from grupe where Cod_Grupa = 'CIB171')
        begin
            -- start task 1
            declare @OldNote int = ( select Nota from deleted where Id_Student=@Id_Student and Tip_Evaluare = @Tip_Evaluare and Id_Disciplina = @Id_Disciplina)

            select  @OldNote = Nota from deleted where Id_Student= @Id_Student 
            if (@OldNote > @NewNote and @OldNote is not null)
            begin
                UPDATE studenti_reusita
                SET Nota = @OldNote
                WHERE Nota = @NewNote and Id_Student=@Id_Student and Tip_Evaluare = @Tip_Evaluare and Id_Disciplina = @Id_Disciplina  
            end
            -- start task2
			
            
         
            
			declare @OldDate date = ( select Data_Evaluare from deleted where Id_Student=@Id_Student and Tip_Evaluare = @Tip_Evaluare and Id_Disciplina = @Id_Disciplina)

            
            if (@OldDate is not null)  --  or @NewDate is not null
            begin
                UPDATE studenti_reusita
                SET Data_Evaluare = @OldDate
                WHERE Data_Evaluare = @Data_Evaluare and Id_Student=@Id_Student and Id_Disciplina=@Id_Disciplina and Tip_Evaluare= @Tip_Evaluare
            end
            
			FETCH NEXT FROM db_cursor INTO @Id_Student,@Id_Disciplina,@Id_Profesor,@Id_Grupa,@Tip_Evaluare,@NewNote,@Data_Evaluare

            Print 'TRIGGER HAS BEEN TRIGGERED'
        end -- end if cib 


    end -- end while
    CLOSE db_cursor
    DEALLOCATE db_cursor
end -- end trigger

go
update studenti_reusita
set  Data_Evaluare = '1998-08-08'
where Id_Student = 101 and Tip_Evaluare='Examen' and Id_Disciplina=105