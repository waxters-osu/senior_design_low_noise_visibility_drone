vsim -gui work.subtractor
add wave N
add wave sub_by
add wave -unsigned a
add wave -unsigned diff

force a 10#50 @ 0ps, 10#55 @ 10ps, 10#63 @ 20ps
run 30 ps
