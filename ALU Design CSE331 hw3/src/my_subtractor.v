module my_subtractor(
	input [31:0] A,
	input [31:0] B,
	input C0,
	output C,
	output [31:0] Res
   
);

wire C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15,C16,C17,C18,C19,C20,C21,C22,C23,C24,C25,C26,C27,C28,C29,C30,C31,C32,C33,C34,
C35,C36,C37,C38,C39,C40,C41,C42,C43,C44,C45,C46,C47,C48,C49,C50,C51,C52,C53,C54,C55,C56,C57,C58,C59,C60,C61,C62,C63;
wire [31:0] resx;
wire [31:0] resc;
reg num=1'b1;
reg num2=1'b0;

my_xor x0(.first(B[31]),.second(num), .result(resx[31]));
my_xor x1(.first(B[30]),.second(num), .result(resx[30]));
my_xor x2(.first(B[29]),.second(num), .result(resx[29]));
my_xor x3(.first(B[28]),.second(num), .result(resx[28]));
my_xor x4(.first(B[27]),.second(num), .result(resx[27]));
my_xor x5(.first(B[26]),.second(num), .result(resx[26]));
my_xor x6(.first(B[25]),.second(num), .result(resx[25]));
my_xor x7(.first(B[24]),.second(num), .result(resx[24]));
my_xor x8(.first(B[23]),.second(num), .result(resx[23]));
my_xor x9(.first(B[22]),.second(num), .result(resx[22]));
my_xor x10(.first(B[21]),.second(num), .result(resx[21]));
my_xor x11(.first(B[20]),.second(num), .result(resx[20]));
my_xor x12(.first(B[19]),.second(num), .result(resx[19]));
my_xor x13(.first(B[18]),.second(num), .result(resx[18]));
my_xor x14(.first(B[17]),.second(num), .result(resx[17]));
my_xor x15(.first(B[16]),.second(num), .result(resx[16]));
my_xor x16(.first(B[15]),.second(num), .result(resx[15]));
my_xor x17(.first(B[14]),.second(num), .result(resx[14]));
my_xor x18(.first(B[13]),.second(num), .result(resx[13]));
my_xor x19(.first(B[12]),.second(num), .result(resx[12]));
my_xor x20(.first(B[11]),.second(num), .result(resx[11]));
my_xor x21(.first(B[10]),.second(num), .result(resx[10]));
my_xor x22(.first(B[9]),.second(num), .result(resx[9]));
my_xor x23(.first(B[8]),.second(num), .result(resx[8]));
my_xor x24(.first(B[7]),.second(num), .result(resx[7]));
my_xor x25(.first(B[6]),.second(num), .result(resx[6]));
my_xor x26(.first(B[5]),.second(num), .result(resx[5]));
my_xor x27(.first(B[4]),.second(num), .result(resx[4]));
my_xor x28(.first(B[3]),.second(num), .result(resx[3]));
my_xor x29(.first(B[2]),.second(num), .result(resx[2]));
my_xor x30(.first(B[1]),.second(num), .result(resx[1]));
my_xor x31(.first(B[0]),.second(num), .result(resx[0]));


