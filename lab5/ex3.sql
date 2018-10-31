Declare @N1 int, @N2 int, @N3 int;
Declare @THE_GREATEST int;

set @N1 = 60 * rand();
set @N2 = 60 * rand();
set @N3 = 60 * rand();


set @THE_GREATEST = case
when (@N1 > @N2 and @N1 > @N3) THEN @N1
when (@N2 > @N1 and @N2 > @N3) THEN @N2 
else 
 @N3 
end

print @N1
print @N2
print @N3
print 'The greatest number  ' + cast(@THE_GREATEST as varchar(2))
