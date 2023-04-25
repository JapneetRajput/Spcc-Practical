%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

%union {
    char *strval;
}

%token <strval> IDENTIFIER

%%

program:
    | program line
    ;

line:
    IDENTIFIER '\n'  { printf("Valid variable: %s\n", $1); free($1); printf("Enter variable name: ");}
    | '\n'
    ;

%%

int main(int argc, char *argv[]) {
    printf("Enter variable name: ");
    yyparse();
    return 0;
}

int yyerror(char *s) {
    printf("Error: %s\n", s);
    return 0;
}
