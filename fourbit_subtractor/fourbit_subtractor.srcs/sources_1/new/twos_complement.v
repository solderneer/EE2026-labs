`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2018 04:31:30 PM
// Design Name: 
// Module Name: twos_complement
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


module twos_complement(
    input [3:0] A,
    output [3:0] B,
    output zero_flag
    );
 
    fourbit_full_adder A1 ((~A), 4'b0001, 1'b0, B, zero_flag);
endmodule
