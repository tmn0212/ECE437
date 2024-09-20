`include "if_id_if.vh"
`include "cpu_types_pkg.vh"
module if_id 
(
	input logic CLK, nRST, 
	if_id_if.ifid pl1
);
  // import types
  import cpu_types_pkg::*;

    always_ff @(posedge CLK, negedge nRST) begin
        if(!nRST) begin
            pl1.next_pc <= '0;
            pl1.next_Instruction <= '0;
        end
        else if(pl1.ihit | pl1.dhit) begin
            pl1.next_pc <= pl1.pc;
            pl1.next_Instruction <= pl1.Instruction; 
        end          
    end


endmodule