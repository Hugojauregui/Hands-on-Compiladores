# Analizador Léxico - Subconjunto de C

## Integrantes del Equipo
* Hugo Johnathan Jauregui Rabelero
* Jesus Ramos Melendez

## Descripción
Analizador léxico desarrollado en C y Flex para la materia de Compiladores.
Reconoce tokens de un subconjunto de C: palabras reservadas, operadores, identificadores y comentarios.

## Requisitos (Windows)
* Flex (WinFlexBison)
* GCC (MinGW o similar)

## Cómo compilar y ejecutar
1. Generar código C:
   flex.exe lexer.l

2. Compilar ejecutable:
   gcc lex.yy.c -o analizador.exe

3. Ejecutar prueba:
   analizador.exe input.c