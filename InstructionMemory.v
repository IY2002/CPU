`timescale 1ns/1ps
module InstructionMemory (
    input [31:0] pc,

    output reg [31:0] instOut
);

reg [31:0] memory [0:63];

initial begin
    memory[25] = {
        6'b100011,
        5'b00001,
        5'b00010,
        5'b00000,
        5'b00000,
        6'b000000
    };

    memory[26] = {
        6'b100011,
        5'b00001,
        5'b00011,
        5'b00000,
        5'b00000,
        6'b000100
    };

    memory[27] = {
        6'b100011,
        5'b00001,
        5'b00100,
        5'b00000,
        5'b00000,
        6'b001000
    };

    memory[28] = {
        6'b100011,
        5'b00001,
        5'b00101,
        5'b00000,
        5'b00000,
        6'b001100
    };
end

always @(pc) begin
    instOut = memory[pc[7:2]];
end
endmodule