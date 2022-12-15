//32-bit adder was created using full adders 

module my_32bit_adder(
	input [31:0] A,
	input [31:0] B,
	input C0,
	output C,
	output [31:0] S
);

wire C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15,C16,C17,C18,C19,C20,C21,C22,C23,C24,C25,C26,C27,C28,C29,C30,C31;  //intermediate carries


my_full_adder FA0(.sum(S[0]), .carry_out(C1), .a(A[0]), .b(B[0]), .carry_in(C0));
my_full_adder FA1(.sum(S[1]), .carry_out(C2), .a(A[1]), .b(B[1]), .carry_in(C1));
my_full_adder FA2(.sum(S[2]), .carry_out(C3), .a(A[2]), .b(B[2]), .carry_in(C2));
my_full_adder FA3(.sum(S[3]), .carry_out(C4), .a(A[3]), .b(B[3]), .carry_in(C3));
my_full_adder FA4(.sum(S[4]), .carry_out(C5), .a(A[4]), .b(B[4]), .carry_in(C4));
my_full_adder FA5(.sum(S[5]), .carry_out(C6), .a(A[5]), .b(B[5]), .carry_in(C5));
my_full_adder FA6(.sum(S[6]), .carry_out(C7), .a(A[6]), .b(B[6]), .carry_in(C6));
my_full_adder FA7(.sum(S[7]), .carry_out(C8), .a(A[7]), .b(B[7]), .carry_in(C7));
my_full_adder FA8(.sum(S[8]), .carry_out(C9), .a(A[8]), .b(B[8]), .carry_in(C8));
my_full_adder FA9(.sum(S[9]), .carry_out(C10), .a(A[9]), .b(B[9]), .carry_in(C9));
my_full_adder FA10(.sum(S[10]), .carry_out(C11), .a(A[10]), .b(B[10]), .carry_in(C10));
my_full_adder FA11(.sum(S[11]), .carry_out(C12), .a(A[11]), .b(B[11]), .carry_in(C11));
my_full_adder FA12(.sum(S[12]), .carry_out(C13), .a(A[12]), .b(B[12]), .carry_in(C12));
my_full_adder FA13(.sum(S[13]), .carry_out(C14), .a(A[13]), .b(B[13]), .carry_in(C13));
my_full_adder FA14(.sum(S[14]), .carry_out(C15), .a(A[14]), .b(B[14]), .carry_in(C14));
my_full_adder FA15(.sum(S[15]), .carry_out(C16), .a(A[15]), .b(B[15]), .carry_in(C15));
my_full_adder FA16(.sum(S[16]), .carry_out(C17), .a(A[16]), .b(B[16]), .carry_in(C16));
my_full_adder FA17(.sum(S[17]), .carry_out(C18), .a(A[17]), .b(B[17]), .carry_in(C17));
my_full_adder FA18(.sum(S[18]), .carry_out(C19), .a(A[18]), .b(B[18]), .carry_in(C18));
my_full_adder FA19(.sum(S[19]), .carry_out(C20), .a(A[19]), .b(B[19]), .carry_in(C19));
my_full_adder FA20(.sum(S[20]), .carry_out(C21), .a(A[20]), .b(B[20]), .carry_in(C20));
my_full_adder FA21(.sum(S[21]), .carry_out(C22), .a(A[21]), .b(B[21]), .carry_in(C21));
my_full_adder FA22(.sum(S[22]), .carry_out(C23), .a(A[22]), .b(B[22]), .carry_in(C22));
my_full_adder FA23(.sum(S[23]), .carry_out(C24), .a(A[23]), .b(B[23]), .carry_in(C23));
my_full_adder FA24(.sum(S[24]), .carry_out(C25), .a(A[24]), .b(B[24]), .carry_in(C24));
my_full_adder FA25(.sum(S[25]), .carry_out(C26), .a(A[25]), .b(B[25]), .carry_in(C25));
my_full_adder FA26(.sum(S[26]), .carry_out(C27), .a(A[26]), .b(B[26]), .carry_in(C26));
my_full_adder FA27(.sum(S[27]), .carry_out(C28), .a(A[27]), .b(B[27]), .carry_in(C27));
my_full_adder FA28(.sum(S[28]), .carry_out(C29), .a(A[28]), .b(B[28]), .carry_in(C28));
my_full_adder FA29(.sum(S[29]), .carry_out(C30), .a(A[29]), .b(B[29]), .carry_in(C29));
my_full_adder FA30(.sum(S[30]), .carry_out(C31), .a(A[30]), .b(B[30]), .carry_in(C30));
my_full_adder FA31(.sum(S[31]), .carry_out(C), .a(A[31]), .b(B[31]), .carry_in(C31));
				
				
endmodule
