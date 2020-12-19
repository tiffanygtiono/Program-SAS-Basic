proc import datafile='/home/u49720641/sasuser.v94/myData/Case3.xlsx'
	out=mod3 dbms=xlsx replace;

data mod3; set mod3;
	MktSQ=Mkt**2;
	if Date < 20020730 then Dummy=0; else Dummy=1;
	InterMkt=Mkt*Dummy;

data Ford; set mod3;
	if PERMNO=25785 then delete;

proc reg data=Ford;
	model MktSQ=Dummy;

proc reg data=mod3;
	model Ret=Mkt;
	by PERMNO;
	output out=Resqr residual=resid;

data Resqr; set Resqr;
	RSQ=resid**2;

proc reg data=Resqr;
	model RSQ=Dummy;
	by PERMNO;

proc reg data=mod3;
	model Ret=Mkt Dummy InterMkt;
	by PERMNO;

proc reg data=Ford;
	model Ret=Mkt;

proc reg data=Ford;
	model Ret=Mkt HML SMB;

proc glm data=Ford;
	model Ret=Mkt HML SMB;

run;

