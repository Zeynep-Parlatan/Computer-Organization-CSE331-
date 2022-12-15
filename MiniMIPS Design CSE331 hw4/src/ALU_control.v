module ALU_control(

	input [1:0] ALUop,
	input [2:0] func,
	output [2:0] ALUctr
	
);

wire [9:0] temp1, temp2, temp3;
wire notP0;
wire [2:0] notfunc;

//C2 = P1P0’F2’F1’F0’ + P1P0’F2F1’F0’ + P1P0’F2F1’F0

not no(notP0, ALUop[0]);			//P0'
not n1(notfunc[2], func[2]);		//F2'
not n2(notfunc[1], func[1]);		//F1'
not n3(notfunc[0], func[0]);		//F0'

and a1(temp1[9],ALUop[1], notP0);			//P1P0'
and a2(temp1[8],notfunc[2], notfunc[1]);	//F2'F1'
and a3(temp1[7], temp1[9], temp1[8]); 		//P1P0'F2'F1'
and a4(temp1[6], temp1[7], notfunc[0]);	//P1P0'F2'F1'F0'

and a5(temp1[5], func[2], notfunc[1]); 	//F2F1'
and a6(temp1[4], temp1[9], temp1[5]);		//P1P0'F2F1'
and a7(temp1[3], temp1[4], notfunc[0]);	//P1P0'F2F1'F0'

and a8(temp1[2], temp1[9], temp1[5]);		//P1P0'F2F1'
and a9(temp1[1],temp1[2], func[0]);			//P1P0'F2F1'F0

or o1(temp1[0], temp1[6], temp1[3]); 		//P1P0'F2'F1'F0' + P1P0'F2F1'F0'
or o2(ALUctr[2], temp1[0], temp1[1]);		//C2 = P1P0’F2’F1’F0’ + P1P0’F2F1’F0’ + P1P0’F2F1’F0

/********************************************************************************************************/

//C1 = P0 + P1P0’F2’F1’F0’ + P1P0’F2’F1F0’ + P1P0’F2F1’F0
and a10(temp2[9], notfunc[2], func[1]);		//F2'F1
and a11(temp2[8], temp1[9], temp2[9]);			//P1P0'F2'F1
and a12(temp2[7], temp2[8], notfunc[0]);		//P1P0'F2'F1F0'

or o3(temp2[6], ALUop[0], temp1[6]);			//P0 + P1P0'F2'F1'F0'
or o4(temp2[5], temp2[6], temp2[7]);			//P0 + P1P0’F2’F1’F0’ + P1P0’F2’F1F0’
or o5(ALUctr[1], temp2[5], temp1[1]);			//C1 = P0 + P1P0’F2’F1’F0’ + P1P0’F2’F1F0’ + P1P0’F2F1’F0

/********************************************************************************************************/

//C0 = P1P0’F2’F1F0 + P1P0’F2F1’F0’ + P1P0’F2F1’F0
and a13(temp3[9], temp2[8], func[0]);		//P1P0’F2’F1F0

or o6(temp3[8], temp3[9], temp1[3]);		//P1P0’F2’F1F0 + P1P0’F2F1’F0’
or o7(ALUctr[0], temp3[8], temp1[1]);		//C0 = P1P0’F2’F1F0 + P1P0’F2F1’F0’ + P1P0’F2F1’F0

/********************************************************************************************************/

endmodule
	
