create procedure ex3lab9 @Nume_Student char(50), @Prenume_Student char(50),@Data_Nastere_Student date, @Adresa_Postala_Student char(30), @Cod_Grupa char(20)
as
declare @code int;
select distinct @code = Id_Grupa from grupe
where Cod_Grupa = @Cod_Grupa
Insert into studenti (Nume_Student,Prenume_Student,Data_Nastere_Student,Adresa_Postala_Student,Id_Student)
values (@Nume_Student,@Prenume_Student,@Data_Nastere_Student,@Adresa_Postala_Student,180)

insert into studenti_reusita (Id_Student,Id_Disciplina,Id_Profesor,Id_Grupa,Tip_Evaluare,Nota)
values (180,105,110,@code,'Examen',null)

GO

exec ex3lab9 @Nume_student = 'Someone' , @Prenume_Student = 'Lazy', @Adresa_Postala_Student = 'In the boring TUM', @Cod_Grupa = 'CIB171',@Data_Nastere_Student = '1900-11-19'

