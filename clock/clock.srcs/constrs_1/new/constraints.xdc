set_property PACKAGE_PIN W15 {get_ports CLOCK}
set_property IOSTANDARD LVCMOS33 {get_ports CLOCK}
create_clock -add -name sys_clock_pin -period 10.00 -waveform {0 5} {get_ports CLOCK}

set_property PACKAGE_PIN U16 {get_ports LED}
set_property IOSTANDARD LVCMOS33 {get_ports LED}


