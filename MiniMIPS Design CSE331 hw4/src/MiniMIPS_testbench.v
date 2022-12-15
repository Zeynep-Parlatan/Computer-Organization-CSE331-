module MiniMIPS_testbench();

	reg [15:0] instruction;
	wire [31:0] result;
	
MiniMIPS try_mips(.instruction(instruction), .result(result));
/*reg clk;
initial clk=1'b1;

always
	begin
	#2 clk= ~clk;
	end
*/
	
initial 
	begin
		$readmemb("registers.txt", try_mips.register.mips_registers.registers);
		$readmemb("data.txt", try_mips.Datamem.mips_data_memory.memregisters);
	end

	
initial
	begin
		
		//****************************AND*****************************//
		
		instruction = 16'b0000010011001000;			//and $R1, $R2, $R3
		//$readmemb("registers.txt", try_mips.register.mips_registers.registers);
		$writememb("registers_out.txt", try_mips.MiniMIPS.register.mips_registers.registers);
		$writememb("data_out.txt", try_mips.Datamem.mips_data_memory.memregisters);
		
		#5
		instruction = 16'b0000101110111000	;		//and $R7, $R5, R$6
		//$readmemb("registers.txt", try_mips.register.mips_registers.registers);
		$writememb("registers_out.txt", try_mips.MiniMIPS.register.mips_registers.registers);
		$writememb("data_out.txt", try_mips.Datamem.mips_data_memory.memregisters);
		
		//*************************************************************//
		
		//****************************NOR*****************************//
		#5
		instruction = 16'b0000101001010100;			//nor $R2, $R5, $R1
		//$readmemb("registers.txt", try_mips.register.mips_registers.registers);
		$writememb("registers_out.txt", try_mips.MiniMIPS.register.mips_registers.registers);
		$writememb("data_out.txt", try_mips.Datamem.mips_data_memory.memregisters);
		
		#5
		instruction = 16'b0000101110111100;		//nor $R7, $R5, R$6
		//$readmemb("registers.txt", try_mips.register.mips_registers.registers);
		$writememb("registers_out.txt", try_mips.MiniMIPS.register.mips_registers.registers);
		$writememb("data_out.txt", try_mips.Datamem.mips_data_memory.memregisters);
		
		//*************************************************************//
		
		//****************************XOR*****************************//
		#5
		instruction = 16'b0000101001010011;			//xor $R2, $R5, $R1
		//$readmemb("registers.txt", try_mips.register.mips_registers.registers);
		$writememb("registers_out.txt", try_mips.MiniMIPS.register.mips_registers.registers);
		$writememb("data_out.txt", try_mips.Datamem.mips_data_memory.memregisters);
		
		#5
		instruction = 16'b0000101110111011;		//xor $R7, $R5, R$6
		//$readmemb("registers.txt", try_mips.register.mips_registers.registers);
		$writememb("registers_out.txt", try_mips.MiniMIPS.register.mips_registers.registers);
		$writememb("data_out.txt", try_mips.Datamem.mips_data_memory.memregisters);
		
		//*************************************************************//
		
		//****************************OR*****************************//
		#5
		instruction = 16'b0000101001010101;			//or $R2, $R5, $R1
		//$readmemb("registers.txt", try_mips.register.mips_registers.registers);
		$writememb("registers_out.txt", try_mips.MiniMIPS.register.mips_registers.registers);
		$writememb("data_out.txt", try_mips.Datamem.mips_data_memory.memregisters);
		
		#5
		instruction = 16'b0000101110111101;		//or $R7, $R5, R$6
		//$readmemb("registers.txt", try_mips.register.mips_registers.registers);
		$writememb("registers_out.txt", try_mips.MiniMIPS.register.mips_registers.registers);
		$writememb("data_out.txt", try_mips.Datamem.mips_data_memory.memregisters);
		
		//*************************************************************//
		
		//****************************ADD*****************************//
		#5
		instruction = 16'b0000101001010001;			//add $R2, $R5, $R1
		//$readmemb("registers.txt", try_mips.register.mips_registers.registers);
		$writememb("registers_out.txt", try_mips.MiniMIPS.register.mips_registers.registers);
		$writememb("data_out.txt", try_mips.Datamem.mips_data_memory.memregisters);
		
		#5
		instruction = 16'b0000101110111001;		//add $R7, $R5, R$6
		//$readmemb("registers.txt", try_mips.register.mips_registers.registers);
		$writememb("registers_out.txt", try_mips.MiniMIPS.register.mips_registers.registers);
		$writememb("data_out.txt", try_mips.Datamem.mips_data_memory.memregisters);
		
		//*************************************************************//
		
		//****************************SUB*****************************//
		#5
		instruction = 16'b0000101001010010;			//sub $R2, $R5, $R1
		//$readmemb("registers.txt", try_mips.register.mips_registers.registers);
		$writememb("registers_out.txt", try_mips.MiniMIPS.register.mips_registers.registers);
		$writememb("data_out.txt", try_mips.Datamem.mips_data_memory.memregisters);
		
		#5
		instruction = 16'b0000101110111010;		//sub $R7, $R5, R$6
		//$readmemb("registers.txt", try_mips.register.mips_registers.registers);
		$writememb("registers_out.txt", try_mips.MiniMIPS.register.mips_registers.registers);
		$writememb("data_out.txt", try_mips.Datamem.mips_data_memory.memregisters);
		
		//*************************************************************//
		
		//****************************LW*****************************//
		#5
		instruction = 16'b1000101001000010;			//lw $R2,2($R5)
		//$readmemb("registers.txt", try_mips.register.mips_registers.registers);
		$writememb("registers_out.txt", try_mips.MiniMIPS.register.mips_registers.registers);
		$writememb("data_out.txt", try_mips.Datamem.mips_data_memory.memregisters);
		
		#5
		instruction = 16'b1000101110000110;		//lw $R7,6($R5)
		//$readmemb("registers.txt", try_mips.register.mips_registers.registers);
		$writememb("registers_out.txt", try_mips.MiniMIPS.register.mips_registers.registers);
		$writememb("data_out.txt", try_mips.Datamem.mips_data_memory.memregisters);
		
		//*************************************************************//
		
		//****************************SW*****************************//
		#5
		instruction = 16'b1001010001000010;			//sw $R1,2($R2)
		//$readmemb("registers.txt", try_mips.register.mips_registers.registers);
		$writememb("registers_out.txt", try_mips.MiniMIPS.register.mips_registers.registers);
		$writememb("data_out.txt", try_mips.Datamem.mips_data_memory.memregisters);
		
		#5
		instruction = 16'b1001010110000001;		//sw $R6, 1($R2)
		//$readmemb("registers.txt", try_mips.register.mips_registers.registers);
		$writememb("registers_out.txt", try_mips.MiniMIPS.register.mips_registers.registers);
		$writememb("data_out.txt", try_mips.Datamem.mips_data_memory.memregisters);
		
		//*************************************************************//

	end

initial
  begin
   $monitor("Testing the miniMIPS\n time=%2d,ALUctr=%3b, Result=%32b, writedata=%32b,",$time, try_mips.Alucontrol.ALUctr, result, try_mips.register.write_data);
  end



endmodule
