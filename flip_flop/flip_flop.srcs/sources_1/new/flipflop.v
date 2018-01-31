`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/31/2018 06:58:09 PM
// Design Name: 
// Module Name: flipflop
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


module flipflop(
    input SET,
    input RESET,
    input clk,
    output reg Q
    );
    
    always @(posedge clk)
    begin
        if(RESET == 1'b1)
            Q <= 1'b0;
        else
            Q <= SET;
    end
endmodule

module bit_flipflop(
    input S1,
    input S2,
    input S3,
    input S4,
    input RESET,
    input clk,
    output LED1,
    output LED2,
    output LED3,
    output LED4
    );

flipflop F1 (S1, RESET, clk, LED1);
flipflop F2 (S2, RESET, clk, LED2);
flipflop F3 (S3, RESET, clk, LED3);
flipflop F4 (S4, RESET, clk, LED4);

endmodule
       
    
       
       
