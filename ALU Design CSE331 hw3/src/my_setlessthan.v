module my_setlessthan(
	input [31:0] A,
	input [31:0] B,
	input C0,
	output C,
	output [31:0] Res,
	output [31:0] setres
   
);

wire C1,C2,C3;  //intermediate carries
reg n=1'b1;
reg n2=1'b0;

my_subtractor s0(.A(A), .B(B), .C0(C0), .C(C), .Res(Res));
and resand0(setres[0], Res[31], n);
and resand1(setres[1], Res[30], n2);
and resand2(setres[2], Res[29], n2);
and resand3(setres[3], Res[28], n2);
and resand4(setres[4], Res[27], n2);
and resand5(setres[5], Res[26], n2);
and resand6(setres[6], Res[25], n2);
and resand7(setres[7], Res[24], n2);
and resand8(setres[8], Res[23], n2);
and resand9(setres[9], Res[22], n2);
and resand10(setres[10], Res[21], n2);
and resand11(setres[11], Res[20], n2);
and resand12(setres[12], Res[19], n2);
and resand13(setres[13], Res[18], n2);
and resand14(setres[14], Res[17], n2);
and resand15(setres[15], Res[16], n2);
and resand16(setres[16], Res[15], n2);
and resand17(setres[17], Res[14], n2);
and resand18(setres[18], Res[13], n2);
and resand19(setres[19], Res[12], n2);
and resand20(setres[20], Res[11], n2);
and resand21(setres[21], Res[10], n2);
and resand22(setres[22], Res[9], n2);
and resand23(setres[23], Res[8], n2);
and resand24(setres[24], Res[7], n2);
and resand25(setres[25], Res[6], n2);
and resand26(setres[26], Res[5], n2);
and resand27(setres[27], Res[4], n2);
and resand28(setres[28], Res[3], n2);
and resand29(setres[29], Res[2], n2);
and resand30(setres[30], Res[1], n2);
and resand31(setres[31], Res[0], n2);


	
				
endmodule