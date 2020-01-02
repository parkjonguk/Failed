interface switch_if(input bit clk);
   parameter ADDR_WIDTH =8;
   parameter DATA_WIDTH = 16;
 
   logic rstn;
   logic vld;
   logic [ADDR_WIDTH-1:0] addr;
   logic [DATA_WIDTH-1:0] data;
   logic [ADDR_WIDTH-1:0] addr_a;
   logic [DATA_WIDTH-1:0] data_a;
   logic [ADDR_WIDTH-1:0] addr_b;
   logic [DATA_WIDTH-1:0] data_b;

   modport DRIVER (
                 input rstn,vld,addr,data,clk,
                 output addr_a,data_a,addr_b,data_b
                 );
   modport MONITOR (
                    input rstn,vld,addr,data,clk,
                    output addr_a,data_a,addr_b,data_b
                    );
   
endinterface
 
