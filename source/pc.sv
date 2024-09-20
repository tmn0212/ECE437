`include "pc_if.vh"
`include "cpu_types_pkg.vh"

module pc
(
    input logic CLK, 
    input logic nRST, 
    pc_if.pc pcif
);

    import cpu_types_pkg::*;
    word_t next_iaddr;

    assign pcif.npc = pcif.iaddr + 4;

    always_ff @(posedge CLK, negedge nRST)
    begin
        if(nRST == 1'b0) begin
            pcif.iaddr <= 32'b0;
        end
        else begin
            if(pcif.op != HALT) begin
                pcif.iaddr <= next_iaddr;
            end
        end
    end

    always_comb begin
        next_iaddr = pcif.iaddr;
        if((pcif.ihit) & (pcif.haltop != HALT)) begin
            next_iaddr = pcif.iaddr + 4;
            if(pcif.PCSrc == 1'b1) begin
                case(pcif.op)
                    JALR: begin next_iaddr =  pcif.return_addr + {{20{pcif.Instruction[31]}}, pcif.Instruction[31:20]}; end
                    BTYPE: begin
                        if(pcif.Instruction[14:12] == BEQ) begin 
                            if(pcif.zero) begin                            
                                next_iaddr = pcif.iaddr + {{19{pcif.Instruction[31]}}, pcif.Instruction[7], pcif.Instruction[30:25], pcif.Instruction[11:8], 1'b0}; 
                            end
                        end
                        if(pcif.Instruction[14:12] == BNE) begin 
                            if(!pcif.zero) begin                               
                                next_iaddr = pcif.iaddr + {{19{pcif.Instruction[31]}}, pcif.Instruction[7], pcif.Instruction[30:25], pcif.Instruction[11:8], 1'b0}; 
                            end
                        end  
                        if((pcif.Instruction[14:12] == BLT)) begin 
                            if(!pcif.zero) begin
                                next_iaddr = pcif.iaddr + {{19{pcif.Instruction[31]}}, pcif.Instruction[7], pcif.Instruction[30:25], pcif.Instruction[11:8], 1'b0}; 
                            end
                        end   
                        if((pcif.Instruction[14:12] == BLTU)) begin 
                            if(!pcif.zero) begin
                                next_iaddr = pcif.iaddr + {19'b0, pcif.Instruction[7], pcif.Instruction[30:25], pcif.Instruction[11:8], 1'b0}; 
                            end
                        end
                        if((pcif.Instruction[14:12] == BGE)) begin 
                            if(pcif.zero) begin                            
                                next_iaddr = pcif.iaddr + {{19{pcif.Instruction[31]}}, pcif.Instruction[7], pcif.Instruction[30:25], pcif.Instruction[11:8], 1'b0};
                            end 
                        end
                        if((pcif.Instruction[14:12] == BGEU)) begin 
                            if(pcif.zero) begin                            
                                next_iaddr = pcif.iaddr + {19'b0, pcif.Instruction[7], pcif.Instruction[30:25], pcif.Instruction[11:8], 1'b0}; 
                            end
                        end
                    end
                    JAL: begin next_iaddr = pcif.iaddr + {{11{pcif.Instruction[31]}}, pcif.Instruction[19:12], pcif.Instruction[20], pcif.Instruction[30:21], 1'b0}; end
                endcase
            end
        end
    end
endmodule
                