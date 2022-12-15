module main_control_testbench();

	reg [3:0] opcode;
	wire [1:0] ALUop;
	wire RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Branchne;
	
main_control try_control(.opcode(opcode), .RegDst(RegDst), .ALUSrc(ALUSrc), .MemtoReg(MemtoReg), .RegWrite(RegWrite), .MemRead(MemRead), 
                         .MemWrite(MemWrite), .Branch(Branch), .Branchne(Branchne), .ALUop(ALUop));
								 

initial 
  begin
		
		opcode = 4'b0000;			//R-type
		#10
			opcode = 4'b0001;		//addi
		#10
			opcode = 4'b0010;		//andi	
		#10
			opcode = 4'b0011;		//ori	
		#10
			opcode = 4'b0100;		//nori
		#10
			opcode = 4'b0101;		//beq
		#10
			opcode = 4'b0110;		//bne
		#10
			opcode = 4'b0111;		//slti
		#10
			opcode = 4'b1000;		//lw
		#10 
			opcode = 4'b1001;		//sw
		  
	end
	
initial
  begin
   $monitor("Testing the main control\n opcode=%4b => time = %2d, RegDst =%1b, ALUSrc=%1b, MemtoReg=%1b, RegWrite=%1b, MemRead=%1b, MemWrite=%1b, Branch=%1b, Branchne=%1b, ALUop1=%1b, ALUop0=%1b",
    	      opcode, $time, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Branchne, ALUop[1], ALUop[0]);
  end
 
endmodule								 