; # Microprocesador: Intel 8085
; # Comienzo del programa: celda de dirección 0100
;
; # DESCRIPCION DEL PROGRAMA
; Multiplicar por sumas sucesivas los contenidos de las celdas 0003 y 0004, luego almacenar el 
; resultado en la celda de dirección 0005.
; Observación: Los valores de menor peso, se guardan en celdas de dirección de menor peso.
;
;-----------------------------------------------------;

LXI H, 0003;    0100 guardo el valor que se sumará, en el registro HL (es decir M) el contenido de la celda 0003 (es de menor peso que 0004)
LDA 0004;       0103 guardo la cantidad de veces que se sumará el valor anterior, en el Registro A(Acumulador) el contenido de la celda 0004 (es de mayor peso que 0003)
CPI 00;         0106 comparo (A == 0) si el valor del Registro A(Acumulador) es igual a cero, si lo es retorna cero
JZ GUARDAR;     0108 si la instrucción anterior devuelve cero entonces realiza el salto condicional a la celda con etiqueta "GUARDAR", sino ejecuta la siguiente instrucción
MOV B,A;        010B guardo el valor del Registro A(Acumulador) en un Registro Auxiliar (el Registro B), que luego decrementaré de 1 en 1 hasta llegar a 0
MVI A, 00;      010C cambio el valor del Registro A(Acumulador) a cero, es donde guardaré el resultado de las sumas sucesivas del Registro M
SUMAR:ADD M;    010E guardo en el Acumulador el resultado de sumar el valor del Acumulador(que al principio es cero) y el Registro M 
DCR B;          010F guardo el resultado de restarle 1 al Registro B, este guarda la cantidad de veces que se debe sumar, y decrementara de 1 en 1 por cada suma realizada
JNZ SUMAR;      0110 comparo si (B!=0), vuelvo a la instrucción con etiqueta "SUMAR" mientras que la instrucción anterior (el valor Registro B) no sea cero, es decir es un bucle que se repetirá mientras se cumpla la condición
GUARDAR:STA 0005;0113 si la condición de la instrucción anterior no se cumple, entonces guardo en la celda 0005 el resultado de las sumas sucesivas guardadas en el Acumulador
HLT;            0116 detengo el programa