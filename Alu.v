module Alu (
    input [3:0] ealuc,
    input [31:0] eqa,
    input [31:0] b,

    output reg [31:0] r
);
    
always @(*) begin
    case (ealuc)
        4'b0000: begin
            r = eqa && b;
        end
        4'b0001: begin
            r = eqa || b;
        end
        4'b0010: begin
            r = eqa + b;
        end
        4'b0110: begin
            r = eqa - b;
        end
    endcase
end

endmodule