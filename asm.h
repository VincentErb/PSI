#define tabSize 1024 
//STRUCTURES

struct tabInstruct {
	char * op;
	char * ra;
	char * rb;
	char * rc;
};

//FUNCTIONS 
void addInstruct(struct tabInstruct * tab, int * tabIndex, char * op,int ra,int rb,int rc);

void printInstruct(struct tabInstruct * tab, int * tabIndex);
