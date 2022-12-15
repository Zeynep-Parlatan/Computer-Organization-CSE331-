module mips_registers(

	output reg[31:0] read_data_1, read_data_2,
	input [31:0] write_data,
	input [2:0] read_reg_1, read_reg_2, write_reg,
	input signal_reg_write, clk

);
	
	reg [31:0] registers [7:0];
	
/* We don't need a signal to read Rs and Rt registers. They are read in every cycle.*/
	always @(*)
	begin
		read_data_1 <= registers[read_reg_1];
		read_data_2 <= registers[read_reg_2];
	end	
		
/************************************************************************************/
	
/*To write to the register; first we need to check whether the signal_reg_write is 1.
 Also, since we cannot change the contents of the zero register, we must check if the write_reg is zero.*/
	always @(posedge clk)
	begin
		if(signal_reg_write == 1 && write_reg != 000)
			registers[write_reg] <= write_data;
	end
/*************************************************************************************/

endmodule

