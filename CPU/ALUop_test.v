`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:17:15 12/06/2019
// Design Name:   ALUop
// Module Name:   D:/CPU/ALUop_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALUop
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALUop_test;

	// Inputs
	reg [5:0] func;
	reg [1:0] ALUctr;

	// Outputs
	wire [2:0] ALU_op;

	// Instantiate the Unit Under Test (UUT)
	ALUop uut (
		.func(func), 
		.ALUctr(ALUctr), 
		.ALU_op(ALU_op)
	);

	initial begin
		// Initialize Inputs
		func = 6'b100000;ALUctr = 2'b10;
		#50;func = 6'b100010;ALUctr = 2'b10;
		#50;func = 6'b100100;ALUctr = 2'b10;
		#50;func = 6'b100101;ALUctr = 2'b10;
		#50;func = 6'b100110;ALUctr = 2'b10;
		#50;func = 6'bxxxxxx;ALUctr = 2'b00;
		#50;func = 6'bxxxxxx;ALUctr = 2'b01;
		#50;func = 6'bxxxxxx;ALUctr = 2'b11;
        
		// Add stimulus here

	end
      
endmodule

