`include "control_unit_if.vh"
`include "cpu_types_pkg.vh"

module control_unit (
  input logic CLK,
  input logic nRst,
  control_unit_if.cu cuif
);
    
    import cpu_types_pkg::*;

    always_comb begin

        cuif.ALUOP = ALU_OR;
        cuif.MemWr = 0;
        cuif.RegWr = 0;
        cuif.ALUSrc = 0;
        cuif.MemtoReg = 0;
        cuif.PCSrc = 0;
        cuif.imm= '0;
        case (cuif.Instruction [6:0])

            RTYPE: begin
                cuif.MemWr = 0;
                cuif.RegWr = 1;
                cuif.ALUSrc = 0;
                cuif.MemtoReg = 0;
                cuif.PCSrc = 0;

                case (cuif.Instruction [14:12])
                    SLL: begin cuif.ALUOP = ALU_SLL; end                    
                    SRL_SRA: begin 
                        if(cuif.Instruction [31:25] == SRL) begin
                            cuif.ALUOP = ALU_SRL;
                        end
                        if(cuif.Instruction [31:25] == SRA) begin
                            cuif.ALUOP = ALU_SRA;
                        end
                    end
                    ADD_SUB: begin 
                        if(cuif.Instruction [31:25] == ADD) begin
                            cuif.ALUOP = ALU_ADD;
                        end
                        if(cuif.Instruction [31:25] == SUB) begin
                            cuif.ALUOP = ALU_SUB;
                        end                        
                    end
                    AND: begin cuif.ALUOP = ALU_AND; end 
                    OR: begin cuif.ALUOP = ALU_OR; end                                          
                    XOR: begin cuif.ALUOP = ALU_XOR; end                         
                    SLT: begin cuif.ALUOP = ALU_SLT; end 
                    SLTU: begin cuif.ALUOP = ALU_SLTU; end 
                    default: begin
                        cuif.ALUOP = ALU_ADD;
                        cuif.MemWr = 0;
                        cuif.RegWr = 0; 
                        cuif.ALUSrc = 0; 
                        cuif.MemtoReg = 0; 
                        cuif.PCSrc = 0;
                    end
                endcase
            end

            ITYPE: begin
                cuif.MemWr = 0;
                cuif.RegWr = 1;
                cuif.ALUSrc = 1;
                cuif.MemtoReg = 0;
                cuif.PCSrc = 0;
                case(cuif.Instruction [14:12])
                    ADDI: begin 
                        cuif.ALUOP = ALU_ADD; 
                        cuif.imm = {{20{cuif.Instruction [31]}}, cuif.Instruction [31:20]};
                    end
                    XORI: begin cuif.ALUOP = ALU_XOR;
                        cuif.imm = {{20{cuif.Instruction [31]}}, cuif.Instruction [31:20]};
                    end                    
                    ORI: begin cuif.ALUOP = ALU_OR;
                        cuif.imm = {{20{cuif.Instruction [31]}}, cuif.Instruction [31:20]};
                    end                    
                    ANDI: begin cuif.ALUOP = ALU_AND;
                        cuif.imm = {{20{cuif.Instruction [31]}}, cuif.Instruction [31:20]};
                    end                    
                    SLLI: begin cuif.ALUOP = ALU_SLL;
                        cuif.imm = cuif.Instruction [24:20];
                    end                    
                    SRLI_SRAI: begin 
                        if(cuif.Instruction [31:25] == SRL) begin
                            cuif.ALUOP = ALU_SRL;
                        end
                        if(cuif.Instruction [31:25] == SRA) begin
                            cuif.ALUOP = ALU_SRA;
                        end
                        cuif.imm = cuif.Instruction [24:20];                         
                    end 
                    SLTI: begin cuif.ALUOP = ALU_SLT;
                        cuif.imm = {{20{cuif.Instruction [31]}}, cuif.Instruction [31:20]};
                    end                    
                    SLTIU: begin cuif.ALUOP = ALU_SLTU;
                        cuif.imm = {20'b0, cuif.Instruction [31:20]};
                    end                                                                   
                endcase             
            end

            ITYPE_LW: begin
                cuif.MemWr = 0;
                cuif.RegWr = 1;
                cuif.ALUSrc = 1;
                cuif.MemtoReg = 1;
                cuif.PCSrc = 0;     
                cuif.ALUOP = ALU_ADD;
                cuif.imm = {{{20{cuif.Instruction [31]}}}, cuif.Instruction [31:20]};    
            end    
                               
            JALR: begin
                cuif.ALUOP = ALU_SLL;
                cuif.MemWr = 0;
                cuif.RegWr = 1;
                cuif.ALUSrc = 0;
                cuif.MemtoReg = 0;
                cuif.PCSrc = 1;
            end 

            STYPE: begin
                cuif.ALUOP = ALU_ADD;
                cuif.MemWr = 1;
                cuif.RegWr = 0;
                cuif.ALUSrc = 1;
                cuif.MemtoReg = 0;
                cuif.PCSrc = 0;
                cuif.imm = {20'b0, cuif.Instruction [31:25], cuif.Instruction [11:7]};
            end 

            BTYPE: begin
                cuif.RegWr = 0;
                cuif.ALUSrc = 0;
                cuif.MemtoReg = 0;
                cuif.PCSrc = 1;
                case(cuif.Instruction [14:12])
                    BEQ: begin cuif.ALUOP = ALU_SUB; end
                    BNE: begin cuif.ALUOP = ALU_SUB; end
                    BLT: begin cuif.ALUOP = ALU_SLT; end
                    BLTU: begin cuif.ALUOP = ALU_SLTU; end
                    BGE: begin cuif.ALUOP = ALU_SLT; end             
                    BGEU: begin cuif.ALUOP = ALU_SLTU; end                             
                endcase
            end

            JAL: begin
                cuif.ALUOP = ALU_SLL;
                cuif.MemWr = 0;
                cuif.RegWr = 1;
                cuif.ALUSrc = 0;
                cuif.MemtoReg = 0;
                cuif.PCSrc = 1;          
            end

            LUI: begin
                cuif.ALUOP = ALU_SLL;
                cuif.MemWr = 0;
                cuif.RegWr = 1;
                cuif.ALUSrc = 1;
                cuif.MemtoReg = 0;
                cuif.PCSrc = 0;         
            end

            AUIPC: begin
                cuif.ALUOP = ALU_SLL;
                cuif.MemWr = 0;
                cuif.RegWr = 1;
                cuif.ALUSrc = 1;
                cuif.MemtoReg = 0;
                cuif.PCSrc = 0;
            end               

            HALT: begin
                cuif.ALUOP = ALU_SLL;
                cuif.MemWr = 0;
                cuif.RegWr = 0;
                cuif.ALUSrc = 0;
                cuif.MemtoReg = 0;
                cuif.PCSrc = 0;
            end
            default: begin
                cuif.ALUOP = SLL;
                cuif.MemWr = 0;
                cuif.RegWr = 0;
                cuif.ALUSrc = 0;
                cuif.MemtoReg = 0;
                cuif.PCSrc = 0;
                cuif.imm= '0;
            end
        endcase
    end


endmodule