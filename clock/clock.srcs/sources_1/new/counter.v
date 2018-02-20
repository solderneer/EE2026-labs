`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.02.2018 04:08:37
// Design Name: 
// Module Name: counter
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


module led_counter(
    input CLOCK,
    output LED
    );
    
    reg [3:0] count = 4'b0000;
    
    always @(posedge CLOCK) begin
        count <= count + 1;
        LED <= (count == 4'b0000) ? ~LED : LED;
    end    
endmodule
