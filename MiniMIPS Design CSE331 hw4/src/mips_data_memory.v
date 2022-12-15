module mips_data_memory(

	output reg[31:0] read_data,
	input [31:0] write_data,
	input [31:0] address,
	input signal_mem_write, signal_mem_read, clk
	
);

	reg [31:0] memregisters [256:0];
	
/*If the signal_mem_read signal is 1, reading from memory is performed.*/ 
	always @(*)
	begin
		if(signal_mem_read == 1)
			read_data <= memregisters[address];
	end
/************************************************************************/

/*If the signal_mem_write signal is 1, the operation of writing to memory is performed.*/
	always @(posedge clk)
	begin
		if(signal_mem_write == 1)
			memregisters[address] <= write_data;		
	end
/***************************************************************************************/ 
		
endmodule
	