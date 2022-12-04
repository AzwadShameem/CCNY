transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/azwad/OneDrive/Documents/Projects/CS_343/Labs/Lab 3/Task 9/Shameem_03_06_22_NBitLPMAddSub/shameem_03_06_22_nbitlpmaddsub.vhd}

vcom -93 -work work {C:/Users/azwad/OneDrive/Documents/Projects/CS_343/Labs/Lab 3/Task 9/Shameem_03_06_22_NBitLPMAddSub/Shameem_03_06_22_NBitLPMAddSubTestBench.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  systb

add wave *
view structure
view signals
run -all
