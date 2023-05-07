# 5-Stage MIPS CPU in Verilog 🖥️💡

This repository contains the design and implementation of a 5-stage MIPS CPU using the Verilog hardware description language. The CPU architecture is based on the classic MIPS RISC (Reduced Instruction Set Computer) architecture, featuring a pipeline architecture and essential components that showcase the fundamentals of CPU design.

## Features 🌟

- 5-stage pipeline architecture for efficient instruction execution.
- Support for a subset of MIPS instructions to demonstrate various CPU operations.
- Detailed implementation of register file, ALU, and memory components.
- Clock cycle and pipeline control for realistic simulation of a processor's operation.
- Verilog testbenches for simulation, verification, and potential performance analysis.

## Educational Value 🎓

This project serves as an excellent resource for learning and understanding:

- The principles of MIPS CPU architecture and RISC design.
- The intricacies of pipeline stages and hazard management.
- The process of designing and implementing a CPU using a hardware description language (Verilog).
- How to create and use testbenches for simulation and verification of hardware designs.


## Components 🛠️

- **IF (Instruction Fetch)**: Fetches instructions from memory.
- **ID (Instruction Decode)**: Decodes instructions and reads operands from the register file.
- **EXEC (Execution)**: Performs arithmetic and logic operations.
- **MEM (Memory Access)**: Accesses memory for load and store instructions.
- **WB (Write Back)**: Writes the results back to the register file.

