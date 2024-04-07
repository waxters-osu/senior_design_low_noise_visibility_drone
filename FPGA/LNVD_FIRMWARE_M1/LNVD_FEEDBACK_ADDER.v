/* Author: 	Evan Newell
	Date:   	April 6, 2024
	Project: LNVD
	
	Input: * 250 KHz clk
			 * 4 x 12 bit values
			 * 4 x 12 bit values from process delay buffer
	
	Output: *4 x 12 bit values summed from the 2 inputs

			  
	Credit: 
	* Silas Waxter and Aaron Jobe (Team member for research and troubleshooting support)

	Contact: (541)527-0767 *** neweleva000@gmail.com
*/

module LNVD_FEEDBACK_ADDER(
	input  clk,
	input  [11:0] data_in1,
	input  [11:0] data_in2,
	input  [11:0] data_in3,
	input  [11:0] data_in4,
	input  [11:0] data_in_buffer1,
	input  [11:0] data_in_buffer2,
	input  [11:0] data_in_buffer3,
	input  [11:0] data_in_buffer4,
	output reg [7:0] data_out1,
	output reg [7:0] data_out2,
	output reg [7:0] data_out3,
	output reg [7:0] data_out4,
	output output_clk
);

	always @(posedge clk) begin
		data_out1 <= data_in1[11:4];
		data_out2 <= data_in2[11:4];
		data_out3 <= data_in3[11:4];
		data_out4 <= data_in4[11:4];
	end

endmodule