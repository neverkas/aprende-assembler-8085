; # Microprocesador: Intel 8085
; # Comienzo del programa: celda de dirección 0100
;
; # DESCRIPCION DEL PROGRAMA
; Contar la cantidad de caracteres ASCII que conforman una lista almacenada a partir de la dirección 0001
; si se sabe que al finalizar la lista se presiona la tecla "enter" (código 0D) almacenar el resultado
; en la celda de dirección 0000 teniendo en cuenta que la lista no supera los 256 caracteres.
;
;-----------------------------------------------------;

LXI H, 0001;     0100 guardo en el Registro HL(es decir M) la celda de dirección 0001 que luego iré incrementado 
MVI A, 0D;       0103 guardo en el Registro A(Acumulador) el codigo de la tecla enter que es 0D, para luego comparar con el Registro H
MVI B, 00;       0105 guardo en el Registro B el valor cero, que irá en incremento, contando la cant de caracteres recorridos
COMPARAR:CMP M;  0108 comparo (A==M) si coincide el contenido del Acumulador (0D) y el Registro M, es porque se presionó la tecla Enter
JZ GUARDAR;      0109 salto si la condición de la instrucción anterior devuelve cero, sino ejecuto la siguiente instrucción
INR B;           010A sino se cumple la condición de CMP, no se realiza el salto, e incremento en+1 el Registro B que cuenta la cant de caracteres
INX H;           010B incremento en +1 el valor del Registro M (ó HL) avanzando a la siguiente celda de dirección, para leer el siguiente caracter
JMP COMPARAR;    010C hago un salto incondicional a la instrucción etiquetada "COMPARAR",
MOV A,B;         0110 guardo en el Registro A(Acumulador) la cantidad de caracteres contados del Registro B
GUARDAR:STA 0000;0111 guardo en la celda 0000 el contenido del Registro A(Acumulador)
HLT;             0114 detengo el programa

; ## Conceptos generales
; 1. Etiquetas, son las que permiten identificar una instrucción de máquina para luego reutilizar (por ej. con condiciones de salto)
; 2. Al utilizar la instrucción LXI, te evitas tener que cargar el dato de una celda de dirección
; en el Registro A(Acumulador) y luego moverlo a un Registro. Esta instrucción permite cargar el dato 
; de forma inmediata en un registro. Se suele guardar en Registro Auxiliar H que representa el par HL,
; el registro par HL es un espacio en memoria que se representa con la M.
; 3. La instrucción LXI permite cargar datos de hasta 16 bits (2 Bytes) en un Registro de una celda de dirección
; 4. En el comparador CPI se compara con 05 en vez de sólo el número 5, porque permite guardar hasta 2 bits. 
; 5. CMP - Posibles valores que puede retornar:
;   a) si es cero, el contenido del Acumulador y el valor con el que se compara, son iguales/idénticos.
;   b) si es negativo, el contenido del Acumulador es menor que el valor con el que se compara.
; 6. CMP - Posibles usos con saltos condicionales:
;   a) si quiero saber si el dato del Acumulador es igual a otro, utilizo el salto condicional JZ
;   b) si quiero determinar si el dato del Acumulador es menor a otro, utilizo el salto condicional JM
;
;
; ## Conjunto de instrucciones
; 1. LDA (Load Accumulator) carga datos en el Acumulador/Registro A 
; 2. STA (Storage Accumulator) guarda datos del Acumulador en una celda dirección 
; 3. LXI (Load the Register pair inmediate) carga hasta 16bits (2 Bytes) en un Registro el contenido de una celda de dir 
; 4. INR (Increment) incrementa en +1 el contenido de un registro
; 4. INX (Increment Register Pair) incrementa en +1 el contenido de un par de registros (es decir dos registros)
; 5. JZ (Jump if Zero Z=1) salto a una celda de dirección si el Indicador de Estado "Cero" está habilitado (Z=1)
; 6. JMP (Unconditionally Jump) salto a una celda de dirección sin ningun condición alguna, no necesito evaluar ninguna condición
; 7. CMP (Compare Register or Memory with Accumulator) compara el contenido del Registro A(Acumulador) con un valor determinado, 
; el valor que retorna se puede evaluar con Saltos Condicionales (JM,JZ,..) que saltan a cierta celda de dirección. 
; Si la condición del salto se cumple se habilita el Indicador de Estado que utiliza el salto utilizado.
;