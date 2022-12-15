module MiniMIPS(

	input [15:0] instruction,
	output [31:0] result
	
);

wire [3:0] opcode;
wire [2:0] Rs, Rt, Rd, func;
wire [5:0] Imm;
reg num=1'b0;
wire RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Branchne;
wire [1:0] ALUop;
wire [2:0] forwrite;
wire [31:0] read_data_1, read_data_2;
wire [31:0] write_data;
wire [31:0] signnum;
wire [31:0] forAlu;
wire [2:0] ALUctr;
wire [31:0] out;
reg carri=3'b000;
wire [3:0] carro;
wire [31:0] read_data;
reg clk=1'b0;


//Specifying the most significant 4 bits of the instruction as an opcode 
or o0(opcode[3], instruction[15], num);
or o1(opcode[2], instruction[14], num);
or o2(opcode[1], instruction[13], num);
or o3(opcode[0], instruction[12], num);

//Specifying the 3 bits of instruction as the Rs
or o4(Rs[2], instruction[11], num);
or o5(Rs[1], instruction[10], num);
or o6(Rs[0], instruction[9], num);

//Specifying the 3 bits of instruction as the Rt
or o7(Rt[2], instruction[8], num);
or o8(Rt[1], instruction[7], num);
or o9(Rt[0], instruction[6], num);

//Specifying the 3 bits of instruction as the Rd
or o10(Rd[2], instruction[5], num);
or o11(Rd[1], instruction[4], num);
or o12(Rd[0], instruction[3], num);

//Specifing the 6 bits of instruction as the  Imm
or o13(Imm[5], instruction[5], num);
or o14(Imm[4], instruction[4], num);
or o15(Imm[3], instruction[3], num);
or o16(Imm[2], instruction[2], num);
or o17(Imm[1], instruction[1], num);
or o18(Imm[0], instruction[0], num);

//Specifiying the 3 bits of instruction as the func
or o19(func[2], instruction[2], num);
or o20(func[1], instruction[1], num);
or o21(func[0], instruction[0], num);

/*************************************************************************/

//Calling the main control block to generate control signals according to the opcode 
main_control control(.opcode(opcode), .RegDst(RegDst), .ALUSrc(ALUSrc), .MemtoReg(MemtoReg), .RegWrite(RegWrite), .MemRead(MemRead), 
                     .MemWrite(MemWrite), .Branch(Branch), .Branchne(Branchne), .ALUop(ALUop));
							

//Selecting the register to write the result 
my_mux2X1 f0(.I0(Rt[2]), .I1(Rd[2]), .S0(RegDst), .D(forwrite[2]));
my_mux2X1 f1(.I0(Rt[1]), .I1(Rd[1]), .S0(RegDst), .D(forwrite[1]));
my_mux2X1 f2(.I0(Rt[0]), .I1(Rd[0]), .S0(RegDst), .D(forwrite[0]));

//Calling the register module for data to be sent to the ALU
mips_registers register(.read_reg_1(Rs), .read_reg_2(Rt), .write_reg(forwrite), .write_data(result), 
                   .signal_reg_write(RegWrite), .read_data_1(read_data_1), .read_data_2(read_data_2), .clk(clk));


//Calling sign extended module for extending 6 bit immediate_field to 32 bit
my_signExtend signextend(.immediatefield(Imm), .num(signnum));

