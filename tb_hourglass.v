`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/25/2026 12:05:04 AM
// Design Name: 
// Module Name: tb_better_hourglass
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


module tb_better_hourglass(

    );
    
    reg clk = 1'b0;
    wire [15:0] out;
    better_hourglass ins(clk, out);
    
    
//    always # 5
//        clk = ~clk;
        
    initial begin
        clk = 0;
        #5; 
        forever begin 
        #5 
        clk = ~clk; 
        end
    end
    
endmodule
