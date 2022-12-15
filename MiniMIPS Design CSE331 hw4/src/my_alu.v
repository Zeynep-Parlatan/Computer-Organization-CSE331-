module my_alu(
	input [31:0] i1,
	input [31:0] i2,
	input [2:0] select,
	output [31:0] out,
	input [3:0] c_in,
	output [3:0] c_o
);

wire [31:0] resAnd;
wire [31:0] resOr;
wire [31:0] resNor;
wire [31:0] resXor;
wire [31:0] resAdd;
wire [31:0] resSub;
wire [31:0]resSlt;
wire [31:0] r;
wire [31:0] resMult;
wire [127:0] wmux0;
wire [63:0] wmux1;



my_and a0(.first(i1),.second(i2), .result(resAnd));

my_or o0(.first(i1),.second(i2), .result(resOr));

my_nor n0(.first(i1),.second(i2), .result(resNor));

my_xor x0(.first(i1),.second(i2), .result(resXor));

my_32bit_adder add0(.A(i1), .B(i2), .C0(c_in), .C(c_o[3]), .S(resAdd));

my_subtractor s0(.A(i1), .B(i2), .C0(c_in), .C(c_o[2]), .Res(resSub));

my_setlessthan setless(.A(i1), .B(i2), .C0(c_in), .C(c_o[1]), .Res(r), .setres(resSlt));

my_mux2X1 f0(.I0(resAdd[31]), .I1(resXor[31]), .S0(select[0]), .D(wmux0[127]));
my_mux2X1 f1(.I0(resSub[31]), .I1(resMult[31]), .S0(select[0]), .D(wmux0[126]));
my_mux2X1 f2(.I0(wmux0[127]), .I1(wmux0[126]), .S0(select[1]), .D(wmux1[63]));
my_mux2X1 f3(.I0(resSlt[31]), .I1(resNor[31]), .S0(select[0]), .D(wmux0[125]));
my_mux2X1 f4(.I0(resAnd[31]), .I1(resOr[31]), .S0(select[0]), .D(wmux0[124]));
my_mux2X1 f5(.I0(wmux0[125]), .I1(wmux0[124]), .S0(select[1]), .D(wmux1[62]));
my_mux2X1 f6(.I0(wmux1[63]), .I1(wmux1[62]), .S0(select[2]), .D(out[31]));

my_mux2X1 f7(.I0(resAdd[30]), .I1(resXor[30]), .S0(select[0]), .D(wmux0[123]));
my_mux2X1 f8(.I0(resSub[30]), .I1(resMult[30]), .S0(select[0]), .D(wmux0[122]));
my_mux2X1 f9(.I0(wmux0[123]), .I1(wmux0[122]), .S0(select[1]), .D(wmux1[61]));
my_mux2X1 f10(.I0(resSlt[30]), .I1(resNor[30]), .S0(select[0]), .D(wmux0[121]));
my_mux2X1 f11(.I0(resAnd[30]), .I1(resOr[30]), .S0(select[0]), .D(wmux0[120]));
my_mux2X1 f12(.I0(wmux0[121]), .I1(wmux0[120]), .S0(select[1]), .D(wmux1[60]));
my_mux2X1 f13(.I0(wmux1[61]), .I1(wmux1[60]), .S0(select[2]), .D(out[30]));

my_mux2X1 f14(.I0(resAdd[29]), .I1(resXor[29]), .S0(select[0]), .D(wmux0[119]));
my_mux2X1 f15(.I0(resSub[29]), .I1(resMult[29]), .S0(select[0]), .D(wmux0[118]));
my_mux2X1 f16(.I0(wmux0[119]), .I1(wmux0[118]), .S0(select[1]), .D(wmux1[59]));
my_mux2X1 f17(.I0(resSlt[29]), .I1(resNor[29]), .S0(select[0]), .D(wmux0[117]));
my_mux2X1 f18(.I0(resAnd[29]), .I1(resOr[29]), .S0(select[0]), .D(wmux0[116]));
my_mux2X1 f19(.I0(wmux0[117]), .I1(wmux0[116]), .S0(select[1]), .D(wmux1[58]));
my_mux2X1 f20(.I0(wmux1[59]), .I1(wmux1[58]), .S0(select[2]), .D(out[29]));

