; # Microprocesador: Intel 8085
; # Comienzo del programa: celda de dirección 0100
;
; # DESCRIPCION DEL PROGRAMA
; Multiplicar por sumas sucesivas los contenidos de las celdas 0003 y 0004, luego almacenar el 
; resultado en la celda de dirección 0005.
;
;-----------------------------------------------------;

LXI H, 0003;    0100 guardo el valor que se sumará, en el registro HL (es decir M) el contenido de la celda 0003 (es de menor peso que 0004)
LDA 0004;       0103 guardo la cantidad de veces que se sumará el valor anterior, en el Registro A(Acumulador) el contenido de la celda 0004 (es de mayor peso que 0003)
CPI 00;         0106 comparo (A == 0) si el valor del Registro A(Acumulador) es igual a cero, si lo es retorna cero
JZ GUARDAR;      0108 si la instrucción anterior devuelve cero entonces realiza el salto condicional a la celda con etiqueta "GUARDAR", sino ejecuta la siguiente instrucción
MOV B,A;        010B guardo el valor del Registro A(Acumulador) en un Registro Auxiliar (el Registro B), que luego decrementaré de 1 en 1 hasta llegar a 0
MVI A, 00;      010C cambio el valor del Registro A(Acumulador) a cero, es donde guardaré el resultado de las sumas sucesivas del Registro M
SUMAR:ADD M;    010E guardo en el Acumulador el resultado de sumar el valor del Acumulador(que al principio es cero) y el Registro M 
DCR B;          010F guardo el resultado de restarle 1 al Registro B, este guarda la cantidad de veces que se debe sumar, y decrementara de 1 en 1 por cada suma realizada
JNZ SUMAR;      0110 comparo si (B!=0), vuelvo a la instrucción con etiqueta "SUMAR" mientras que la instrucción anterior (el valor Registro B) no sea cero, es decir es un bucle que se repetirá mientras se cumpla la condición
GUARDAR:STA 0005;0113 si la condición de la instrucción anterior no se cumple, entonces guardo en la celda 0005 el resultado de las sumas sucesivas guardadas en el Acumulador
HLT;            0116 detengo el programa

; ## Conceptos generales
; 1. Etiquetas, son las que permiten identificar una instrucción de máquina para luego reutilizar (por ej. con condiciones de salto)
; 2. Al utilizar la instrucción LXI, te evitas tener que cargar el dato de una celda de dirección
; en el Registro A(Acumulador) y luego moverlo a un Registro. Esta instrucción permite cargar el dato 
; de forma inmediata en un registro. Se suele guardar en Registro Auxiliar H que representa el par HL,
; el registro par HL es un espacio en memoria que se representa con la M.
; 3. La instrucción LXI permite cargar datos de hasta 16 bits (2 Bytes) en un Registro de una celda de dirección
; 4. En el comparador CPI se compara con 05 en vez de sólo el número 5, porque permite guardar hasta 2 bits. 
; 5. CPI - Posibles valores que puede retornar:
;   a) si es cero, el contenido del Acumulador y el valor con el que se compara, son iguales/idénticos.
;   b) si es negativo, el contenido del Acumulador es menor que el valor con el que se compara.
; 6. CPI - Posibles usos con saltos condicionales:
;   a) si quiero saber si el dato del Acumulador es igual a otro, utilizo el salto condicional JZ
;   b) si quiero determinar si el dato del Acumulador es menor a otro, utilizo el salto condicional JM
; 7. (Validar si esta ok) Los valores de menor peso, se guardan en celdas de dirección de menor peso, 
; por eso guardo 0003 primero para y luego 0004
;
;
; ## Conjunto de instrucciones
; 1. LDA (Load Accumulator) carga datos en el Acumulador/Registro A 
; 2. STA (Storage Accumulator) guarda datos del Acumulador en una celda dirección 
; 3. LXI (Load the Register pair inmediate) carga hasta 16bits (2 Bytes) en un Registro el contenido de una celda de dir 
; 4. ADD (Addition) guarda en el Registo A(Acumulador) el resultado de sumar el contenido del Acumulador y otro Registro
; 5. DCR (Decrement) decrementa en -1 el contenido de un registro
; 6. JZ (Jump if Zero Z=1) salto a una celda de dirección si el Indicador de Estado "Cero" está habilitado (Z=1)
; 7. JNZ (Jump if no Zero Z=0) salto a una celda de dirección si el Indicador de Estado "Cero" está deshabilitado (Z=0)
; 8. CPI (Compare immediate with the accumulator) compara el contenido del Registro A(Acumulador) con un valor determinado, 
; el valor que retorna se puede evaluar con Saltos Condicionales (JM,JZ,..) que saltan a cierta celda de dirección. 
; Si la condición del salto se cumple se habilita el Indicador de Estado que utiliza el salto utilizado.
;

