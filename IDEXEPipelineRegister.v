`timescale 1ns/1ps
module IDEXEPipelineRegister (
    input clk,
    input wreg,
    input m2reg,
    input wmem,
    input aluimm,
    input [3:0] aluc,
    input [4:0] destReg,
    input [31:0] qa,
    input [31:0] qb,
    input [31:0] imm32,

    output reg ewreg,
    output reg em2reg,
    output reg ewmem,
    output reg ealuimm,
    output reg [3:0] ealuc,
    output reg [4:0] edestReg,
    output reg [31:0] eqa,
    output reg [31:0] eqb,
    output reg [31:0] eimm32
);
    
    always @(posedge clk) begin
        ewreg = wreg;
        em2reg = m2reg;
        ewmem = wmem;
        ealuimm = aluimm;
        ealuc = aluc;
        edestReg = destReg;
        eqa = qa;
        eqb = qb;
        eimm32 = imm32;
    end
endmodule