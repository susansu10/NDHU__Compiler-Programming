mjparse:	minij.o minij_parse.o minij_lex.o
	gcc -o mjparse minij.o minij_parse.o minij_lex.o

debug:
	bison -d --report=all -o minij_parse.c minij_parse.y

minij_parse.h:	minij_parse.y
	bison -d -o minij_parse.c minij_parse.y

minij_parse.c:	minij_parse.y
	bison -d -o minij_parse.c minij_parse.y

minij_parse.o:	minij_parse.c minij.h minij_parse.h
	gcc -c -o minij_parse.o minij_parse.c

minij_lex.c:	minij_lex.l
	flex -ominij_lex.c minij_lex.l

minij_lex.o:	minij_lex.c minij.h minij_parse.h
	gcc -c -o minij_lex.o minij_lex.c

minij.o:	minij.c minij.h minij_parse.h
	gcc -c -o minij.o minij.c

clean:
	rm *.o minij_parse.h minij_lex.c minij_parse.c mjparse

