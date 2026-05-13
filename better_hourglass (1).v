`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2026 11:47:55 PM
// Design Name: 
// Module Name: better_hourglass
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


module better_hourglass(
    input CLK100MHZ,
    output reg [15:0] LED = 16'b1111_1111_0000_0000
    );

    reg [3:0] state = 1'b0;
    reg [3:0] state_next;
    reg [15:0] led_next;

    always @ * begin
        state_next = state;
        led_next = LED;
        if (state < 8) begin
            led_next = {1'b0, LED[15:9], LED[6:0], 1'b1};
        end 
        else begin 
            led_next = {1'b1, LED[15:9], LED[6:0], 1'b0};  
        end
    end
    
    
    reg clk = 1'b0;
    reg [25:0] counter = 26'd0;
    always @(posedge CLK100MHZ) begin
        counter <= counter + 1'b1;
        if (counter == 26'd50_000_000) begin 
            clk <= ~clk; 
            counter <= 26'd0;
        end
    end
    
    always @(posedge clk) begin
        state <= state_next + 1'b1;
        LED <= led_next;
    end
    
endmodule
