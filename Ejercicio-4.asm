; # Microprocesador: Intel 8085
; # Comienzo del programa: celda de dirección 0100
;
; # DESCRIPCION DEL PROGRAMA
; Almacenar el contenido de la celda 0001 en la celda 0002 si es mayor que 5, y en la celda 0003 si es menor que 5
;
;-----------------------------------------------------;

LDA 0001;       0100 guardo en el Registro A(Acumulador) el contenido de la celda de dir 0001
CPI 05;         0103 comparo (A==5) si el contenido del Registro A(Acumulador) con el numero 5 
JM MENOR;       0105 realizo un salto a otra celda de dirección (etiquetada con MENOR) si se cumple (A < 0), si la instrucción anterior devuelve valor negativo, entonces el contenido del Acumulador es menor a 5 y el Indicador de Estado S(Signo) se activa
STA 0002;       0108 sino se cumple la condición anterior(es decir que el contenido del Acumulador es mayor que 5), guardo en la celda de dir 0002
HLT;            010B detengo el programa
MENOR:STA 0003; 010C guardo el contenido del Registro a(Acumulador) si se cumplia la condición de la instrucción de la celda 0105
HLT;            010F detengo el programa

;-----------------------------------------------------;
; # Contenido Adicional
;
; ## Conceptos generales
; 1. Etiquetas, son las que permiten identificar una instrucción de máquina para luego reutilizar (por ej. con condiciones de salto)
; 2. En el comparador CPI se compara con 05 en vez de sólo el número 5, porque permite guardar hasta 2 bits. 
; 3. CPI - Posibles valores que puede retornar:
;   a) si es cero, el contenido del Acumulador y el valor con el que se compara, son iguales/idénticos.
;   b) si es negativo, el contenido del Acumulador es menor que el valor con el que se compara.
; 4. CPI - Posibles usos con saltos condicionales:
;   a) si quiero saber si el dato del Acumulador es igual a otro, utilizo el salto condicional JZ
;   b) si quiero determinar si el dato del Acumulador es menor a otro, utilizo el salto condicional JM
;
; ## Conjunto de instrucciones
; 1. LDA (Load Accumulator) carga datos en el Acumulador/Registro A 
; 2. STA (Storage Accumulator) guarda datos del Acumulador en una celda dirección 
; 3. JM (Jump if Minus) salto a una celda de dirección si el Indicador de Estado "Signo" está habilitado (S=1)
; 4. CPI (Compare immediate with the accumulator) compara el contenido del Registro A(Acumulador) con un valor determinado, 
; el valor que retorna se puede evaluar con Saltos Condicionales (JM,JZ,..) que saltan a cierta celda de dirección. 
; Si la condición del salto se cumple se habilita el Indicador de Estado que utiliza el salto utilizado.
;
