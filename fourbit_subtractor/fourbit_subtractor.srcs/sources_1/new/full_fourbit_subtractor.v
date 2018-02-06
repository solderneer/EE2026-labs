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
    output neg_flag
    );
    
    wire [3:0] intermediate;
    wire [3:0] intermediate1; 
    wire [3:0] intermediate2;
    wire not_neg_flag;
    wire zero_flag;
       
    twos_complement C1 (B, intermediate, zero_flag);
    fourbit_full_adder A1 (A, intermediate, 1'b0, intermediate1, not_neg_flag);
    reverse_twos_complement C2 (intermediate1, intermediate2);
    
    assign neg_flag = (zero_flag == 0) ? (~(not_neg_flag)) : (not_neg_flag);
    assign S = (neg_flag == 0) ? intermediate1 : intermediate2; 
    
endmodule
