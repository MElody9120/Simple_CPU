`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:09:36 11/12/2019 
// Design Name: 
// Module Name:    DATA_RAM 
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
module DATA_RAM(
		input        Clock,//时钟信号
		output[31:0] dataout,//要读出的数据
		input [31:0] datain,//要进行写入的数据
		input [31:0] addr,	//读取或者写入数据的地址
		input        write , read//写和读信号
    );

   reg [31:0] ram [0:31];//定义32个32位的寄存器
	//是否使能了读信号，如是则读出对应存储器的数据，
	//如无使能读信号，输出XXXXXX
	//因为地址是字节对齐，一个存储器里面有四个字节，按字对齐
	//所以忽略掉地址的低两位，就和寄存器对应上了
	assign dataout = read ? ram[addr[6:2]] : 32'hxxxxxxxx;
	//如使能了写信号，在时钟上升沿将数据进行写入
	always @ (posedge Clock) begin
			if (write) ram[addr[6:2]] = datain;
	end

	integer i;
	//对32个寄存器进行初始化
	initial begin
			for ( i = 0 ; i <= 31 ; i = i + 1) ram [i] = i * i;
	end		

endmodule
