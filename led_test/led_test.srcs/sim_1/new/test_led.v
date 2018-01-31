`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/31/2018 12:09:05 PM
// Design Name: 
// Module Name: test_led
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


module test_led(

    );
    
    reg A;
    reg B;
    
    wire LED1;
    wire LED2;
    wire LED3;
    
    my_control_module dut(A, B,  LED1 ,LED2, LED3);
    
    initial begin
        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;
    end
    
endmodule
