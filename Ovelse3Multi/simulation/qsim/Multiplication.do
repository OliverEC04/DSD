onerror {quit -f}
vlib work
vlog -work work Ovelse3Multiplication.vo
vlog -work work Multiplication.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.mult_vlg_vec_tst
vcd file -direction Multiplication.msim.vcd
vcd add -internal mult_vlg_vec_tst/*
vcd add -internal mult_vlg_vec_tst/i1/*
add wave /*
run -all