my_mux2X1 f21(.I0(resAdd[28]), .I1(resXor[28]), .S0(select[0]), .D(wmux0[115]));
my_mux2X1 f22(.I0(resSub[28]), .I1(resMult[28]), .S0(select[0]), .D(wmux0[114]));
my_mux2X1 f23(.I0(wmux0[115]), .I1(wmux0[114]), .S0(select[1]), .D(wmux1[57]));
my_mux2X1 f24(.I0(resSlt[28]), .I1(resNor[28]), .S0(select[0]), .D(wmux0[113]));
my_mux2X1 f25(.I0(resAnd[28]), .I1(resOr[28]), .S0(select[0]), .D(wmux0[112]));
my_mux2X1 f26(.I0(wmux0[113]), .I1(wmux0[112]), .S0(select[1]), .D(wmux1[56]));
my_mux2X1 f27(.I0(wmux1[57]), .I1(wmux1[56]), .S0(select[2]), .D(out[28]));

my_mux2X1 f28(.I0(resAdd[27]), .I1(resXor[27]), .S0(select[0]), .D(wmux0[111]));
my_mux2X1 f29(.I0(resSub[27]), .I1(resMult[27]), .S0(select[0]), .D(wmux0[110]));
my_mux2X1 f30(.I0(wmux0[111]), .I1(wmux0[110]), .S0(select[1]), .D(wmux1[55]));
my_mux2X1 f31(.I0(resSlt[27]), .I1(resNor[27]), .S0(select[0]), .D(wmux0[109]));
my_mux2X1 f32(.I0(resAnd[27]), .I1(resOr[27]), .S0(select[0]), .D(wmux0[108]));
my_mux2X1 f33(.I0(wmux0[109]), .I1(wmux0[108]), .S0(select[1]), .D(wmux1[54]));
my_mux2X1 f34(.I0(wmux1[55]), .I1(wmux1[54]), .S0(select[2]), .D(out[27]));

my_mux2X1 f35(.I0(resAdd[26]), .I1(resXor[26]), .S0(select[0]), .D(wmux0[107]));
my_mux2X1 f36(.I0(resSub[26]), .I1(resMult[26]), .S0(select[0]), .D(wmux0[106]));
my_mux2X1 f37(.I0(wmux0[107]), .I1(wmux0[106]), .S0(select[1]), .D(wmux1[53]));
my_mux2X1 f38(.I0(resSlt[26]), .I1(resNor[26]), .S0(select[0]), .D(wmux0[105]));
my_mux2X1 f39(.I0(resAnd[26]), .I1(resOr[26]), .S0(select[0]), .D(wmux0[104]));
my_mux2X1 f40(.I0(wmux0[105]), .I1(wmux0[104]), .S0(select[1]), .D(wmux1[52]));
my_mux2X1 f41(.I0(wmux1[53]), .I1(wmux1[52]), .S0(select[2]), .D(out[26]));

my_mux2X1 f42(.I0(resAdd[25]), .I1(resXor[25]), .S0(select[0]), .D(wmux0[103]));
my_mux2X1 f43(.I0(resSub[25]), .I1(resMult[25]), .S0(select[0]), .D(wmux0[102]));
my_mux2X1 f44(.I0(wmux0[103]), .I1(wmux0[102]), .S0(select[1]), .D(wmux1[51]));
my_mux2X1 f45(.I0(resSlt[25]), .I1(resNor[25]), .S0(select[0]), .D(wmux0[101]));
my_mux2X1 f46(.I0(resAnd[25]), .I1(resOr[25]), .S0(select[0]), .D(wmux0[100]));
my_mux2X1 f47(.I0(wmux0[101]), .I1(wmux0[100]), .S0(select[1]), .D(wmux1[50]));
my_mux2X1 f48(.I0(wmux1[51]), .I1(wmux1[50]), .S0(select[2]), .D(out[25]));

