`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:38:29 12/06/2019
// Design Name:   Control_Unit
// Module Name:   D:/CPU/Control_Unit_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control_Unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Control_Unit_test;

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
	Control_Unit uut (
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
		op = 6'b000000;func = 6'b100000;		//加法指令
		#50;op = 6'b000000;func = 6'b100010;	//减法指令
		#50;op = 6'b000000;func = 6'b100100;	//与运算
		#50;op = 6'b000000;func = 6'b100101;	//或运算
		#50;op = 6'b000000;func = 6'b100110;	//异或运算
		#50;op = 6'b100011;func = 6'bxxxxxx;	//lw指令
		#50;op = 6'b101011;func = 6'bxxxxxx;	//sw指令
		#50;op = 6'b000100;func = 6'bxxxxxx;	//beq指令
		#50;op = 6'b001111;func = 6'bxxxxxx;	//lui指令
        
		// Add stimulus here

	end
      
endmodule

