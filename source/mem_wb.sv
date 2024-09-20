`include "cpu_types_pkg.vh"

module mem_wb 
import cpu_types_pkg::*; 
(
	input logic CLK, nRST, 
	mem_wb_if.memwb pl4
);

	import cpu_types_pkg::*;

    always_ff @(posedge CLK, negedge nRST) begin
        if(!nRST) begin
            pl4.next_pc <= '0;
            pl4.next_dmemload <= '0;
            pl4.next_ALUOut <= '0;
            pl4.next_MemtoReg <= 0;
            pl4.next_RegWr <= 0;
            pl4.next_wsel <='0;
            pl4.next_halt <= 0;
            pl4.next_Instruction <= '0;
        end
        else if(pl4.ihit | pl4.dhit) begin
            pl4.next_pc <= pl4.pc;
            pl4.next_dmemload <= pl4.dmemload;
            pl4.next_ALUOut <= pl4.ALUOut;
            pl4.next_MemtoReg <= pl4.MemtoReg;
            pl4.next_RegWr <= pl4.RegWr;
            pl4.next_wsel <= pl4.wsel;
            pl4.next_halt <= pl4.halt;
            pl4.next_Instruction <= pl4.Instruction;
        end
    end

endmodule