//Selecting Rt or Immediate_field according to ALUSrc signal 
my_mux2X1 src1(.I0(read_data_2[31]), .I1(signnum[31]), .S0(ALUSrc), .D(forAlu[31]));
my_mux2X1 src2(.I0(read_data_2[30]), .I1(signnum[30]), .S0(ALUSrc), .D(forAlu[30]));
my_mux2X1 src3(.I0(read_data_2[29]), .I1(signnum[29]), .S0(ALUSrc), .D(forAlu[29]));
my_mux2X1 src4(.I0(read_data_2[28]), .I1(signnum[28]), .S0(ALUSrc), .D(forAlu[28]));
my_mux2X1 src5(.I0(read_data_2[27]), .I1(signnum[27]), .S0(ALUSrc), .D(forAlu[27]));
my_mux2X1 src6(.I0(read_data_2[26]), .I1(signnum[26]), .S0(ALUSrc), .D(forAlu[26]));
my_mux2X1 src7(.I0(read_data_2[25]), .I1(signnum[25]), .S0(ALUSrc), .D(forAlu[25]));
my_mux2X1 src8(.I0(read_data_2[24]), .I1(signnum[24]), .S0(ALUSrc), .D(forAlu[24]));
my_mux2X1 src9(.I0(read_data_2[23]), .I1(signnum[23]), .S0(ALUSrc), .D(forAlu[23]));
my_mux2X1 src10(.I0(read_data_2[22]), .I1(signnum[22]), .S0(ALUSrc), .D(forAlu[22]));
my_mux2X1 src11(.I0(read_data_2[21]), .I1(signnum[21]), .S0(ALUSrc), .D(forAlu[21]));
my_mux2X1 src12(.I0(read_data_2[20]), .I1(signnum[20]), .S0(ALUSrc), .D(forAlu[20]));
my_mux2X1 src13(.I0(read_data_2[19]), .I1(signnum[19]), .S0(ALUSrc), .D(forAlu[19]));
my_mux2X1 src14(.I0(read_data_2[18]), .I1(signnum[18]), .S0(ALUSrc), .D(forAlu[18]));
my_mux2X1 src15(.I0(read_data_2[17]), .I1(signnum[17]), .S0(ALUSrc), .D(forAlu[17]));
my_mux2X1 src16(.I0(read_data_2[16]), .I1(signnum[16]), .S0(ALUSrc), .D(forAlu[16]));
my_mux2X1 src17(.I0(read_data_2[15]), .I1(signnum[15]), .S0(ALUSrc), .D(forAlu[15]));
my_mux2X1 src18(.I0(read_data_2[14]), .I1(signnum[14]), .S0(ALUSrc), .D(forAlu[14]));
my_mux2X1 src19(.I0(read_data_2[13]), .I1(signnum[13]), .S0(ALUSrc), .D(forAlu[13]));
my_mux2X1 src20(.I0(read_data_2[12]), .I1(signnum[12]), .S0(ALUSrc), .D(forAlu[12]));
my_mux2X1 src21(.I0(read_data_2[11]), .I1(signnum[11]), .S0(ALUSrc), .D(forAlu[11]));
my_mux2X1 src22(.I0(read_data_2[10]), .I1(signnum[10]), .S0(ALUSrc), .D(forAlu[10]));
my_mux2X1 src23(.I0(read_data_2[9]), .I1(signnum[9]), .S0(ALUSrc), .D(forAlu[9]));
my_mux2X1 src24(.I0(read_data_2[8]), .I1(signnum[8]), .S0(ALUSrc), .D(forAlu[8]));
my_mux2X1 src25(.I0(read_data_2[7]), .I1(signnum[7]), .S0(ALUSrc), .D(forAlu[7]));
my_mux2X1 src26(.I0(read_data_2[6]), .I1(signnum[6]), .S0(ALUSrc), .D(forAlu[6]));
my_mux2X1 src27(.I0(read_data_2[5]), .I1(signnum[5]), .S0(ALUSrc), .D(forAlu[5]));
my_mux2X1 src28(.I0(read_data_2[4]), .I1(signnum[4]), .S0(ALUSrc), .D(forAlu[4]));
my_mux2X1 src29(.I0(read_data_2[3]), .I1(signnum[3]), .S0(ALUSrc), .D(forAlu[3]));
my_mux2X1 src30(.I0(read_data_2[2]), .I1(signnum[2]), .S0(ALUSrc), .D(forAlu[2]));
my_mux2X1 src31(.I0(read_data_2[1]), .I1(signnum[1]), .S0(ALUSrc), .D(forAlu[1]));
my_mux2X1 src32(.I0(read_data_2[0]), .I1(signnum[0]), .S0(ALUSrc), .D(forAlu[0]));

//Calling the ALU_control block to generate ALUcontrol signals according to the ALUop sent by the main control i
ALU_control Alucontrol(.ALUop(ALUop), .func(func), .ALUctr(ALUctr));

//Calling the ALU to perform operations
my_alu ALU(.i1(read_data_1), .i2(forAlu), .select(ALUctr), .out(out), .c_in(carri), .c_o(carro));

//Data memory
mips_data_memory Datamem(.write_data(read_data_2), .address(out), .signal_mem_write(MemWrite),
								 .signal_mem_read(MemRead), .clk(clk), .read_data(read_data));
								 
