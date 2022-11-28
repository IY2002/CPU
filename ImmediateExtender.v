`timescale 1ns/1ps
module ImmediateExtender (
    input [15:0] imm,

    output reg [31:0] imm32
);

always @(imm) begin
    // copys the last bit of imm 16 times before imm
    // makes sure the sign of imm is not lost during sign extension
    imm32 = {{16{imm[15]}}, imm[15:0]};
end
endmodule