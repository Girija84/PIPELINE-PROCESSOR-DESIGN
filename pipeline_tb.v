`timescale 1ns / 1ps

module pipeline_tb;

    reg clk;
    processor uut(.clk(clk));

    always #5 clk = ~clk;

    initial begin
        $dumpfile("pipeline.vcd");
        $dumpvars(0, pipeline_tb);
        clk = 0;
        #100 $finish;
    end

endmodule