my_mux2X1 f49(.I0(resAdd[24]), .I1(resXor[24]), .S0(select[0]), .D(wmux0[99]));
my_mux2X1 f50(.I0(resSub[24]), .I1(resMult[24]), .S0(select[0]), .D(wmux0[98]));
my_mux2X1 f51(.I0(wmux0[99]), .I1(wmux0[98]), .S0(select[1]), .D(wmux1[49]));
my_mux2X1 f52(.I0(resSlt[24]), .I1(resNor[24]), .S0(select[0]), .D(wmux0[97]));
my_mux2X1 f53(.I0(resAnd[24]), .I1(resOr[24]), .S0(select[0]), .D(wmux0[96]));
my_mux2X1 f54(.I0(wmux0[97]), .I1(wmux0[96]), .S0(select[1]), .D(wmux1[48]));
my_mux2X1 f55(.I0(wmux1[49]), .I1(wmux1[48]), .S0(select[2]), .D(out[24]));

my_mux2X1 f56(.I0(resAdd[23]), .I1(resXor[23]), .S0(select[0]), .D(wmux0[95]));
my_mux2X1 f57(.I0(resSub[23]), .I1(resMult[23]), .S0(select[0]), .D(wmux0[94]));
my_mux2X1 f58(.I0(wmux0[95]), .I1(wmux0[94]), .S0(select[1]), .D(wmux1[47]));
my_mux2X1 f59(.I0(resSlt[23]), .I1(resNor[23]), .S0(select[0]), .D(wmux0[93]));
my_mux2X1 f60(.I0(resAnd[23]), .I1(resOr[23]), .S0(select[0]), .D(wmux0[92]));
my_mux2X1 f61(.I0(wmux0[93]), .I1(wmux0[92]), .S0(select[1]), .D(wmux1[46]));
my_mux2X1 f62(.I0(wmux1[47]), .I1(wmux1[46]), .S0(select[2]), .D(out[23]));

my_mux2X1 f63(.I0(resAdd[22]), .I1(resXor[22]), .S0(select[0]), .D(wmux0[91]));
my_mux2X1 f64(.I0(resSub[22]), .I1(resMult[22]), .S0(select[0]), .D(wmux0[90]));
my_mux2X1 f65(.I0(wmux0[91]), .I1(wmux0[90]), .S0(select[1]), .D(wmux1[45]));
my_mux2X1 f66(.I0(resSlt[22]), .I1(resNor[22]), .S0(select[0]), .D(wmux0[89]));
my_mux2X1 f67(.I0(resAnd[22]), .I1(resOr[22]), .S0(select[0]), .D(wmux0[88]));
my_mux2X1 f68(.I0(wmux0[89]), .I1(wmux0[88]), .S0(select[1]), .D(wmux1[44]));
my_mux2X1 f69(.I0(wmux1[45]), .I1(wmux1[44]), .S0(select[2]), .D(out[22]));

my_mux2X1 f70(.I0(resAdd[21]), .I1(resXor[21]), .S0(select[0]), .D(wmux0[87]));
my_mux2X1 f71(.I0(resSub[21]), .I1(resMult[21]), .S0(select[0]), .D(wmux0[86]));
my_mux2X1 f72(.I0(wmux0[87]), .I1(wmux0[86]), .S0(select[1]), .D(wmux1[43]));
my_mux2X1 f73(.I0(resSlt[21]), .I1(resNor[21]), .S0(select[0]), .D(wmux0[85]));
my_mux2X1 f74(.I0(resAnd[21]), .I1(resOr[21]), .S0(select[0]), .D(wmux0[84]));
my_mux2X1 f75(.I0(wmux0[85]), .I1(wmux0[84]), .S0(select[1]), .D(wmux1[42]));
my_mux2X1 f76(.I0(wmux1[43]), .I1(wmux1[42]), .S0(select[2]), .D(out[21]));

