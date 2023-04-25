%{
int keyword_count = 0;
int identifier_count = 0;
int operator_count = 0;
%}

%%
"if"|"else"|"while"|"do"|"for"|"printf"   {keyword_count++;}
"="|"+"|"-"|"*"|"/"|"=="|"<="|">="|"<"|">"|";"   {operator_count++;}
[a-zA-Z][a-zA-Z0-9]*    {identifier_count++;}
[ \t\n]                 {/* ignore whitespace and newline */}
.                       {/* ignore other characters */}
%%

int main() {
    yylex();
    printf("Number of keywords: %d\n", keyword_count);
    printf("Number of identifiers: %d\n", identifier_count);
    printf("Number of operators: %d\n", operator_count);
    yywrap();
}
int yywrap(){
    return 1;
}
