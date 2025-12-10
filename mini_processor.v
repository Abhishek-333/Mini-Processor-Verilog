
---

### 2) `Mini-Processor-Verilog`

**`mini_processor.v`** (single-cycle simplified datapath skeleton)
```verilog
// Mini Processor - simplified single-cycle datapath skeleton
module mini_processor (
    input  wire clk,
    input  wire rst
);

// Simple 8-bit program counter and instruction memory example
reg [7:0] pc;
reg [15:0] instr_mem [0:255]; // small instruction mem (pseudo)
reg [7:0] regfile [0:3];      // 4 registers R0-R3 small example

wire [15:0] instr;
assign instr = instr_mem[pc];

wire [1:0] rd = instr[15:14];
wire [1:0] rs1 = instr[13:12];
wire [1:0] rs2 = instr[11:10];
wire [3:0] imm = instr[3:0];

// simple opcode example in bits [9:8]
// 00 -> add, 01 -> sub, 10 -> load imm, 11 -> nop

always @(posedge clk or posedge rst) begin
    if (rst) begin
        pc <= 0;
        regfile[0] <= 0;
        regfile[1] <= 0;
        regfile[2] <= 0;
        regfile[3] <= 0;
    end else begin
        case(instr[9:8])
            2'b00: regfile[rd] <= regfile[rs1] + regfile[rs2];
            2'b01: regfile[rd] <= regfile[rs1] - regfile[rs2];
            2'b10: regfile[rd] <= {4'b0, imm};
            default: regfile[rd] <= regfile[rd];
        endcase
        pc <= pc + 1;
    end
end

endmodule
