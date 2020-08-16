`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:22:32 12/06/2019
// Design Name:   Control_Unit_case
// Module Name:   D:/CPU/Control_Unit_case_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control_Unit_case
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Control_Unit_case_test;

	// Inputs
	reg [5:0] op;
	reg [5:0] func;

	// Outputs
	wire RegDst;
	wire RegWrite;
	wire ALUSrc;
	wire MemWrite;
	wire MemRead;
	wire MemtoReg;
	wire Branch;
	wire [2:0] ALU_op;

	// Instantiate the Unit Under Test (UUT)
	Control_Unit_case uut (
		.op(op), 
		.func(func), 
		.RegDst(RegDst), 
		.RegWrite(RegWrite), 
		.ALUSrc(ALUSrc), 
		.MemWrite(MemWrite), 
		.MemRead(MemRead), 
		.MemtoReg(MemtoReg), 
		.Branch(Branch), 
		.ALU_op(ALU_op)
	);

	initial begin
		// Initialize Inputs
		op = 6'b000000;
		func = 6'b100000;
		#50;
		op = 6'b000000;
		func = 6'b100010;
		#50;
		op = 6'b000000;
		func = 6'b100100;
		#50;
		op = 6'b000000;
		func = 6'b100101;
		#50;
		op = 6'b000000;
		func = 6'b100110;
		#50;
		op = 6'b100011;
		func = 6'bxxxxxx;
		#50;
		op = 6'b101011;
		func = 6'bxxxxxx;
		#50;
		op = 6'b1000100;
		func = 6'bxxxxxx;
		#50;
		op = 6'b001111;
		func = 6'bxxxxxx;
        
		// Add stimulus here

	end
      
endmodule

