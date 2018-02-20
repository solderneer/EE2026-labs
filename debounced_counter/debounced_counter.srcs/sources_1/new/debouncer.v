`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.02.2018 05:03:53
// Design Name: 
// Module Name: debouncer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module debouncer(
    input BUTTON,
    input CLOCK,
    output PULSE
    );
    
    wire out_1;
    wire out_2;
    wire out_3;
    wire out_4;
    
    d_flipflop ff1 (CLOCK, BUTTON, out_1, out_2);
    d_flipflop ff2 (CLOCK, out_1, out_3, out_4);
    
    assign PULSE = out_1 & out_4;
     
endmodule
