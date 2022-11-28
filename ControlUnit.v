`timescale 1ns/1ps
module ControlUnit (
    input [5:0] op,
    input [5:0] func,

    // write register, if 1 then a register is being written to else its 0
    output reg wreg,

    // memory to register, if 1 then a value from emmeory is going toa  regsier else its 0
    // set to X (dont care) if wreg is 0
    output reg m2reg,

    //write memory, if 1 then memory is being written into else its 0
    output reg wmem,

    // ALU immediate, if 1 then we are using sign extender else it should be 0
    output reg aluimm,

    // register rt, if 1 then register being written is rt instead of rd. 
    // if wreg is 0 then this can be X.
    output reg regrt,

    // ALU control, indicates the operation that the ALU will do
    output reg [3:0] aluc
);

    always @(op or func) begin
        case(op)
            6'b000000: begin // r-type
                case(func)
                    6'b100000: begin//ADD instruction
                        //set signal settings for add
                        wreg = 1'b1;
                        m2reg = 1'b0;
                        wmem = 1'b0;
                        aluimm = 1'b0;
                        regrt = 1'b0;
                        aluc = 4'b0010;
                    end
                    6'b100010: begin //SUB instruction
                        //set signal settings for sub
                        wreg = 1'b1;
                        m2reg = 1'b0;
                        wmem = 1'b0;
                        aluimm = 1'b0;
                        regrt = 1'b0;
                        aluc = 4'b0110;
                    end
                endcase
            end
            6'b100011: begin// LW
                //set signal settings for lw
                wreg = 1'b1;
                m2reg = 1'b1;
                wmem = 1'b0;
                aluimm = 1'b1;
                regrt = 1'b1;
                aluc = 4'b0010;
            end
        endcase
    end
endmodule