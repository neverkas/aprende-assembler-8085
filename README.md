## Acerca del contenido
Realizé esta recopilación de material para aquellos estudiantes que necesiten entender más en detalle como desarrollar programas básicos con el microprocesador intel 8085. En cada uno de los programas les dejo comentado la función de cada instrucción.

Debajo les dejo contenido adicional, explicando conceptos generales, y algunas de las instrucciones que se utilizaron durante el desarrollo de los programas.

Si hacen uso de este material agradecería mencionar la fuente.

***

 ## Conceptos generales
1. Etiquetas, son las que permiten identificar una instrucción de máquina para luego reutilizar (por ej. con condiciones de salto)
2. Al utilizar la instrucción **LXI**, te evitas tener que cargar el dato de una celda de dirección en el Registro A(Acumulador) y luego moverlo a un Registro. Esta instrucción permite cargar el dato  de forma inmediata en un registro. Se suele guardar en Registro Auxiliar H que representa el par HL, el registro par HL es un espacio en memoria que se representa con la M.
3. Cuando se realiza la suma entre 2 números, siempre hay un acarreo que sería como el excedente. Por ejemplo En el sistema de numeración decimal, el resultado de sumar 16+26 es 42, el primer acarreo de esa operación resulta de sumar las unidades(como 6+6 es 12), el acarreo es 1. Luego al resultado de sumar las decenas (1+2) se suma el primer acarreo (1+2=3, 3+1=4) que resulta 4 
4. Calcular el Complemento A1 de un numero binario es la reemplazar los 0 por 1, y los 1 por 0
5. Calcular el Complemento A2 de un binario es sumar 1 al Complemento A1
6. El Acumulador/Registro A guarda los resultados de operaciones realizadas por la UAL (Unidad Arimetológica)
7. Cada celda de dirección puede almacenar un máximo hasta 2 Bytes de datos (es decir 16 bits) pero también se puede guardar 2 Bytes por separado en dos celdas, esto sería guardando 1 Byte (8 bits) en cada celda.
8. Una instrucción de máquina se guarda en una celda de dirección única, donde que cada bit tiene asignado un peso que se incrementa de derecha a izquierda.
9. Las celdas de dirección se muestran en sistema de numeración hexadecimal, es decir en potencias de base 16 (si fuese octal sería base 8, binario base 2, etc..) Por ejemplo la celda de dirección 0100 es de menor peso que la celda 0103, y esta que 0104, etc..

***

## Conjunto de Instrucciones

**LDA (Load Accumulator)**

Carga el contenido de una celda en el Registro A(Acumulador)
```assembly
LDA 0002; Carga en el Acumulador el valor de la celda 0002
```
**STA (Storage Accumulator)**

Guarda el contenido del Acumulador en una celda dirección 
```assembly
STA 0002; Carga en la celda 0002 el valor que tenga el Acumulador
```
**CMA (Complement Accumulator)**

Determina el complemento A1 del contenido guardado en el Acumulador
```assembly
CMA; si el valor del Registro A era 0101, ahora sería 1010, los 1 se vuelven 0, y los 0 en 1.
```
**LXI (Load the Register pair inmediate)**

Carga en un par Registros, datos de hasta un máximo de 16bits ó 2 Bytes.
```assembly
LXI H, 0005; Carga en el registro par HL lo que contenga la celda 0005; (te evitas cargar primero en el Acumulador, y luego moverlo a un Registro)
```
**ADD (Addition)**

Guarda en el Registo A(Acumulador) el resultado de sumar el contenido del Acumulador y otro Registro
```assembly
ADD M; Guarda en el Registro A el resultado de sumar A más lo que tenga el registro M. Si el registro A ya tenia un valor, le sumará el resultado de la suma.
```
**ADC (addition with carry)**

