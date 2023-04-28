module shifter( input logic [31:0] a,  // señales de entrada
                output logic [31:0] y, // Señales de salida
                input logic [4:0] shamt5, // directivas de corrimiento
                input logic [1:0] sh); // High select 
	
   always_comb
      case(sh)
        2'b00: y = a << shamt5;                 // LSL - logical shift left
        2'b01: y = a >> shamt5;                 // LSR - logical shift right
        2'b10: y = {{32{a[31]}}, a} >> shamt5;  // ASR  y = a >>> shamt5; - Arithmetic shift right
        2'b11: y = {a, a} >> shamt5;                 // ROR - 
      endcase

endmodule
