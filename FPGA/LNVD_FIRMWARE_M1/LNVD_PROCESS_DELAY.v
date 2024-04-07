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

module LNVD_PROCESS_DELAY
(
	input  clk,
	input  [11:0] data_in1,
	input  [11:0] data_in2,
	input  [11:0] data_in3,
	input  [11:0] data_in4,
	output reg [11:0] data_out1,
	output reg [11:0] data_out2,
	output reg [11:0] data_out3,
	output reg [11:0] data_out4,
	output clk_out

);

parameter DELAY = 200; //delay in ns

reg [19:0] counter; 

always @(posedge clk) begin
	counter <= counter + 1;
	
	//shift register here :(
	
	data_out1 <= data_in1;
	data_out2 <= data_in2;
	data_out3 <= data_in3;
	data_out4 <= data_in4;
end

endmodule