// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"
// CREATED		"Mon Jun  6 23:28:15 2022"

module keyboard_controlled_sprite(
	clk_50MHz,
	ps2_clk,
	ps2_data,
	sys_reset_n,
	Backgnd_color,
	H_sync,
	V_sync,
	LEDs,
	RGB_Outputs
);


input wire	clk_50MHz;
input wire	ps2_clk;
input wire	ps2_data;
input wire	sys_reset_n;
input wire	[5:0] Backgnd_color;
output wire	H_sync;
output wire	V_sync;
output wire	[6:0] LEDs;
output wire	[11:0] RGB_Outputs;

wire	[5:0] bk_color;
wire	[11:0] bkg;
wire	[9:0] columndisplay;
wire	en;
wire	[6:0] is_pressed_key;
wire	[11:0] pixel_to_display;
wire	[11:0] rgb_out;
wire	[15:0] rom_address;
wire	[9:0] rowdisplay;
wire	[15:0] sprite_pixel;
wire	sys_reset;
wire	v_sync_ALTERA_SYNTHESIZED;




assign	sys_reset =  ~sys_reset_n;


ps2_driver	b2v_inst1(
	.sys_reset(sys_reset),
	.ps2_clk(ps2_clk),
	.clk_50MHz(clk_50MHz),
	.ps2_data(ps2_data),
	.is_pressed_key(is_pressed_key));


VGA_driver	b2v_inst10(
	.reset_n(sys_reset_n),
	.clk(clk_50MHz),
	.Pixel_RGB(pixel_to_display),
	.H_sync(H_sync),
	.V_sync(v_sync_ALTERA_SYNTHESIZED),
	.ColumnCount(columndisplay),
	.RGB_Outputs(rgb_out),
	.RowCount(rowdisplay));


Sprite_Position_Parser	b2v_inst13(
	.reset(sys_reset),
	.clk_V_sync(v_sync_ALTERA_SYNTHESIZED),
	.is_move_left(is_pressed_key[0]),
	.is_move_right(is_pressed_key[3]),
	.is_move_up(is_pressed_key[1]),
	.is_move_down(is_pressed_key[2]),
	.Backgnd_color(bk_color),
	.colCount(columndisplay),
	.rowCount(rowdisplay),
	.disp_sprite(en),
	.bkg(bkg),
	.sprite_pos(rom_address));


Sprite_ROM	b2v_inst15(
	.clock(clk_50MHz),
	.address(rom_address),
	.q(sprite_pixel));


Nbit_mux2	b2v_inst9(
	.s(en),
	.d0(bkg),
	.d1(sprite_pixel[15:4]),
	.y(pixel_to_display));
	defparam	b2v_inst9.N = 12;

assign	bk_color = Backgnd_color;
assign	V_sync = v_sync_ALTERA_SYNTHESIZED;
assign	LEDs = is_pressed_key;
assign	RGB_Outputs = rgb_out;

endmodule
