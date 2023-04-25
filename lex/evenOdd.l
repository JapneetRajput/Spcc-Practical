%{
int even_count = 0;
int odd_count = 0;
%}

%%
[0-9]+  {
            int number = atoi(yytext);
            if (number % 2 == 0) {
                even_count++;
                printf("%d is even\n", number);
            } else {
                odd_count++;
                printf("%d is odd\n", number);
            }
        }
[ \t\n] {/* ignore whitespace and newline */}
.       {/* ignore other characters */}
%%

int main() {
    yylex();
    printf("Number of even integers: %d\n", even_count);
    printf("Number of odd integers: %d\n", odd_count);
    yywrap();
}
int yywrap(){
    return 1;
}
