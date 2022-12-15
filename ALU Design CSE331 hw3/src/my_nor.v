module my_nor(
	input [31:0] first,
	input [31:0] second,
	output [31:0] result
);

nor n0(result[31], first[31], second[31]);
nor n1(result[30], first[30], second[30]);
nor n2(result[29], first[29], second[29]);
nor n3(result[28], first[28], second[28]);
nor n4(result[27], first[27], second[27]);
nor n5(result[26], first[26], second[26]);
nor n6(result[25], first[25], second[25]);
nor n7(result[24], first[24], second[24]);
nor n8(result[23], first[23], second[23]);
nor n9(result[22], first[22], second[22]);
nor n10(result[21], first[21], second[21]);
nor n11(result[20], first[20], second[20]);
nor n12(result[19], first[19], second[19]);
nor n13(result[18], first[18], second[18]);
nor n14(result[17], first[17], second[17]);
nor n15(result[16], first[16], second[16]);
nor n16(result[15], first[15], second[15]);
nor n17(result[14], first[14], second[14]);
nor n18(result[13], first[13], second[13]);
nor n19(result[12], first[12], second[12]);
nor n20(result[11], first[11], second[11]);
nor n21(result[10], first[10], second[10]);
nor n22(result[9], first[9], second[9]);
nor n23(result[8], first[8], second[8]);
nor n24(result[7], first[7], second[7]);
nor n25(result[6], first[6], second[6]);
nor n26(result[5], first[5], second[5]);
nor n27(result[4], first[4], second[4]);
nor n28(result[3], first[3], second[3]);
nor n29(result[2], first[2], second[2]);
nor n30(result[1], first[1], second[1]);
nor n31(result[0], first[0], second[0]);

endmodule