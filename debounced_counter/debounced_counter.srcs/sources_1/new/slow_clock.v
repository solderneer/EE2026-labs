`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// Design Name: 
// Module Name: slow_clock
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


module slow_clock(
    input CLOCK,
    output reg OUTPUT
    );
    
    reg [23:0] count = 0;
    
    always @(posedge CLOCK) begin
        count <= count + 1;
        OUTPUT <= (count == 0) ? ~OUTPUT : OUTPUT;
    end
        
endmodule

