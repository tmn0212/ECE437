`include "ex_mem_if.vh"
`include "cpu_types_pkg.vh"

module ex_mem 
(
	input logic CLK, nRST, 
	ex_mem_if.exmem pl3
);

	import cpu_types_pkg::*;
    always_ff @(posedge CLK, negedge nRST) begin
        if(!nRST) begin
            pl3.next_Instruction <= '0;
            pl3.next_pc <= '0;
            pl3.next_rdat1 <= '0;
            pl3.next_rdat2 <= '0;
            pl3.next_ALUOut <= '0;
            pl3.next_zero <= 0;
            pl3.next_MemWr <= 0;
            pl3.next_MemtoReg <= 0;
            pl3.next_RegWr <= 0;
            pl3.next_PCSrc <= 0;
            pl3.next_wsel <= '0;
            pl3.next_halt <= 0;
        end
        else if (pl3.ihit | pl3.dhit) begin
            pl3.next_Instruction <= pl3.Instruction;
            pl3.next_pc <= pl3.pc;
            pl3.next_rdat1 <= pl3.rdat1;
            pl3.next_rdat2 <= pl3.rdat2;
            pl3.next_ALUOut <= pl3.ALUOut;
            pl3.next_zero <= pl3.zero;
            pl3.next_MemWr <= pl3.MemWr;
            pl3.next_MemtoReg <= pl3.MemtoReg;
            pl3.next_RegWr <= pl3.RegWr;
            pl3.next_PCSrc <= pl3.PCSrc;
            pl3.next_wsel <= pl3.wsel;
            pl3.next_halt <= pl3.halt;
        end
    end


endmodule