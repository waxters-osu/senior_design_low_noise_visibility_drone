/* Author: 	Evan Newell
	Date:   	April 6, 2024
	Project: LNVD
	
	Input: * 50 MHz clk
			 * 4 x 12 bit values
	
	Output: *4 x 12 bit values downsampled N times
			  *250 KHz clk
				
			  
	Credit: 
	* Silas Waxter and Aaron Jobe (Team member for research and troubleshooting support)

	Contact: (541)527-0767 *** neweleva000@gmail.com
*/

module LNVD_DWN_SIZE(
	input  clk,
	input  [11:0] data_in1,
	input  [11:0] data_in2,
	input  [11:0] data_in3,
	input  [11:0] data_in4,
	output reg [11:0] data_out1,
	output reg [11:0] data_out2,
	output reg [11:0] data_out3,
	output reg [11:0] data_out4,
	output reg clk_out
	);
	
	reg [7:0] counter;
	
	always @(posedge clk) begin
		counter <= counter + 1;
		
		if(counter == 'hC8) begin
			clk_out <= ~clk_out;
			counter <= 0;
			data_out1 <= data_in1;
			data_out2 <= data_in2;
			data_out3 <= data_in3;
			data_out4 <= data_in4;
		end
	end
	

endmodule