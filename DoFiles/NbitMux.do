vsim -gui work.Nbit_mux2
add wave N
add wave -unsigned d0
add wave -unsigned d1
add wave -binary s
add wave -unsigned y

force d0 10#55 @ 0ps, 10#63 @ 20ps
force d1 10#25 @ 0ps, 10#34 @ 10ps
force s 0 @ 0ps, 1 @ 5ps, 0 @ 15ps

run 30ps