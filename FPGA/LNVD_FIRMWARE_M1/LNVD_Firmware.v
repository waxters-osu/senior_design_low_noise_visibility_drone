/* Author: 	Evan Newell
	Date:   	April 6, 2024
	Project: LNVD
	
	Input: * 
	
	Output: *
			  
	Credit: 
	* Silas Waxter and Aaron Jobe (Team member for research and troubleshooting support)

	Contact: (541)527-0767 *** neweleva000@gmail.com
*/

module LNVD_Firmware (
	input 		  clk,  
	output [35:0] GPIO
	);

	//wire and reg calculations
	wire [11:0] adc_data1;
	wire [11:0] adc_data2;
	wire [11:0] adc_data3;
	wire [11:0] adc_data4;
	wire sys_clk1;
	wire sys_clk1a;
	
	wire [11:0] down_sample1;
	wire [11:0] down_sample2;
	wire [11:0] down_sample3;
	wire [11:0] down_sample4;
	wire sys_clk2;
	
	wire [11:0] post_fft1;
	wire [11:0] post_fft2;
	wire [11:0] post_fft3;
	wire [11:0] post_fft4;
	wire sys_clk3;
	
	wire [11:0] invert1;
	wire [11:0] invert2;
	wire [11:0] invert3;
	wire [11:0] invert4;
	wire sys_clk4;
	
	wire [11:0] wire_delay1;
	wire [11:0] wire_delay2;
	wire [11:0] wire_delay3;
	wire [11:0] wire_delay4;
	wire sys_clk5;
	
	wire [11:0] buffer_delay1;
	wire [11:0] buffer_delay2;
	wire [11:0] buffer_delay3;
	wire [11:0] buffer_delay4;
	wire sys_clk6;

	
	//clock bridge go to thing
	
	
	LNVD_ADC u0(
		.clk(clk), 
		.adc_data_out1(adc_data1),
		.adc_data_out2(adc_data2),
		.adc_data_out3(adc_data3),
		.adc_data_out4(adc_data4),
		.system_clk(sys_clk1)
		);
		
	LNVD_CLK50M u1 (
		.clk_clk       (sys_clk1),       //     clk.clk
		//.reset_reset_n (<connected-to-reset_reset_n>), //   reset.reset_n
		.clk_50m_clk   (sys_clk1a)    // clk_50m.clk
	);
		
	LNVD_DWN_SIZE u2(
		.clk(sys_clk1a),
		.data_in1(adc_data1),
		.data_in2(adc_data2),
		.data_in3(adc_data3),
		.data_in4(adc_data4),
		.data_out1(down_sample1),
		.data_out2(down_sample2),
		.data_out3(down_sample3),
		.data_out4(down_sample4),
		.clk_out(sys_clk2)
	);
	
	LNVD_CLK250K u3 (
		.clk_clk       (sys_clk2),       //      clk.clk
		//.reset_reset_n (<connected-to-reset_reset_n>), //    reset.reset_n
		.clk_250a_clk  (sys_clk3),  // clk_250a.clk
		.clk_250b_clk  (sys_clk4),  // clk_250b.clk
		.clk_250c_clk  (sys_clk5),  // clk_250c.clk
		.clk_250d_clk  (sys_clk6),  // clk_250d.clk
		.clk_250e_clk  (sys_clk7),  // clk_250e.clk
	);

	
	LNVD_FFT u4(
		.clk(sys_clk3),
		.data_in1(down_sample1),
		.data_in2(down_sample2),
		.data_in3(down_sample3),
		.data_in4(down_sample4),
		.data_out1(post_fft1),
		.data_out2(post_fft2),
		.data_out3(post_fft3),
		.data_out4(post_fft4),
		//.clk_out(sys_clk3)
	);
	
		
	SPKR_INVERTER u5(   //if error its probably because inverted pins are registers
		.clk(sys_clk4),
		.non_inverted1(post_fft1),
		.non_inverted2(post_fft2),
		.non_inverted3(post_fft3),
		.non_inverted4(post_fft4),
		.inverted1(invert1),
		.inverted2(invert2),
		.inverted3(invert3),
		.inverted4(invert4)
	);
	
	//wire delay
	LNVD_PROCESS_DELAY #(.DELAY(200)) u6(
		.clk(sys_clk5),
		.data_in1(invert1),
		.data_in2(invert2),
		.data_in3(invert3),
		.data_in4(invert4),
		.data_out1(wire_delay1),
		.data_out2(wire_delay2),
		.data_out3(wire_delay3),
		.data_out4(wire_delay4),
		//.clk_out(sys_clk5)
	);
	
	//whole process delay
	LNVD_PROCESS_DELAY #(.DELAY(300)) u7(
		.clk(sys_clk6),
		.data_in1(wire_delay1),
		.data_in2(wire_delay2),
		.data_in3(wire_delay3),
		.data_in4(wire_delay4),
		.data_out1(buffer_delay1),
		.data_out2(buffer_delay2),
		.data_out3(buffer_delay3),
		.data_out4(buffer_delay4),
		//.clk_out(sys_clk6)
	);
	
	LNVD_FEEDBACK_ADDER u8(
		.clk(sys_clk7),
		.data_in1(wire_delay1),
		.data_in2(wire_delay2),
		.data_in3(wire_delay3),
		.data_in4(wire_delay4),
		.data_in_buffer1(buffer_delay1),
		.data_in_buffer2(buffer_delay2),
		.data_in_buffer3(buffer_delay3),
		.data_in_buffer4(buffer_delay4),
		.data_out1(GPIO[7:0]),
		.data_out2(GPIO[15:8]),
		.data_out3(GPIO[23:16]),
		.data_out4(GPIO[31:24]),
		.output_clk(GPIO[32])
	);

	
endmodule



