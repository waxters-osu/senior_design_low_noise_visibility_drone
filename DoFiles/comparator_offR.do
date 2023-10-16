vsim -gui work.comparator_offR
add wave N
add wave M
add wave -unsigned a
add wave -unsigned offcount
add wave -binary offset

force a 10#20 @ 0ps, 10#9 @ 2ps, 10#10 @ 5ps, 10#5 @ 6ps, 10#15 @ 8ps
force offcount 10#0 @ 0ps, 10#15 @ 10ps, 10#22 @ 15ps
run 20ps