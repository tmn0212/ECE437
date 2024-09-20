/*
  Eric Villasenor
  evillase@gmail.com

  datapath contains register file, control, hazard,
  muxes, and glue logic for processor
*/

// data path interface
`include "datapath_cache_if.vh"
`include "control_unit_if.vh"
`include "register_file_if.vh"
`include "alu_if.vh"
`include "request_unit_if.vh"
`include "pc_if.vh"
`include "if_id_if.vh"
`include "id_ex_if.vh"
`include "ex_mem_if.vh"
`include "mem_wb_if.vh"
// alu op, mips op, and instruction type
`include "cpu_types_pkg.vh"

module datapath (
  input logic CLK, nRST,
  datapath_cache_if.dp dpif
);

  // import types
  import cpu_types_pkg::*;

  // pc init
  parameter PC_INIT = 0;
    control_unit_if cuif();
    request_unit_if ruif();
    pc_if pc();
    register_file_if rfif();
    alu_if alu();
    if_id_if pl1();
    id_ex_if pl2();
    ex_mem_if pl3();
    mem_wb_if pl4();

    register_file RF(CLK, nRST, rfif);
    control_unit CU(CLK, nRST, cuif);
    alu ALU(alu);
    pc PC(CLK, nRST, pc);
    request_unit RU(CLK, nRST, ruif);
    if_id IFID(CLK, nRST, pl1);
    id_ex IDEX(CLK, nRST, pl2);
    ex_mem EXMEM(CLK, nRST, pl3);
    mem_wb MEMWB(CLK, nRST, pl4);

    logic next_halt;

    assign rfif.wsel = pl4.next_wsel;
    assign rfif.rsel1 = pl1.next_Instruction [19:15];
    assign rfif.rsel2 = pl1.next_Instruction [24:20];
    assign rfif.WEN = pl4.next_RegWr & (dpif.ihit | dpif.dhit);

    assign dpif.datomic = 1'b0;
    assign dpif.imemaddr = pc.iaddr;
    assign dpif.imemREN = 1;
    assign dpif.dmemREN = pl3.next_MemtoReg;
    assign dpif.dmemWEN = pl3.next_MemWr;
    assign dpif.dmemstore = pl3.next_rdat2;
    assign dpif.dmemaddr = pl3.next_ALUOut;

    assign alu.PortA = pl2.next_rdat1;
    assign alu.PortB = pl2.next_ALUSrc ? pl2.next_imm : pl2.next_rdat2;
    assign alu.ALUOP = pl2.next_ALUOP;

    assign cuif.Instruction = pl1.next_Instruction;

    assign pc.return_addr = pl3.next_rdat1;
    assign pc.zero = pl3.next_zero;   
    assign pc.PCSrc = pl3.next_PCSrc;
    assign pc.Instruction = pl3.next_Instruction;
    assign pc.op = pl3.next_Instruction [6:0];
    assign pc.ihit = dpif.ihit;
    assign pc.dhit = dpif.dhit;
    assign pc.haltop = pl4.next_Instruction [6:0];

    //assign ruif.ihit = dpif.ihit;
    //assign ruif.dhit = dpif.dhit;
    //assign ruif.MemtoReg = cuif.MemtoReg;                                   
    //assign ruif.MemWr = cuif.MemWr

    assign pl1.ihit = dpif.ihit;
    assign pl1.dhit = dpif.dhit;
    assign pl1.Instruction = dpif.imemload;
    assign pl1.pc = pc.iaddr;

    assign pl2.ihit = dpif.ihit; 
    assign pl2.dhit = dpif.dhit; 
    assign pl2.Instruction = pl1.next_Instruction;
    assign pl2.pc = pl1.next_pc; 
    assign pl2.rdat1 = rfif.rdat1;
    assign pl2.rdat2 = rfif.rdat2;
    assign pl2.imm = cuif.imm;
    assign pl2.ALUOP = cuif.ALUOP;
    assign pl2.ALUSrc = cuif.ALUSrc;
    assign pl2.RegWr = cuif.RegWr;
    assign pl2.PCSrc = cuif.PCSrc;
    assign pl2.MemWr = cuif.MemWr;
    assign pl2.MemtoReg  = cuif.MemtoReg;
    assign pl2.wsel = cuif.Instruction [11:7];
    assign pl2.halt = next_halt;

    assign pl3.ihit = dpif.ihit; 
    assign pl3.dhit = dpif.dhit; 
    assign pl3.Instruction = pl2.next_Instruction;
    assign pl3.pc = pl2.next_pc;
    assign pl3.rdat1 = pl2.next_rdat1;
    assign pl3.rdat2 = pl2.next_rdat2;
    assign pl3.ALUOut = alu.OutputPort;
    assign pl3.zero = alu.Zero;
    assign pl3.MemWr = pl2.next_MemWr;
    assign pl3.MemtoReg = pl2.next_MemtoReg;
    assign pl3.RegWr = pl2.next_RegWr;
    assign pl3.PCSrc = pl2.next_PCSrc;
    assign pl3.wsel = pl2.next_wsel;
    assign pl3.halt = pl2.next_halt;

    assign pl4.ihit = dpif.ihit; 
    assign pl4.dhit = dpif.dhit; 
    assign pl4.pc = pl3.next_pc;
    assign pl4.dmemload = dpif.dmemload;
    assign pl4.ALUOut = pl3.next_ALUOut;
    assign pl4.MemtoReg = pl3.next_MemtoReg;
    assign pl4.RegWr = pl3.next_RegWr;
    assign pl4.wsel = pl3.next_wsel;
    assign pl4.halt = pl3.next_halt;
    assign pl4.Instruction = pl3.next_Instruction;

    always_ff @(posedge CLK, negedge nRST) begin
        if(!nRST) begin
            dpif.halt <= 1'b0;
        end
        else begin
            dpif.halt <= next_halt; 
        end
    end

    always_comb begin
        if(pl4.next_Instruction [6:0] == HALT) begin
            next_halt = 1'b1;
        end
        else begin
            next_halt = 1'b0;
        end
    end

    always_comb begin
        if((pl4.next_Instruction[6:0] == JALR) || (pl4.next_Instruction[6:0] == JAL)) begin
            rfif.wdat = pl4.next_pc;
        end
        else if(pl4.next_Instruction[6:0] == LUI) begin
            rfif.wdat = {pl4.next_Instruction[31:12], 12'b0};
        end
        else if(pl4.next_Instruction[6:0] == AUIPC) begin
            rfif.wdat = pl4.pc + {pl4.next_Instruction[31:12], 12'b0};
        end
        else if(pl4.next_MemtoReg) begin
            rfif.wdat = pl4.next_dmemload;
        end
        else begin
            rfif.wdat = pl4.next_ALUOut;
        end
    end

endmodule
