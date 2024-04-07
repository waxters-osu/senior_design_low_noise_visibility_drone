/* Author: 	Evan Newell
	Date:   	April 6, 2024
	Project: LNVD
	
	Input: * 250 KHz clk
			 * 4 x 12 bit values
	
	Output: *4 x 12 bit values 
			  *250 KHz clk
			  *delay of parameterized N ns
				
			  
	Credit: 
	* Silas Waxter and Aaron Jobe (Team member for research and troubleshooting support)

	Contact: (541)527-0767 *** neweleva000@gmail.com
*/

module LNVD_WIRE_DELAY(
	input  clk,
	input  [11:0] data_in1,
	input  [11:0] data_in2,
	input  [11:0] data_in3,
	input  [11:0] data_in4,
	output [11:0] data_out1,
	output [11:0] data_out2,
	output [11:0] data_out3,
	output [11:0] data_out4,
	output clk_out

);

parameter DELAY = 200;	//delay in ns

endmodule