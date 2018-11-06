declare @id_grupa_current int = 0;
declare @group_count int = (select count(Id_Grupa) from grupe);


while @id_grupa_current < @group_count 
begin

    set @id_grupa_current = @id_grupa_current + 1
    update grupe
    set Sef_grupa =  (
        select distinct Id_Student
        from studenti_reusita
        WHERE Id_Student in (select Id_Student 
            from studenti_reusita
            group by Id_Student, Id_Grupa

            having avg(cast(Nota as float)) = any(
                select max(media)
                from (
                select  Id_Grupa, Id_Student, avg(cast(studenti_reusita.Nota as float)) as media
                from studenti_reusita
                group by Id_Student, Id_Grupa) as T
                group by Id_Grupa
            ) and Id_Grupa = @id_grupa_current
        ) 
    )
    where Id_Grupa = @id_grupa_current
end