`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:55:38 12/06/2019 
// Design Name: 
// Module Name:    ALUop 
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
module ALUop(
	 input	[5:0]	func,//R型指令的func，为了识别是哪种R型指令
	 input	[1:0]	ALUctr,//Control模块输出的信号
	 output	[2:0]	ALU_op//告知ALU执行什么运算
    );
	 //是否是R型指令
	 wire i_Rt = ALUctr[1] & ~ALUctr[0];
	 //通过卡诺图进行化简，得出ALU_op的表达式
	 assign ALU_op[2] = (i_Rt & ((~func[2] & func[1]) | (func[2] & func[0]))) | ALUctr[0];
	 assign ALU_op[1] = (i_Rt & func[2] & func[1]) | (ALUctr[1] & ALUctr[0]);
	 assign ALU_op[0] = (i_Rt & func[2] & ~func[1]);

endmodule
