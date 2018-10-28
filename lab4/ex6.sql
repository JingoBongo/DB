/*
	Afisati numele si prenumile primilor 5 studentii care au obtinut note in ordine descrescatoare 
	la al doilea test de la disciplina Baze de date. Sa se foloseasc optiunea Top...with ties.
*/


select  TOP(5) WITH TIES studenti.Nume_Student , studenti.Prenume_Student , Nota
from studenti
join studenti_reusita on studenti.Id_Student = studenti_reusita.Id_Student
join discipline on discipline.Id_Disciplina = studenti_reusita.Id_Disciplina
where Tip_Evaluare = 'Testul 2' and Disciplina = 'Baze de date'
order by Nota desc
