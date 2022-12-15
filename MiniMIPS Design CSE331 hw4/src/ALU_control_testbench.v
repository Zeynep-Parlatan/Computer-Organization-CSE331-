module ALU_control_testbench();

	reg [1:0] ALUop;
	reg [2:0] func;
	wire [2:0] ALUctr;
	
ALU_control try_ALU(.ALUop(ALUop), .func(func), .ALUctr(ALUctr));

initial 
  begin
  
		ALUop = 2'b00;					//lw-sw
		func = 3'b000;
		#10
			ALUop = 2'b01;				//beq-bne
			func = 3'b000;	
		#10
			ALUop = 2'b10;				//and		
			func = 3'b000;	
		#10
			ALUop = 2'b10;				//add
			func = 3'b001;	
		#10
			ALUop = 2'b10;				//sub
			func = 3'b010;
		#10
			ALUop = 2'b10;				//xor
			func = 3'b011;
		#10
			ALUop = 2'b10;				//nor
			func = 3'b100;
		#10
			ALUop = 2'b10;				//or
			func = 3'b101;
			
	end
	
initial
  begin
   $monitor("Testing the ALU control\n ALUop=%2b func=%3b => time = %2d, ALUctr =%3b",ALUop, func, $time, ALUctr);
  end
 
endmodule		