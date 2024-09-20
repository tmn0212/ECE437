`include "id_ex_if.vh"
`include "cpu_types_pkg.vh"

module id_ex 
(
	input logic CLK, nRST, 
	id_ex_if.idex pl2
);

	import cpu_types_pkg::*;
    always_ff @(posedge CLK, negedge nRST) begin
        if(!nRST) begin
            pl2.next_Instruction <= '0;
            pl2.next_pc <= '0;
            pl2.next_rdat1 <='0;
            pl2.next_rdat2 <= '0;
            pl2.next_imm <= '0;
            pl2.next_ALUOP <= '0;
            pl2.next_ALUSrc <= 0;
            pl2.next_RegWr <= 0;
            pl2.next_MemtoReg <= 0;
            pl2.next_MemWr <= 0;
            pl2.next_PCSrc <= 0;
            pl2.next_wsel <= '0;
            pl2.next_halt <= 0;
        end
        else if(pl2.ihit | pl2.dhit) begin
            pl2.next_Instruction <= pl2.Instruction;
            pl2.next_pc <= pl2.pc;
            pl2.next_rdat1 <= pl2.rdat1;
            pl2.next_rdat2 <= pl2.rdat2;
            pl2.next_imm <= pl2.imm;
            pl2.next_ALUOP <= pl2.ALUOP;
            pl2.next_ALUSrc <= pl2.ALUSrc;
            pl2.next_RegWr <= pl2.RegWr;
            pl2.next_MemtoReg <= pl2.MemtoReg;
            pl2.next_MemWr <= pl2.MemWr;
            pl2.next_PCSrc <= pl2.PCSrc;
            pl2.next_wsel <= pl2.wsel;    
            pl2.next_halt <= pl2.halt;
        end  
    end      

endmodule
