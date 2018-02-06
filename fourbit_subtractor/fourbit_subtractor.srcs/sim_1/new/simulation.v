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
    
    fourbit_subtractor dut (A, B, S, neg_flag);
    
    initial begin
        A = 4'b0001; B = 4'b0011; #10;
    end
    
endmodule
