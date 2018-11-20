WITH View_14 AS (
SELECT DISTINCT    studenti.Nume_Student, studenti.Prenume_Student, discipline.Disciplina
FROM         studenti INNER JOIN
                      studenti_reusita ON studenti.Id_Student = studenti_reusita.Id_Student INNER JOIN
                      discipline ON studenti_reusita.Id_Disciplina = discipline.Id_Disciplina 
WHERE     (studenti_reusita.Nota > 8) )
SELECT * FROM View_14