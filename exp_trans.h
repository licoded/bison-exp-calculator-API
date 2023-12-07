/* 
 * 将表达式字符串转化为AST结构
 * File:   exp_trans.h
 * Author: Yongkang Li
 *
 * Created on December 7, 2023
 */

#ifndef TRANS_H
#define	TRANS_H

#include "exp_parser.h"
#include "exp_lexer.h"

#ifdef	__cplusplus
extern "C"
{
#endif

  int getAST (const char *input);

#ifdef	__cplusplus
}
#endif

#endif	/* EXP_TRANS_H */

