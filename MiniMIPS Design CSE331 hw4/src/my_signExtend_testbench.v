module my_signExtend_testbench();

	//reg mostSignificantbit;
	reg [5:0] immediatefield;
	wire [31:0] num;
	
my_signExtend try(.immediatefield(immediatefield), .num(num));

initial
  begin
  
		immediatefield = 6'b010001;
		
		#5
			immediatefield = 6'b100011;
	end
	
initial
  begin
   $monitor("Testing the sign extend module\n sign extend : time = %2d, 6 bit immediatefield =%6b, 32 bit num=%32b", $time, immediatefield, num);
  end
 
endmodule
