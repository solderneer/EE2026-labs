set_property PACKAGE_PIN W5 [get_ports {CLOCK}]
set_property IOSTANDARD LVCMOS33 [get_ports {CLOCK}]
create_clock -add -name sys_clock_pin -period 10.00 -waveform {0 5} [get_ports {CLOCK}]

set_property PACKAGE_PIN U16 [get_ports {LED_ARRAY[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED_ARRAY[0]}]

set_property PACKAGE_PIN E19 [get_ports {LED_ARRAY[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED_ARRAY[1]}]

set_property PACKAGE_PIN U19 [get_ports {LED_ARRAY[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED_ARRAY[2]}]

set_property PACKAGE_PIN V19 [get_ports {LED_ARRAY[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED_ARRAY[3]}]

set_property PACKAGE_PIN W18 [get_ports {LED_ARRAY[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED_ARRAY[4]}]

set_property PACKAGE_PIN U15 [get_ports {LED_ARRAY[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED_ARRAY[5]}]

set_property PACKAGE_PIN U14 [get_ports {LED_ARRAY[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED_ARRAY[6]}]

set_property PACKAGE_PIN V14 [get_ports {LED_ARRAY[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED_ARRAY[7]}]

set_property PACKAGE_PIN U18 [get_ports {BUTTON}]
set_property IOSTANDARD LVCMOS33 [get_ports {BUTTON}]