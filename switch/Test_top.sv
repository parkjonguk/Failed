`include "Interface.sv"
`include "Test.sv"
`include ""
module tb;
   reg clk;

   always #10 clk = ~clk;

   switch_if _if(clk);
   
switch u0 (.clk(clk),
           .rstn(_if.rstn),
           .addr(_if.addr),
           .data(_if.data),
           .vld(_if.vld),
           .addr_a(_if.addr_a),
           .data_a(_if.data_a),
           .addr_b(_if.addr_b),
           .data_b(_if.data_b)
           );
   initial begin
      {clk,_if.rstn} <= 0;
      #20 _if.rstn <=1;
   end
   test t1(vif);

   initial begin
      $dumpvars;
      $dumpfile("dump.vcd");
   end
endmodule // tb

   
