`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:06:55 12/04/2019
// Design Name:   MUX5_2_1
// Module Name:   D:/CPU/MUX5_2_1_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MUX5_2_1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MUX5_2_1_test;

	// Inputs
	reg [4:0] A;
	reg [4:0] B;
	reg Sel;

	// Outputs
	wire [4:0] O;

	// Instantiate the Unit Under Test (UUT)
	MUX5_2_1 uut (
		.A(A), 
		.B(B), 
		.Sel(Sel), 
		.O(O)
	);

	initial begin
		// Initialize Inputs
		A = 2;
		B = 4;
		Sel = 0;//输出应为2
		// Wait 100 ns for global reset to finish
		#100;
		A = 2;
		B = 4;
		Sel = 1;//输出应为4
        
		// Add stimulus here

	end
      
endmodule

