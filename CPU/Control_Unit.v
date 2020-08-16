`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:31:07 12/06/2019 
// Design Name: 
// Module Name:    Control_Unit 
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
module Control_Unit(
	//一条32位指令中的操作码和func的值
	input	[5:0]	op,func,
	//对应的输出使能控制信号
	output RegDst,RegWrite,ALUSrc,
	output MemWrite,MemRead,MemtoReg,
	output Branch,
	output [2:0] ALU_op
    );
	
	wire [1:0] ALUctr;
	
	Control U0( .op(op),
					.RegDst(RegDst),
					.RegWrite(RegWrite),
					.ALUSrc(ALUSrc),
					.MemWrite(MemWrite),
					.MemRead(MemRead),
					.MemtoReg(MemtoReg),
					.Branch(Branch),
					.ALUctr(ALUctr));
					
	ALUop U1(.func(func),.ALUctr(ALUctr),.ALU_op(ALU_op));
endmodule
