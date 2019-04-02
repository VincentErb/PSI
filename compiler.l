%{
	#include "y.tab.h"
	#include "string.h"
%} 

%%

"main" {return tMAIN;}
"int" {return tINT;}
"const" {return tCONST;}
"printf" {return tPRINTF;}
"{" {return tBRACKETOPEN;}
"}" {return tBRACKETCLOSED;}
"(" {return tPAROPEN;}
")" {return tPARCLOSED;}
"=" {return tAFFECT;}
"+" {return tPLUS;}
"-" {return tMINUS;}
"*" {return tSTAR;}
"/" {return tSLASH;}
" "|"\t"|"\n" { }
"," {return tCOMMA;}
";" {return tENDEXPR;}
[0-9]+ {yylval.e = atoi(yytext);
		return tINTVAR;}
[a-z](_|[a-zA-Z0-9])* {yylval.c = strdup(yytext);
						return tID;}
. {printf("error");}

