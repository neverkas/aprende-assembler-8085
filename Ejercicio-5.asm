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
