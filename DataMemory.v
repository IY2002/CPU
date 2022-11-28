module DataMemory (
    input clk,
    input mwmem,
    input [31:0] mr,
    input [31:0] mqb,

    output reg [31:0] mdo
);

reg [31:0] memory [0:63];

initial begin
    memory[0] = 32'hA00000AA;
    memory[1] = 32'h10000011;
    memory[2] = 32'h20000022;
    memory[3] = 32'h30000033;
    memory[4] = 32'h40000044;
    memory[5] = 32'h50000055;
    memory[6] = 32'h60000066;
    memory[7] = 32'h70000077;
    memory[8] = 32'h80000088;
    memory[9] = 32'h90000099;
end

always @(*) begin
    mdo = memory[mr[31:2]];
end

always @(negedge clk) begin
    if(mwmem == 1) begin
        memory[mr[31:2]] = mqb;
    end
end

endmodule