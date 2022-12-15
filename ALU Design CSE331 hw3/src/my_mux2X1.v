//I used 2x1 mux to get 8x1 mux 

module my_mux2X1(
	input I0,
	input I1,
	input S0,
	output D

);

//D= S0'I0 + S0I1
wire not1;
wire and1;
wire and2;

not m0(not1, S0);
and m1(and1, not1, I0);
and m2(and2, S0, I1);
or m3(D, and1, and2);

endmodule
