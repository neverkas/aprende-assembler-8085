; # Microprocesador: Intel 8085
; # Comienzo del programa: celda de dirección 0100
;
; # ENUNCIADO 2
; Almacenar en la celda de dirección 0002 el complemento A2 del contenido de la celda 0001
;
;-----------------------------------------------------;

LDA 0001;   0100 guardo en el Registro A(Acumulador) el contenido de la celda de dir 0001
CMA;        0103 guardo en el Registro A(Acumulador) el complemento A1 del contenido ya guardado
INR A;      0104 incremento el contenido del Registro A(Acumulador) para convertirlo a complemento A2
STA 0002;   0105 guardo el contenido del Registro A(Acumulador) en la celda de dir 0002
HLT;        0108 detengo el programa

;-----------------------------------------------------;
; # Contenido Adicional
;
; ## Conceptos generales
; 1. Calcular el Complemento A1 de un numero binario es la reemplazar los 0 por 1, y los 1 por 0
; 2. Determinar el Complemento A2 de un binario es sumar 1 al Complemento A1
;
; ## Conjunto de instrucciones
; 1. LDA (Load Accumulator) carga datos en el Registro A (Acumulador)
; 2. STA (Storage Accumulator) guarda datos del Registro A(Acumulador) en una celda dirección 
; 3. CMA (Complement Accumulator) determina el complemento A1 del contenido guardado en el Acumulador
; 4. INR (Increment) incrementa en +1 el contenido de un registro
