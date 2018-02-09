`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2018 08:09:57 PM
// Design Name: 
// Module Name: full_fourbit_subtractor
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


module full_fourbit_subtractor(
    input [3:0] A,
    input [3:0] B,
    input A_pos,
    input B_pos,
    output [3:0] S,
    output overflow_flag,
    output neg_flag
    );
    
    wire [3:0] i1; 
    wire [3:0] i2;
    wire [3:0] i3;
    wire [3:0] i4;
    wire [3:0] i5;
    wire [3:0] i6;
    
    wire not_neg_flag;
    wire zero_flag, zero_flag1;
       
    twos_complement C1 (A, i1, zero_flag);
    twos_complement C2 (B, i2, zero_flag1);
    
    assign i3 = (A_pos == 0) ? A : i1;
    assign i4 = (B_pos == 1) ? B : i2;
    
    fourbit_full_adder A1 (i3, i4, 1'b0, i5, not_neg_flag);
    reverse_twos_complement C3 (i5, i6);
    
    assign neg_flag = (i5[3] == 0) ? 0 : 1;
    assign S = (neg_flag == 0) ? i5 : i6;
    assign overflow_flag = (i3[3] != i4[3]) ? 0 : ((i3[3] == i5[3]) ? 0 : 1);
    
endmodule
