module my_and_testbench();

reg [31:0] first;
reg [31:0] second;
wire [31:0] result;

my_and try_and(.first(first),.second(second), .result(result));

initial
  begin
		first = 32'hF114002A;
		second = 32'hA116021C;
		
		#5 first = 32'hBAAACC00;
		   second = 32'hDBB44050;
			
	end
	
initial
  begin
   $monitor("Testing the 32-bit and\n 32-bit and: time = %2d, first =%1h, second=%1h, and=%1h", $time, first, second, result);
  end
 
endmodule