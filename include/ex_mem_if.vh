`ifndef EX_MEM_IF_VH
`define EX_MEM_IF_VH

// ram memory types
`include "cpu_types_pkg.vh"

interface ex_mem_if;

  // import types
  import cpu_types_pkg::*;

  word_t Instruction, pc, rdat1, rdat2, ALUOut;
  logic ihit, dhit, zero, MemWr, MemtoReg, RegWr, halt;
  regbits_t wsel;

  logic [1:0] PCSrc, next_PCSrc;

  word_t next_Instruction, next_pc, next_rdat1, next_rdat2, next_ALUOut;
  logic next_zero, next_MemWr, next_MemtoReg, next_RegWr, next_halt;
  regbits_t next_wsel;

  modport exmem (
    input Instruction, pc, rdat1, rdat2, ALUOut,
        ihit, dhit, zero, MemWr, MemtoReg, RegWr, PCSrc, halt,
        wsel,

    output next_Instruction, next_pc, next_rdat1, next_rdat2, next_ALUOut,
        next_zero, next_MemWr, next_MemtoReg, next_RegWr, next_PCSrc, next_halt,
        next_wsel
  );

endinterface
`endif