my_mux2X1 f77(.I0(resAdd[20]), .I1(resXor[20]), .S0(select[0]), .D(wmux0[83]));
my_mux2X1 f78(.I0(resSub[20]), .I1(resMult[20]), .S0(select[0]), .D(wmux0[82]));
my_mux2X1 f79(.I0(wmux0[83]), .I1(wmux0[82]), .S0(select[1]), .D(wmux1[41]));
my_mux2X1 f80(.I0(resSlt[20]), .I1(resNor[20]), .S0(select[0]), .D(wmux0[81]));
my_mux2X1 f81(.I0(resAnd[20]), .I1(resOr[20]), .S0(select[0]), .D(wmux0[80]));
my_mux2X1 f82(.I0(wmux0[81]), .I1(wmux0[80]), .S0(select[1]), .D(wmux1[40]));
my_mux2X1 f83(.I0(wmux1[41]), .I1(wmux1[40]), .S0(select[2]), .D(out[20]));

my_mux2X1 f84(.I0(resAdd[19]), .I1(resXor[19]), .S0(select[0]), .D(wmux0[79]));
my_mux2X1 f85(.I0(resSub[19]), .I1(resMult[19]), .S0(select[0]), .D(wmux0[78]));
my_mux2X1 f86(.I0(wmux0[79]), .I1(wmux0[78]), .S0(select[1]), .D(wmux1[39]));
my_mux2X1 f87(.I0(resSlt[19]), .I1(resNor[19]), .S0(select[0]), .D(wmux0[77]));
my_mux2X1 f88(.I0(resAnd[19]), .I1(resOr[19]), .S0(select[0]), .D(wmux0[76]));
my_mux2X1 f89(.I0(wmux0[77]), .I1(wmux0[76]), .S0(select[1]), .D(wmux1[38]));
my_mux2X1 f90(.I0(wmux1[39]), .I1(wmux1[38]), .S0(select[2]), .D(out[19]));

my_mux2X1 f91(.I0(resAdd[18]), .I1(resXor[18]), .S0(select[0]), .D(wmux0[75]));
my_mux2X1 f92(.I0(resSub[18]), .I1(resMult[18]), .S0(select[0]), .D(wmux0[74]));
my_mux2X1 f93(.I0(wmux0[75]), .I1(wmux0[74]), .S0(select[1]), .D(wmux1[37]));
my_mux2X1 f94(.I0(resSlt[18]), .I1(resNor[18]), .S0(select[0]), .D(wmux0[73]));
my_mux2X1 f95(.I0(resAnd[18]), .I1(resOr[18]), .S0(select[0]), .D(wmux0[72]));
my_mux2X1 f96(.I0(wmux0[73]), .I1(wmux0[72]), .S0(select[1]), .D(wmux1[36]));
my_mux2X1 f97(.I0(wmux1[37]), .I1(wmux1[36]), .S0(select[2]), .D(out[18]));

my_mux2X1 f98(.I0(resAdd[17]), .I1(resXor[17]), .S0(select[0]), .D(wmux0[71]));
my_mux2X1 f99(.I0(resSub[17]), .I1(resMult[17]), .S0(select[0]), .D(wmux0[70]));
my_mux2X1 f100(.I0(wmux0[71]), .I1(wmux0[70]), .S0(select[1]), .D(wmux1[35]));
my_mux2X1 f101(.I0(resSlt[17]), .I1(resNor[17]), .S0(select[0]), .D(wmux0[69]));
my_mux2X1 f102(.I0(resAnd[17]), .I1(resOr[17]), .S0(select[0]), .D(wmux0[68]));
my_mux2X1 f103(.I0(wmux0[69]), .I1(wmux0[68]), .S0(select[1]), .D(wmux1[34]));
my_mux2X1 f104(.I0(wmux1[35]), .I1(wmux1[34]), .S0(select[2]), .D(out[17]));

