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

;-----------------------------------------------------;
; # Contenido Adicional
;
; ## Conceptos generales
; 1. El Acumulador/Registro A guarda los resultados de operaciones realizadas por la UAL (Unidad Arimetológica)
; 2. Cada celda de dirección puede almacenar máximo hasta 2 Bytes de datos (16 bits)
; pero también se puede guardar 2 Bytes por separado en dos celdas, guardando 1 Byte (8 bits) en cada celda.
; 3. Una instrucción de máquina se guarda en una celda de dirección única,
; donde que cada bit tiene asignado un peso que se incrementa de derecha a izquierda.
; 4. Las celdas de dirección se muestran en sistema de numeración hexadecimal, es decir 
; en potencias de base 16 (si fuese octal sería base 8, binario base 2, etc..)
; 5. La celda de dirección 0100 es de menor peso que la 0103, y esta que 0104, etc..
;
; ## Conjunto de instrucciones
; 1. LDA (Load Accumulator) carga datos en el Acumulador/Registro A 
; 2. STA (Storage Accumulator) guarda datos del Acumulador en una celda dirección 
;
