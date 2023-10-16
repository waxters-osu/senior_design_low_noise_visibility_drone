vsim -gui work.AddressConverter
add wave N
add wave ROWVAL
add wave -unsigned row
add wave -unsigned column
add wave -unsigned roff
add wave -unsigned coff
add wave -unsigned addresses

force row 10#0 @ 0ps, 10#1 @ 2ps, 10#5 @ 6ps, 10#50 @ 15ps
force column 10#0 @ 0ps, 10#1 @ 4ps, 10#10 @ 10ps
force roff 10#0 @ 0ps, 10#10 @ 17ps 
force coff 10#0 @ 0ps, 10#100 @ 25ps

run 30ps