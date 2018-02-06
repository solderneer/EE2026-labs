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
    wire COUT;
    
    reg [3:0] A;
    reg [3:0] B;
    reg CIN;
    
    fourbit_full_adder dut (A, B, CIN, S, COUT);
    
    initial begin
        A = 4'b0011; B = 4'b0011; CIN = 1'b0; #10;
        A = 4'b1011; B = 4'b0111; CIN = 1'b0; #10;
        A = 4'b1111; B = 4'b1111; CIN = 1'b0; #10;
    end
    
endmodule
