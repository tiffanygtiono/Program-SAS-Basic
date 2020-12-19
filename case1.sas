proc import datafile='/home/u49720641/sasuser.v94/myData/Case1.xlsx'
	dbms=xlsx out=mod1 replace;
	sheet='DATA';

proc reg data=mod1;
	model y=x;
	
proc glm data=mod1;
	model y=x;
	output out=resx r=residuals;

proc print data=resx;
run;

proc sort data=resx;
	by descending residuals;

proc print data=resx;
run;
	



	