module my_xor(
	input [31:0] first,
	input [31:0] second,
	output [31:0] result
);

xor x0(result[31], first[31], second[31]);
xor x1(result[30], first[30], second[30]);
xor x2(result[29], first[29], second[29]);
xor x3(result[28], first[28], second[28]);
xor x4(result[27], first[27], second[27]);
xor x5(result[26], first[26], second[26]);
xor x6(result[25], first[25], second[25]);
xor x7(result[24], first[24], second[24]);
xor x8(result[23], first[23], second[23]);
xor x9(result[22], first[22], second[22]);
xor x10(result[21], first[21], second[21]);
xor x11(result[20], first[20], second[20]);
xor x12(result[19], first[19], second[19]);
xor x13(result[18], first[18], second[18]);
xor x14(result[17], first[17], second[17]);
xor x15(result[16], first[16], second[16]);
xor x16(result[15], first[15], second[15]);
xor x17(result[14], first[14], second[14]);
xor x18(result[13], first[13], second[13]);
xor x19(result[12], first[12], second[12]);
xor x20(result[11], first[11], second[11]);
xor x21(result[10], first[10], second[10]);
xor x22(result[9], first[9], second[9]);
xor x23(result[8], first[8], second[8]);
xor x24(result[7], first[7], second[7]);
xor x25(result[6], first[6], second[6]);
xor x26(result[5], first[5], second[5]);
xor x27(result[4], first[4], second[4]);
xor x28(result[3], first[3], second[3]);
xor x29(result[2], first[2], second[2]);
xor x30(result[1], first[1], second[1]);
xor x31(result[0], first[0], second[0]);


endmodule
