-- ex16 lab 4
create function ex6_1 ( @nr_ore_plan int)
returns table
as return 
	select distinct Nume_Student,Prenume_Student, discipline.Disciplina , discipline.Nr_ore_plan_disciplina
	from studenti_reusita
	inner join studenti on studenti_reusita.Id_Student = studenti.Id_Student
	inner join discipline on studenti_reusita.Id_Disciplina = discipline.Id_Disciplina
	where discipline.Nr_ore_plan_disciplina < @nr_ore_plan

go
select * from ex6_1(60)  