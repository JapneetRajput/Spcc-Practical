%{
int printf_count = 0;
int scanf_count = 0;
%}

%%
"printf"    {printf_count++;}
"scanf"     {scanf_count++;}
[ \t\n]     {/* ignore whitespace and newline */}
.           {/* ignore other characters */}
%%

int main() {
    yylex();
    printf("Number of printf statements: %d\n", printf_count);
    printf("Number of scanf statements: %d\n", scanf_count);
    yywrap();
}
int yywrap(){
    return 1;
}
