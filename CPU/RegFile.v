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
	input  [4:0]  Rn1,Rn2,Wn,//Rn1��Rn2Ϊ��Ҫ�����ļĴ�����ַ��WnΪ����Ҫд���ļĴ�����ַ
	input		  Write,//д�ź�
	input  [31:0] Wd,//Ҫд��Ĵ���������
	output [31:0] A,B,//�����������Ĵ�����ֵ
	input		  Clock//ʱ���ź�
    );

	reg [31:0] Register[1:31]; //����31��1-31����32λ�ļĴ���
	
	//������
	assign A = (Rn1 == 0)? 0 : Register[Rn1];
	assign B = (Rn2 == 0)? 0 : Register[Rn2];
	
	//д���ݣ�����ʱ�������ؽ���д�룩
	always @(posedge Clock) begin
		if ((Write) && (Wn != 0)) Register[Wn] <= Wd;//д�ź���Чʱ����д��
	end

endmodule
