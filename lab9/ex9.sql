create function ex9 (@isGood char(50))
returns table as return
	with AverageGradeTable as (
		select studenti_reusita.Id_Student, AVG(cast(studenti_reusita.Nota as float)) as Nota 
		from studenti_reusita
		join studenti on studenti.Id_Student = studenti_reusita.Id_Student
		group by studenti_reusita.Id_Student
	)

	select distinct Nume_Student,Prenume_Student,AverageGradeTable.Nota,Cod_Grupa, @isGood as isGood
	from AverageGradeTable
	join studenti on studenti.Id_Student = AverageGradeTable.Id_Student
	join studenti_reusita on studenti_reusita.Id_Student = AverageGradeTable.Id_Student
	join grupe on grupe.Id_Grupa = studenti_reusita.Id_Grupa
	where AverageGradeTable.Nota in (
		select case when @isGood = 'slab' then min(Nota) when @isGood = 'sarguincios' then max(Nota)  end
		from AverageGradeTable
	)
go
select * from ex9('slab')
select * from ex9('sarguincios')
