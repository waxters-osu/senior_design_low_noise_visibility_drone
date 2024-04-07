/* Author: 	Evan Newell
	Date:   	April 6, 2024
	Project: LNVD
	
	Input: * 250 KHZ clk
			 * 4 x 12 bit values
	
	Output: *4 x 12 bit values mirrored across it's center 
				e.g. Input = 4096 -- Ouput = 0
					  Input = 4000 -- Output = 96
			  
	Credit: 
	* Silas Waxter and Aaron Jobe (Team member for research and troubleshooting support)

	Contact: (541)527-0767 *** neweleva000@gmail.com
*/


module SPKR_INVERTER_TB(
	input clk, 
	input [9: 0] SW,
	output[7: 0] HEX1,
   output[7: 0] HEX2,
   output[7: 0] HEX3
	);

	wire [11:0] data1;
	wire [11:0] data2;
	wire [11:0] data3;
	wire [11:0] data4;
	
	LNVD_VIEW_4SIG_TEST u0 (
		.clk(clk),
		.SW_in(SW),
		.data_in_12_A(data1),
		.data_in_12_B(data2),
		.data_in_12_C(data3),
		.data_in_12_D(data4),
		.HEX1_in(HEX1),
      .HEX2_in(HEX2),
      .HEX3_in(HEX3)

	);
	
	SPKR_INVERTER u1 (
		.clk(clk),
		.non_inverted1('h0),
		.non_inverted2('hFFF),
		.non_inverted3('D200),
		.non_inverted4('D3000),
		.inverted1(data1),
		.inverted2(data2),
		.inverted3(data3),
		.inverted4(data4)
	);

endmodule
