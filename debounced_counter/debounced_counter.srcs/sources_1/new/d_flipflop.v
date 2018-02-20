`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.02.2018 05:05:32
// Design Name: 
// Module Name: d_flipflop
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


module d_flipflop(
    input CLOCK,
    input INPUT,
    output reg Q,
    output reg NOT_Q
    );
    
    always @(posedge CLOCK) begin
        Q <= INPUT;
        NOT_Q <= (~INPUT);
    end    
endmodule
