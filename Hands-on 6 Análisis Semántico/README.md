# Hands-on 6: Análisis Semántico

## Integrantes
* Hugo Johnathan Jauregui Rabelero
* Jesus Ramos Melendez

## Descripción
Extensión del analizador sintáctico para incluir validaciones semánticas mediante una **Tabla de Símbolos** dinámica y una pila de **Scopes**.

## Características Implementadas
1. **Tabla de Símbolos:** Estructura en C (Lista enlazada) que almacena nombre, tipo y nivel de scope de cada identificador.
2. **Manejo de Scopes (Alcance):**
   - **Scope Global (0):** Variables accesibles desde todo el programa.
   - **Scopes Locales/Anidados:** Se incrementa el nivel al entrar en llaves `{` o funciones, y se decrementa al salir `}`, limpiando las variables locales.
3. **Validaciones Semánticas:**
   - **Detección de variables no declaradas:** Error si se usa una variable que no existe en el scope actual ni en los superiores.
   - **Detección de redeclaraciones:** Error si se declara una variable con el mismo nombre dos veces en el *mismo* scope.
   - **Shadowing:** Permite declarar una variable local con el mismo nombre que una global (válido en C).

## Ejecución
1. `bison -d parser.y`
2. `flex lexer.l`
3. `gcc parser.tab.c lex.yy.c -o semantico.exe`
4. `semantico.exe input.c`