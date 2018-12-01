; # Microprocesador: Intel 8085
; # Comienzo del programa: celda de dirección 0100
;
; # DESCRIPCION DEL PROGRAMA
; Sumar dos cantidades de 2 Bytes cada una almacenada en dos celdas.
; La primera en la celda de dirección 0001 y 0002, la segunda en 0003 y 0004.
; Almacenar el resultado en la celda 0005 y 0006. 
;
;-----------------------------------------------------;

LXI H, 0001;    0100 guardo en HL(es decir M) el contenido de la celda 0001 (es de menor peso que 0002)
LDA 0003;       0103 guardo en el Registro A(Acumulador) el contenido de la celda 0003 (es de menor peso que 0004)
ADD M;          0106 guardo el resultado de sumar 0001 y 0002 y lo guardo en el Registro A(Acumulador)
STA 0005;       0107 guardo el el contenido del Registro A(Acumulador) en la celda 0005 (es de menor peso que 0006)
LXI H, 0002;    010A guardo en HL(es decir M) el contenido de la celda 0002 (es de mayor peso que 0001)
LDA 0004;       010D guardo en el Registro A(Acumulador) el contenido de la celda 0004 (de mayor peso que 0003)
ADC M;          0110 guardo el resultado de sumar el contenido de las celdas 0002, 0004 y el acarreo que había quedado guardado de la anterior suma
STA 0006;       0111 guardo el contenido del Registro A(Acumulador) en la celda 0006 (es de mayor peso que 0005)
HLT;            0114 detengo el programa

;-----------------------------------------------------;
; # Contenido Adicional
;
; ## Conceptos generales
; 1. Al utilizar la instrucción LXI, te evitas tener que cargar el dato de una celda de dirección
; en el Registro A(Acumulador) y luego moverlo a un Registro. Esta instrucción permite cargar el dato 
; de forma inmediata en un registro. Se suele guardar en Registro Auxiliar H que representa el par HL,
; el registro par HL es un espacio en memoria que se representa con la M.
; 2. La instrucción LXI permite cargar datos de hasta 16 bits (2 Bytes) en un Registro de una celda de dirección
; 3. Cuando se realiza la suma entre 2 números, siempre hay un acarreo que sería como el excedente,
; Ej. En sistema decimal, 16+26 es 42, el primer acarreo de esa operación resulta de sumar las unidades,
; como 6+6 es 12, el acarreo es 1, y se suma al resultado de sumar las decenas 1+2+(el acarreo 1) que es 4 
;
; ## Conjunto de instrucciones
; 1. LDA (Load Accumulator) carga datos en el Acumulador/Registro A 
; 2. STA (Storage Accumulator) guarda datos del Acumulador en una celda dirección 
; 3. LXI (Load the Register pair inmediate) carga hasta 16bits (2 Bytes) en un Registro el contenido de una celda de dir 
; 4. ADD (Addition) guarda en el Registo A(Acumulador) el resultado de sumar el contenido del Acumulador y otro Registro
; 5. ADC (addition with carry) guardo en el Registro A(Acumulador) el resultado de sumar el contenido del Acumulador, otro Registro y el acarreo de una suma anterior realizada.
;

