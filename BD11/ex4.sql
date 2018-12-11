restore database [universitatea_lab11] 
	from  disk = 'D:\files\univ2year\DB\BD11\files\exercitiul1.bak' 
	with  file = 1,  
	move 'universitatea' to 'D:\files\univ2year\DB\BD11\files\universitatea_lab11.mdf',  
	MOVE 'universitatea_log' to 'D:\files\univ2year\DB\BD11\files\universitatea_lab11_log.ldf',  
	norecovery,  nounload,  replace
go

restore database [universitatea_lab11] 
	from  disk = 'D:\files\univ2year\DB\BD11\files\exercitiul2.bak' 
	with  file = 1,  
	move 'universitatea' to 'D:\files\univ2year\DB\BD11\files\universitatea_lab11.mdf',  
	move 'universitatea_log' to 'D:\files\univ2year\DB\BD11\files\universitatea_lab11_log.ldf',  
	norecovery,  nounload,  replace
go

restore LOG [universitatea_lab11] 
	from disk = 'D:\files\univ2year\DB\BD11\files\exercitiul3.bak' 
	with file = 1,  
	nounload
go