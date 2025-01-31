#vlog assertions.sv 
#vlog clock.sv
#vlog amd.sv
#vlog apb.sv
#vlog multibit.sv
vlog siyacon.sv
vsim -novopt -suppress 12110 tb -assertdebug
add wave /tb/a1
#add wave /tb/a2
#add wave /tb/a3
run -all 
