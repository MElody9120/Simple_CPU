`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:43:06 12/11/2019
// Design Name:   DATA_RAM
// Module Name:   D:/CPU/DATA_RAM_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DATA_RAM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DATA_RAM_test;

	// Inputs
	reg Clock;
	reg [31:0] datain;
	reg [31:0] addr;
	reg write;
	reg read;

	// Outputs
	wire [31:0] dataout;

	// Instantiate the Unit Under Test (UUT)
	DATA_RAM uut (
		.Clock(Clock), 
		.dataout(dataout), 
		.datain(datain), 
		.addr(addr), 
		.write(write), 
		.read(read)
	);

	initial begin
		// Initialize Inputs
		//无读出无写入，输出数据线为xxx
		Clock = 0;
		datain = 0;
		addr = 0;
		write = 0;
		read = 0;
		// Wait 100 ns for global reset to finish
		//读出1号寄存器的值
		#100;addr = 4;read = 1;
		//将100写入1号寄存器
		#100;read = 0;addr = 4;datain = 100;write = 1;
		//重新读出1号寄存器的值
		#100;write = 0;addr = 4;read = 1;
		
        
		// Add stimulus here

	end
	always #25 Clock = !Clock;
      
endmodule

