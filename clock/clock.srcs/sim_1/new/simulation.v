`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.02.2018 03:52:53
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
    
    reg CLOCK;
    wire LED;
    
    clock dut(CLOCK, LED);
    
    initial begin
        CLOCK = 0;
    end
    
    always begin
    CLOCK = ~CLOCK; #5;
    end
     
endmodule
