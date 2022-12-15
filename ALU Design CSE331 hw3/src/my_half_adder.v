//to be used for full adder 
module my_half_adder(
	input a, 
	input b,
	output sum,
	output carry_out
);

xor sum_of_digits(sum, a, b);
and carry_of_sum(carry_out, a, b);

endmodule