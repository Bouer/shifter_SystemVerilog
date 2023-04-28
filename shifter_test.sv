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
#10
a = 5;
shamt5 = 2;
sh= 2'b00;
#100;
a = 5;
sh = 2'b01;
#100;
a = 4;
sh = 2'b10;
#100;
a = 5;
sh = 2'b11;
#100;
end
endmodule