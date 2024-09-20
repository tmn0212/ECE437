`ifndef MEM_WB_IF_VH
`define MEM_WB_IF_VH

// ram memory types
`include "cpu_types_pkg.vh"

interface mem_wb_if;

  // import types
  import cpu_types_pkg::*;

  word_t pc, dmemload, ALUOut;
  logic MemtoReg, RegWr, dhit, ihit, halt;
  regbits_t wsel;

  word_t next_pc, next_dmemload, next_ALUOut, Instruction, next_Instruction;
  logic next_MemtoReg, next_RegWr, next_halt;
  regbits_t next_wsel;

  modport memwb (
    input pc, dmemload, ALUOut, Instruction,
        MemtoReg, RegWr, dhit, ihit, halt,
        wsel,

    output next_pc, next_dmemload, next_ALUOut, next_Instruction,
        next_MemtoReg, next_RegWr, next_halt,
        next_wsel
  );

endinterface
`endif