module my_or(
	input [31:0] first,
	input [31:0] second,
	output [31:0] result
);

or o0(result[31], first[31], second[31]);
or o1(result[30], first[30], second[30]);
or o2(result[29], first[29], second[29]);
or o3(result[28], first[28], second[28]);
or o4(result[27], first[27], second[27]);
or o5(result[26], first[26], second[26]);
or o6(result[25], first[25], second[25]);
or o7(result[24], first[24], second[24]);
or o8(result[23], first[23], second[23]);
or o9(result[22], first[22], second[22]);
or o10(result[21], first[21], second[21]);
or o11(result[20], first[20], second[20]);
or o12(result[19], first[19], second[19]);
or o13(result[18], first[18], second[18]);
or o14(result[17], first[17], second[17]);
or o15(result[16], first[16], second[16]);
or o16(result[15], first[15], second[15]);
or o17(result[14], first[14], second[14]);
or o18(result[13], first[13], second[13]);
or o19(result[12], first[12], second[12]);
or o20(result[11], first[11], second[11]);
or o21(result[10], first[10], second[10]);
or o22(result[9], first[9], second[9]);
or o23(result[8], first[8], second[8]);
or o24(result[7], first[7], second[7]);
or o25(result[6], first[6], second[6]);
or o26(result[5], first[5], second[5]);
or o27(result[4], first[4], second[4]);
or o28(result[3], first[3], second[3]);
or o29(result[2], first[2], second[2]);
or o30(result[1], first[1], second[1]);
or o31(result[0], first[0], second[0]);

endmodule