Guarda en el Registro A(Acumulador) el resultado de sumar el contenido del ```
Acumulador, otro Registro y el acarreo de una suma anterior realizada.
```assembly
ADC M; Guarda en el Registro A el resultado de sumar A más el contenido del Registro M ó HL más el acarreo de una suma anterior. Ej.: 15+15, suma 5+5 el acarreo es 1, suma 1+1+acarreo
```
**INR (Increment)**

Incrementa en +1 el contenido de un registro

**INX (Increment Register Pair)**

Incrementa en +1 el contenido de un par de registros (es decir dos registros)

**DCR (Decrement)**

Decrementa en -1 el contenido de un registro
```assembly
DCR B; Al valor que tenga el Registro B le resto 1, se puede utilizar para una estructura de bucle, o recorrer celdas direccion.
```

**DCX (Decrement the register pair by 1)**
Decrementa en -1 el contenido de un par de registros (Ej. HL)

**JM (Jump if Minus)**

Salta a una celda de dirección si el Indicador de Estado "Signo" está habilitado (S=1)

**JMP (Unconditionally Jump)**

Salta a una celda de dirección sin ningun condición alguna, no necesito evaluar ninguna condición
```assembly
JMP SUMAR; salta a la instrucción con etiqueta "SUMAR" sin ninguna condición, se puede utilizar para sumas sucesivas, saltando a un Comparador (CPI,CMP,..) para que la recursividad tenga fin.
```

**JZ (Jump if Zero Z=1)**

Salta a una celda de dirección si el Indicador de Estado "Cero" está habilitado (Z=1)
```assembly
JZ GUARDAR; si el valor de la instrucción anterior es cero, entonces salta a la instrucción que se pase, sino continua a la siguiente instrucción que tenga debajo
```

**JNZ (Jump if no Zero Z=0)**

Salta a una celda de dirección si el Indicador de Estado "Cero" está deshabilitado (Z=0)
```assembly
JNZ SUMAR; si el valor de la instrucción anterior no es cero, entonces salto a la instrucción que le pase, sino continua a la siguiente instrucción que tenga debajo
```

**MOV (Move)**

Carga en un Registro el contenido de otro Registro.
```assembly
MOV A,B; mueve el contenido del Registro B al Registro A
```

**MVI (Move immediate 8-bit)**

Carga a un Registro un valor determinado (Ej. 00, 0A, ..) de máximo 1 Byte ó 8 bits es decir 2 números hexadecimales (que equivalen 4 bits cada uno).
```assembly
MVI A, 0F; Carga al Registro A el valor 0F que está Hexadecimal(en base 16), y equivale a 0000 1111 en binario(en base 2) ó 15 en Decimal (en base 10)
```

**ANI (Logical AND immediate with the accumulator)**

Guarda y compara el contenido del Acumulador con un dato de 8bits Por ejemplo 0F (que en binario es 0000 1111) ó F0 (que en binario es 1111 0000).
```assembly
ANI 0F; guardo en el Registro A los 4 bits de menor peso(los de la derecha), al comparar los 4 bits de mayor peso (los de la izquierda) con 0, estos devolverán 0. Recordemos que el operador de lógica AND devuelve 1, sólo si ambas proposiciones son 1, sino devuelve 0.
ANI F0; guardo en el Registro A los 4 bits de mayor peso(los de la izquierda) 
```

**RRC (Rotate the accumulator right)**
Rota(mueve) bits del Registro A(Acumulador) hacia la derecha, es decir los bits que esten ubicados a la izquierda se moveran a la derecha. Por ejemplo F0 en binario sería 1111 0000, para mover los 4 bits de la izquierda (es decir 1111) hacia la derecha, se debe ejecutar la instrucción RRC unas 4 veces, 1 vez por cada bit que se quiera mover.

**CPI (Compare immediate with the accumulator)**

Compara el contenido del Registro A(Acumulador) con un valor determinado, el valor que retorna se puede evaluar con Saltos Condicionales (JM,JZ,..) que saltan a cierta celda de dirección. El valor a comparar no puede superar los 8 bits(1 Byte).

Si se utiliza combinado con saltos condicionales, si se cumple la condición se habilita el Indicador de Estado que utiliza el salto condicional utilizado.

Posibles valores que puede retornar:
   - si es cero, el contenido del Acumulador y el valor con el que se compara, son iguales/idénticos.
   - si es negativo, el contenido del Acumulador es menor que el valor con el que se compara.

Posibles usos con saltos condicionales:
   - si quiero saber si el dato del Acumulador es igual a otro, utilizo el salto condicional JZ
   - si quiero determinar si el dato del Acumulador es menor a otro, utilizo el salto condicional JM
```assembly
CPI 01; Comparo el contenido del Registro A con el valor 01, solo se pasan valores, no registros ni direcciones.
```

**CMP (Compare Register or Memory with Accumulator)**
Compara el contenido del Registro A(Acumulador) con otro Registro. Los valores que retorna se pueden combinar con saltos condicionales, al igual que la instrucción CPI anteriormente explicada.
```assembly
CMP M; Comparo el contenido del Registro A con el dato del Registro M ó HL
```
