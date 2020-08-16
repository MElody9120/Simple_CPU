`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:35:25 12/04/2019 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
	input	[31:0]	A,B,//要进行运算的两个32位数
	input	[2:0]	ALU_operation,//ALU的操作码，一个操作码对应一种运算
	output[31:0]	Result,	//进行运算的两个32位数的结果
	output			Zero	//Zero信号，运算结果是否为0信号，为JEQ指令所用
    );
	 //对输入进来的两个数，按照输入进来的操作码对应的运算进行运算
	 assign Result =  (ALU_operation == 3'b000) ? A + B :
							(ALU_operation == 3'b100) ? A - B :
							(ALU_operation == 3'b001) ? A & B :
							(ALU_operation == 3'b101) ? A | B :
							(ALU_operation == 3'b010) ? A ^ B :
							//取第二个操作数的低16位放到高16位，低16位补0
							(ALU_operation == 3'b110) ? {B[15:0],16'h0} :
							32'hxxxxxxxx;//操作码输入错误
	
	assign Zero = ~|Result;//Result自身按位或运算最后再取反

endmodule
