`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2018 12:02:13 PM
// Design Name: 
// Module Name: simulation
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


module simulation(

    );
    
    wire [3:0] S;
    wire neg_flag;
    
    reg [3:0] A;
    reg [3:0] B;
    reg A_pos, B_pos;
    
    full_fourbit_subtractor dut (A, B, A_pos, B_pos, S, overflow_flag, neg_flag);
    
    initial begin
        A = 4'b1111; B = 4'b0000; A_pos = 0; B_pos = 0; #10;
    end

endmodule
