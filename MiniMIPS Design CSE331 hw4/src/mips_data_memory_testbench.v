module mips_data_memory_testbench ();

	reg [31:0] write_data;
	reg [31:0] address;
	reg signal_mem_write, signal_mem_read, clk;
	wire [31:0] read_data;
	
mips_data_memory tryData(.write_data(write_data), .address(address), .signal_mem_write(signal_mem_write),
								 .signal_mem_read(signal_mem_read), .clk(clk), .read_data(read_data));
						 

initial clk=1'b1;

always
	begin
	#2 clk= ~clk;
	end
					 
initial 
	begin				//reading data to registers
		$readmemb("data.txt", tryData.mips_data_memory.memregisters);
	end
	
initial
	begin
	
		signal_mem_write = 1'b0;
		signal_mem_read = 1'b1;
		address = 32'b00000000000000000000000000001000;				
		write_data = 32'b00000000000000000000000000000110;
		$writememb("data_out.txt", tryData.mips_data_memory.memregisters);
		
		#5
		signal_mem_write = 1'b1;
		signal_mem_read = 1'b0;
		address = 32'b00000000000000000000000000001100;
		write_data = 32'b00000000000000000000000000000001;
		$writememb("data_out.txt", tryData.mips_data_memory.memregisters);
		
		#5
		signal_mem_write = 1'b0;
		signal_mem_read = 1'b1;
		address = 32'b00000000000000000000000000001110;
		write_data = 32'b00000000000000000000000000000110;
		$writememb("data_out.txt", tryData.mips_data_memory.memregisters);

	end

initial
  begin
   $monitor("Testing the data memory\n Read_data: time = %2d, read_data =%32b", $time, read_data);
  end

endmodule
