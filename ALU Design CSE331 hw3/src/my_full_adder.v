module my_full_adder(
	input a,
   input	b,
   input	carry_in,
	output sum,
   output carry_out
);

wire temp_sum, first_carry_out, second_carry_out;

my_half_adder first(.sum(temp_sum), .carry_out(first_carry_out), .a(a), .b(b));
my_half_adder second(.sum(sum), .carry_out(second_carry_out), .a(temp_sum), .b(carry_in));
or final_carry_out(carry_out, second_carry_out, first_carry_out);

endmodule