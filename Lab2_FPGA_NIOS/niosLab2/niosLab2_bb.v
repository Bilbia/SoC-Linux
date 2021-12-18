
module niosLab2 (
	buttons_export,
	clk_clk,
	leds_export,
	stepmotor_export,
	reset_reset_n);	

	input	[9:0]	buttons_export;
	input		clk_clk;
	output	[5:0]	leds_export;
	output	[3:0]	stepmotor_export;
	input		reset_reset_n;
endmodule
