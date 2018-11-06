use universitatea

select  Id_Profesor, 
		Nume_Profesor, 
		Prenume_Profesor, 
		Adresa_Postala_Profesor as Localitate, 
		substring(Adresa_Postala_Profesor, charindex('str.', Adresa_Postala_Profesor), 15) as Adresa_1, 
		substring(Adresa_Postala_Profesor, charindex(', ', Adresa_Postala_Profesor), 5) as Adresa_2

into profesori_new
from profesori

alter table profesori_new
add default 'Mun. Chisinau' for Localitate;
alter table profesori_new   
add constraint Id_Profesor PRIMARY KEY CLUSTERED (Id_Profesor);