`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/31/2018 02:31:29 PM
// Design Name: 
// Module Name: lab_1a
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


module lab_1a(
    input A,
    input B,
    input C,
    output LED1,
    output LED2,
    output LED3
    );
    
    assign LED1 = ((A & ~B) & C) | ((A & B) & C);
    assign LED2 = ((~A & B) & C) | ((A & B) & C);
    assign LED3 = ((A & B) & C);
    
endmodule
