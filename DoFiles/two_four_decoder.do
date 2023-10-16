vsim -gui work.two_four_decoder
add wave -binary data
add wave -binary encoding

force data 00 @ 0ps, 01 @ 5ps, 10 @ 10ps, 11 @ 15ps

run 20ps