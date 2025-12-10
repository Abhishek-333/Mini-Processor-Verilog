`timescale 1ns/1ps
module mini_processor_tb;
reg clk, rst;
initial clk = 0;
always #5 clk = ~clk;

mini_processor uut(.clk(clk), .rst(rst));

initial begin
  rst = 1;
  #10 rst = 0;
  // You can initialize instruction memory by $readmemb or direct assignment
  #200 $finish;
end

endmodule
