module reg_ctrl (/*AUTOARG*/
   // Outputs
   rdata, ready,
   // Inputs
   clk, rstn, addr, sel, wr, wdata
   ) ;
   parameter ADDR_WIDTH = 8;
   parameter DATA_WIDTH = 16;
   parameter DEPTH = 256;
   parameter RESET_VAL = 16'h1234;

   input                  clk;
   input                  rstn;
   input [ADDR_WIDTH-1:0] addr;
   input                  sel;
   input                  wr;
   input [DATA_WITDH-1:0] wdata;
   output reg [DATA_WITDH-1:0] rdata;
   output reg                  ready;
   reg [DATA_WITDH-1:0]        crtl [DEPTH];

   reg                         ready_dly;
   wire                        ready_pe;

   assign ready_pe = ~ready & ready_dly;
   
   always @(posedge clk) begin
      if(!rstn) begin
         for(int i=0;i<DEPTH;i+=1) begin
            ctrl[i] <= RESET_VAL;
         end
      end
      else begin
         if(sel & ready & wr) begin
            crtl[addr] <= wdata;
         end

         if(sel & ready & !wr) begin
            rdata <= crtl[addr];
         end
         else begin
            rdata <=0;
         end
      end // else: !if(!rstn)
   end // always @ (posedge clk)

   always @ (posedge clk) begin
      if(!rstn) begin
         ready <=1;
      end else begin
         if(sel & ready_pe) begin
            ready <= 1;
         end
         if(sel & ready & !wr) begin
            ready <= 0;
         end
      end
   end // always @ (posedge clk)

   always @ (posedge clk) begin
      if(!rstn)begin
         ready_dly <= 1;
      end
      else
        ready_dly <= ready;
   end

endmodule // reg_ctrl