my_mux2X1 f105(.I0(resAdd[16]), .I1(resXor[16]), .S0(select[0]), .D(wmux0[67]));
my_mux2X1 f106(.I0(resSub[16]), .I1(resMult[16]), .S0(select[0]), .D(wmux0[66]));
my_mux2X1 f107(.I0(wmux0[67]), .I1(wmux0[66]), .S0(select[1]), .D(wmux1[33]));
my_mux2X1 f108(.I0(resSlt[16]), .I1(resNor[16]), .S0(select[0]), .D(wmux0[65]));
my_mux2X1 f109(.I0(resAnd[16]), .I1(resOr[16]), .S0(select[0]), .D(wmux0[64]));
my_mux2X1 f110(.I0(wmux0[65]), .I1(wmux0[64]), .S0(select[1]), .D(wmux1[32]));
my_mux2X1 f111(.I0(wmux1[33]), .I1(wmux1[32]), .S0(select[2]), .D(out[16]));

my_mux2X1 f112(.I0(resAdd[15]), .I1(resXor[15]), .S0(select[0]), .D(wmux0[63]));
my_mux2X1 f113(.I0(resSub[15]), .I1(resMult[15]), .S0(select[0]), .D(wmux0[62]));
my_mux2X1 f114(.I0(wmux0[63]), .I1(wmux0[62]), .S0(select[1]), .D(wmux1[31]));
my_mux2X1 f115(.I0(resSlt[15]), .I1(resNor[15]), .S0(select[0]), .D(wmux0[61]));
my_mux2X1 f116(.I0(resAnd[15]), .I1(resOr[15]), .S0(select[0]), .D(wmux0[60]));
my_mux2X1 f117(.I0(wmux0[61]), .I1(wmux0[60]), .S0(select[1]), .D(wmux1[30]));
my_mux2X1 f118(.I0(wmux1[31]), .I1(wmux1[30]), .S0(select[2]), .D(out[15]));

my_mux2X1 f119(.I0(resAdd[14]), .I1(resXor[14]), .S0(select[0]), .D(wmux0[59]));
my_mux2X1 f120(.I0(resSub[14]), .I1(resMult[14]), .S0(select[0]), .D(wmux0[58]));
my_mux2X1 f121(.I0(wmux0[59]), .I1(wmux0[58]), .S0(select[1]), .D(wmux1[29]));
my_mux2X1 f122(.I0(resSlt[14]), .I1(resNor[14]), .S0(select[0]), .D(wmux0[57]));
my_mux2X1 f123(.I0(resAnd[14]), .I1(resOr[14]), .S0(select[0]), .D(wmux0[56]));
my_mux2X1 f124(.I0(wmux0[57]), .I1(wmux0[56]), .S0(select[1]), .D(wmux1[28]));
my_mux2X1 f125(.I0(wmux1[29]), .I1(wmux1[28]), .S0(select[2]), .D(out[14]));

my_mux2X1 f126(.I0(resAdd[13]), .I1(resXor[13]), .S0(select[0]), .D(wmux0[55]));
my_mux2X1 f127(.I0(resSub[13]), .I1(resMult[13]), .S0(select[0]), .D(wmux0[54]));
my_mux2X1 f128(.I0(wmux0[55]), .I1(wmux0[54]), .S0(select[1]), .D(wmux1[27]));
my_mux2X1 f129(.I0(resSlt[13]), .I1(resNor[13]), .S0(select[0]), .D(wmux0[53]));
my_mux2X1 f130(.I0(resAnd[13]), .I1(resOr[13]), .S0(select[0]), .D(wmux0[52]));
my_mux2X1 f131(.I0(wmux0[53]), .I1(wmux0[52]), .S0(select[1]), .D(wmux1[26]));
my_mux2X1 f132(.I0(wmux1[27]), .I1(wmux1[26]), .S0(select[2]), .D(out[13]));

