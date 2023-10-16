vsim -gui work.Updated_VGA_driver
add wave -binary clk
add wave -binary clk_25
add wave -binary reset_n
add wave -binary res
add wave -binary H_sync
add wave -binary H_disp
add wave -unsigned H_count
add wave -binary V_sync
add wave -binary V_disp
add wave -unsigned V_count
add wave -binary EN
add wave -binary Pixel_RGB
add wave -binary RGB_Outputs

force reset_n 0 @ 0ps, 1 @ 1ps
force clk 0 @ 0ps, 1 @ 1ps -r 2ps

force Pixel_RGB 100111 @ 0ps

run 2000 ns