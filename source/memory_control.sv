/*
  Eric Villasenor
  evillase@gmail.com

  this block is the coherence protocol
  and artibtration for ram
*/

// interface include
`include "cache_control_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module memory_control (
  input CLK, nRST,
  cache_control_if.cc ccif
);
  // type import
  import cpu_types_pkg::*;

  // number of cpus for cc
  parameter CPUS = 1;
  always_comb begin 
    ccif.ramstore = 0;
    ccif.ramaddr = 0;
    ccif.ramWEN = 0;
    ccif.ramREN = 0;
    ccif.iload = 0;
    ccif.dload = 0;

    ccif.iwait = 1;
    ccif.dwait = 1;
    
    if(ccif.dREN == 1) 
    begin
      ccif.dload = ccif.ramload;
      ccif.ramaddr = ccif.daddr;
      ccif.ramREN = 1;
      ccif.dwait = ~(ccif.ramstate == ACCESS);
    end
    else if(ccif.dWEN == 1) 
    begin
      ccif.ramWEN = 1;
      ccif.ramstore = ccif.dstore;
      ccif.ramaddr = ccif.daddr;
      ccif.dwait = ~(ccif.ramstate == ACCESS);
    end
    else if(ccif.iREN == 1) 
    begin
      ccif.ramREN = 1;
      ccif.iload = ccif.ramload;
      ccif.ramaddr = ccif.iaddr;
      ccif.iwait = ~(ccif.ramstate == ACCESS);
    end
  end

endmodule
