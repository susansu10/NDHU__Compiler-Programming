# Programing-Compiler
## 110-2 程式語言與編譯器
### HW01
#### Programming Assignment 1

Use lex (or flex) and yacc (or bison) to implement a front end (including a lexical
analyzer and a syntax recognizer) of the compiler for the MiniJ programming
language, which is a simplified version of Java especially designed for a
compiler construction project by Professor Chung Yung.
Ø See an attached file for the MiniJ lexical rules and grammar rules in details.
Ø You are requested to separate the C code, the Lex specification, the Yacc
specification into separated files.

Guideline:
1. You have to demonstrate your program in person and have the report in paper
with you.
2. You will get 15% bonus if you succeed in demonstrating your program AND
upload the report in laboratory session 2 (on March 29th/31st). The regular due
for demonstrating your program AND uploading the report in laboratory session
4 (on May 17th/19th), but after that 15% penalty will be given for lateness.
More precisely, if you get X in demonstration, and Y for the report:
Ø (March 29th/31st) In-class demonstration = (X * 70% + Y * 30%) * 115%
Ø (May 17th/19th) Your score = X * 70% + Y * 30%
Ø Late = (X * 70% + Y * 30%) * 85%
3. Your report has to include the following elements:
I. A cover page.
II. The problem description.
III. Highlight of the way you write the program.
IV. The program listing.
V. Test run results.
VI. Discussion.

#### The MiniJ Programming Language
##### The MiniJ Lexical Rules
###### Identifiers
An identifier is a sequence of letters, digits, and underscores, starting with a
letter. Uppercase letters are distinguished from lowercase. We usually use the
symbol id for an identifier.

###### Integer literals
A sequence of decimal digits is an integer literal that denotes the corresponding
integer value.

###### Binary operators
&& || < <= == + - *
We usually use the symbol op for a binary operator.

###### Reserved words
class public static void main String extends return int
boolean if else while System.out.println true false this new

###### Special symbols
{ } ( ) [ ] = ; . , !

###### Comments:
A comment begins with // and goes to the end of the line

#### The MiniJ Grammar
##### The MiniJ grammar is given by EBNF rules as follows.
Program → MainClass ClassDecl*

MainClass → class id lbp public static void main lp string lsp rsp

id rp lbp Statement* rbp rbp

ClassDecl → class id lbp VarDecl* MethodDecl* rbp

VarDecl → Type id semi

MethodDecl → public Type id lp FormalList rp lbp Statement* return

Exp semi rbp

FormalList → Type id FormalRest*
→

FormalRest → comma Type id

Type → int lsp rsp
→ boolean
→ int
→ id

Statement → lbp Statement* rbp
→ if lp Exp rp Statement else Statement
→ while lp Exp rp Statement
→ print lp Exp rp semi
→ id assign Exp semi
→ id lsp Exp rsp assign Exp semi
→ VarDecl

Exp → Exp add Exp
 → Exp minus Exp
 → Exp times Exp
 → Exp and Exp
 → Exp or Exp
 → Exp lt Exp
 → Exp le Exp
 → Exp eq Exp
→ id lsp Exp rsp
→ id lp ExpList rp
→ lp Exp rp
→ Exp dot Exp
→ lit
→ true
→ false
→ id
→ this
→ new int lsp Exp rsp
→ new id lp rp
→ not Exp

ExpList → Exp ExpRest*
→

ExpRest → comma Exp
#### 編譯過程
flex -ominij_lex.c minij_lex.l

bison -d –o minij_parse.c minij_parse.y

gcc -c minij_lex.c

gcc -c minij_parse.c

gcc -c minij.c

gcc -o mjparse.exe minij.o minij_lex.o minij_parse.o
#### 測試test
mjparse.exe test1.mj
