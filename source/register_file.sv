`include "register_file_if.vh"

module register_file (
    input logic CLK, nRST,
    register_file_if.rf rfif
);
    logic [31:0] [31:0] register, next_register;

    always_ff @(posedge CLK, negedge nRST ) begin
        if(nRST == 1'b0)
        begin
            register <= '0;
        end
        else begin
            register <= next_register;
        end
    end

    always_comb begin
       next_register = register;

        if(rfif.WEN)
        begin
            if(rfif.wsel != 0) 
            begin
                next_register[rfif.wsel][31:0] = rfif.wdat;
            end
        end     
    end

    assign rfif.rdat1 = register[rfif.rsel1];
    assign rfif.rdat2 = register[rfif.rsel2];

endmodule