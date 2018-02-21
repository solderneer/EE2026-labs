`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.02.2018 03:06:23
// Design Name: 
// Module Name: countup
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


module countup(
    input PULSE,
    output reg [7:0] COUNTUP
    );
    
    initial begin
        COUNTUP = 8'd0;
    end
    
    always @(posedge PULSE) begin
        COUNTUP <= COUNTUP + 1;
    end
endmodule