//Selecting what will be written to the write data
my_mux2X1 wr1(.I0(out[31]), .I1(read_data[31]), .S0(MemtoReg), .D(result[31]));	
my_mux2X1 wr2(.I0(out[30]), .I1(read_data[30]), .S0(MemtoReg), .D(result[30]));	
my_mux2X1 wr3(.I0(out[29]), .I1(read_data[29]), .S0(MemtoReg), .D(result[29]));	
my_mux2X1 wr4(.I0(out[28]), .I1(read_data[28]), .S0(MemtoReg), .D(result[28]));	
my_mux2X1 wr5(.I0(out[27]), .I1(read_data[27]), .S0(MemtoReg), .D(result[27]));	
my_mux2X1 wr6(.I0(out[26]), .I1(read_data[26]), .S0(MemtoReg), .D(result[26]));	
my_mux2X1 wr7(.I0(out[25]), .I1(read_data[25]), .S0(MemtoReg), .D(result[25]));	
my_mux2X1 wr8(.I0(out[24]), .I1(read_data[24]), .S0(MemtoReg), .D(result[24]));	
my_mux2X1 wr9(.I0(out[23]), .I1(read_data[23]), .S0(MemtoReg), .D(result[23]));	
my_mux2X1 wr10(.I0(out[22]), .I1(read_data[22]), .S0(MemtoReg), .D(result[22]));	
my_mux2X1 wr11(.I0(out[21]), .I1(read_data[21]), .S0(MemtoReg), .D(result[21]));	
my_mux2X1 wr12(.I0(out[20]), .I1(read_data[20]), .S0(MemtoReg), .D(result[20]));	
my_mux2X1 wr13(.I0(out[19]), .I1(read_data[19]), .S0(MemtoReg), .D(result[19]));	
my_mux2X1 wr14(.I0(out[18]), .I1(read_data[18]), .S0(MemtoReg), .D(result[18]));	
my_mux2X1 wr15(.I0(out[17]), .I1(read_data[17]), .S0(MemtoReg), .D(result[17]));	
my_mux2X1 wr16(.I0(out[16]), .I1(read_data[16]), .S0(MemtoReg), .D(result[16]));	
my_mux2X1 wr17(.I0(out[15]), .I1(read_data[15]), .S0(MemtoReg), .D(result[15]));	
my_mux2X1 wr18(.I0(out[14]), .I1(read_data[14]), .S0(MemtoReg), .D(result[14]));	
my_mux2X1 wr19(.I0(out[13]), .I1(read_data[13]), .S0(MemtoReg), .D(result[13]));	
my_mux2X1 wr20(.I0(out[12]), .I1(read_data[12]), .S0(MemtoReg), .D(result[12]));	
my_mux2X1 wr21(.I0(out[11]), .I1(read_data[11]), .S0(MemtoReg), .D(result[11]));	
my_mux2X1 wr22(.I0(out[10]), .I1(read_data[10]), .S0(MemtoReg), .D(result[10]));	
my_mux2X1 wr23(.I0(out[9]), .I1(read_data[9]), .S0(MemtoReg), .D(result[9]));	
my_mux2X1 wr24(.I0(out[8]), .I1(read_data[8]), .S0(MemtoReg), .D(result[8]));	
my_mux2X1 wr25(.I0(out[7]), .I1(read_data[7]), .S0(MemtoReg), .D(result[7]));	
my_mux2X1 wr26(.I0(out[6]), .I1(read_data[6]), .S0(MemtoReg), .D(result[6]));	
my_mux2X1 wr27(.I0(out[5]), .I1(read_data[5]), .S0(MemtoReg), .D(result[5]));	
my_mux2X1 wr28(.I0(out[4]), .I1(read_data[4]), .S0(MemtoReg), .D(result[4]));
my_mux2X1 wr29(.I0(out[3]), .I1(read_data[3]), .S0(MemtoReg), .D(result[3]));
my_mux2X1 wr30(.I0(out[2]), .I1(read_data[2]), .S0(MemtoReg), .D(result[2]));
my_mux2X1 wr31(.I0(out[1]), .I1(read_data[1]), .S0(MemtoReg), .D(result[1]));
my_mux2X1 wr32(.I0(out[0]), .I1(read_data[0]), .S0(MemtoReg), .D(result[0]));	
							 
								 						 

														 
endmodule





