`ifndef REQUEST_UNIT_IF_VH
`define REQUEST_UNIT_IF_VH

`include "cpu_types_pkg.vh"


interface request_unit_if;

  import cpu_types_pkg::*;
  parameter CPUS = 1;
  logic ihit;
  logic dhit;
  logic MemtoReg;
  logic MemWr;
  logic imemREN;
  logic dmemWEN;
  logic dmemREN;
  logic [6:0] opcode;


  modport ru (
    input ihit, dhit, MemtoReg, MemWr,
    output dmemREN, dmemWEN, imemREN
  );


endinterface

`endif 