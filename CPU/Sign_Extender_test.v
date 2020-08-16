`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:53:27 12/04/2019
// Design Name:   Sign_Extender
// Module Name:   D:/CPU/Sign_Extender_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Sign_Extender
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Sign_Extender_test;

	// Inputs
	reg [15:0] a;

	// Outputs
	wire [31:0] b;

	// Instantiate the Unit Under Test (UUT)
	Sign_Extender uut (
		.a(a), 
		.b(b)
	);

	initial begin
		// Initialize Inputs
		a = 100;//对100进行符号扩展
		// Wait 100 ns for global reset to finish
		#100;
		a = -100;//对-100进行符号扩展
        
		// Add stimulus here

	end
      
endmodule

