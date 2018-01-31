@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xsim test_led_behav -key {Behavioral:sim_1:Functional:test_led} -tclbatch test_led.tcl -view C:/Users/solderneer/led_test/test_led_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
