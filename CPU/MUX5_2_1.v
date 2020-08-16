`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:03:18 12/04/2019 
// Design Name: 
// Module Name:    MUX5_2_1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module MUX5_2_1(
	input [4:0] A,B,	//两个输入
	input Sel,			//选位信号
	output [4:0] O		//按选位信号给出输出
    );
	 
	assign O = Sel ? B : A;//用问号冒号表达式进行选择
							//assign语句进行赋值
endmodule
