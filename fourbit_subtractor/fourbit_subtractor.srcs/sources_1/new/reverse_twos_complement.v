`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2018 08:11:22 PM
// Design Name: 
// Module Name: reverse_twos_complement
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


module reverse_twos_complement(
    input [3:0] IN,
    output [3:0] OUT
    );
    
    wire dummy;
    wire [3:0] intermediate;
    
    fourbit_subtractor(IN, 1'b0001, intermediate, dummy);
    assign OUT = ~intermediate;
    
    
endmodule
