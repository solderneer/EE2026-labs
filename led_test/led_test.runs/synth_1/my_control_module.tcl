# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/solderneer/led_test/led_test.cache/wt [current_project]
set_property parent.project_path C:/Users/solderneer/led_test/led_test.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_verilog -library xil_defaultlib C:/Users/solderneer/led_test/led_test.srcs/sources_1/new/led_test.v
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/solderneer/led_test/led_test.srcs/constrs_1/new/lab_1_constraints.xdc
set_property used_in_implementation false [get_files C:/Users/solderneer/led_test/led_test.srcs/constrs_1/new/lab_1_constraints.xdc]


synth_design -top my_control_module -part xc7a35tcpg236-1


write_checkpoint -force -noxdef my_control_module.dcp

catch { report_utilization -file my_control_module_utilization_synth.rpt -pb my_control_module_utilization_synth.pb }