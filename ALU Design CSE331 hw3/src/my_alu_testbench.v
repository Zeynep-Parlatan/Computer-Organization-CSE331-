module my_alu_testbench();

reg [31:0] i1;
reg [31:0] i2;
reg [2:0] select;
reg [3:0] carri;
wire [7:0] carro;
wire [31:0] out;

my_alu try(.i1(i1), .i2(i2), .select(select), .out(out),.c_in(carri), .c_o(carro));

initial 
  begin
  
    //and
	 i1= 32'h10001001;
	 i2= 32'h00101000;
	 select=3'b000;
	 carri=3'b000;
	
	 #5 i1= 32'h10001001;
	   i2= 32'h00101000;
		 select=3'b001;
		 
	 #5 i1= 32'h10001001;
	   i2= 32'h00101000;
		 select=3'b010;
		 
	  #5 i1= 32'h10001001;
	    i2= 32'h00101000;
		  select= 3'b100;
		  
	  #5 i1= 32'h10001001;
	    i2= 32'h00101000;
		  select = 3'b101;
		  
	  #5 i1= 32'h10001001;
	    i2= 32'h00101000;
		  select = 3'b110;
		  
	  #5 i1= 32'h10001001;
	    i2= 32'h00101000;
		  select = 3'b111;
		  
		  
	end
	
initial
  begin
   $monitor("Testing the 32-bit alu\n 32-bit alu: time = %2d, i1 =%1h, i2=%1h, select=%3b, out=%1h", $time, i1, i2, select, out);
  end
 
endmodule