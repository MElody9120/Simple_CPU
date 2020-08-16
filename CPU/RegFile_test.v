`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:21:45 12/04/2019
// Design Name:   RegFile
// Module Name:   D:/CPU/RegFile_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RegFile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RegFile_test;

	// Inputs
	reg [4:0] Rn1;
	reg [4:0] Rn2;
	reg [4:0] Wn;
	reg Write;
	reg [31:0] Wd;
	reg Clock;

	// Outputs
	wire [31:0] A;
	wire [31:0] B;

	// Instantiate the Unit Under Test (UUT)
	RegFile uut (
		.Rn1(Rn1), 
		.Rn2(Rn2), 
		.Wn(Wn), 
		.Write(Write), 
		.Wd(Wd), 
		.A(A), 
		.B(B), 
		.Clock(Clock)
	);

	initial begin
		// Initialize Inputs
		//往1号寄存器写入数据32
		Rn1 = 0;
		Rn2 = 0;//RegFile代码中无0号寄存器，读出的值会为0
		Wn = 1;//数据写入的地址为1号寄存器
		Write = 1;//使能写信号
		Wd = 32;//写入的数据为32
		Clock = 0;
		// Wait 100 ns for global reset to finish
		#100;
		//往2号寄存器写入数据32
		Wn = 2;//数据写入的地址为2号寄存器
		Write = 1;
		Wd = 32;//写入的数据也为32
		#100;
		//读出1号和2号寄存器的值，两个输出口都为32
		Rn1 = 1;
		Rn2 = 2;
		Write = 0;//不使能读信号
	end
		always #10 Clock = ~Clock;//生成时钟信号
		
endmodule

