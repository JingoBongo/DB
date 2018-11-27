CREATE PROCEDURE EX17Proc @ID_student int AS 
	select profesori.Id_Profesor, profesori.Nume_Profesor,profesori.Prenume_Profesor
	from studenti_reusita
	join profesori on studenti_reusita.Id_Profesor = profesori.Id_Profesor
	where studenti_reusita.Id_Student = any( select studenti_reusita.Id_Student
											from studenti_reusita
											where studenti_reusita.Id_Student = @ID_student
											) 
	group by profesori.Id_Profesor, profesori.Nume_Profesor,profesori.Prenume_Profesor
