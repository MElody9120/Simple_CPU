`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:11:44 12/04/2019 
// Design Name: 
// Module Name:    RegFile 
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
module RegFile(
	input  [4:0]  Rn1,Rn2,Wn,//Rn1、Rn2为需要读出的寄存器地址，Wn为数据要写到的寄存器地址
	input		  Write,//写信号
	input  [31:0] Wd,//要写入寄存器的数据
	output [31:0] A,B,//读出的两个寄存器的值
	input		  Clock//时钟信号
    );

	reg [31:0] Register[1:31]; //定义31（1-31）个32位的寄存器
	
	//读数据
	assign A = (Rn1 == 0)? 0 : Register[Rn1];
	assign B = (Rn2 == 0)? 0 : Register[Rn2];
	
	//写数据（需在时钟上升沿进行写入）
	always @(posedge Clock) begin
		if ((Write) && (Wn != 0)) Register[Wn] <= Wd;//写信号有效时进行写入
	end

endmodule
