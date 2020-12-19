proc import datafile='/home/u49720641/sasuser.v94/myData/Case4data.xlsx'
	out=case4 dbms=xlsx replace;

proc print data=Case4;

proc reg data=Case4;
	model GNP=Invest CPI Interest/ collinoint VIF TOL SPEC ACOV DW;

proc reg data=Case4;
	model GNP=Invest;

proc reg data=Case4;
	model GNP=CPI;

proc reg data=Case4;
	model GNP=Interest;

run;