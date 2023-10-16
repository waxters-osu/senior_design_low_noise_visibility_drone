vsim -gui work.comparator
add wave N
add wave M
add wave -unsigned a
add wave -binary gt
add wave -binary lt

force a 10#0 @ 0ps, 10#1 @ 10ps, 10#20 @ 20ps
run 25ps