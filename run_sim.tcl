# Create a new project named alu_project
create_project ALU  ./ALU
set_property simulator_language Verilog [current_project] 

# add source files
add_files {./ALU.srcs/sources_1/new/alu.v ./ALU.srcs/sim_1/new/stimuli.v}

set_property top stimuli [get_filesets sim_1]    

# sim_1 is the default simulation fileset created in Vivado when you add simulation sources.

# Run synthesis (only needed if doing synthesis-based verification)
launch_runs synth_1
wait_on_run synth_1


# Set simulation options
set_property -name {xsim.simulate.runtime} -value {1000ns} -objects [get_filesets sim_1]

# Launch simulation
launch_simulation

# Run wave capture (optional)
log_wave -r /*
run all

# Capture output values
open_vcd output.vcd
