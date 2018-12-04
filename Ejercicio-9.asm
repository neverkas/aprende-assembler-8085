; # Microprocesador: Intel 8085
; # Comienzo del programa: celda de dirección 0100
;
; # DESCRIPCION DEL PROGRAMA
; Convertir un valor decimal codificado en binario de 3 digitos a un valor representado 
; en sistema binario si se sabe que:
; -las centenas estan almacenadas en la celda de dirección 0007
; -las decenas en la celda 0006
; -las unidades en la celda de dirección 0005
; Considerando que el valor esta comprendido entre 0 y 255, almacenar el resultado en la celda; 
; de dirección 0004.
  
MVI A, 00;      0100 Inicializo el Registro A(Acumulador) en cero

LXI H, 0007;    0102 Cargo en el Registro HL, el numero de las centenas de la celda 0007;
MVI B, 64;      0105 Cargo en el Registro B(Auxiliar) el número 100, en Hexadecimal es 64 (lo usaré para multiplicar el numero de las centenas)
CALL SUMAR;     0107 Salto a la subrutina "SUMAR", que multiplica el numero de las centenas por 100, es decir suma el numero 100 veces

DCX H;          010A Decremento la celda HL, para apuntar a la celda anterior (0006) que tiene el numero de las decenas
MVI B, 0A;      010B Cargo en el Registro B(Auxiliar) el número 10, en Hexadecimal es 0A (lo usaré para multiplicar el numero de las decenas)
CALL SUMAR;     010D Salto a la subrutina "SUMAR", que multiplica el numero de las decenas por 10, es decir sumara el numero 10 veces

DCX H;          0110 Decremento el valor de la celda HL, para apuntar a la celda anterior (0004) que tiene el numero de las unidades
MVI B, 01;      0111 Cargo en el Registro B(Auxiliar) el numero 1, en Hexadecimal es 1 también (lo usare para multiplicar el numero de las unidades)
CALL SUMAR;     0113 Salto a la subrtuina "SUMAR", que multiplica el numero de las unidades por 1, es decir sumará el numero 1 vez

STA 0004;       0116 Guardo en la celda 0004, el contenido del Registro A(Acumulador) que es el resultado de las sumas sucesivas(multiplicación)
HLT;            0119 Finalizo el programa

SUMAR:ADD M;    011A Guardo en el Registro A(Acumulador) la suma del Acumulador y el contenido del Registro HL ó M
DCR B;          011B Decremento el valor del Registro B en 1
JNZ SUMAR;      011C Evaluo la instrucción anterior, mientras (B != 0) el valor del Registro B sea distinto de cero, vuelvo a la instrucción con etiqueta "SUMAR", realizo sumas sucesivas
RET;            011F Retorno el resultado si la condición anterior no se cumple