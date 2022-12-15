module my_32bit_adder_testbench(); 

reg [31:0] a;
reg [31:0] b;
reg  carry_in;
wire [31:0] sum;
wire carry_out;

my_32bit_adder try_adder (.S(sum), .C(carry_out), .A(a), .B(b), .C0(carry_in));

initial 
  begin
     a = 32'h20040001;
	  b = 32'h30050000; 
	  carry_in = 1'b0;
	  
    #5 a = 32'h45000110;
	    b = 32'hFFFFFFFF;
		 carry_in = 1'b0;
		 
    #5 a = 32'hAC000010;
	    b = 32'h36441000;
		
		 
    
  end
 
 
initial
  begin
   $monitor("Testing the 32-bit adder\n 32-bit adder: time = %2d, a =%1h, b=%1h, carry_in=%1b, sum=%1h, carry_out=%1b", $time, a, b, carry_in, sum, carry_out);
  end
 
endmodule