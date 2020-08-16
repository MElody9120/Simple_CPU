`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:53:22 12/11/2019
// Design Name:   INST_ROM
// Module Name:   D:/CPU/INST_ROM_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: INST_ROM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module INST_ROM_test;

	// Inputs
	reg [31:0] addr;

	// Outputs
	wire [31:0] Inst;

	// Instantiate the Unit Under Test (UUT)
	INST_ROM uut (
		.addr(addr), 
		.Inst(Inst)
	);

	initial begin
		// Initialize Inputs
		addr = 4;//读出第一个寄存器的指令
		// Wait 100 ns for global reset to finish
		#100;
		addr = 8;//读出第二个寄存器的指令
        
		// Add stimulus here

	end   
	
endmodule

