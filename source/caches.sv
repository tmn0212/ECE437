/*
  Eric Villasenor
  evillase@gmail.com

  this block holds the i and d cache
*/


<<<<<<< HEAD
// interfaces
`include "datapath_cache_if.vh"
`include "caches_if.vh"

// cpu types
`include "cpu_types_pkg.vh"

module caches (
  input logic CLK, nRST,
  datapath_cache_if.cache dcif,
  caches_if.caches cif
);
  // import types
  import cpu_types_pkg::word_t;

  parameter CPUID = 0;

  word_t instr;
  word_t daddr;
=======
module caches (
  input logic CLK, nRST,
  datapath_cache_if.cache dcif,
  caches_if cif
);
>>>>>>> 5bd21b5eda985cc129168b5791851689fead6a2d

  // icache
  //icache  ICACHE(dcif, cif);
  // dcache
  //dcache  DCACHE(dcif, cif);

<<<<<<< HEAD
  // single cycle instr saver (for memory ops)
  always_ff @(posedge CLK)
  begin
    if (!nRST)
    begin
      instr <= '0;
      daddr <= '0;
    end
    else
    if (dcif.ihit)
    begin
      instr <= cif.iload;
      daddr <= dcif.dmemaddr;
    end
  end
  // dcache invalidate before halt
  assign dcif.flushed = dcif.halt;

  //single cycle
  assign dcif.ihit = (dcif.imemREN) ? ~cif.iwait : 0;
  assign dcif.dhit = (dcif.dmemREN|dcif.dmemWEN) ? ~cif.dwait : 0;
  assign dcif.imemload = (cif.iwait) ? instr : cif.iload;
=======
  // dcache invalidate before halt handled by dcache when exists
  assign dcif.flushed = dcif.halt;

  //singlecycle
  assign dcif.ihit = (dcif.imemREN) ? ~cif.iwait : 0;
  assign dcif.dhit = (dcif.dmemREN|dcif.dmemWEN) ? ~cif.dwait : 0;
  assign dcif.imemload = cif.iload;
>>>>>>> 5bd21b5eda985cc129168b5791851689fead6a2d
  assign dcif.dmemload = cif.dload;


  assign cif.iREN = dcif.imemREN;
  assign cif.dREN = dcif.dmemREN;
  assign cif.dWEN = dcif.dmemWEN;
  assign cif.dstore = dcif.dmemstore;
  assign cif.iaddr = dcif.imemaddr;
<<<<<<< HEAD
  assign cif.daddr = daddr;
=======
  assign cif.daddr = dcif.dmemaddr;
>>>>>>> 5bd21b5eda985cc129168b5791851689fead6a2d

endmodule
