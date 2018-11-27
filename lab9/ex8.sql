create function ex8 (@LastName char(50),@Name char(50))
returns table as return 
	select Nume_Student,Prenume_Student,Disciplina, avg(studenti_reusita.Nota) as Nota
	from studenti_reusita
	join studenti on studenti.Id_Student = studenti_reusita.Id_Student
	join discipline on discipline.Id_Disciplina = studenti_reusita.Id_Disciplina
	where Nume_Student = @LastName and Prenume_Student = @Name
	group by studenti_reusita.Id_Student,studenti_reusita.Id_Disciplina, Nume_Student,Prenume_Student,Disciplina
GO

select * from ex8('Corovet','Eduard') 