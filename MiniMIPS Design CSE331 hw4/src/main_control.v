module main_control(
	input [3:0] opcode,
	output [1:0] ALUop,
	output RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Branchne
);

wire signal_r, signal_lw, signal_sw, signal_beq, signal_addi, signal_andi, signal_ori, signal_nori, signal_slti, signal_bne;
wire [3:0] R, Lw, Sw, Beq, Bne, addi, andi, ori, nori, slti;
wire [1:0] Ra, Lwa, Swa, Beqa, Bnea, addia, andia, oria, noria, sltia;
wire [5:0] temp, temp2;
wire [3:0] temp3;
wire [4:0] temp4;
reg num=1'b0;
 
/****signal_r(opcode=0000)***************************/
not r0(R[3], opcode[3]);
not r1(R[2], opcode[2]);
not r2(R[1], opcode[1]);
not r3(R[0], opcode[0]);

and r4(Ra[1],R[3], R[2]);
and r5(Ra[0], R[1], R[0]);
and r6(signal_r, Ra[1], Ra[0]);
/****************************************************/


/*****signal_lw(opcode=1000)*************************/
not l0(Lw[2], opcode[2]);
not l1(Lw[1], opcode[1]);
not l2(Lw[0], opcode[0]);

and l3(Lwa[1], opcode[3], Lw[2]);
and l4(Lwa[0],Lw[1], Lw[0]);
and l5(signal_lw, Lwa[1], Lwa[0]);
/****************************************************/


/*****signal_sw(opcode=1001)*************************/
not s0(Sw[2], opcode[2]);
not s1(Sw[1], opcode[1]);

and s2(Swa[1], opcode[3], Sw[2]);
and s3(Swa[0], Sw[1], opcode[0]);
and s4(signal_sw, Swa[1], Swa[0]);
/****************************************************/


/*****signal_beq(opcode=0101)*************************/
not b0(Beq[3], opcode[3]);
not b1(Beq[1], opcode[1]);

and b2(Beqa[1], Beq[3], opcode[2]);
and b3(Beqa[0], Beq[1], opcode[0]);
and b4(signal_beq, Beqa[1], Beqa[0]);
/*****************************************************/


/******signal_addi(opcode=0001)************************************/
not ad0(addi[3], opcode[3]);
not ad1(addi[2], opcode[2]);
not ad2(addi[1], opcode[1]);

and ad3(addia[1], addi[3], addi[2]);
and ad4(addia[0], addi[1], opcode[0]);
and ad5(signal_addi, addia[1], addia[0]);
/*******************************************************************/


/*****signal_andi(opcode=0010)***************************************/
not an0(andi[3], opcode[3]);
not an1(andi[2], opcode[2]);
not an2(andi[0], opcode[0]);

and an3(andia[1], andi[3], andi[2]);
and an4(andia[0], opcode[1], andi[0]);
and an5(signal_andi, andia[1], andia[0]);
/********************************************************************/


/*****signal_ori(opcode=0011)****************************************/
not o0(ori[3], opcode[3]);
not o1(ori[2], opcode[2]);

and o2(oria[1], ori[3], ori[2]);
and o3(oria[0], opcode[1], opcode[0]);
and o4(signal_ori, oria[1], oria[0]);
/********************************************************************/


/*****signal_nori(opcode=0100)***************************************/
not n0(nori[3], opcode[3]);
not n1(nori[1], opcode[1]);
not n2(nori[0], opcode[0]);

and n3(noria[1], nori[3], opcode[2]);
and n4(noria[0], nori[1], nori[0]);
and n5(signal_nori, noria[1], noria[0]);
/*********************************************************************/


/*****signal_slti(opcode=0111)***************************************/
not sl0(slti[3], opcode[3]);

and sl1(sltia[1], slti[3], opcode[2]);
and sl2(sltia[0], opcode[1], opcode[0]);
and sl3(signal_slti, sltia[1], sltia[0]);
/********************************************************************/


/******signal_bne(opcode=0110)***************************************/
not bn0(Bne[3], opcode[3]);
not bn1(Bne[0], opcode[0]);

and bn2(Bnea[1], Bne[3], opcode[2]);
and bn3(Bnea[0], opcode[1], Bne[0]);
and bn4(signal_bne, Bnea[1], Bnea[0]);
/*********************************************************************/



/****RegDst*****/
or mc1(RegDst, signal_r, num);

/****ALUSrc*****/
or mc2(temp[5], signal_lw, signal_sw);
or mc3(temp[4], signal_addi, signal_andi);
or mc4(temp[3], signal_ori, signal_nori);
or mc5(temp[2], temp[5], temp[4]);
or mc6(temp[1], temp[3], temp[2]);
or mc7(ALUSrc, temp[1], signal_slti);

/****MemtoReg****/
or mc8(MemtoReg, signal_lw, num);

/*****RegWrite****/
or mc9(temp2[5], signal_r, signal_lw);
or mc10(temp2[4], signal_addi, signal_andi);
or mc11(temp2[3], signal_ori, signal_nori);
or mc12(temp2[2], temp2[5], temp2[4]);
or mc13(temp2[1], temp2[3], temp2[2]);
or mc14(RegWrite, temp2[1], signal_slti);

/*****MemRead*****/
or mc15(MemRead, signal_lw, num);

/*****MemWrite*****/
or mc16(MemWrite, signal_sw, num);

/*****Branch******/
or mc17(Branch, signal_beq, num);

/****Branchne******/
or mc18(Branchne, signal_bne, num);

/*****ALUop1*****/
or mc19(ALUop[1], signal_r, num);


/*****ALUop0******/
or mc20(ALUop[0], signal_beq, signal_bne);


endmodule
