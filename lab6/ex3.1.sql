alter table grupe add Sef_grupa int 
alter table grupe add constraint ExistSef unique (Sef_grupa)
alter table grupe add Prof_Inrudator int 
alter table grupe add constraint ExistProfIntrudactor unique (Sef_grupa)
