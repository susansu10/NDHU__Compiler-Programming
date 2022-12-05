#include <stdio.h>
#include "minij.h"
#include "minij_parse.h"

char name[16];
int val;

int main(int argc,char *argv[]) {
    int t;

    yyin = fopen(argv[1],"r");
    yyparse();
}
