`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:05:39 12/06/2019 
// Design Name: 
// Module Name:    Control 
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
module Control(
	 input	[5:0] op,//操作码
	 //输出的信号线
	 output	RegDst,RegWrite,ALUSrc,
	 output	MemWrite,MemRead,MemtoReg,
	 output	Branch,
	 output	[1:0] ALUctr
    );
	//用卡诺图进行化简，得出判定每种指令最简洁的判定位数
	wire i_Rt = ~|op;				//R型指令
	wire i_lw = op[5] & ~op[3];		//lw指令
	wire i_sw = op[5] & op[3];		//sw指令
	wire i_beq = op[2] & ~op[1];	//beq指令
	wire i_lui = op[3] & op[2];		//lui指令
	
	//给对应的输出控制信号进行赋值
	assign RegDst 		= i_Rt;//为R型指令时使能
	//为R型指令或者lw、lui指令时使能寄存器写信号
	assign RegWrite 	= i_Rt | i_lw | i_lui;
	//为lw、sw、lui指令时使能ALU第二操作数来源为立即数信号
	assign ALUSrc 		= i_lw | i_sw | i_lui;
	assign MemWrite		= i_sw;//sw指令时使能主存写信号
	assign MemRead		= i_lw;//lw指令时使能主存读信号
	//lw指令时，使能写回数据为主存数据信号
	assign MemtoReg		= i_lw;
	assign Branch		= i_beq;//beq指令时使能跳转信号
	//控制ALUop模块的信号
	assign ALUctr[1] = i_Rt | i_lui;
	assign ALUctr[0] = i_beq | i_lui;
endmodule
