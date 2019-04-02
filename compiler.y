%{
	#include "symbol.h"
	#include "asm.h"
	#include <stdio.h>

	int yylex();
	int yyerror(char*);
	int type;
	int constt;

	struct line tab[tabSize];
	int tabIndex=0;
	int currentAddr=0;

	struct tabInstruct tabInst[tabSize];
	int indexInst = 0;

	int tmpId = -1;
	int tmpAddr;
	int tmpSymbol;

%}

%token tMAIN tINT tCONST tPRINTF tBRACKETOPEN tBRACKETCLOSED tPAROPEN 
tPARCLOSED tAFFECT tPLUS tMINUS tSTAR tSLASH tCOMMA tENDEXPR tINTVAR tID

%left tPLUS tMINUS
%left tSLASH tSTAR

%union {
	int e;
	char * c;
}

%type<e> tINTVAR
%type<c> tID


%%

start : 
	tMAIN tPAROPEN mainArg tPARCLOSED tBRACKETOPEN mainBody tBRACKETCLOSED {printTable(tab,&tabIndex); printInstruct(tabInst,&indexInst);};

mainArg : 
	| tINT;

mainBody : 
	declare affect;

declare : 
	| tINT { type = 0; constt=0;} declBody declare
	| tCONST tINT { type = 0; constt=1;} declBody declare;

declBody : 
	tID tAFFECT tINTVAR tENDEXPR			{	tmpSymbol = addSymbole(tab,&tabIndex,type,$1,0,1,constt,&currentAddr); 
											 	addInstruct(tabInst,&indexInst,"AFC",0,$3,-1);
											 	addInstruct(tabInst,&indexInst,"STORE",addrFromSymbol(tab,&tabIndex, $1),0,-1);
											 
											}

	| tID tENDEXPR							{	addSymbole(tab,&tabIndex,type,$1,0,0,constt,&currentAddr); 	  
											}

	| tID tCOMMA declBody					{	addSymbole(tab,&tabIndex,type,$1,0,0,constt,&currentAddr); 
										 	}

	| tID tAFFECT tINTVAR tCOMMA declBody	{	tmpSymbol = addSymbole(tab,&tabIndex,type,$1,0,1,constt,&currentAddr);
											 	addInstruct(tabInst,&indexInst,"AFC",0,$3,-1);
											 	addInstruct(tabInst,&indexInst,"STORE",addrFromSymbol(tab,&tabIndex, $1),0,-1);
								     	 	};
	
affect : 
	| tID tAFFECT exp tENDEXPR affect 		{	tmpId = findSymbole(tab,&tabIndex,$1);
												addInstruct(tabInst,&indexInst,"LOAD",0,pop(&tabIndex, &currentAddr),-1);
												addInstruct(tabInst,&indexInst,"STORE",addrFromSymbol(tab,&tabIndex, $1),0,-1);
													
											}
	| printf affect;

exp : 
	tPAROPEN exp tPARCLOSED 
	| exp tPLUS exp 			{	addInstruct(tabInst,&indexInst,"LOAD",0,pop(&tabIndex, &currentAddr),-1);
									addInstruct(tabInst,&indexInst,"LOAD",1,pop(&tabIndex, &currentAddr),-1);
									addInstruct(tabInst,&indexInst,"ADD",0,1,0);
									tmpAddr = addTemp(tab,&tabIndex,&currentAddr);
									addInstruct(tabInst,&indexInst,"STORE",tmpAddr,0,-1);
								}
	| exp tMINUS exp			{	addInstruct(tabInst,&indexInst,"LOAD",0,pop(&tabIndex, &currentAddr),-1);
									addInstruct(tabInst,&indexInst,"LOAD",1,pop(&tabIndex, &currentAddr),-1);
									addInstruct(tabInst,&indexInst,"SOU",0,1,0);
									tmpAddr = addTemp(tab,&tabIndex,&currentAddr);
									addInstruct(tabInst,&indexInst,"STORE",tmpAddr,0,-1);
								}
	| exp tSTAR exp				{	addInstruct(tabInst,&indexInst,"LOAD",0,pop(&tabIndex, &currentAddr),-1);
									addInstruct(tabInst,&indexInst,"LOAD",1,pop(&tabIndex, &currentAddr),-1);
									addInstruct(tabInst,&indexInst,"MUL",0,1,0);
									tmpAddr = addTemp(tab,&tabIndex,&currentAddr);
									addInstruct(tabInst,&indexInst,"STORE",tmpAddr,0,-1);
								}
	| exp tSLASH exp			{	addInstruct(tabInst,&indexInst,"LOAD",0,pop(&tabIndex, &currentAddr),-1);
									addInstruct(tabInst,&indexInst,"LOAD",1,pop(&tabIndex, &currentAddr),-1);
									addInstruct(tabInst,&indexInst,"DIV",0,1,0);
									tmpAddr = addTemp(tab,&tabIndex,&currentAddr);
									addInstruct(tabInst,&indexInst,"STORE",tmpAddr,0,-1);
								}

	| tINTVAR 					{	tmpAddr = addTemp(tab,&tabIndex,&currentAddr);
									addInstruct(tabInst,&indexInst,"AFC",0,$1,-1);
									addInstruct(tabInst,&indexInst,"STORE",tmpAddr,0,-1);
									printTable(tab,&tabIndex);
								}

	| tID 						{	if (initFromSymbol(tab,&tabIndex,$1)){
										tmpAddr = addTemp(tab,&tabIndex,&currentAddr);
										addInstruct(tabInst,&indexInst,"LOAD",0,findSymbole(tab,&tabIndex,$1),-1);
										addInstruct(tabInst,&indexInst,"STORE",tmpAddr,0,-1);
									}else{
										printf("\x1b[1m[\x1b[91mwarning\x1b[0m\x1b[1m]\x1b[0m Variable \"%s\" not initialized.\n \n", $1);
									}	
								};

printf : 
	tPRINTF tPAROPEN tID tPARCLOSED tENDEXPR ;

%%




