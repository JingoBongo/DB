/*
	Gasiti numele, prenumele, adresa studentilor si ale profesori care locuiesc pe strada 31 August.
*/

select distinct studenti.Nume_Student , studenti.Prenume_Student , profesori.Nume_Profesor,profesori.Prenume_Profesor 
from studenti
join studenti_reusita on studenti_reusita.Id_Student = studenti.Id_Student
join profesori on studenti_reusita.Id_Profesor = profesori.Id_Profesor
where studenti.Adresa_Postala_Student like '%str. 31 August%'
