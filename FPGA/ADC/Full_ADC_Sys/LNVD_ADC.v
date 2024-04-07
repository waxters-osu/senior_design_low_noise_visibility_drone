/* Author: 	Evan Newell
	Date:   	April 6, 2024
	Project: LNVD
	
	Input: 50 MHZ clk
	
	Output: *4 x 12 bit values representing analog values sampled at 1MHz from channels 
			   1, 2, 3, 4.  Each channel is sampled rotationally and thus has approximately
				250KHz per channel
				
			  *50 MHz clk in cycle with adc sampling
			  
	Credit: 
	* Qsys file was used as generated from the below source with modifications to update to 
	version 22.1
	https://github.com/FedorChervyakov/de10lite-hello-adc/blob/dev/fpga/src/top_level.vhd

	* Silas Waxter and Aaron Jobe (Team member for research and troubleshooting support)

	Contact: (541)527-0767 *** neweleva000@gmail.com
*/
module LNVD_ADC (
		input clk, 
		output [11: 0] adc_data_out1,
		output [11: 0] adc_data_out2,
		output [11: 0] adc_data_out3,
		output [11: 0] adc_data_out4,
		output system_clk	
		);

	
	//reg & wire intialization
	reg [11:0] adc_data;
	reg [11:0] adc_data1;
	reg [11:0] adc_data2;
	reg [11:0] adc_data3;
	reg [11:0] adc_data4;
	reg [4:0] response_channel;
	reg [4:0] command_channel;
	reg [7:0] channel_counter;

	wire reponse_valid;
	wire reset_n;
	wire [4:0] rsp_channel;
	wire cmd_start;
	wire cmd_end;
	wire command_valid;
	wire sys_clk;
	wire [11:0] response_data;
		
	//ADC qsys initialization	
	ADC_t6 u0 (
		.clk_clk                              	  (clk),                      //  clk.clk
      .reset_reset_n                        	  (reset_n),                  //  reset.reset_n
      .adc_control_core_command_valid          (command_valid),            //  modular_adc_0_command.valid
      .adc_control_core_command_channel        (command_channel),          //  .channel
      .adc_control_core_command_startofpacket  (cmd_start),    				//  .startofpacket    
      .adc_control_core_command_endofpacket    (cmd_end),    					// 
		.adc_control_core_command_ready          (command_ready),            //   ready
      .adc_control_core_response_valid         (response_valid),           // modular_adc_0_response.valid
      .adc_control_core_response_channel       (rsp_channel),         //                       .channel
      .adc_control_core_response_data          (response_data),            //                       .data
      .adc_control_core_response_startofpacket (response_startofpacket),   //                       .startofpacket
      .adc_control_core_response_endofpacket   (response_endofpacket),     //                       .endofpacket
      .clock_bridge_out_clk_clk         		  (sys_clk)           			// clock_bridge_sys_out_clk.clk
    );

	//constants for ADC 
	assign cmd_start = 'b1;
	assign cmd_end = 'b1;
	assign command_valid ='b1;
	assign reset_n = 'b1;
	
	//output signals
	assign adc_data_out1 = adc_data1;
	assign adc_data_out2 = adc_data2;
	assign adc_data_out3 = adc_data3;
	assign adc_data_out4 = adc_data4;
	assign system_clk = sys_clk;

	
	always @(posedge sys_clk) begin
		
		//increment counter for channel
		channel_counter <= (channel_counter + 1);

		//when counter = 200, increment channel (mod 4)
		if(channel_counter == 'hC8)
			command_channel <= (command_channel % 4) + 1;
		
		//if ADC has valid data sample it
		if( response_valid) begin
			adc_data <= response_data;	
			response_channel <= rsp_channel;
		end
		
		//multiplex data to appropriate datastream
		if(response_channel == 'h1) begin
			adc_data1 <= adc_data;
		end else if(response_channel == 'h2) begin
			adc_data2 <= adc_data;
		end else if(response_channel == 'h3) begin
			adc_data3 <= adc_data;
		end else if(response_channel == 'h4) begin
			adc_data4 <= adc_data;
		end
		
	end
	
		
endmodule

