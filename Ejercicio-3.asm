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