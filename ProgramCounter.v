`timescale 1ns/1ps
module ProgramCounter (
    input clk,
    input [31:0] nextPc,

    output reg [31:0] pc
);

initial begin
    pc = 32'h00000063;
end

always @(posedge clk) begin
    pc <= nextPc;
end

endmodule