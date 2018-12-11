CREATE OR ALTER TRIGGER inregistrarea_noua ON Orarul 
 after  update
AS
BEGIN

SELECT 'Lesson that was for  '+upper(grupe.Cod_Grupa)+' in  '+ CAST(deleted.Auditoriu as char(3))+' " '+ lower(plan_studii.discipline.Disciplina)+'" at '+ CAST(inserted.Ora as varchar(5))+
	' o`clock , '+ lower(inserted.Zi)                 +' will be in '+ CAST(inserted.Auditoriu as char(3))+', in block '+upper(inserted.Bloc) 
	FROM inserted Join plan_studii.discipline on inserted.Id_Disciplina=discipline.Id_Disciplina
					join deleted on deleted.Id_Disciplina=discipline.Id_Disciplina
					join grupe on deleted.Id_Grupa=grupe.Id_Grupa
END
GO
select * from orarul
UPDATE orarul 
SET orarul.Auditoriu = 202
WHERE Auditoriu = 303 and Id_Disciplina= 108