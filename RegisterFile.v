`timescale 1ns/1ps
module RegisterFile (
    input [4:0] rs,
    input [4:0] rt,

    output reg [31:0] qa,
    output reg [31:0] qb
);

reg [31:0] registers [0:31];

integer i;

initial begin
for(i = 0; i < 32; i = i + 1) begin
    registers[i] = 0;
end
end

always @(rs or rt) begin
    qa = registers[rs];
    qb = registers[rt];
end
endmodule