`include "request_unit_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module request_unit (
  input CLK, nRST,
  request_unit_if.ru ruif
);

  import cpu_types_pkg::*;

    logic next_dmemREN;
    logic next_dmemWEN;
    logic next_imemREN;

    always_ff @(posedge CLK, negedge nRST)
    begin
        if(nRST == 1'b0)
        begin
            ruif.dmemREN <= 1'b0;
            ruif.dmemWEN <= 1'b0;
            ruif.imemREN <= 1'b1;
        end
        else
        begin
            ruif.dmemREN <= next_dmemREN;
            ruif.dmemWEN <= next_dmemWEN;
            ruif.imemREN <= next_imemREN;
        end
    end

    always_comb
    begin
        next_imemREN = 1'b1;

        if(ruif.ihit == 1'b1) begin
            next_dmemREN = ruif.MemtoReg;
            next_dmemWEN = ruif.MemWr;
        end
        else if(ruif.dhit == 1'b1) begin
            next_dmemREN = 1'b0;
            next_dmemWEN = 1'b0;
        end
        else begin
            next_dmemREN = ruif.dmemREN;
            next_dmemWEN = ruif.dmemWEN;
        end
    end

endmodule
