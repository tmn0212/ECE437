`include "cpu_types_pkg.vh"
`include "alu_if.vh"

module alu
(
    alu_if.alu aluif    
);
    import cpu_types_pkg::*;
    always_comb begin
        case (aluif.ALUOP)
            ALU_SLL: begin
                aluif.OutputPort = aluif.PortA << aluif.PortB[4:0];
                aluif.Negative = (aluif.OutputPort[31] == 1);
                aluif.Overflow = 0;
                aluif.Zero = (aluif.OutputPort == '0);
            end
            ALU_SRL: begin
                aluif.OutputPort = aluif.PortA >> aluif.PortB[4:0];
                aluif.Negative = (aluif.OutputPort[31] == 1);
                aluif.Overflow = 0;
                aluif.Zero = (aluif.OutputPort == '0);
            end  
            ALU_SRA: begin
                aluif.OutputPort = ($signed(aluif.PortA)) >>> aluif.PortB[4:0];
                aluif.Negative = (aluif.OutputPort[31] == 1);
                aluif.Overflow = 0;
                aluif.Zero = (aluif.OutputPort == '0);
            end  
            ALU_AND: begin 
                aluif.OutputPort = aluif.PortA & aluif.PortB;
                aluif.Negative = (aluif.OutputPort[31] == 1);
                aluif.Overflow = 0;
                aluif.Zero = (aluif.OutputPort == 0);
            end
            ALU_OR: begin 
                aluif.OutputPort = aluif.PortA | aluif.PortB;
                aluif.Negative = (aluif.OutputPort[31] == 1);
                aluif.Overflow = 0;
                aluif.Zero = (aluif.OutputPort == 0);
            end
            ALU_XOR: begin 
                aluif.OutputPort = aluif.PortA ^ aluif.PortB;
                aluif.Negative = (aluif.OutputPort[31] == 1);
                aluif.Overflow = 0;
                aluif.Zero = (aluif.OutputPort == 0);
            end
            ALU_ADD: begin
                aluif.OutputPort = ($signed(aluif.PortA)) + ($signed(aluif.PortB));
                aluif.Negative = (aluif.OutputPort[31] == 1);
                aluif.Overflow = (((aluif.PortA[31] == 1)&&(aluif.PortB[31] == 1)&&(aluif.OutputPort[31] == 0))||((aluif.PortA[31] == 0)&&(aluif.PortB[31] == 0)&&(aluif.OutputPort[31] == 1)));
                aluif.Zero = (aluif.OutputPort == '0);
            end             
            ALU_SUB: begin
                aluif.OutputPort = ($signed(aluif.PortA)) - ($signed(aluif.PortB));
                aluif.Negative = (aluif.OutputPort[31] == 1);
                aluif.Overflow = (((aluif.PortA[31] == 1)&&(aluif.PortB[31] == 1)&&(aluif.OutputPort[31] == 0))||((aluif.PortA[31] == 0)&&(aluif.PortB[31] == 0)&&(aluif.OutputPort[31] == 1)));
                aluif.Zero = (aluif.OutputPort == '0);
            end              
            ALU_SLT: begin
                aluif.OutputPort = ($signed(aluif.PortA) < $signed(aluif.PortB));               
                aluif.Negative = (aluif.OutputPort[31] == 1);
                aluif.Overflow = 0;
                aluif.Zero = (aluif.OutputPort == 0);
            end
            ALU_SLTU: begin
                aluif.OutputPort = (aluif.PortA < aluif.PortB);
                aluif.Negative = (aluif.OutputPort[31] == 1);
                aluif.Overflow = 0;
                aluif.Zero = (aluif.OutputPort == 0);
            end
            default: begin
                aluif.OutputPort = 0;
                aluif.Negative = 0;
                aluif.Overflow = 0;
                aluif.Zero = 0;
            end
        endcase
    end

endmodule