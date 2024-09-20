`ifndef ALU_IF_VH
`define ALU_IF_VH

`include "cpu_types_pkg.vh"

interface alu_if;
  import cpu_types_pkg::*;

  logic [31:0] PortA;
  logic [31:0] PortB;
  logic [3:0] ALUOP;

  logic Negative;  
  logic [31:0] OutputPort;
  logic Overflow;
  logic Zero;

  modport alu (
    input   PortA, PortB, ALUOP, 
    output  Negative, OutputPort, Overflow, Zero
  );

  modport tb (
    input   Negative, OutputPort, Overflow, Zero,
    output  PortA, PortB, ALUOP 
  );

endinterface
`endif 