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

void printInstruct(struct tabInstruct * tab, int * tabIndex){
	printf("\n");
	for (int i=0;i<(*tabIndex);i++){
		if (tab[i].rc != -1) {
			printf("%s %d, %d , %d \n",
			tab[i].op, tab[i].ra, tab[i].rb, tab[i].rc);
		}else {
			printf("%s %d, %d  \n",
			tab[i].op, tab[i].ra, tab[i].rb);
		}

	}
}