my_full_adder complement0(.a(num), .b(resx[0]), .carry_in(C0), .carry_out(C1), .sum(resc[0]));
my_full_adder complement1(.a(num2), .b(resx[1]), .carry_in(C1), .carry_out(C2), .sum(resc[1]));
my_full_adder complement2(.a(num2), .b(resx[2]), .carry_in(C2), .carry_out(C3), .sum(resc[2]));
my_full_adder complement3(.a(num2), .b(resx[3]), .carry_in(C3), .carry_out(C4), .sum(resc[3]));
my_full_adder complement4(.a(num2), .b(resx[4]), .carry_in(C4), .carry_out(C5), .sum(resc[4]));
my_full_adder complement5(.a(num2), .b(resx[5]), .carry_in(C5), .carry_out(C6), .sum(resc[5]));
my_full_adder complement6(.a(num2), .b(resx[6]), .carry_in(C6), .carry_out(C7), .sum(resc[6]));
my_full_adder complement7(.a(num2), .b(resx[7]), .carry_in(C7), .carry_out(C8), .sum(resc[7]));
my_full_adder complement8(.a(num2), .b(resx[8]), .carry_in(C8), .carry_out(C9), .sum(resc[8]));
my_full_adder complement9(.a(num2), .b(resx[9]), .carry_in(C9), .carry_out(C10), .sum(resc[9]));
my_full_adder complement10(.a(num2), .b(resx[10]), .carry_in(C10), .carry_out(C11), .sum(resc[10]));
my_full_adder complement11(.a(num2), .b(resx[11]), .carry_in(C11), .carry_out(C12), .sum(resc[11]));
my_full_adder complement12(.a(num2), .b(resx[12]), .carry_in(C12), .carry_out(C13), .sum(resc[12]));
my_full_adder complement13(.a(num2), .b(resx[13]), .carry_in(C13), .carry_out(C14), .sum(resc[13]));
my_full_adder complement14(.a(num2), .b(resx[14]), .carry_in(C14), .carry_out(C15), .sum(resc[14]));
my_full_adder complement15(.a(num2), .b(resx[15]), .carry_in(C15), .carry_out(C16), .sum(resc[15]));
my_full_adder complement16(.a(num2), .b(resx[16]), .carry_in(C16), .carry_out(C17), .sum(resc[16]));
my_full_adder complement17(.a(num2), .b(resx[17]), .carry_in(C17), .carry_out(C18), .sum(resc[17]));
my_full_adder complement18(.a(num2), .b(resx[18]), .carry_in(C18), .carry_out(C19), .sum(resc[18]));
my_full_adder complement19(.a(num2), .b(resx[19]), .carry_in(C19), .carry_out(C20), .sum(resc[19]));
my_full_adder complement20(.a(num2), .b(resx[20]), .carry_in(C20), .carry_out(C21), .sum(resc[20]));
my_full_adder complement21(.a(num2), .b(resx[21]), .carry_in(C21), .carry_out(C22), .sum(resc[21]));
my_full_adder complement22(.a(num2), .b(resx[22]), .carry_in(C22), .carry_out(C23), .sum(resc[22]));
my_full_adder complement23(.a(num2), .b(resx[23]), .carry_in(C23), .carry_out(C24), .sum(resc[23]));
my_full_adder complement24(.a(num2), .b(resx[24]), .carry_in(C24), .carry_out(C25), .sum(resc[24]));
my_full_adder complement25(.a(num2), .b(resx[25]), .carry_in(C25), .carry_out(C26), .sum(resc[25]));
my_full_adder complement26(.a(num2), .b(resx[26]), .carry_in(C26), .carry_out(C27), .sum(resc[26]));
my_full_adder complement27(.a(num2), .b(resx[27]), .carry_in(C27), .carry_out(C28), .sum(resc[27]));
my_full_adder complement28(.a(num2), .b(resx[28]), .carry_in(C28), .carry_out(C29), .sum(resc[28]));
my_full_adder complement29(.a(num2), .b(resx[29]), .carry_in(C29), .carry_out(C30), .sum(resc[29]));
my_full_adder complement30(.a(num2), .b(resx[30]), .carry_in(C30), .carry_out(C31), .sum(resc[30]));
my_full_adder complement31(.a(num2), .b(resx[31]), .carry_in(C31), .carry_out(C32), .sum(resc[31]));


