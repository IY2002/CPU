`timescale 1ns/1ps
module PcAdder (
    input [31:0] pc,

    output reg [31:0] nextPc
);

always @(pc) begin
    nextPc = pc + 32'h00000004;

    //waits a cycle so pc isnt constantly being written to
    #1;
end
endmodule