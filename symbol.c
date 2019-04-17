#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// DECLARATION
#define tabSize 1024



// STRUCTURES
struct line {
	int type;
	char * id;
	int depth;
	int intInit;
	int isConst;
	int addr;
};


// FUNCTIONS 
int isSymboleInTab(struct line * tab, int * tabIndex, char * id){
	for (int i=0; i < (*tabIndex); i++){
		if (!strcmp(tab[i].id, id)) {
			printf("\x1b[1m[\x1b[91mwarning\x1b[0m\x1b[1m]\x1b[0m Variable \"%s\" already initialized.\n \n", id);
			return 0;
		}  
	} 
	return -1; 
}

int findSymbole(struct line * tab, int * tabIndex, char * id){
	for (int i=0; i < (*tabIndex); i++){
		if (!strcmp(tab[i].id, id)) {
			return i;
		}  
	} 
	return -1; 
}

int initFromSymbol(struct line * tab, int * tabIndex, char * id){
	for (int i=0; i < (*tabIndex); i++){
		if (!strcmp(tab[i].id, id)) {
			return tab[i].intInit;
		}  
	} 
	return -1; 
}

int addrFromSymbol(struct line * tab, int * tabIndex, char * id){
	for (int i=0; i < (*tabIndex); i++){
		if (!strcmp(tab[i].id, id)) {
			return tab[i].addr;
		}  
	} 
	return -1; 
}




int addSymbole(struct line * tab, int * tabIndex, 
				int type, char * id, int depth, int intInit,  int isConst, int * currentAddr){
	if (isSymboleInTab(tab,tabIndex,id)) {
		struct line myLine; 
		myLine.type = type;
		myLine.id = id;
		myLine.depth = depth;
		myLine.intInit = intInit;
		myLine.isConst = isConst;
		myLine.addr= (*currentAddr);
		*(currentAddr) += 4;
		tab[* tabIndex] = myLine;
		*(tabIndex) += 1;
		return (*tabIndex);
	}
}


int addTemp(struct line * tab, int * tabIndex, int * currentAddr){		
	struct line myLine; 
	myLine.type = -1;
	myLine.id = "#";
	myLine.depth = -1;
	myLine.intInit = -1;
	myLine.isConst = -1;
	myLine.addr= (*currentAddr);
	int res = (*currentAddr);
	*(currentAddr) += 4;
	tab[* tabIndex] = myLine;
	*(tabIndex) += 1;
	return res;
}


int pop(int * tabIndex, int * currentAddr){
	*(currentAddr) = (*currentAddr) - 4;
	*(tabIndex) -= 1;
	return (*currentAddr);
}



void printTable(struct line * tab, int * tabIndex){
	printf("\n");
	for (int i=0;i<(*tabIndex);i++){
		printf("Variable : %s Type : %d, Depth : %d, Init ? : %d, Const? : %d, Addr : %d \n -------------------------- \n",
		tab[i].id, tab[i].type, tab[i].depth, tab[i].intInit, tab[i].isConst, tab[i].addr);
	}
} 

/*
void main(){

	struct line tab[tabSize];
	int tabIndex=0;
	int currentAddr=0;	
	addSymbole(tab,&tabIndex,0,"toto",0,0,0,&currentAddr);
	addSymbole(tab,&tabIndex,1,"jojo",1,1,1,&currentAddr);
	addTemp(tab,&tabIndex,&currentAddr);
	printTable(tab,&tabIndex);
} 
*/


 

 

