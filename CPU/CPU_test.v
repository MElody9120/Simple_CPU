`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:21:47 12/13/2019
// Design Name:   CPU
// Module Name:   D:/CPU/CPU_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPU_test;

	// Inputs
	reg Clock;
	reg Reset;

	// Outputs
	wire [31:0] result;
	wire [31:0] pc;
	wire [31:0] inst;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.Clock(Clock), 
		.Reset(Reset), 
		.result(result), 
		.pc(pc), 
		.inst(inst)
	);

	initial begin
		// Initialize Inputs
		Clock = 1;
		Reset = 0;
		// Wait 100 ns for global reset to finish
		#100;
		Reset = 1;
	end
	
	always #50 Clock = !Clock;
      
endmodule

