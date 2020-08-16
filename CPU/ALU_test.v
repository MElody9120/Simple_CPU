`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:43:09 12/04/2019
// Design Name:   ALU
// Module Name:   D:/CPU/ALU_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_test;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg [2:0] ALU_operation;

	// Outputs
	wire [31:0] Result;
	wire Zero;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.A(A), 
		.B(B), 
		.ALU_operation(ALU_operation), 
		.Result(Result), 
		.Zero(Zero)
	);

	initial begin
		// Initialize Inputs
		//A = 10,B = 10,做加法运算，结果为20
		A = 10;B = 10;ALU_operation = 0;、
		
		//A = 10,B = 10,做减法运算，结果为0
		#50;A = 10;B = 10;ALU_operation = 4;
		
		//A = 10,B = 10,做与运算，结果为10
		#50;A = 10;B = 10;ALU_operation = 1;
		
		//A = 10,B = 10,做或运算，结果为10
		#50;A = 10;B = 10;ALU_operation = 5;
		
		//A = 10,B = 10,做异或运算，结果为0
		#50;A = 10;B = 10;ALU_operation = 2;
		
		//B = 10，结果为0x0A00（655360）
		#50;A = 10;B = 10;ALU_operation = 6;
        
		// Add stimulus here

	end
      
endmodule

