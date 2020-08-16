`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:35:57 12/17/2019 
// Design Name: 
// Module Name:    INST_ROM 
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
module INST_ROM(
	 input [31:0] addr,//输入的地址
	 output [31:0] Inst//输出对应地址的指令
    );
	 
	 wire [31:0] ram [0:31];//定义32个32位的寄存器
	 
	 assign ram[5'h00]=0;		    //
	 assign ram[5'h01]=32'h3c011234;    //lui R1,0x1234  R1=0x12340000  Result=0x12340000
	 assign ram[5'h02]=32'h3c025678;    //lui R2,0x5678  R2=0x56780000  Result=0x56780000
	 assign ram[5'h03]=32'h00221820;    //add R3,R1,R2  R3=0x68ac0000  Result=0x68ac0000
	 assign ram[5'h04]=32'h00221822;    //sub R3,R1,R2  R3=0xbbbc0000  Result=0xbbbc0000
 	 assign ram[5'h05]=32'h00221824;    //and R3,R1,R2  R3=0x12300000	Result=0x12300000
	 assign ram[5'h06]=32'h00221825;    //or R3,R1,R2	 R3=0x567c0000	Result=0x567c0000
	 assign ram[5'h07]=32'h00221826;    //xor R3,R1,R2	 R3=0x444c0000	Result=0x444c0000
	 assign ram[5'h08]=32'h00631826;    //xor R3,R3,R3	 R3=0x00000000	Result=0x00000000
	 assign ram[5'h09]=32'hac610000;    //sw R1,1(R3)	 R3=0x00000000	Result=0x00000000
	 assign ram[5'h0a]=32'h8c640000;    //lw R4,1(R3)	 R3=0x12340000	Result=0x12340000
	 assign ram[5'h0b]=32'h10220000;    //beq R1,R2,0
	 assign ram[5'h0c]=32'h1021fffb;    //beq R1,R1,0xfffb
	 //因为地址是字节对齐，一个存储器里面有四个字节，按字对齐
	 //所以忽略掉地址的低两位，就和寄存器对应上了
	 assign Inst=ram[addr[6:2]];
endmodule
