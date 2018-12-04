; # Microprocesador: Intel 8085
; # Comienzo del programa: celda de dirección 0100
;
; # DESCRIPCION DEL PROGRAMA
; Almacenar en la celda de dirección 0002 el complemento A2 del contenido de la celda 0001
;
;-----------------------------------------------------;

LDA 0001;   0100 guardo en el Registro A(Acumulador) el contenido de la celda de dir 0001
CMA;        0103 guardo en el Registro A(Acumulador) el complemento A1 del contenido ya guardado
INR A;      0104 incremento el contenido del Registro A(Acumulador) para convertirlo a complemento A2
STA 0002;   0105 guardo el contenido del Registro A(Acumulador) en la celda de dir 0002
HLT;        0108 detengo el programa