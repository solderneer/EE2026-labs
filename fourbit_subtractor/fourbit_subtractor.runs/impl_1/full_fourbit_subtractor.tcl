proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param xicom.use_bs_reader 1
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir Z:/Documents/Projects/EE2026_labs/fourbit_subtractor/fourbit_subtractor.cache/wt [current_project]
  set_property parent.project_path Z:/Documents/Projects/EE2026_labs/fourbit_subtractor/fourbit_subtractor.xpr [current_project]
  set_property ip_repo_paths z:/Documents/Projects/EE2026_labs/fourbit_subtractor/fourbit_subtractor.cache/ip [current_project]
  set_property ip_output_repo z:/Documents/Projects/EE2026_labs/fourbit_subtractor/fourbit_subtractor.cache/ip [current_project]
  add_files -quiet Z:/Documents/Projects/EE2026_labs/fourbit_subtractor/fourbit_subtractor.runs/synth_1/full_fourbit_subtractor.dcp
  read_xdc Z:/Documents/Projects/EE2026_labs/fourbit_subtractor/fourbit_subtractor.srcs/constrs_1/new/constraints.xdc
  link_design -top full_fourbit_subtractor -part xc7a35tcpg236-1
  write_hwdef -file full_fourbit_subtractor.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force full_fourbit_subtractor_opt.dcp
  report_drc -file full_fourbit_subtractor_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force full_fourbit_subtractor_placed.dcp
  report_io -file full_fourbit_subtractor_io_placed.rpt
  report_utilization -file full_fourbit_subtractor_utilization_placed.rpt -pb full_fourbit_subtractor_utilization_placed.pb
  report_control_sets -verbose -file full_fourbit_subtractor_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force full_fourbit_subtractor_routed.dcp
  report_drc -file full_fourbit_subtractor_drc_routed.rpt -pb full_fourbit_subtractor_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file full_fourbit_subtractor_timing_summary_routed.rpt -rpx full_fourbit_subtractor_timing_summary_routed.rpx
  report_power -file full_fourbit_subtractor_power_routed.rpt -pb full_fourbit_subtractor_power_summary_routed.pb -rpx full_fourbit_subtractor_power_routed.rpx
  report_route_status -file full_fourbit_subtractor_route_status.rpt -pb full_fourbit_subtractor_route_status.pb
  report_clock_utilization -file full_fourbit_subtractor_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force full_fourbit_subtractor.mmi }
  write_bitstream -force full_fourbit_subtractor.bit 
  catch { write_sysdef -hwdef full_fourbit_subtractor.hwdef -bitfile full_fourbit_subtractor.bit -meminfo full_fourbit_subtractor.mmi -file full_fourbit_subtractor.sysdef }
  catch {write_debug_probes -quiet -force debug_nets}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

