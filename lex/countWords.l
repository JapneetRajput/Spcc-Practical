%{
#include<string.h>
int word_count = 0;
int char_count = 0;
int line_count = 0;
%}

%%
\n      {line_count++; char_count++;}
.       {char_count++;}
[a-zA-Z]+   {word_count++;}
%%

int main() {
    yylex();
    printf("Number of words: %d\n", word_count);
    printf("Number of characters: %d\n", char_count);
    printf("Number of lines: %d\n", line_count);
    yywrap();
}
int yywrap(){
    return 1;
}
