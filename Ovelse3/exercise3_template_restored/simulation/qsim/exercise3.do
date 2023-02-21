onerror {quit -f}
vlib work
vlog -work work template.vo
vlog -work work exercise3.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.four_bit_adder_tester_vlg_vec_tst
vcd file -direction exercise3.msim.vcd
vcd add -internal four_bit_adder_tester_vlg_vec_tst/*
vcd add -internal four_bit_adder_tester_vlg_vec_tst/i1/*
add wave /*
run -all
