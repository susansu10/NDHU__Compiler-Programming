%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include "minij.h"
	#include "minij_parse.h"
%}

%token CLASS PUB STATIC
%left  AND OR
%left  LT LE EQ
%left  ADD MINUS
%left  TIMES
%token LBP RBP LSP RSP LP RP
%token INT
%token IF ELSE
%token WHILE PRINT
%token ASSIGN
%token VOID MAIN STR
%token RETURN
%token SEMI COMMA
%token THIS NEW DOT
%token ID LIT TRUE FALSE
%token COMMENT
%%
prog	:	mainc cdcls
		{ printf("Program -> MainClass ClassDecl*\n");
		  printf("Parsed OK!\n"); }
	|
		{ printf("****** Parsing failed!\n"); }	
	;

mainc	:	CLASS ID LBP PUB STATIC VOID MAIN LP STR LSP RSP ID RP LBP stmts RBP RBP
		{ printf("MainClass -> class id lbp public static void main lp string lsp rsp id rp lbp Statemet* rbp rbp\n"); }
	;

cdcls	:	cdcl cdcls
		{ printf("(for ClassDecl*) cdcls : cdcl cdcls\n"); }
	|
		{ printf("(for ClassDecl*) cdcls : \n"); }
	;

cdcl	:	CLASS ID LBP vdcls mdcls RBP
		{ printf("ClassDecl -> class id lbp VarDecl* MethodDecl* rbp\n"); }
	|
		COMMENT
	;

vdcls	:	vdcl vdcls
		{ printf("(for VarDecl*) vdcls : vdcl vdcls\n"); }
	|
		{ printf("(for VarDecl*) vdcls : \n"); }
	;

vdcl	:	type ID SEMI
		{ printf("VarDecl -> Type id semi\n"); }
	;

mdcls	:	mdcl mdcls
		{ printf("(for MethodDecl*) mdcls : mdcl mdcls\n"); }
	|
		{ printf("(for MethodDecl*) mdcls : \n"); }
	;

mdcl	:	PUB type ID LP formals RP LBP vdcls stmts RETURN exp SEMI RBP
		{ printf("MethodDecl -> public Type id lp FormalList rp lbp Statements* return Exp semi rbp\n"); }
	;

formals	:	type ID frest
		{ printf("FormalList -> Type id FormalRest*\n"); }
	|
		{ printf("FormalList -> \n"); }
	;

frest	:	COMMA type ID frest
		{ printf("FormalRest -> comma Type id FormalRest\n"); }
	|
		{ printf("FormalRest -> \n"); }
	;

boolean   :	TRUE
		{ printf("boolean -> true\n"); }
	|
		FALSE
		{ printf("boolean -> false\n"); }
	;

type	:	INT LSP RSP
		{ printf("Type -> int lsp rsp\n"); }
	|
		boolean
		{ printf("Type -> boolean\n"); }
	|			
 		INT
		{ printf("Type -> int\n"); }
	| 
		ID
		{ printf("Type -> id\n"); }
	;

stmts	:	state stmts
		{ printf("(for Statement*) stmts : state stmts\n"); }
	|
		{ printf("(for Statement*) stmts :\n"); }
	;

state :		LBP stmts RBP
		{ printf("Statement -> lbp Statement* rbp\n"); }
	|
		IF LP exp RP state ELSE state
		{ printf("Statement -> if lp Exp rp Statement else Statement\n"); }
	|
		WHILE LP exp RP state
		{ printf("Statement -> while lp Exp rp Statement\n"); }
	|
		PRINT LP exp RP SEMI
		{ printf("Statement -> print lp Exp rp semi\n"); }
	|
		ID ASSIGN exp SEMI
		{ printf("Statement -> id assign Exp semi\n"); }
	|
		ID LSP exp RSP ASSIGN exp SEMI
		{ printf("Statement -> id lsp Exp rsp assign Exp semi\n"); }
	| 
		vdcl
		{ printf("Statement -> VarDecl\n"); }
	;	

exp	:	exp ADD exp
		{ printf("Exp -> Exp add Exp\n"); }
	|
		exp MINUS exp
		{ printf("Exp -> Exp minus Exp\n"); }
	|
		exp TIMES exp
		{ printf("Exp -> Exp times Exp\n"); }
	|
		exp AND exp
		{ printf("Exp -> Exp and Exp\n"); }
	|
		exp OR exp
		{ printf("Exp -> Exp or Exp\n"); }
	|
		exp LT exp
		{ printf("Exp -> Exp lt Exp\n"); }
	|
		exp LE exp
		{ printf("Exp -> Exp le Exp\n"); }
	|
		exp EQ exp
		{ printf("Exp -> Exp eq Exp\n"); }
	|
		ID LSP exp RSP
		{ printf("Exp -> id lsp Exp rsp\n"); }
	|
		exp LP explist RP
		{ printf("Exp -> id lp ExpList rp\n"); }
	| 
		LP exp RP
		{ printf("Exp -> lp Exp rp\n"); }
	|
		exp DOT exp
		{ printf("Exp -> Exp dot Exp\n"); }
	|
		LIT
		{ printf("Exp -> lit\n"); }
	|
		TRUE
		{ printf("Exp -> true\n"); }
	|
		FALSE
		{ printf("Exp -> false\n"); }
	|
		ID
		{ printf("Exp -> id\n"); }
	|
		THIS
		{ printf("Exp -> this\n"); }
	|
		NEW INT LSP exp RSP
		{ printf("Exp -> new int lsp Exp rsp\n"); }
	|
		NEW ID LP RP
		{ printf("Exp -> new id lp rp\n"); }
	;
		
explist      :	exp exrt
		{ printf("ExpList -> Exp ExpRest*\n"); }
	|
		{ printf("ExpList -> \n"); }
	;

exrt	:	COMMA exp exrt
		{ printf("ExpRest -> comma exp\n"); }
	|
		{ printf("ExpRest -> \n"); }
	;
%%

int yyerror(char *s)
{
	printf("%s\n",s);
        return 1;
}