my_mux2X1 f133(.I0(resAdd[12]), .I1(resXor[12]), .S0(select[0]), .D(wmux0[51]));
my_mux2X1 f134(.I0(resSub[12]), .I1(resMult[12]), .S0(select[0]), .D(wmux0[50]));
my_mux2X1 f135(.I0(wmux0[51]), .I1(wmux0[50]), .S0(select[1]), .D(wmux1[25]));
my_mux2X1 f136(.I0(resSlt[12]), .I1(resNor[12]), .S0(select[0]), .D(wmux0[49]));
my_mux2X1 f137(.I0(resAnd[12]), .I1(resOr[12]), .S0(select[0]), .D(wmux0[48]));
my_mux2X1 f138(.I0(wmux0[49]), .I1(wmux0[48]), .S0(select[1]), .D(wmux1[24]));
my_mux2X1 f139(.I0(wmux1[25]), .I1(wmux1[24]), .S0(select[2]), .D(out[12]));

my_mux2X1 f140(.I0(resAdd[11]), .I1(resXor[11]), .S0(select[0]), .D(wmux0[47]));
my_mux2X1 f141(.I0(resSub[11]), .I1(resMult[11]), .S0(select[0]), .D(wmux0[46]));
my_mux2X1 f142(.I0(wmux0[47]), .I1(wmux0[46]), .S0(select[1]), .D(wmux1[23]));
my_mux2X1 f143(.I0(resSlt[11]), .I1(resNor[11]), .S0(select[0]), .D(wmux0[45]));
my_mux2X1 f144(.I0(resAnd[11]), .I1(resOr[11]), .S0(select[0]), .D(wmux0[44]));
my_mux2X1 f145(.I0(wmux0[45]), .I1(wmux0[44]), .S0(select[1]), .D(wmux1[22]));
my_mux2X1 f146(.I0(wmux1[23]), .I1(wmux1[22]), .S0(select[2]), .D(out[11]));

my_mux2X1 f147(.I0(resAdd[10]), .I1(resXor[10]), .S0(select[0]), .D(wmux0[43]));
my_mux2X1 f148(.I0(resSub[10]), .I1(resMult[10]), .S0(select[0]), .D(wmux0[42]));
my_mux2X1 f149(.I0(wmux0[43]), .I1(wmux0[42]), .S0(select[1]), .D(wmux1[21]));
my_mux2X1 f150(.I0(resSlt[10]), .I1(resNor[10]), .S0(select[0]), .D(wmux0[41]));
my_mux2X1 f151(.I0(resAnd[10]), .I1(resOr[10]), .S0(select[0]), .D(wmux0[40]));
my_mux2X1 f152(.I0(wmux0[41]), .I1(wmux0[40]), .S0(select[1]), .D(wmux1[20]));
my_mux2X1 f153(.I0(wmux1[21]), .I1(wmux1[20]), .S0(select[2]), .D(out[10]));

my_mux2X1 f154(.I0(resAdd[9]), .I1(resXor[9]), .S0(select[0]), .D(wmux0[39]));
my_mux2X1 f155(.I0(resSub[9]), .I1(resMult[9]), .S0(select[0]), .D(wmux0[38]));
my_mux2X1 f156(.I0(wmux0[39]), .I1(wmux0[38]), .S0(select[1]), .D(wmux1[19]));
my_mux2X1 f157(.I0(resSlt[9]), .I1(resNor[9]), .S0(select[0]), .D(wmux0[37]));
my_mux2X1 f158(.I0(resAnd[9]), .I1(resOr[9]), .S0(select[0]), .D(wmux0[36]));
my_mux2X1 f159(.I0(wmux0[37]), .I1(wmux0[36]), .S0(select[1]), .D(wmux1[18]));
my_mux2X1 f160(.I0(wmux1[19]), .I1(wmux1[18]), .S0(select[2]), .D(out[9]));

my_mux2X1 f161(.I0(resAdd[8]), .I1(resXor[8]), .S0(select[0]), .D(wmux0[35]));
my_mux2X1 f162(.I0(resSub[8]), .I1(resMult[8]), .S0(select[0]), .D(wmux0[34]));
my_mux2X1 f163(.I0(wmux0[35]), .I1(wmux0[34]), .S0(select[1]), .D(wmux1[17]));
my_mux2X1 f164(.I0(resSlt[8]), .I1(resNor[8]), .S0(select[0]), .D(wmux0[33]));
my_mux2X1 f165(.I0(resAnd[8]), .I1(resOr[8]), .S0(select[0]), .D(wmux0[32]));
my_mux2X1 f166(.I0(wmux0[33]), .I1(wmux0[32]), .S0(select[1]), .D(wmux1[16]));
my_mux2X1 f167(.I0(wmux1[17]), .I1(wmux1[16]), .S0(select[2]), .D(out[8]));

