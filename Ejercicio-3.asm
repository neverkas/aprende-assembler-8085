; # Microprocesador: Intel 8085
; # Comienzo del programa: celda de dirección 0100
;
; # DESCRIPCION DEL PROGRAMA
; Sumar los contenidos de las celdas de dirección 0001 y 0002, almacenando el dato en la celda de dirección 0003 
;
;-----------------------------------------------------;

LXI H, 0001;    0100 guardo en el registro HL el contenido de la celda de dir 0001
LDA 0002;       0103 guardo en el Registro A(Acumulador) el contenido de la celda de dir 0002
ADD M;          0106 sumo al Registro A(Acumulador) el contenido del registro M (HL=M) y lo guardo en el Acumulador
STA 0003;       0107 guardo el contenido del Registro A(Acumulador) en la celda de dir 0003
HLT;            0110 detengo programa

;-----------------------------------------------------;
; # Contenido Adicional
;
; ## Conceptos generales
; 1. Al utilizar la instrucción LXI, te evitas tener que cargar el dato de una celda de dirección
; en el Registro A(Acumulador) y luego moverlo a un Registro. Esta instrucción permite cargar el dato 
; de forma inmediata en un registro. Se suele guardar en Registro Auxiliar H que representa el par HL,
; el registro par HL es un espacio en memoria que se representa con la M.
; 2. La instrucción LXI permite cargar datos de hasta 16 bits (2 Bytes) en un Registro de una celda de dirección
;
;
; ## Conjunto de instrucciones
; 1. LDA (Load Accumulator) carga datos en el Registro A (Acumulador)
; 2. STA (Storage Accumulator) guarda datos del Registro A(Acumulador) en una celda dirección 
; 3. ADD (Addition) guarda en el Registo A(Acumulador) el resultado de sumar el Registro A(Acumulador) y otro Registro
; 4. LXI (Load the Register pair inmediate) carga hasta 16bits (2 Bytes) en un Registro el contenido de una celda de dir 

