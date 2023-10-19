module controller(input logic          clk,reset,
						input logic  [31:12] Instruction,
						input logic  [3:0]   ALUFlags.
						output logic [1:0]   RegisterSrc,
						output logic         RegisterWrite,
						output logic [1:0]   ImmSrc,
						output logic         ALUSrc,
						output logic [1:0]   ALUControl,
						output logic         MemoryWrite, MemorytoRegister,
						output logic         PCSrc);
	logic [1:0] FlagW;
	logic PCS, RegisterW, MemoryW;
	
	decoder dec(Instructions[27:26], Instructions[25:20], Instructions[15:12],
					FlagW, PCS, RegisterW, MemoryW,
					MemorytoRegister, ALUSrc, ImmSrc, RegisterSrc, ALUControl);
	condlogic cl(clk, reset, Instructions[31:28], ALUFlags,
					 FlagW, PCS, RegisterW, MemoryW,
					 PCSrc, RegWrite, MemWrite);
endmodule