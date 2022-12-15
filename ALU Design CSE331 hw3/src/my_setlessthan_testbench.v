module my_setlessthan_testbench();

reg [31:0] A;
reg [31:0] B;
reg  C0;
wire [31:0] Res;
wire C;
wire setres;

my_setlessthan try_set (.A(A), .B(B), .C0(C0), .C(C), .Res(Res), .setres(setres));

initial 
  begin
     A = 32'h00000001;
	  B = 32'h00000000; 
	  C0 = 1'b0;
	  
    #5 A = 32'b00000110;
	    B = 32'b00001000;
		 		 
    
  end
 
 
initial
  begin
   $monitor("Testing the setlessthan\n setlessthan: time = %2d, a =%4h, b=%4h, set=%1h", $time, A, B, setres);
  end
 
endmodule