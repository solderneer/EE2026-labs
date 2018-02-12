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
    
    reg [3:0] A;
    reg [3:0] B;
    
    full_fourbit_subtractor dut (A, B, S, overflow_flag);
    
    initial begin
        A = 4'b0101; B = 4'b0001; #100;
        A = 4'b0101; B = 4'b1001; #100;
        A = 4'b1101; B = 4'b0001; #100;
        A = 4'b1101; B = 4'b1001; #100;
        
        A = 4'b0111; B = 4'b1111; #100;
        A = 4'b1111; B = 4'b0111; #100;
        A = 4'b0000; B = 4'b0000; #100;
    end

endmodule
