`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:12:26 12/11/2019 
// Design Name: 
// Module Name:    CPU 
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
module CPU(
	input Clock,Reset,//输入为时钟和复位使能信号
	//输出为指令执行结果、当前PC值和当前指令的操作码
	output [31:0] result,pc,inst
    );
	 
	 wire Zero;
	 wire [31:0] B_addr,addr;
	 wire [31:0] Inst;
	 wire RegDst,RegWrite,ALUSrc,MemWrite,MemRead,MemtoReg,Branch;
	 wire [2:0] ALU_op;
	 wire [4:0] Wn;
	 wire [31:0] Wd;
	 wire [31:0] A,B,ALU_B;
	 wire [31:0] ALU_Result;
	 wire [31:0] data_ram_dataout;
	
	//实例化fetch模块
	Fetch fetch(.B(Branch),
					.Z(Zero),
					.Reset(Reset),
					.Clock(Clock),
					.B_addr(B_addr),
					.addr(addr));
	//实例化指令取值模块			
	INST_ROM inst_rom(.addr(addr),
					 .Inst(Inst));		
	//实例化符号扩展模块
	Sign_Extender sign_extender(.a(Inst[15:0]), .b(B_addr));
	//实例化指令译码模块（生成对应的控制信号）
	Control_Unit control_unit(.op(Inst[31:26]),
									  .func(Inst[5:0]),
									  .RegDst(RegDst),
									  .RegWrite(RegWrite),
									  .ALUSrc(ALUSrc),
									  .MemWrite(MemWrite),
									  .MemRead(MemRead),
									  .MemtoReg(MemtoReg),
									  .Branch(Branch),
									  .ALU_op(ALU_op));
	//实例化5位2选1模块								  
	MUX5_2_1 mux1(.A(Inst[20:16]),
						.B(Inst[15:11]),
						.Sel(RegDst),
						.O(Wn));
	//实例化三个32位2选1模块				
	MUX32_2_1 mux2(.A(B),
						.B(B_addr),
						.Sel(ALUSrc),
						.O(ALU_B));
						
	MUX32_2_1 mux3(.A(ALU_Result),
						.B(data_ram_dataout),
						.Sel(MemtoReg),
						.O(Wd));
	//实例化寄存器模块					
	RegFile regfile(.Rn1(Inst[25:21]),
						 .Rn2(Inst[20:16]),
						 .Wn(Wn),
						 .Write(RegWrite),
						 .Wd(Wd),
						 .A(A),
						 .B(B),
						 .Clock(Clock));
	//实例化ALU单元模块					 
	ALU alu(.A(A),
			  .B(ALU_B),
			  .ALU_operation(ALU_op),
			  .Result(ALU_Result),
			  .Zero(Zero));
	//实例化数据储存器模块		  
	DATA_RAM data_ram(.Clock(Clock),
							.dataout(data_ram_dataout),
							.datain(B),
							.addr(ALU_Result),
							.write(MemWrite),
							.read(MemRead));
							
	assign result = Wd;
	assign pc = addr;
	assign inst = Inst;

endmodule
