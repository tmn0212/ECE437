`ifndef PC_IF_VH
`define PC_IF_VH

// all types
`include "cpu_types_pkg.vh"

interface pc_if;
  // import types
  import cpu_types_pkg::*;

    logic zero, neg, overflow, PCSrc, ihit, dhit;
    word_t return_addr, npc, iaddr, Instruction;
    logic [6:0] op, haltop;

    modport pc (
        input return_addr, zero, PCSrc, Instruction, op, ihit, dhit, neg, overflow, haltop,
        output npc, iaddr
    );

    modport tb (
        input npc, iaddr,
        output return_addr, zero, PCSrc, Instruction, op, ihit, neg, overflow, haltop      
    );

endinterface

`endif //PC_IF_VH