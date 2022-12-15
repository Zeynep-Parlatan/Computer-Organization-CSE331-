module my_xor_testbench();

reg [31:0] first;
reg [31:0] second;
wire [31:0] result;

my_xor try_xor(.first(first),.second(second), .result(result));

initial
  begin
		first = 32'hA2341000;
		second = 32'hCAB11318;
		
		#5 first = 32'hBEF44587;
		   second = 32'hDAAA2201;
			
		#5 first = 32'hFFFFFFFF;
		   second = 32'h10000001;
			
	end
	
initial
  begin
   $monitor("Testing the 32-bit xor\n 32-bit xor: time = %2d, first =%1h, second=%1h, xor=%1h", $time, first, second, result);
  end
 
endmodule