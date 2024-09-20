`ifndef CONTROL_UNIT_IF_VH
`define CONTROL_UNIT_IF_VH

`include "cpu_types_pkg.vh"

interface control_unit_if;
  // import types
  import cpu_types_pkg::*;
  logic [31:0] Instruction;
  logic MemWr;
  logic [3:0] ALUOP;
  logic RegWr;
  logic ALUSrc;
  logic MemtoReg;
  logic [1:0] PCSrc; 
  logic [31:0] imm;

  modport cu (
    input Instruction,
    output MemWr, ALUOP, RegWr, ALUSrc, MemtoReg, PCSrc, imm
  );

  modport tb (
    input MemWr, ALUOP, RegWr, ALUSrc, MemtoReg, PCSrc, imm,
    output Instruction
  );
endinterface
`endif //CONTROL_UNIT_IF_VH