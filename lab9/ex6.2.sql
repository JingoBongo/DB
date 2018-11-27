-- ex 6 lab 4
create function ex6_2 (@Tip_ev char(50), @Disc char(50))
returns table as return 
	select  TOP(5) WITH TIES studenti.Nume_Student , studenti.Prenume_Student , Nota
	from studenti
	join studenti_reusita on studenti.Id_Student = studenti_reusita.Id_Student
	join discipline on discipline.Id_Disciplina = studenti_reusita.Id_Disciplina
	where Tip_Evaluare = @Tip_ev and Disciplina = @disc
	order by Nota desc

GO

select * from ex6_2('Testul 2','Baze de date')