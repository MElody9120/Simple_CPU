`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:25:22 12/06/2019
// Design Name:   Control
// Module Name:   D:/CPU/Control_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Control_test;

	// Inputs
	reg [5:0] op;

	// Outputs
	wire RegDst;
	wire RegWrite;
	wire ALUSrc;
	wire MemWrite;
	wire MemRead;
	wire MemtoReg;
	wire Branch;
	wire [1:0] ALUctr;

	// Instantiate the Unit Under Test (UUT)
	Control uut (
		.op(op), 
		.RegDst(RegDst), 
		.RegWrite(RegWrite), 
		.ALUSrc(ALUSrc), 
		.MemWrite(MemWrite), 
		.MemRead(MemRead), 
		.MemtoReg(MemtoReg), 
		.Branch(Branch), 
		.ALUctr(ALUctr)
	);

	initial begin
		// Initialize Inputs
		op = 6'b000000;		//R型指令
		#50;op = 6'b100011;	//lw指令
		#50;op = 6'b101011;	//sw指令
		#50;op = 6'b000100;	//beq指令
		#50;op = 6'b001111;	//lui指令
		
        
		// Add stimulus here

	end
      
endmodule

