Declare @N1 int, @N2 int, @N3 int;
Declare @THE_GREATEST int;

set @N1 = 60 * rand();
set @N2 = 60 * rand();
set @N3 = 60 * rand();


if (@N1 > @N2 and @N1 > @N3)
	set	@THE_GREATEST = @N1 
if @N2 > @N1 and @N2 > @N3 
	set @THE_GREATEST = @N2 
if @N3 > @N1 and  @N3 > @N2
	set @THE_GREATEST = @N3 


print @N1
print @N2
print @N3
print 'The greatest number : ' + cast(@THE_GREATEST as varchar(2))
