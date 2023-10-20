module top(input logic clk, reset,
			  output logic [31:0] WriteData, DataAdder,
			  output logic MemoryWrite);

	logic [31:0] PC, Instructions, ReadData;

	// instantiate processor and memories
	arm arm(clk, reset, PC, Instructions, MemoryWrite, DataAdder,
		WriteData, ReadData);
	imem imem(PC, Instructions);
	dmem dmem(clk, MemoryWrite, DataAdder, WriteData, ReadData);
endmodule