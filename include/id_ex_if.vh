`ifndef ID_EX_IF_VH
`define ID_EX_IF_VH

// ram memory types
`include "cpu_types_pkg.vh"

interface id_ex_if;

  // import types
  import cpu_types_pkg::*;

  word_t Instruction, pc, rdat1, rdat2, imm;
  logic [3:0] ALUOP;
  logic [1:0] PCSrc, next_PCSrc;
  logic ALUSrc, RegWr, MemtoReg, MemWr, ihit, dhit, halt;
  regbits_t wsel;

  word_t next_Instruction, next_pc, next_rdat1, next_rdat2, next_imm;
  logic [3:0] next_ALUOP;
  logic next_ALUSrc, next_RegWr, next_MemtoReg, next_MemWr, next_halt;
  regbits_t next_wsel;  

  modport idex(
    input Instruction, pc, rdat1, rdat2, imm,
        ALUOP,
        ALUSrc, RegWr, MemtoReg, MemWr, PCSrc, ihit, dhit, halt,
        wsel,

    output next_Instruction, next_pc, next_rdat1, next_rdat2, next_imm,
        next_ALUOP,
        next_ALUSrc, next_RegWr, next_MemtoReg, next_MemWr, next_PCSrc, next_halt,
        next_wsel
  );

endinterface
`endif