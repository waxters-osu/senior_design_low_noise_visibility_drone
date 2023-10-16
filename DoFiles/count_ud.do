vsim -gui work.count_ud
add wave N
add wave Ub
add wave Lb
add wave Pcount
add wave -binary clk
add wave -binary res
add wave -binary pos
add wave -binary neg
add wave -signed q
add wave -signed s_curr
add wave -signed s_next
#add wave -signed n1
#add wave -signed n2
#add wave -signed n3

force clk 0 @ 0, 1 @ 1 -r 2
force res 1 @ 0, 0 @ 1
force pos 1 @ 5, 0 @ 150
force neg 0 @ 0, 1 @ 155
run 460 ps

run 460 ps
