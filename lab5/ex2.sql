Declare @N1 int,@N2 int;
Declare @disciplina varchar(20);
set @disciplina = 'Baze de date';

Declare @tipEvaluare varchar(20);
set @tipEvaluare = 'Testul 1';

set @n1 = 6;
set @n2 = 8;

 Declare @indexStudent int;
 set @indexStudent = 100;
 Declare @checkedStudents int;
 set @checkedStudents = 0;
 

 while @checkedStudents < 10 
	begin
	declare @grade int;
	set @grade = (select nota from studenti_reusita as sr
	 join discipline on discipline.Id_Disciplina = sr.Id_Disciplina
	where sr.Id_Student = @indexStudent and discipline.Disciplina = @disciplina and sr.Tip_Evaluare = @tipEvaluare)
	
	if @grade != @N1 and @grade != @N2
	begin
			declare @name varchar(20)
			set @name = (
			select Nume_Student from studenti where studenti.Id_Student = @indexStudent
			)
			declare @lastName varchar(20)
			set @lastName = (
			select Prenume_Student from studenti where studenti.Id_Student = @indexStudent
			)

			print 'Name - ' + @name + '     last name - ' + @lastName + '      grade - ' + cast(@grade as varchar(2));
	end
	else 
	begin
		print 'Student has grade 6 or 8';
	end
	
	set @indexStudent = @indexStudent + 1
	set @checkedStudents = @checkedStudents + 1
	end