/* 1. DECLARACIONES GLOBALES */
int globalA;
int globalB;
int resultadoGlobal;

/* 2. DECLARACIÓN DE FUNCIONES */
/* Definimos una función auxiliar para probar llamadas */
int calcularSuma(int a, int b) {
    int res;
    res = a + b;
    return res;
}

/* 3. FUNCIÓN PRINCIPAL Y BLOQUES */
int main() {
    /* 4. DECLARACIONES LOCALES */
    int localX;
    int localY;

    /* 5. ASIGNACIONES Y EXPRESIONES ARITMÉTICAS */
    globalA = 10;
    localX = 5;

    /* Probamos precedencia: (5 * 2) + 10 = 20 */
    localY = localX * 2 + globalA;

    /* 6. LLAMADAS A FUNCIONES */
    /* Pasamos variables globales y locales como argumentos */
    resultadoGlobal = calcularSuma(globalA, localY);

    /* 7. BLOQUES { ... } Y SCOPES ANIDADOS */
    {
        int variableInterna;
        variableInterna = 100;

        /* Shadowing: Esta variable 'localX' oculta a la 'localX' de afuera */
        int localX;
        localX = 999;

        /* Operación válida dentro del bloque usando variable externa (globalB) */
        globalB = variableInterna + localX;

        /* --- PRUEBAS DE ERRORES SEMÁNTICOS (Deben salir en consola) --- */

        /* Error A: Redeclaración en el mismo scope */
        int variableInterna;
    }

    /* --- MÁS ERRORES SEMÁNTICOS (Fuera del bloque) --- */

    /* Error B: Variable 'variableInterna' ya murió (fuera de scope) */
    localX = variableInterna;

    /* Error C: Variable nunca declarada */
    variableFantasma = 50;

    /* Error D: Función no declarada */
    funcionFalsa();

    return 0;
}