my_mux2X1 f168(.I0(resAdd[7]), .I1(resXor[7]), .S0(select[0]), .D(wmux0[31]));
my_mux2X1 f169(.I0(resSub[7]), .I1(resMult[7]), .S0(select[0]), .D(wmux0[30]));
my_mux2X1 f170(.I0(wmux0[31]), .I1(wmux0[30]), .S0(select[1]), .D(wmux1[15]));
my_mux2X1 f171(.I0(resSlt[7]), .I1(resNor[7]), .S0(select[0]), .D(wmux0[29]));
my_mux2X1 f172(.I0(resAnd[7]), .I1(resOr[7]), .S0(select[0]), .D(wmux0[28]));
my_mux2X1 f173(.I0(wmux0[29]), .I1(wmux0[28]), .S0(select[1]), .D(wmux1[14]));
my_mux2X1 f174(.I0(wmux1[15]), .I1(wmux1[14]), .S0(select[2]), .D(out[7]));

my_mux2X1 f175(.I0(resAdd[6]), .I1(resXor[6]), .S0(select[0]), .D(wmux0[27]));
my_mux2X1 f176(.I0(resSub[6]), .I1(resMult[6]), .S0(select[0]), .D(wmux0[26]));
my_mux2X1 f177(.I0(wmux0[27]), .I1(wmux0[26]), .S0(select[1]), .D(wmux1[13]));
my_mux2X1 f178(.I0(resSlt[6]), .I1(resNor[6]), .S0(select[0]), .D(wmux0[25]));
my_mux2X1 f179(.I0(resAnd[6]), .I1(resOr[6]), .S0(select[0]), .D(wmux0[24]));
my_mux2X1 f180(.I0(wmux0[25]), .I1(wmux0[24]), .S0(select[1]), .D(wmux1[12]));
my_mux2X1 f181(.I0(wmux1[13]), .I1(wmux1[12]), .S0(select[2]), .D(out[6]));

my_mux2X1 f182(.I0(resAdd[5]), .I1(resXor[5]), .S0(select[0]), .D(wmux0[23]));
my_mux2X1 f183(.I0(resSub[5]), .I1(resMult[5]), .S0(select[0]), .D(wmux0[22]));
my_mux2X1 f184(.I0(wmux0[23]), .I1(wmux0[22]), .S0(select[1]), .D(wmux1[11]));
my_mux2X1 f185(.I0(resSlt[5]), .I1(resNor[5]), .S0(select[0]), .D(wmux0[21]));
my_mux2X1 f186(.I0(resAnd[5]), .I1(resOr[5]), .S0(select[0]), .D(wmux0[20]));
my_mux2X1 f187(.I0(wmux0[21]), .I1(wmux0[20]), .S0(select[1]), .D(wmux1[10]));
my_mux2X1 f188(.I0(wmux1[11]), .I1(wmux1[10]), .S0(select[2]), .D(out[5]));

my_mux2X1 f189(.I0(resAdd[4]), .I1(resXor[4]), .S0(select[0]), .D(wmux0[19]));
my_mux2X1 f190(.I0(resSub[4]), .I1(resMult[4]), .S0(select[0]), .D(wmux0[18]));
my_mux2X1 f191(.I0(wmux0[19]), .I1(wmux0[18]), .S0(select[1]), .D(wmux1[9]));
my_mux2X1 f192(.I0(resSlt[4]), .I1(resNor[4]), .S0(select[0]), .D(wmux0[17]));
my_mux2X1 f193(.I0(resAnd[4]), .I1(resOr[4]), .S0(select[0]), .D(wmux0[16]));
my_mux2X1 f194(.I0(wmux0[17]), .I1(wmux0[16]), .S0(select[1]), .D(wmux1[8]));
my_mux2X1 f195(.I0(wmux1[9]), .I1(wmux1[8]), .S0(select[2]), .D(out[4]));

