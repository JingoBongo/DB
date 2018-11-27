create procedure ex2 @FirstResult int OUTPUT
as
select @FirstResult = count(distinct Id_Student)
from studenti_reusita
where Nota < 5.0 or Nota is null

