create procedure ex5 @disc_name char(50) as 
	declare @Id_disc int = (select discipline.Id_Disciplina from discipline where @disc_name = discipline.Disciplina) 
	declare @Student_Id int

	declare c cursor  for ( select Id_Student
	from (
		select top 3 studenti_reusita.Id_Student,studenti_reusita.Id_Disciplina, avg(cast(studenti_reusita.Nota as float)) as Average
		from studenti_reusita
		group by studenti_reusita.Id_Student, studenti_reusita.Id_Disciplina
		having studenti_reusita.Id_Disciplina = @Id_disc
		order by avg(cast(studenti_reusita.Nota as float)) desc
	) as T )

	open c

	FETCH NEXT FROM c   
	INTO @Student_Id  
	WHILE @@FETCH_STATUS = 0
	begin

	print @Student_Id

	update studenti_reusita set Nota = Nota + 1 where Id_Student = @Student_Id and Tip_Evaluare='Examen' and Nota < 10

	FETCH NEXT FROM c   
	INTO @Student_Id 
	end
  
	Close c
	deallocate c


	select top 3  studenti.Nume_Student,studenti.Prenume_Student,grupe.Cod_Grupa ,discipline.Disciplina,T.Nota as Nota_Veche, 
	
		case
		when T.Nota = 10 then 10 
		else T.Nota + 1  end as Nota_Nou,  
	
		avg(cast(studenti_reusita.Nota as float)) as Average

	from studenti
	join studenti_reusita on studenti.Id_Student = studenti_reusita.Id_Student
	join grupe on grupe.Id_Grupa = studenti_reusita.Id_Grupa
	join discipline on discipline.Id_Disciplina = studenti_reusita.Id_Disciplina

	join (
	select top 10 Nota,studenti_reusita.Id_Student 
	from studenti_reusita 
	where studenti_reusita.Tip_Evaluare = 'Examen'
	group by studenti_reusita.Id_Student, studenti_reusita.Id_Disciplina, Nota
	having studenti_reusita.Id_Disciplina = @Id_disc
	order by avg(cast(studenti_reusita.Nota as float)) desc
	) as T on T.Id_Student = studenti_reusita.Id_Student 

	group by studenti_reusita.Id_Student, studenti_reusita.Id_Disciplina, studenti.Nume_Student,studenti.Prenume_Student, grupe.Cod_Grupa,discipline.Disciplina, T.Nota 
	having studenti_reusita.Id_Disciplina = @Id_disc
	order by avg(cast(studenti_reusita.Nota as float)) desc

GO

EXEC ex5 @disc_name = 'Baze de date'