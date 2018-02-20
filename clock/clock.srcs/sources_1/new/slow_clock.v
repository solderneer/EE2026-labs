`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.02.2018 04:42:07
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
    output OUTPUT
    );
    
    reg [24:0] count = 0;
    reg out_state = 0;
    
    assign OUTPUT = out_state;
    
    always @(posedge CLOCK) begin
        count <= count + 1;
        out_state <= (count == 0) ? ~out_state : out_state;
    end
        
endmodule
