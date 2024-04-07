/* Author: 	Evan Newell
	Date:   	April 7, 2024
	Project: LNVD
	
	Input: * 50 MHZ clk
			 * 10 bit slide switch values (Available on DE10-LITE)
	
	Output: *3 digit 7 segment display which displays hexadecimal version of 
				analog input to the channel indicated by switch combination
			  
	Credit: 
	* Silas Waxter and Aaron Jobe (Team member for research and troubleshooting support)

	Contact: (541)527-0767 *** neweleva000@gmail.com
*/

module LNVD_FIRMWARE_TB (
		input         clk, 
		input  [9: 0] SW,
		output [7: 0] HEX1,
      output [7: 0] HEX2,
      output [7: 0] HEX3,
		output [35:0] GPIO
		);
	
	//reg [35:0] test;
	LNVD_Firmware u0(
		.clk(clk),
		.GPIO(GPIO)
	);
	/*always @(posedge clk) begin
		test <= 'hFFFFFFFFF;
	end*/
	
	LNVD_VIEW_4SIG_TEST u1(
		.clk(clk),
		.SW_in(SW),
		.data_in_12_A({4'b0, GPIO[7:0]   }),
		.data_in_12_B({4'b0, GPIO[15:8]  }),
		.data_in_12_C({4'b0, GPIO[23:16] }),
		.data_in_12_D({4'b0, GPIO[31:24] }),
		.HEX1_in(HEX1),
		.HEX2_in(HEX2),
		.HEX3_in(HEX3)
	);
		
endmodule
