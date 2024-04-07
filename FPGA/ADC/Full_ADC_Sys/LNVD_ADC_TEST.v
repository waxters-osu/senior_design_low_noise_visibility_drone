/* Author: 	Evan Newell
	Date:   	April 6, 2024
	Project: LNVD
	
	Input: * 50 MHZ clk
			 * 10 bit slide switch values (Available on DE10-LITE)
	
	Output: *3 digit 7 segment display which displays hexadecimal version of 
				analog input to the channel indicated by switch combination
			  
	Credit: 
	* Silas Waxter and Aaron Jobe (Team member for research and troubleshooting support)

	Contact: (541)527-0767 *** neweleva000@gmail.com
*/

module LNVD_ADC_TEST (
		input clk, 
		input [9: 0] SW,
		output[7: 0] HEX1,
      output[7: 0] HEX2,
      output[7: 0] HEX3
		);

		
	wire [11:0] adc_out1;
	wire [11:0] adc_out2;
	wire [11:0] adc_out3;
	wire [11:0] adc_out4;
	wire sys_clk;
	
	
	LNVD_ADC u0(
		.clk(clk),
		.adc_data_out1(adc_out1),
		.adc_data_out2(adc_out2),
		.adc_data_out3(adc_out3),
		.adc_data_out4(adc_out4),
		.system_clk(sys_clk)
	);
	
	LNVD_VIEW_4SIG_TEST u1(
		.clk(sys_clk),
		.SW_in(SW),
		.data_in_12_A(adc_out1),
		.data_in_12_B(adc_out2),
		.data_in_12_C(adc_out3),
		.data_in_12_D(adc_out4),
		.HEX1_in(HEX1),
		.HEX2_in(HEX2),
		.HEX3_in(HEX3)
	);
	
		
endmodule
