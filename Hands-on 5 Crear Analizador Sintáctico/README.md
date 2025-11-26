# Hands-on 5: Crear Analizador Sintáctico (Flex + Bison)

## Integrantes
* Hugo Johnathan Jauregui Rabelero
* Jesus Ramos Melendez

## Descripción
Analizador Sintáctico para un subconjunto del lenguaje C. Valida la estructura gramatical del código fuente utilizando **Bison** para definir las reglas de producción (CFG) y **Flex** para la obtención de tokens.

## Alcance de la Gramática
El parser valida las siguientes estructuras:
* **Declaraciones Globales:** Variables y directivas (#include, #define).
* **Funciones:** Definición de funciones con tipo de retorno, nombre y parámetros.
* **Bloques:** Estructuras delimitadas por llaves `{ ... }`.
* **Sentencias:**
  * Declaración de variables locales.
  * Asignaciones (`a = b + 5;`).
  * Llamadas a funciones (`print(x);`).
  * Retornos (`return 0;`).
* **Expresiones:** Aritmética básica (+, -, *, /) respetando precedencia.

## Instrucciones (Windows)
1. Generar los archivos del parser:
   `bison -d parser.y`
2. Generar el escáner léxico:
   `flex lexer.l`
3. Compilar el ejecutable:
   `gcc parser.tab.c lex.yy.c -o sintactico.exe`
4. Ejecutar:
   `sintactico.exe input.c`