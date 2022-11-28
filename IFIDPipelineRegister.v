`timescale 1ns/1ps
module IFIDPipelineRegister (
    input clk,
    input [31:0] instOut,

    output reg [31:0] dinstOut
);

always @(posedge clk) begin
    dinstOut = instOut;
end
    
endmodule