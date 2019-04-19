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

	int currentDepth=0;

	struct tabInstruct tabInst[tabSize];
	int indexInst = 0;

	int tmpId = -1;
	int tmpAddr;
	int tmpSymbol;

#define POP() pop(&tabIndex, &currentAddr)
#define AI(op, a1, a2, a3) addInstruct(tabInst,&indexInst,op,a1,a2,a3)
#define GFS(name) addrFromSymbol(tab,&tabIndex, name)
%}

%token tMAIN tINT tCONST tPRINTF tBRACKETOPEN tBRACKETCLOSED tPAROPEN 
tPARCLOSED tAFFECT tPLUS tMINUS tSTAR tSLASH tCOMMA tENDEXPR tINTVAR tID tIF
tNOT tDIFF tINF tWHILE

%left tPLUS tMINUS
%left tSLASH tSTAR
%left tINF tDIFF
%left tNOT

%union {
	int e;
	char * c;
}

%type<e> tINTVAR
%type<c> tID


%%

start : 
	tMAIN tPAROPEN mainArg tPARCLOSED tBRACKETOPEN instructions tBRACKETCLOSED {//printTable(tab,&tabIndex); 
																			printInstruct(tabInst,&indexInst);};

mainArg : 
	| tINT;

instructions  : instruction instructions 
		| ;
	
instruction : 
	  tID tAFFECT exp tENDEXPR
									  		{	tmpId = findSymbole(tab,&tabIndex,$1);
												AI("LOAD",  0,       POP(), -1);
												AI("STORE", GFS($1), 0,     -1);
												updateInitSymbol(tab,&tabIndex,$1);			
											}
	| tPRINTF tPAROPEN tID tPARCLOSED tENDEXPR {	
												AI("LOAD",0,GFS($3),-1);
												AI("PRINT",0,-1,-1);
											}
	| if 

	| while

	| tINT { type = 0; constt=0;} declBody

	| tCONST tINT { type = 0; constt=1;} declBody;

declBody : 
	tID tAFFECT tINTVAR tENDEXPR			{	tmpSymbol = addSymbole(tab,&tabIndex,type,$1,currentDepth,1,constt,&currentAddr); 
											 	addInstruct(tabInst,&indexInst,"AFC",0,$3,-1);
											 	addInstruct(tabInst,&indexInst,"STORE",addrFromSymbol(tab,&tabIndex, $1),0,-1);
											 
											}

	| tID tENDEXPR							{	addSymbole(tab,&tabIndex,type,$1,currentDepth,0,constt,&currentAddr); 	  
											}

	| tID tCOMMA declBody					{	addSymbole(tab,&tabIndex,type,$1,currentDepth,0,constt,&currentAddr); 
										 	}

	| tID tAFFECT tINTVAR tCOMMA declBody	{	tmpSymbol = addSymbole(tab,&tabIndex,type,$1,currentDepth,1,constt,&currentAddr);
											 	addInstruct(tabInst,&indexInst,"AFC",0,$3,-1);
											 	addInstruct(tabInst,&indexInst,"STORE",addrFromSymbol(tab,&tabIndex, $1),0,-1);
								     	 	};

			

if : tIF exp {addInstruct(tabInst,&indexInst,"LOAD",0,pop(&tabIndex, &currentAddr),-1);
			  $<e>1 = indexInst;
			  addInstruct(tabInst,&indexInst,"JMPC",-1,0,-1);}
	tBRACKETOPEN {currentDepth++ ;}
	instructions tBRACKETCLOSED { removeSymbolFromDepth(tab, &tabIndex,currentDepth,&currentAddr);
								  currentDepth--;
								  updateInstruct(tabInst,&indexInst, $<e>1);};

while : tWHILE {$<e>1 = indexInst;}
		exp {addInstruct(tabInst,&indexInst,"LOAD",0,pop(&tabIndex, &currentAddr),-1);
			 $<e>2 = indexInst;
			 addInstruct(tabInst,&indexInst,"JMPC",-1,0,-1);}
		tBRACKETOPEN {currentDepth++ ;} instructions tBRACKETCLOSED {addInstruct(tabInst,&indexInst,"JMP",$<e>1,-1,-1);
																	 removeSymbolFromDepth(tab, &tabIndex,currentDepth,&currentAddr);
																	 currentDepth--;
																	 updateInstruct(tabInst,&indexInst, $<e>2);};



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

	| exp tDIFF exp				{	addInstruct(tabInst,&indexInst,"LOAD",0,pop(&tabIndex, &currentAddr),-1);
									addInstruct(tabInst,&indexInst,"LOAD",1,pop(&tabIndex, &currentAddr),-1);
									addInstruct(tabInst,&indexInst,"SOU",0,1,0);
									addInstruct(tabInst,&indexInst,"DIFZ",0,-1,-1);
									tmpAddr = addTemp(tab,&tabIndex,&currentAddr);
									addInstruct(tabInst,&indexInst,"STORE",tmpAddr,0,-1);
									
								}

	| tNOT exp					{
									addInstruct(tabInst,&indexInst,"LOAD",0,pop(&tabIndex, &currentAddr),-1);
									addInstruct(tabInst,&indexInst,"NOT",0,-1,-1);
									tmpAddr = addTemp(tab,&tabIndex,&currentAddr);
									addInstruct(tabInst,&indexInst,"STORE",tmpAddr,0,-1);
								}

	| exp tINF exp 				{
									addInstruct(tabInst,&indexInst,"LOAD",0,pop(&tabIndex, &currentAddr),-1);
									addInstruct(tabInst,&indexInst,"LOAD",1,pop(&tabIndex, &currentAddr),-1);
									addInstruct(tabInst,&indexInst,"INF",0,1,0);
									tmpAddr = addTemp(tab,&tabIndex,&currentAddr);
									addInstruct(tabInst,&indexInst,"STORE",tmpAddr,0,-1);
								}

	| tINTVAR 					{	tmpAddr = addTemp(tab,&tabIndex,&currentAddr);
									addInstruct(tabInst,&indexInst,"AFC",0,$1,-1);
									addInstruct(tabInst,&indexInst,"STORE",tmpAddr,0,-1);
									//printTable(tab,&tabIndex);
								}

	| tID 						{	if (initFromSymbol(tab,&tabIndex,$1)){
										tmpAddr = addTemp(tab,&tabIndex,&currentAddr);
										addInstruct(tabInst,&indexInst,"LOAD",0,addrFromSymbol(tab,&tabIndex,$1),-1);
										addInstruct(tabInst,&indexInst,"STORE",tmpAddr,0,-1);
									}else{
										printf("\x1b[1m[\x1b[91mwarning\x1b[0m\x1b[1m]\x1b[0m Variable \"%s\" not initialized.\n \n", $1);
									}	
								};

	

%%




