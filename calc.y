%{
#include "exp_parser.h"
#include "exp_lexer.h" 

void yyerror(int *formula, yyscan_t scanner, const char *msg);
%}

%code requires {
#ifndef YY_TYPEDEF_YY_SCANNER_T
#define YY_TYPEDEF_YY_SCANNER_T
typedef void* yyscan_t;
#endif
}

%output  "./exp_parser.c"
%defines "./exp_parser.h"
 
%define api.pure
%lex-param   { yyscan_t scanner }
%parse-param { int *formula }
%parse-param { yyscan_t scanner }


%union {
    int formula;
    int ival;
}

%type <formula> expr

%token    <ival> INTEGER
%left    '+' '-'
%left    '*' '/'

%%
program:
    statement;
statement:
     expr    {*formula = $1; printf("%d\n", $1);}
     ;
expr:
    INTEGER {$$ = $1;}
    |expr '+' expr    {$$ = $1 + $3;}
    |expr '-' expr    {$$ = $1 - $3;}
    |expr '*' expr    {$$ = $1 * $3;}
    |expr '/' expr    {$$ = $1 / $3;}
    |'('expr')'    {$$ = $2;}
    ;
%%

void yyerror(int *formula, yyscan_t scanner, const char *msg) {
	fprintf (stderr, "\033[31mERROR\033[0m: %s\n", msg);
}