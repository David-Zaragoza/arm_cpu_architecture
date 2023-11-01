module arm( input logic          clk, reset,
				output logic [31:0] PC,
				input logic  [31:0] Instructions,
				output logic        MemoryWrite,
				output logic [31:0] ALUResult, WriteData,
				input logic  [31:0] ReadData);
				
	logic [3:0] ALUFlags;
	logic       RegisterWrite, ALUSrc, MemtoReg, PCSrc;
	logic [1:0] RegisterSrc, ImmSrc, ALUControl;
	
	controller c(clk, reset, Instructions[31:12], ALUFlags,
					 RegisterSrc, RegisterWrite, ImmSrc,
					 ALUSrc, ALUControl,
					 MemoryWrite, MemorytoRegister, PCSrc);
	datapath dp(clk, reset,
					RegisterSrc, RegisterWrite, ImmSrc,
					ALUSrc, ALUControl,
					MemorytoRegister, PCSrc,
					ALUFlags, PC, Instructions,
					ALUResult, WriteData, ReadData);
endmodule
				
