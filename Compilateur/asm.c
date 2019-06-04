#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// DECLARATION
#define tabSize 1024



// STRUCTURES
struct tabInstruct {
	char * op;
	int ra;
	int rb;
	int rc;
};


// FUNCTIONS 
void addInstruct(struct tabInstruct * tab, int * tabIndex, char * op,int ra,int rb,int rc){
	struct tabInstruct inst;
	inst.op = op;
	inst.ra = ra;
	inst.rb = rb; 
	inst.rc = rc;
	tab[* tabIndex] = inst;
	*(tabIndex) += 1;
}

void updateInstruct(struct tabInstruct * tab, int * indexInst, int targetInst){
	tab[targetInst].ra = (*indexInst);

}

void printInstruct(struct tabInstruct * tab, int * tabIndex){
	for (int i=0;i<(*tabIndex);i++){
		
		printf("%s %x %d %d\n",
		tab[i].op, tab[i].ra, tab[i].rb, tab[i].rc);
	}
}

void printInstructHexa(struct tabInstruct * tab, int * tabIndex){
	for (int i=0;i<(*tabIndex);i++){
		if (!strcmp(tab[i].op,"AFC")){
			printf("%02hhX%02hhX%02hhX%02hhX\n", 6, tab[i].ra, tab[i].rb, tab[i].rc);
		}	
		else if (!strcmp(tab[i].op,"STORE")){
			printf("%02hhX%02hhX%02hhX%02hhX\n", 8, tab[i].ra, tab[i].rb, tab[i].rc);
		}
		else if (!strcmp(tab[i].op,"ADD")){
			printf("%02hhX%02hhX%02hhX%02hhX\n", 1, tab[i].ra, tab[i].rb, tab[i].rc);
		}
		else if (!strcmp(tab[i].op,"SOU")){
			printf("%02hhX%02hhX%02hhX%02hhX\n", 3, tab[i].ra, tab[i].rb, tab[i].rc);
		}
		else if (!strcmp(tab[i].op,"MUL")){
			printf("%02hhX%02hhX%02hhX%02hhX\n", 2, tab[i].ra, tab[i].rb, tab[i].rc);
		}
		else if (!strcmp(tab[i].op,"DIV")){
			printf("%02hhX%02hhX%02hhX%02hhX\n", 4, tab[i].ra, tab[i].rb, tab[i].rc);
		}
		else if (!strcmp(tab[i].op,"PRINT")){
			printf("%02hhX%02hhX%02hhX%02hhX\n", 0xc, tab[i].ra, tab[i].rb, tab[i].rc);
		}
		else if (!strcmp(tab[i].op,"DIFZ")){
			printf("%02hhX%02hhX%02hhX%02hhX\n", 9, tab[i].ra, tab[i].rb, tab[i].rc);
		}
		else if (!strcmp(tab[i].op,"NOT")){
			printf("%02hhX%02hhX%02hhX%02hhX\n", 0xa, tab[i].ra, tab[i].rb, tab[i].rc);
		}
		else if (!strcmp(tab[i].op,"INF")){
			printf("%02hhX%02hhX%02hhX%02hhX\n", 0xb, tab[i].ra, tab[i].rb, tab[i].rc);
		}
		else if (!strcmp(tab[i].op,"JMPC")){
			printf("%02hhX%02hhX%02hhX%02hhX\n", 0xf, tab[i].ra, tab[i].rb, tab[i].rc);
		}
		else if (!strcmp(tab[i].op,"JMP")){
			printf("%02hhX%02hhX%02hhX%02hhX\n", 0xe, tab[i].ra, tab[i].rb, tab[i].rc);
		}
		}
	}

