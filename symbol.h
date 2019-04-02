
#define tabSize 1024 
//STRUCTURES

struct line {
	char * type;
	char * id;
	int depth;
	int intInit;
	int isConst;
	int addr;
};

//FUNCTIONS 

// Function that add a symbole and his arguments to the table "tab"
//intInit = 1 => variable is initialized
int addSymbole(struct line * tab, int * tabIndex, int type, char * id, int depth, int intInit,  int isConst, int * currentAddr);

// Function that returns the index of a variable from its ID 
int findSymbole(struct line * tab, int * tabIndex, char * id);

// Function that returns the value of the intInit field of the line for a given id
int initFromSymbol(struct line * tab, int * tabIndex, char * id);

//Returns address from element given its ID
int addrFromSymbol(struct line * tab, int * tabIndex, char * id);

//Prints table
void printTable(struct line * tab, int * tabIndex);

//Adds a temp variable to symbol table
int addTemp(struct line * tab, int * tabIndex, int * currentAddr);

//Removes last element from table and returns its address
int pop(int * tabIndex, int * currentAddr);


