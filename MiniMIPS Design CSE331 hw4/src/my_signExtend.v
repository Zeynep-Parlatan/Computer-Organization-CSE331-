//I implemented sign extended block
//First I use 2x1 mux and I decide whether to start with zero or one by looking at the most significant bit of the immediatefield.
module my_signExtend(
	//input mostSignificantbit,
	input [5:0] immediatefield,
	output [31:0] num
);

//ResMux= (mostSignificantbit')zero + (mostSignificantbit)one
wire not1;
wire [25:0] ResMux;
wire [25:0] and1;
wire [25:0] and2;
wire mostSignificantbit;

//Saving the most significant bit of immediatefield for use in multiplexer 
or ms(mostSignificantbit, immediatefield[5], 0);

//not of mostSignificantbit
not m0(not1, mostSignificantbit);

//(mostSignificantbit').zero
and m1(and1[25], not1, 0);
and m2(and1[24], not1, 0);
and m3(and1[23], not1, 0);
and m4(and1[22], not1, 0);
and m5(and1[21], not1, 0);
and m6(and1[20], not1, 0);
and m7(and1[19], not1, 0);
and m8(and1[18], not1, 0);
and m9(and1[17], not1, 0);
and m10(and1[16], not1, 0);
and m11(and1[15], not1, 0);
and m12(and1[14], not1, 0);
and m13(and1[13], not1, 0);
and m14(and1[12], not1, 0);
and m15(and1[11], not1, 0);
and m16(and1[10], not1, 0);
and m17(and1[9], not1, 0);
and m18(and1[8], not1, 0);
and m19(and1[7], not1, 0);
and m20(and1[6], not1, 0);
and m21(and1[5], not1, 0);
and m22(and1[4], not1, 0);
and m23(and1[3], not1, 0);
and m24(and1[2], not1, 0);
and m25(and1[1], not1, 0);
and m26(and1[0], not1, 0);

//(mostSignificantbit).one
and m27(and2[25], mostSignificantbit, 1);
and m28(and2[24], mostSignificantbit, 1);
and m29(and2[23], mostSignificantbit, 1);
and m30(and2[22], mostSignificantbit, 1);
and m31(and2[21], mostSignificantbit, 1);
and m32(and2[20], mostSignificantbit, 1);
and m33(and2[19], mostSignificantbit, 1);
and m34(and2[18], mostSignificantbit, 1);
and m35(and2[17], mostSignificantbit, 1);
and m36(and2[16], mostSignificantbit, 1);
and m37(and2[15], mostSignificantbit, 1);
and m38(and2[14], mostSignificantbit, 1);
and m39(and2[13], mostSignificantbit, 1);
and m40(and2[12], mostSignificantbit, 1);
and m41(and2[11], mostSignificantbit, 1);
and m42(and2[10], mostSignificantbit, 1);
and m43(and2[9], mostSignificantbit, 1);
and m44(and2[8], mostSignificantbit, 1);
and m45(and2[7], mostSignificantbit, 1);
and m46(and2[6], mostSignificantbit, 1);
and m47(and2[5], mostSignificantbit, 1);
and m48(and2[4], mostSignificantbit, 1);
and m49(and2[3], mostSignificantbit, 1);
and m50(and2[2], mostSignificantbit, 1);
and m51(and2[1], mostSignificantbit, 1);
and m52(and2[0], mostSignificantbit, 1);

// result of (mostSignificantbit')zero + (mostSignificantbit)one
or m53(ResMux[25], and1[25], and2[25]);
or m54(ResMux[24], and1[24], and2[24]);
or m55(ResMux[23], and1[23], and2[23]);
or m56(ResMux[22], and1[22], and2[22]);
or m57(ResMux[21], and1[21], and2[21]);
or m58(ResMux[20], and1[20], and2[20]);
or m59(ResMux[19], and1[19], and2[19]);
or m60(ResMux[18], and1[18], and2[18]);
or m61(ResMux[17], and1[17], and2[17]);
or m62(ResMux[16], and1[16], and2[16]);
or m63(ResMux[15], and1[15], and2[15]);
or m64(ResMux[14], and1[14], and2[14]);
or m65(ResMux[13], and1[13], and2[13]);
or m66(ResMux[12], and1[12], and2[12]);
or m67(ResMux[11], and1[11], and2[11]);
or m68(ResMux[10], and1[10], and2[10]);
or m69(ResMux[9], and1[9], and2[9]);
or m70(ResMux[8], and1[8], and2[8]);
or m71(ResMux[7], and1[7], and2[7]);
or m72(ResMux[6], and1[6], and2[6]);
or m73(ResMux[5], and1[5], and2[5]);
or m74(ResMux[4], and1[4], and2[4]);
or m75(ResMux[3], and1[3], and2[3]);
or m76(ResMux[2], and1[2], and2[2]);
or m77(ResMux[1], and1[1], and2[1]);
or m78(ResMux[0], and1[0], and2[0]);

//Concatenate part to make the number 32 bit
//First, I added the result of the multiplexer to the beginning of the number.
or r0(num[31], ResMux[25], 0);
or r1(num[30], ResMux[24], 0);
or r2(num[29], ResMux[23], 0);
or r3(num[28], ResMux[22], 0);
or r4(num[27], ResMux[21], 0);
or r5(num[26], ResMux[20], 0);
or r6(num[25], ResMux[19], 0);
or r7(num[24], ResMux[18], 0);
or r8(num[23], ResMux[17], 0);
or r9(num[22], ResMux[16], 0);
or r10(num[21], ResMux[15], 0);
or r11(num[20], ResMux[14], 0);
or r12(num[19], ResMux[13], 0);
or r13(num[18], ResMux[12], 0);
or r14(num[17], ResMux[11], 0);
or r15(num[16], ResMux[10], 0);
or r16(num[15], ResMux[9], 0);
or r17(num[14], ResMux[8], 0);
or r18(num[13], ResMux[7], 0);
or r19(num[12], ResMux[6], 0);
or r20(num[11], ResMux[5], 0);
or r21(num[10], ResMux[4], 0);
or r22(num[9], ResMux[3], 0);
or r23(num[8], ResMux[2], 0);
or r24(num[7], ResMux[1], 0);
or r25(num[6], ResMux[0], 0);

//Then I placed the number in the remaining 6 bits.
or r26(num[5], immediatefield[5], 0);
or r27(num[4], immediatefield[4], 0);
or r28(num[3], immediatefield[3], 0);
or r29(num[2], immediatefield[2], 0);
or r30(num[1], immediatefield[1], 0);
or r31(num[0], immediatefield[0], 0);



endmodule
