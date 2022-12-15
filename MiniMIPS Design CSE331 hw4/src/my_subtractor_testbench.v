module my_subtractor_testbench();

reg [31:0] A;
reg [31:0] B;
reg  C0;
wire [31:0] Res;
wire C;

my_subtractor try_sub (.A(A), .B(B), .C0(C0), .C(C), .Res(Res));

initial 
  begin
    A = 32'h00000003;
	  B = 32'h00000001; 
	  C0= 1'b0;
	  
    #5 A = 32'h00000008;
	    B = 32'h00000018;
		 
		 		 
    
  end
 
 
initial
  begin
   $monitor("Testing the 32-bit subtractor\n 32-bit subtractor: time = %2d, a =%1h, b=%1h, sum=%1h", $time, A, B, Res);
  end
 
endmodule
