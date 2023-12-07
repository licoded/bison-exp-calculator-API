%{
#include "exp_parser.h"

#include <stdio.h>
%}

%option outfile="./exp_lexer.c" header-file="./exp_lexer.h"
%option warn nodefault
%option reentrant noyywrap never-interactive nounistd
%option bison-bridge

%%

    /* 整数 */
[0-9]+	{
            yylval->ival = atoi(yytext);
            return INTEGER;
    	}

    /* 运算符 */
[-+()=/*\n]	{return *yytext;}

    /* 空白被忽略 */
[ \t]    ;

    /* 其他字符都是非法的 */
.    { fprintf(stderr, "\033[31mERROR\033[0m: Unrecognized symbol: \033[34m%s\033[0m\n", yytext); exit(1); }

%%