module mips_registers_testbench ();

	reg [31:0] write_data;
	reg [2:0] read_reg_1, read_reg_2, write_reg;
	reg signal_reg_write, clk;
	wire [31:0] read_data_1, read_data_2;
	
mips_registers try(.read_reg_1(read_reg_1), .read_reg_2(read_reg_2), .write_reg(write_reg), .write_data(write_data), 
                   .signal_reg_write(signal_reg_write), .read_data_1(read_data_1), .read_data_2(read_data_2), .clk(clk));
						 
/*initial 
	begin
		$readmemb("registers.txt", try.mips_registers.registers);
	end
*/

initial clk=1'b1;

always
	begin
	#2 clk= ~clk;
	end
					 
initial 
	begin
		$readmemb("registers.txt", try.mips_registers.registers);
	end
	
initial
	begin
		read_reg_1 = 3'b010;			//register[2]
		read_reg_2 = 3'b011;			//register[3]
		write_reg = 3'b110;			//register[6]
		signal_reg_write = 1'b1;
		write_data = 32'b00000000000000000000000000000011;
		$writememb("registers_out.txt", try.mips_registers.registers);
		
		#5
		read_reg_1 = 3'b001;			//register[1]
		read_reg_2 = 3'b010;			//register[2]
		write_reg = 3'b011;			//register[3]
		signal_reg_write = 1'b1;
		write_data = 32'b00000000000000000000000000000000;
		$writememb("registers_out.txt", try.mips_registers.registers);
		
		#5
		read_reg_1 = 3'b111;			//register[7]
		read_reg_2 = 3'b100;			//register[4]
		write_reg = 3'b001;			//register[1]
		signal_reg_write = 1'b1;
		write_data = 32'b00000000000000000000000000000111;
		$writememb("registers_out.txt", try.mips_registers.registers);

	end

initial
  begin
   $monitor("Testing the mips registers\n Rs and Rt: time = %2d, read_data_1 =%32b, read_data_2=%32b", $time, read_data_1, read_data_2);
  end

endmodule
