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
  set_property webtalk.parent_dir C:/Users/Auora/Documents/EE2026_labs/clock/clock.cache/wt [current_project]
  set_property parent.project_path C:/Users/Auora/Documents/EE2026_labs/clock/clock.xpr [current_project]
  set_property ip_repo_paths c:/Users/Auora/Documents/EE2026_labs/clock/clock.cache/ip [current_project]
  set_property ip_output_repo c:/Users/Auora/Documents/EE2026_labs/clock/clock.cache/ip [current_project]
  add_files -quiet C:/Users/Auora/Documents/EE2026_labs/clock/clock.runs/synth_1/slow_clock.dcp
  read_xdc C:/Users/Auora/Documents/EE2026_labs/clock/clock.srcs/constrs_1/new/constraints.xdc
  link_design -top slow_clock -part xc7a35tcpg236-1
  write_hwdef -file slow_clock.hwdef
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
  write_checkpoint -force slow_clock_opt.dcp
  report_drc -file slow_clock_drc_opted.rpt
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
  write_checkpoint -force slow_clock_placed.dcp
  report_io -file slow_clock_io_placed.rpt
  report_utilization -file slow_clock_utilization_placed.rpt -pb slow_clock_utilization_placed.pb
  report_control_sets -verbose -file slow_clock_control_sets_placed.rpt
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
  write_checkpoint -force slow_clock_routed.dcp
  report_drc -file slow_clock_drc_routed.rpt -pb slow_clock_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file slow_clock_timing_summary_routed.rpt -rpx slow_clock_timing_summary_routed.rpx
  report_power -file slow_clock_power_routed.rpt -pb slow_clock_power_summary_routed.pb -rpx slow_clock_power_routed.rpx
  report_route_status -file slow_clock_route_status.rpt -pb slow_clock_route_status.pb
  report_clock_utilization -file slow_clock_clock_utilization_routed.rpt
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
  catch { write_mem_info -force slow_clock.mmi }
  write_bitstream -force slow_clock.bit 
  catch { write_sysdef -hwdef slow_clock.hwdef -bitfile slow_clock.bit -meminfo slow_clock.mmi -file slow_clock.sysdef }
  catch {write_debug_probes -quiet -force debug_nets}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

