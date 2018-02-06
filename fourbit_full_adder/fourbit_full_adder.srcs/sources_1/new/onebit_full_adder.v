`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2018 08:59:10 PM
// Design Name: 
// Module Name: onebit_full_adder
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


module onebit_full_adder(
    input A,
    input B,
    input CIN,
    output S,
    output COUT
    );
    
    assign S = (A ^ B) ^ CIN;
    assign COUT = (A & B) | (CIN & (A ^ B));
    
endmodule
