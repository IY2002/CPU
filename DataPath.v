`timescale 1ns/1ps
module DataPath (
    input clk,

    output wire ewreg,
    output wire em2reg,
    output wire ewmem,
    output wire ealuimm,
    output wire mwreg,
    output wire mm2reg,
    output wire mwmem,
    output wire wwreg,
    output wire wm2reg,
    output wire [3:0] ealuc,
    output wire [4:0] edestReg,
    output wire [4:0] mdestReg,
    output wire [4:0] wdestReg,
    output wire [31:0] eqa,
    output wire [31:0] eqb,
    output wire [31:0] eimm32,
    output wire [31:0] dinstOut,
    output wire [31:0] pc,
    output wire [31:0] mr,
    output wire [31:0] mqb,
    output wire [31:0] wr,
    output wire [31:0] wdo
);

wire wreg;
wire m2reg;
wire wmem;
wire aluimm;
wire regrt;
wire [3:0] aluc;
wire [4:0] destReg;
wire [31:0] qa;
wire [31:0] qb;
wire [31:0] imm32;
wire [31:0] instOut;
wire [31:0] nextPc;
wire [31:0] b;
wire [31:0] r;
wire [31:0] mdo;

MEMWBPipelineRegister memwbPipelineRegister(
    .clk(clk),
    .mwreg(mwreg),
    .mm2reg(mm2reg),
    .mdestReg(mdestReg),
    .mr(mr),
    .mdo(mdo),

    .wwreg(wwreg),
    .wm2reg(wm2reg),
    .wdestReg(wdestReg),
    .wr(wr),
    .wdo(wdo)
);

EXEMEMPipelineRegister exememPipelineRegister(
    .clk(clk),
    .ewreg(ewreg),
    .em2reg(em2reg),
    .ewmem(ewmem),
    .edestReg(edestReg),
    .r(r),
    .eqb(eqb),

    .mwreg(mwreg),
    .mm2reg(mm2reg),
    .mwmem(mwmem),
    .mdestReg(mdestReg),
    .mr(mr),
    .mqb(mqb)
);

Alu alu(
    .ealuc(ealuc),
    .eqa(eqa),
    .b(b),

    .r(r)
);

AluMux aluMux(
    .ealuimm(ealuimm),
    .eqb(eqb),
    .eimm32(eimm32),

    .b(b)
);

DataMemory dataMemory(
    .clk(clk),
    .mwmem(mwmem),
    .mr(mr),
    .mqb(mqb),

    .mdo(mdo)
);

ControlUnit controlUnit(
    .op(dinstOut[31:26]),
    .func(dinstOut[5:0]),

    .wreg(wreg),
    .m2reg(m2reg),
    .wmem(wmem),
    .aluimm(aluimm),
    .regrt(regrt),
    .aluc(aluc)
);

IDEXEPipelineRegister idexePipelineRegister(
    .clk(clk),
    .wreg(wreg),
    .m2reg(m2reg),
    .wmem(wmem),
    .aluimm(aluimm),
    .aluc(aluc),
    .destReg(destReg),
    .qa(qa),
    .qb(qb),
    .imm32(imm32),

    .ewreg(ewreg),
    .em2reg(em2reg),
    .ewmem(ewmem),
    .ealuimm(ealuimm),
    .ealuc(ealuc),
    .edestReg(edestReg),
    .eqa(eqa),
    .eqb(eqb),
    .eimm32(eimm32)
);

IFIDPipelineRegister ifidPipelineRegister(
    .clk(clk),
    .instOut(instOut),

    .dinstOut(dinstOut)
);

ImmediateExtender immediateExtender(
    .imm(dinstOut[15:0]),

    .imm32(imm32)
);

InstructionMemory instructionMemory(
    .pc(pc),

    .instOut(instOut)
);

PcAdder pcAdder(
    .pc(pc),

    .nextPc(nextPc)
);

ProgramCounter programCounter(
    .clk(clk),
    .nextPc(nextPc),

    .pc(pc)
);

RegisterFile registerFile(
    .rs(dinstOut[25:21]),
    .rt(dinstOut[20:16]),

    .qa(qa),
    .qb(qb)
);

RegrtMux regrtMux(
    .regrt(regrt),
    .rt(dinstOut[20:16]),
    .rd(dinstOut[15:11]),

    .destReg(destReg)
);

endmodule