/* Author: 	Evan Newell
	Date:   	April 6, 2024
	Project: LNVD
	
	Input: * 50 MHZ clk
			 * 10 bit value representing which signal you want displayed (1 to 4)
			 * 4 x 12 bit value to be displayed
	
	Output: *3 digit value diplaying 12 bit value in hex
			  
	Credit: 
	* The structure of SEG7_LUT was taken directly from the below source (which was 
	previous taken from terasic inc. -- see corresponding seven segment module for 
	licensing
	https://github.com/FedorChervyakov/de10lite-hello-adc/blob/dev/fpga/src/top_level.vhd

	* Silas Waxter and Aaron Jobe (Team member for research and troubleshooting support)

	Contact: (541)527-0767 *** neweleva000@gmail.com
*/

module LNVD_VIEW_4SIG_TEST (
		input  clk,
		input  [9: 0] SW_in,
		input  [11:0] data_in_12_A,
		input	 [11:0] data_in_12_B,
		input	 [11:0] data_in_12_C,
		input	 [11:0] data_in_12_D,
		output [7: 0] HEX1_in,
      output [7: 0] HEX2_in,
      output [7: 0] HEX3_in
		);

		
	reg [11:0] data_7;
	
	always @(posedge clk) begin
				
		//code segment to toggle 7-segment viewable data
		if(SW_in[2:0] == 'h1) begin
			data_7 <= data_in_12_A;
			
		end else if(SW_in[2:0] == 'h2) begin
			data_7 <= data_in_12_B;
			
		end else if(SW_in[2:0] == 'h3) begin
			data_7 <= data_in_12_C;
			
		end else if(SW_in[2:0] == 'h4) begin
			data_7 <= data_in_12_D;
		end	
		else
			data_7 <= 'h0;
		
	end
	
	
	//initialization for 7 segment to read adc data
	SEG7_LUT	SEG7_LUT_v (
		.oSEG(HEX3_in),
		.iDIG(data_7[11:8])
	);

	SEG7_LUT	SEG7_LUT_v_1 (
		.oSEG(HEX2_in),
		.iDIG(data_7[7:4])
	);

	SEG7_LUT	SEG7_LUT_v_2 (
		.oSEG(HEX1_in),
		.iDIG(data_7[3:0])
	);

	
endmodule


