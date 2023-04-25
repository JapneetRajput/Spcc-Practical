%{
int verb_count = 0;
int adverb_count = 0;
int adjective_count = 0;
int noun_count = 0;
int other_count = 0;
%}

%%
[a-zA-Z]+   {
                switch (yytext[0]) {
                    case 'a': case 'e': case 'i': case 'o': case 'u':
                    case 'A': case 'E': case 'I': case 'O': case 'U':
                        verb_count++;
                        break;
                    case 'r':
                        adverb_count++;
                        break;
                    case 'j':
                        adjective_count++;
                        break;
                    case 'n':
                        noun_count++;
                        break;
                    default:
                        other_count++;
                        break;
                }
            }
[ \t\n]     {/* ignore whitespace and newline */}
.           {/* ignore other characters */}
%%

int main() {
    yylex();
    printf("Number of verbs: %d\n", verb_count);
    printf("Number of adverbs: %d\n", adverb_count);
    printf("Number of adjectives: %d\n", adjective_count);
    printf("Number of nouns: %d\n", noun_count);
    printf("Number of other words: %d\n", other_count);
    yywrap();
}
int yywrap(){
    return 1;
}