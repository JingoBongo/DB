select studenti.Nume_Student,studenti.Prenume_Student, grupe.Cod_Grupa ,avg(cast(Nota as float))
from studenti_reusita

join studenti on studenti.Id_Student = studenti_reusita.Id_Student
join grupe on grupe.Id_Grupa = studenti_reusita.Id_Grupa

group by studenti.Nume_Student,studenti.Prenume_Student, grupe.Cod_Grupa

having avg(cast(Nota as float)) = any(
	select max(media)
	from (
	select  Id_Grupa, Id_Student, avg(cast(studenti_reusita.Nota as float)) as media
	from studenti_reusita
	group by Id_Student, Id_Grupa) as T
	group by Id_Grupa
)