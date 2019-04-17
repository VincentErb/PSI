/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    tMAIN = 258,
    tINT = 259,
    tCONST = 260,
    tPRINTF = 261,
    tBRACKETOPEN = 262,
    tBRACKETCLOSED = 263,
    tPAROPEN = 264,
    tPARCLOSED = 265,
    tAFFECT = 266,
    tPLUS = 267,
    tMINUS = 268,
    tSTAR = 269,
    tSLASH = 270,
    tCOMMA = 271,
    tENDEXPR = 272,
    tINTVAR = 273,
    tID = 274,
    tIF = 275,
    tNOT = 276,
    tDIFF = 277,
    tINF = 278,
    tWHILE = 279
  };
#endif
/* Tokens.  */
#define tMAIN 258
#define tINT 259
#define tCONST 260
#define tPRINTF 261
#define tBRACKETOPEN 262
#define tBRACKETCLOSED 263
#define tPAROPEN 264
#define tPARCLOSED 265
#define tAFFECT 266
#define tPLUS 267
#define tMINUS 268
#define tSTAR 269
#define tSLASH 270
#define tCOMMA 271
#define tENDEXPR 272
#define tINTVAR 273
#define tID 274
#define tIF 275
#define tNOT 276
#define tDIFF 277
#define tINF 278
#define tWHILE 279

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 38 "compiler.y" /* yacc.c:1909  */

	int e;
	char * c;

#line 107 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
