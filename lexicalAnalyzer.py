
import re
operators = {
    "+": "Addition operator",
    "-": "Subtraction operator",
    "*": "Multplication operator",
    "/": "Division operator",
    "%": "Modulus operator",
    "&&": "Logical AND operator",
    "||": "Logical OR operator",
}
optr_keys = operators.keys()
symbols = {
    "(": "Left parenthesis",
    ")": "Right parenthesis",
    "{": "Left curly brace",
    "}": "Right curly brace",
    ";": "Semi colon",
    ",": "Comma"
}
symb_keys = symbols.keys()
print(symb_keys)
keywords = {"main": "Keyword", "printf": "Keyword", "if": "Keyword", "while": "Keyword",
            "for": "Keyword", "do": "Keyword", "return": "Keyword"}
keywords_keys = keywords.keys()
print(keywords_keys)
datatype = {"int": "Integer",
            "float": "Floating point", "double": "Double", "char": "Character"}
datatype_keys = datatype.keys()
print(datatype.keys())
preproder = {"define": "Pre processor derivative",
             "include": "Pre processor derivative"}
preproder_keys = preproder.keys()
print(preproder_keys)
f = open(r"lex/countPrintf.l", "r")
crap = f.read()
program = crap.split("\n")
count = 0
for line in program:
    count = count + 1
print("\nLine no.", count, " : ", line)
t = line.split(' ')
for i in t:
    tokens = re.split('(\W)', i)
for t in tokens:
    if t == '':
        tokens.remove(t)
flag = 0
for token in tokens:
    if (token in preproder_keys):
        print("#", token, preproder[token])
        break
    elif token in datatype_keys:
        print(token, "==", datatype[token], "datatype")
    elif token in keywords_keys:
        print(token, " == ", keywords[token])
    elif token == '"':
        if flag == 0:
            print(token, "Inverted commas start")
            flag = 1
    elif flag == 1:
        print(token, "Inverted commas end")
        flag = 0
    elif token in symb_keys:
        print(token, symbols[token], "== delimiter")
    elif token in optr_keys:
        print(token, " == ", operators[token])
    elif token != '#':
        print(token, " == identifier")
