`ifndef IF_ID_IF_VH
`define IF_ID_IF_VH

// types
`include "cpu_types_pkg.vh"

interface if_id_if;

  // import types
  import cpu_types_pkg::*;

  word_t Instruction, pc, next_Instruction, next_pc;
  logic ihit, dhit;

  modport ifid (
    input Instruction, pc, ihit, dhit,
    output next_Instruction, next_pc
  );

endinterface
`endif