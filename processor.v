module processor(input clk);

    reg [7:0] PC;
    wire [15:0] instr;

    wire [3:0] opcode, rs, rt, rd;
    wire [7:0] imm;

    // IF Stage
    instruction_memory imem(.addr(PC), .instr(instr));
    
    assign opcode = instr[15:12];
    assign rs = instr[11:10];
    assign rt = instr[9:8];
    assign rd = instr[7:6];
    assign imm = instr[7:0];

    // Pipeline registers between stages
    reg [15:0] IF_ID;
    reg [15:0] ID_EX;
    reg [15:0] EX_MEM;
    reg [15:0] MEM_WB;

    always @(posedge clk) begin
        // Pipeline stage transitions
        IF_ID <= instr;
        ID_EX <= IF_ID;
        EX_MEM <= ID_EX;
        MEM_WB <= EX_MEM;
        
        PC <= PC + 1;
    end

endmodule
