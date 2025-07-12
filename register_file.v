module register_file(input clk,
                     input [1:0] rs, rt, rd,
                     input [7:0] write_data,
                     input write_enable,
                     output [7:0] read1, read2);

    reg [7:0] regfile [0:3];

    assign read1 = regfile[rs];
    assign read2 = regfile[rt];

    always @(posedge clk) begin
        if (write_enable)
            regfile[rd] <= write_data;
    end

endmodule