my_full_adder sub0(.a(A[0]), .b(resc[0]), .carry_in(C32), .carry_out(C33), .sum(Res[0]));
my_full_adder sub1(.a(A[1]), .b(resc[1]), .carry_in(C33), .carry_out(C34), .sum(Res[1]));
my_full_adder sub2(.a(A[2]), .b(resc[2]), .carry_in(C34), .carry_out(C35), .sum(Res[2]));
my_full_adder sub3(.a(A[3]), .b(resc[3]), .carry_in(C35), .carry_out(C36), .sum(Res[3]));
my_full_adder sub4(.a(A[4]), .b(resc[4]), .carry_in(C36), .carry_out(C37), .sum(Res[4]));
my_full_adder sub5(.a(A[5]), .b(resc[5]), .carry_in(C37), .carry_out(C38), .sum(Res[5]));
my_full_adder sub6(.a(A[6]), .b(resc[6]), .carry_in(C38), .carry_out(C39), .sum(Res[6]));
my_full_adder sub7(.a(A[7]), .b(resc[7]), .carry_in(C39), .carry_out(C40), .sum(Res[7]));
my_full_adder sub8(.a(A[8]), .b(resc[8]), .carry_in(C40), .carry_out(C41), .sum(Res[8]));
my_full_adder sub9(.a(A[9]), .b(resc[9]), .carry_in(C41), .carry_out(C42), .sum(Res[9]));
my_full_adder sub10(.a(A[10]), .b(resc[10]), .carry_in(C42), .carry_out(C43), .sum(Res[10]));
my_full_adder sub11(.a(A[11]), .b(resc[11]), .carry_in(C43), .carry_out(C44), .sum(Res[11]));
my_full_adder sub12(.a(A[12]), .b(resc[12]), .carry_in(C44), .carry_out(C45), .sum(Res[12]));
my_full_adder sub13(.a(A[13]), .b(resc[13]), .carry_in(C45), .carry_out(C46), .sum(Res[13]));
my_full_adder sub14(.a(A[14]), .b(resc[14]), .carry_in(C46), .carry_out(C47), .sum(Res[14]));
my_full_adder sub15(.a(A[15]), .b(resc[15]), .carry_in(C47), .carry_out(C48), .sum(Res[15]));
my_full_adder sub16(.a(A[16]), .b(resc[16]), .carry_in(C48), .carry_out(C49), .sum(Res[16]));
my_full_adder sub17(.a(A[17]), .b(resc[17]), .carry_in(C49), .carry_out(C50), .sum(Res[17]));
my_full_adder sub18(.a(A[18]), .b(resc[18]), .carry_in(C50), .carry_out(C51), .sum(Res[18]));
my_full_adder sub19(.a(A[19]), .b(resc[19]), .carry_in(C51), .carry_out(C52), .sum(Res[19]));
my_full_adder sub20(.a(A[20]), .b(resc[20]), .carry_in(C52), .carry_out(C53), .sum(Res[20]));
my_full_adder sub21(.a(A[21]), .b(resc[21]), .carry_in(C53), .carry_out(C54), .sum(Res[21]));
my_full_adder sub22(.a(A[22]), .b(resc[22]), .carry_in(C54), .carry_out(C55), .sum(Res[22]));
my_full_adder sub23(.a(A[23]), .b(resc[23]), .carry_in(C55), .carry_out(C56), .sum(Res[23]));
my_full_adder sub24(.a(A[24]), .b(resc[24]), .carry_in(C56), .carry_out(C57), .sum(Res[24]));
my_full_adder sub25(.a(A[25]), .b(resc[25]), .carry_in(C57), .carry_out(C58), .sum(Res[25]));
my_full_adder sub26(.a(A[26]), .b(resc[26]), .carry_in(C58), .carry_out(C59), .sum(Res[26]));
my_full_adder sub27(.a(A[27]), .b(resc[27]), .carry_in(C59), .carry_out(C60), .sum(Res[27]));
my_full_adder sub28(.a(A[28]), .b(resc[28]), .carry_in(C60), .carry_out(C61), .sum(Res[28]));
my_full_adder sub29(.a(A[29]), .b(resc[29]), .carry_in(C61), .carry_out(C62), .sum(Res[29]));
my_full_adder sub30(.a(A[30]), .b(resc[30]), .carry_in(C62), .carry_out(C63), .sum(Res[30]));
my_full_adder sub31(.a(A[31]), .b(resc[31]), .carry_in(C63), .carry_out(C), .sum(Res[31]));


endmodule