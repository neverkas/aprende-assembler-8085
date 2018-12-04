; # Microprocesador: Intel 8085
; # Comienzo del programa: celda de dirección 0100
;
; # DESCRIPCION DEL PROGRAMA
; Cargar en la celda de memoria de dirección 0001 el dato contenido por la celda de memoria 0000
;
;-----------------------------------------------------;

LDA 0000;   0100 cargo en el Registro A(Acumulador) el dato de la celda de dir 0000
STA 0001;   0103 guardo el contenido guardado en el Registro A(Acumulador) en la celda de dir 0001
HLT;        0106 detengo el programa