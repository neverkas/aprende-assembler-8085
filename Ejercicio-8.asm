; # Microprocesador: Intel 8085
; # Comienzo del programa: celda de dirección 0100
;
; # DESCRIPCION DEL PROGRAMA
; Separar el Byte almacenado en la celda 0005 de manera que se almacenen los bits
; de menor peso en la celda 0006 y los de mayor peso en la celda 0007
;
;-----------------------------------------------------;

LDA 0005;   guardo en el Registro A(Acumulador) el contenido de la celda 0005 
ANI 0F;     comparo con el operador AND los 8 bits(1 Byte) del Acumulador con 0F (0F=0000 1111)
STA 0006;   guardo en la celda 0006 los bits de menor peso 

LDA 0005;   guardo de nuevo en el Registro A(Acumulador) el contenido de la celda 0005
ANI F0;     comparo con el operador AND los 8 bits(1 Byte) del Acumulador con F0 (F0 = 1111 0000)
RRC;        roto(muevo) los bits del Acumulador que quedaron a la izquierda, hacia la derecha
RRC;        roto(muevo) los bits del Acumulador que quedaron a la izquierda, hacia la derecha
RRC;        roto(muevo) los bits del Acumulador que quedaron a la izquierda, hacia la derecha
RRC;        roto(muevo) los bits del Acumulador que quedaron a la izquierda, hacia la derecha
STA 0007;   guardo en celda 0007 los bits de mayor peso del Registro A(Acumulador)
HLT;        finalizo el programa;