vsim -gui work.counter
add wave N
add wave -binary clk
add wave -binary reset
add wave -unsigned q

force clk 0 @ 0ps, 1 @ 1ps -r 2ps
force reset 1 @ 0ps, 0 @ 1ps

run 50 ps