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

module SPKR_INVERTER(
	input 			   clk,
	input      [11:0] non_inverted1,
	input      [11:0] non_inverted2,
	input      [11:0] non_inverted3,
	input  	  [11:0] non_inverted4,
	output reg [11:0] inverted1,
	output reg [11:0] inverted2,
	output reg [11:0] inverted3,
	output reg [11:0] inverted4
	);
	
	always @(posedge clk) begin
		
		inverted1 <= 'hFFF - non_inverted1;
		inverted2 <= 'hFFF - non_inverted2;
		inverted3 <= 'hFFF - non_inverted3;
		inverted4 <= 'hFFF - non_inverted4;
		
	end



endmodule