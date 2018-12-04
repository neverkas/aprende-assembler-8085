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