`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:48:09 12/04/2019 
// Design Name: 
// Module Name:    Sign_Extender 
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
module Sign_Extender(
	input	[15:0] a,//要进行符号扩展的16位数
	output[31:0] b	//进行符号拓展之后的32位数
    );
//对a[15]进行判断，如果为1，则1扩展，为0，则0扩展
	assign b = {a[15] ? 16'hffff : 16'h0 , a};

endmodule
