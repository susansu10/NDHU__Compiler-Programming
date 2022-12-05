%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "minij.h"
#include "minij_parse.h"
%}

ID      [A-Za-z][A-Za-z0-9_]*
LIT     [0-9][0-9]*
NONNL   [^\n]

%%
class             {return CLASS;}
public		{return PUB;}
static		{return STATIC;}
String		{return STR;}
void			{return VOID;}
main			{return MAIN;}
int			{return INT;}
if			{return IF;}
else			{return ELSE;}
while			{return WHILE;}
new			{return NEW;}
return		{return RETURN;}
this			{return THIS;}
true			{return TRUE;}
false			{return FALSE;}
"&&"			{return AND;}
"<"			{return LT;}
"<="			{return LE;}
"+"			{return ADD;}
"-"			{return MINUS;}
"*"			{return TIMES;}
"("			{return LP;}
")"			{return RP;}
"{"			{return LBP;}
"}"			{return RBP;}
","			{return COMMA;}
"."			{return DOT;}
System"."Out"."println         {return PRINT;}
"||"               {return OR;}
"=="               {return EQ;}
"["                {return LSP;}
"]"                {return RSP;}
";"               {return SEMI;}
"="                {return ASSIGN;}
{ID}               {return ID;}
{LIT}              {return LIT;}
"//"[^\n]*			 {return COMMENT;}
[ \t\n]		{/* skip BLANK */}
.			{/* skip redundant characters */}
%%

int yywrap()
{
     return(1);
}