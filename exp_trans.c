/* 
 * 将表达式字符串转化为AST结构
 * File:   exp_trans.c
 * Author: Yongkang Li
 *
 * Created on December 7, 2023
 */

#include "exp_trans.h"

#include <stdlib.h>

int getAST (const char *input)
{
  int formula;
  yyscan_t scanner;
  YY_BUFFER_STATE state;

  if (yylex_init (&scanner))
    {
      // couldn't initialize
      return NULL;
    }

  state = yy_scan_string (input, scanner);
  if (yyparse (&formula, scanner))
    {
      // error parsing
      return NULL;
    }

  yy_delete_buffer (state, scanner);
  yylex_destroy (scanner);

  return formula;
}