%{
#include "validVariable.tab.h"
%}



%%
[a-zA-Z_][a-zA-Z0-9_]*  { yylval.strval = strdup(yytext); return IDENTIFIER; }
.|\n                   { return yytext[0]; }
%%
int yywrap() {
    return 1;
}
