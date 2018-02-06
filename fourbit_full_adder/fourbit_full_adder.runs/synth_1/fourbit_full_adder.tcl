# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir Z:/Documents/Projects/EE2026_labs/fourbit_full_adder/fourbit_full_adder.cache/wt [current_project]
set_property parent.project_path Z:/Documents/Projects/EE2026_labs/fourbit_full_adder/fourbit_full_adder.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_verilog -library xil_defaultlib {
  Z:/Documents/Projects/EE2026_labs/fourbit_full_adder/fourbit_full_adder.srcs/sources_1/new/onebit_full_adder.v
  Z:/Documents/Projects/EE2026_labs/fourbit_full_adder/fourbit_full_adder.srcs/sources_1/new/fourbit_full_adder.v
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc Z:/Documents/Projects/EE2026_labs/fourbit_full_adder/fourbit_full_adder.srcs/constrs_1/new/constraints.xdc
set_property used_in_implementation false [get_files Z:/Documents/Projects/EE2026_labs/fourbit_full_adder/fourbit_full_adder.srcs/constrs_1/new/constraints.xdc]


synth_design -top fourbit_full_adder -part xc7a35tcpg236-1


write_checkpoint -force -noxdef fourbit_full_adder.dcp

catch { report_utilization -file fourbit_full_adder_utilization_synth.rpt -pb fourbit_full_adder_utilization_synth.pb }