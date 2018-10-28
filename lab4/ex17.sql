/*
	Afisati	 numele si prenumele profesorilor, care au predat doar disciplina studentului ci id. 100.
*/

select profesori.Id_Profesor, profesori.Nume_Profesor,profesori.Prenume_Profesor
from studenti_reusita
join profesori on studenti_reusita.Id_Profesor = profesori.Id_Profesor
where studenti_reusita.Id_Student = any( select studenti_reusita.Id_Student
										 from studenti_reusita
										 where studenti_reusita.Id_Student = 100
										) 
group by profesori.Id_Profesor, profesori.Nume_Profesor,profesori.Prenume_Profesor


