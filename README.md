# Ejemplo de shifter realizado en SystemVerilog

[![SHIFTER.jpg](https://i.postimg.cc/NMkfHZ4W/SHIFTER.jpg)](https://postimg.cc/PpNjG304)

Creamos un modulo para el shifter con las siguientes señales:

a      = Señales de entrada del shifter
b      = Señales de salida del shifter
shamt5 = Nos fija la cantidad de bit de corrimiento que queremos realizar
sh     = Señales de seleccion que nos selecciona la operacion que queremos realizar 

```
module shifter( input logic [31:0] a,  // señales de entrada
                output logic [31:0] y, // Señales de salida
                input logic [4:0] shamt5, // directivas de corrimiento
                input logic [1:0] sh); // High select 
always_comb
      case(sh)
        2'b00: y = a << shamt5;                       // LSL - corrimiento logico a la derecha
        2'b01: y = a >> shamt5;                       // LSR - corrimiento logico a la izquierda
        2'b10: y = {{32{a[31]}}, a} >> shamt5;  // ASR  y = a >>> shamt5; - Corrimiento aritmetico a la derecha
        2'b11: y = {a, a} >> shamt5;                 // ROR - Rotacion hacia derecha
      endcase
endmodule
		
```
##TestBench

* Utizamos una escala de 1ns/10ps para la simulacion. Definimos sh1 donde inicializamos las entradas y entre parentesis le ponemos con que señal se corresponde del modulo shifter.
* Realizamos una simulacion simple fijando la entrada a en 5 decimal (para facilitar la declaracion se utilizo el valor decimal y no el valor binario, aunque las operaciones se realizan en este segundo sistema)
* Fijamos el valor de corrimiento shmt5 = 2 (sirve la aclaracion anterior).
* Variamos la señal de entrada de 2 bit's para realizar las operaciones permitidas por el shifter:

00 - corrimiento logico a la derecha
01 - corrimiento logico a la izquierda
10 - Corrimiento aritmetico a la derecha
11 - Rotacion hacia la derecha

```
`timescale 1ns/10ps

module shifter_test();

	logic [31:0] a;  // señales de entrada
	logic [4:0] shamt5; // directivas de corrimiento
	logic [1:0] sh; // High select
	wire [31:0] y; // Señales de salida
	
shifter sh1	( 
			    	 .a(a), 
				     .shamt5(shamt5),
				     .sh(sh),
				     .y(y)
			    	 );
	
initial 
begin
a = 5; shamt5 = 2; sh= 2'b00; #100;
a = 5; sh = 2'b01; #100;
a = 5; sh = 2'b10; #100;
a = 5; sh = 2'b11; #100;
end
endmodule
```