my_mux2X1 f196(.I0(resAdd[3]), .I1(resXor[3]), .S0(select[0]), .D(wmux0[15]));
my_mux2X1 f197(.I0(resSub[3]), .I1(resMult[3]), .S0(select[0]), .D(wmux0[14]));
my_mux2X1 f198(.I0(wmux0[15]), .I1(wmux0[14]), .S0(select[1]), .D(wmux1[7]));
my_mux2X1 f199(.I0(resSlt[3]), .I1(resNor[3]), .S0(select[0]), .D(wmux0[13]));
my_mux2X1 f200(.I0(resAnd[3]), .I1(resOr[3]), .S0(select[0]), .D(wmux0[12]));
my_mux2X1 f201(.I0(wmux0[13]), .I1(wmux0[12]), .S0(select[1]), .D(wmux1[6]));
my_mux2X1 f202(.I0(wmux1[7]), .I1(wmux1[6]), .S0(select[2]), .D(out[3]));

my_mux2X1 f203(.I0(resAdd[2]), .I1(resXor[2]), .S0(select[0]), .D(wmux0[11]));
my_mux2X1 f204(.I0(resSub[2]), .I1(resMult[2]), .S0(select[0]), .D(wmux0[10]));
my_mux2X1 f205(.I0(wmux0[11]), .I1(wmux0[10]), .S0(select[1]), .D(wmux1[5]));
my_mux2X1 f206(.I0(resSlt[2]), .I1(resNor[2]), .S0(select[0]), .D(wmux0[9]));
my_mux2X1 f207(.I0(resAnd[2]), .I1(resOr[2]), .S0(select[0]), .D(wmux0[8]));
my_mux2X1 f208(.I0(wmux0[9]), .I1(wmux0[8]), .S0(select[1]), .D(wmux1[4]));
my_mux2X1 f209(.I0(wmux1[5]), .I1(wmux1[4]), .S0(select[2]), .D(out[2]));

my_mux2X1 f210(.I0(resAdd[1]), .I1(resXor[1]), .S0(select[0]), .D(wmux0[7]));
my_mux2X1 f211(.I0(resSub[1]), .I1(resMult[1]), .S0(select[0]), .D(wmux0[6]));
my_mux2X1 f212(.I0(wmux0[7]), .I1(wmux0[6]), .S0(select[1]), .D(wmux1[3]));
my_mux2X1 f213(.I0(resSlt[1]), .I1(resNor[1]), .S0(select[0]), .D(wmux0[5]));
my_mux2X1 f214(.I0(resAnd[1]), .I1(resOr[1]), .S0(select[0]), .D(wmux0[4]));
my_mux2X1 f215(.I0(wmux0[5]), .I1(wmux0[4]), .S0(select[1]), .D(wmux1[2]));
my_mux2X1 f216(.I0(wmux1[3]), .I1(wmux1[2]), .S0(select[2]), .D(out[1]));

my_mux2X1 f217(.I0(resAdd[0]), .I1(resXor[0]), .S0(select[0]), .D(wmux0[3]));
my_mux2X1 f218(.I0(resSub[0]), .I1(resMult[0]), .S0(select[0]), .D(wmux0[2]));
my_mux2X1 f219(.I0(wmux0[3]), .I1(wmux0[2]), .S0(select[1]), .D(wmux1[1]));
my_mux2X1 f220(.I0(resSlt[0]), .I1(resNor[0]), .S0(select[0]), .D(wmux0[1]));
my_mux2X1 f221(.I0(resAnd[0]), .I1(resOr[0]), .S0(select[0]), .D(wmux0[0]));
my_mux2X1 f222(.I0(wmux0[1]), .I1(wmux0[0]), .S0(select[1]), .D(wmux1[0]));
my_mux2X1 f223(.I0(wmux1[1]), .I1(wmux1[0]), .S0(select[2]), .D(out[0]));



endmodule
