create function ex7 (@date date)
returns table as return
	SELECT DATEDIFF(year, @date, GETDATE()) AS DateDiff;
GO
select * from ex7('1998/08/25')