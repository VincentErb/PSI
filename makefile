compiler: y.tab.c lex.yy.c symbol.c asm.c
	gcc lex.yy.c y.tab.c symbol.c asm.c -o compiler -ly -ll

lex.yy.c: compiler.l
	flex compiler.l

y.tab.c: compiler.y
	yacc -d -t -v compiler.y

test: compiler
	./compiler < testsimple.c

asm: compiler
	./compiler < testsimple.c > test.s


