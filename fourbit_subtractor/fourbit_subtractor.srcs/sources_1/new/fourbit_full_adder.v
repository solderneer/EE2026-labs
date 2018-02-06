`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2018 11:54:07 AM
// Design Name: 
// Module Name: fourbit_full_adder
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


module fourbit_full_adder(
    input [3:0] A,
    input [3:0] B,
    input CIN,
    output [3:0] S,
    output COUT
    );
    
    wire C1, C2, C3;
    
    onebit_full_adder A1 (A[0], B[0], CIN, S[0], C1);
    onebit_full_adder A2 (A[1], B[1], C1, S[1], C2);
    onebit_full_adder A3 (A[2], B[2], C2, S[2], C3);
    onebit_full_adder A4 (A[3], B[3], C3, S[3], COUT);
endmodule
