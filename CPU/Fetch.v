`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:41:18 12/11/2019 
// Design Name: 
// Module Name:    Fetch 
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
module Fetch(
	//B：是否为跳转指令		Z：ALU运算结果为0
	//Reset：复位信号		Clock：时钟信号
	input B,Z,Reset,Clock,
	input [31:0] B_addr,//为跳转指令时为当前需要加上的地址数
	output [31:0] addr	//输出的需要进行译码的地址
    );
	
	reg [31:0] PC;
	wire [31:0] sum0,B_addr1,sum1,next_pc;
	wire sel = Z & B;//是否需要跳转
	
	//将输入的地址左移两位
	Left_2_Shifter U0(.I(B_addr),.O(B_addr1));
	//将PC地址加4
	ADD32 U1(.Num1(PC),.Num2(4),.Sum(sum0));
	//PC+4后再加上需转移的地址
	ADD32 U2(.Num1(sum0),.Num2(B_addr1),.Sum(sum1));
	//不需跳转时，选择PC+4；需跳转时，选择PC+4+需转移的地址
	MUX32_2_1 M1(.A(sum0),.B(sum1),.Sel(sel),.O(next_pc));
	
	assign addr = PC;//更新PC值
	
	always @(posedge Clock or negedge Reset)begin
		if(Reset == 0) PC = 0;//复位地址
		else				PC = next_pc;//赋值下条指令地址
	end
endmodule
