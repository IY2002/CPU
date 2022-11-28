`timescale 1ns/1ps
module RegrtMux (
    input regrt,
    input [4:0] rt,
    input [4:0] rd,

    output reg [4:0] destReg
);
    always @(regrt or rt or rd) begin
        if (regrt == 1'b0) begin
            destReg = rd;
        end
        else begin
            destReg = rt;
        end
    end
endmodule