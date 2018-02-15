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
    output [3:0] S,
    output overflow_flag
    );
    
    wire [3:0] i1; // Intermediate wires
    wire [3:0] i2;
    wire [3:0] i3; 
    wire [3:0] i4;
    wire [3:0] i5;
    wire [3:0] i6;
    wire [3:0] i7;
    wire [3:0] i8;
    wire [3:0] i9;
    
    wire carry;
    wire neg_flag;
    wire zero_flag, zero_flag1;
    
    assign i7 = A & 4'b0111; // Masking out MSB to remove sign
    assign i8 = B & 4'b0111;
       
    twos_complement C1 (i7, i1, zero_flag); // Twos-complement for negative 
    twos_complement C2 (i8, i2, zero_flag1);
    
    assign i3 = (A[3] == 0) ? i7 : i1; 
    assign i4 = (B[3] == 1) ? i8 : i2;
    
    fourbit_full_adder A1 (i3, i4, 1'b0, i5, not_neg_flag);
    reverse_twos_complement C3 (i5, i6);
    
    assign neg_flag = (i5[3] == 0) ? 0 : 1;
    
    assign i9 = (neg_flag == 0) ? i5 : i6;
    assign S = (neg_flag == 0) ? (i9 & 4'b0111) : (i9 | 4'b1000); // Adding sign back in
    
    assign overflow_flag = (i3[3] != i4[3]) ? 0 : ((i3[3] == i5[3]) ? 0 : 1);
    
endmodule
