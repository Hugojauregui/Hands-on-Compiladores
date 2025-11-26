%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parser.tab.h" /* Archivo generado por Bison */

/* Fix para Windows */
#include <io.h>
#define isatty _isatty
#define YY_NO_UNISTD_H
%}

%option yylineno
%x COMENTARIO_BLOQUE

%%

    /* 1. Comentarios */
"//".* { }
"/*"                { BEGIN(COMENTARIO_BLOQUE); }
<COMENTARIO_BLOQUE>"*/" { BEGIN(INITIAL); }
<COMENTARIO_BLOQUE>(.|\n) { }

    /* 2. Preprocesador */
"#include".* { return PREPROC_INCLUDE; }
"#define"           { return PREPROC_DEFINE; }

    /* 3. Palabras Reservadas */
"int"               { return KW_INT; }
"float"             { return KW_FLOAT; }
"void"              { return KW_VOID; }
"return"            { return KW_RETURN; }

    /* 4. Identificadores (IMPORTANTE: Guardamos el nombre) */
[a-zA-Z_][a-zA-Z0-9_]* { yylval.sval = _strdup(yytext); return ID; }

    /* 5. Números */
[0-9]+(\.[0-9]+)?       { return NUMBER; }

    /* 6. Operadores y Delimitadores */
"+"                 { return OP_PLUS; }
"-"                 { return OP_MINUS; }
"*"                 { return OP_MULT; }
"/"                 { return OP_DIV; }
"="                 { return OP_ASSIGN; }
"("                 { return LPAREN; }
")"                 { return RPAREN; }
"{"                 { return LBRACE; }
"}"                 { return RBRACE; }
";"                 { return SEMICOLON; }
","                 { return COMMA; }

[ \t\n]+            { /* Ignorar */ }
.                   { printf("Error lexico: %s\n", yytext); }

%%

int yywrap() { return 1; }
