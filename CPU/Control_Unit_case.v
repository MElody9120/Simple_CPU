`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:50:34 12/06/2019 
// Design Name: 
// Module Name:    Control_Unit_case 
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
module Control_Unit_case(
	input	[5:0]	op,func,
	output RegDst,RegWrite,ALUSrc,
	output MemWrite,MemRead,MemtoReg,
	output Branch,
	output [2:0] ALU_op
    );
	 
	 reg RegDst,RegWrite,ALUSrc,MemWrite,MemRead,MemtoReg,Branch;
	 reg [2:0] ALU_op;
	 
	 always@(op,func)
	 begin
		 case(op)
		 6'b000000:	begin
							RegDst = 1;
							RegWrite = 1;
							ALUSrc = 0;
							MemWrite = 0;
							MemRead = 0;
							MemtoReg = 0;
							Branch = 0;
							case(func)
								6'b100000:	ALU_op = 3'b000;
								6'b100010:	ALU_op = 3'b100;
								6'b100100:	ALU_op = 3'b001;
								6'b100101:	ALU_op = 3'b101;
								6'b100110:	ALU_op = 3'b010;
							endcase
						end
		 
		 6'b100011: 
						begin
								RegDst = 0;
								RegWrite = 1;
								ALUSrc = 1;
								MemWrite = 0;
								MemRead = 1;
								MemtoReg = 1;
								Branch = 0;
								ALU_op = 3'b000;
						end
						
		6'b101011:  
						begin
							RegDst = 1'bx;
							RegWrite = 0;
							ALUSrc = 1;
							MemWrite = 1;
							MemRead = 0;
							MemtoReg = 1'bx;
							Branch = 0;
							ALU_op = 3'b000;
						end
		
		6'b000100:  
						begin
							RegDst = 1'bx;
							RegWrite = 0;
							ALUSrc = 0;
							MemWrite = 0;
							MemRead = 0;
							MemtoReg = 1'bx;
							Branch = 1;
							ALU_op = 3'b100;
						end
		
		6'b001111:  
						begin
						RegDst = 0;
						RegWrite = 1;
						ALUSrc = 1;
						MemWrite = 0;
						MemRead = 0;
						MemtoReg = 0;
						Branch = 0;
						ALU_op = 3'b110;
						end
		
		 endcase
	end

endmodule
