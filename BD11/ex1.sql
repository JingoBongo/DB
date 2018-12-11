if EXISTS (select * from master.dbo.sysdevices where name = 'backLAB11')
	exec sp_dropdevice 'backup1';
go

exec sp_addumpdevice 'disk','backup1','D:\files\univ2year\DB\BD11\files\exercitiul1.bkp';
go

backup database universitatea
to disk = 'D:\files\univ2year\DB\BD11\files\exercitiul1.bkp'
with format,
name = 'universitatea - First Full Backup';
go


