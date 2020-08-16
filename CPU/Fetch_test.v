`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:53:52 12/11/2019
// Design Name:   Fetch
// Module Name:   D:/CPU/Fetch_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Fetch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Fetch_test;

	// Inputs
	reg B;
	reg Z;
	reg Reset;
	reg Clock;
	reg [31:0] B_addr;

	// Outputs
	wire [31:0] addr;

	// Instantiate the Unit Under Test (UUT)
	Fetch uut (
		.B(B), 
		.Z(Z), 
		.Reset(Reset), 
		.Clock(Clock), 
		.B_addr(B_addr), 
		.addr(addr)
	);

	initial begin
		// Initialize Inputs
		B = 0;
		Z = 0;
		Reset = 0;//复位地址
		Clock = 1;
		B_addr = 0;
		// Wait 100 ns for global reset to finish
		#50;
		B = 1;
		Z = 1;//进行跳转指令
		Reset = 1;//复位不使能
		B_addr = 1;//地址再加4
		#100;
		B = 0;
		Z = 0;
		Reset = 0;//复位地址
		#50;
		Reset = 1;//让地址自增
	end
	always #25 Clock = !Clock;
      
endmodule

