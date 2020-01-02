class transaction;
   
   parameter ADDR_WIDTH =8;
   parameter DATA_WIDTH =16;
   rand bit [ADDR_WIDTH-1:0]      addr;
   rand bit [DATA_WIDTH-1:0]      data;
   bit [ADDR_WIDTH-1:0] addr_a;
   bit [DATA_WIDTH-1:0] data_a;
   bit [ADDR_WIDTH-1:0] addr_b;
   bit [DATA_WIDTH-1:0] data_b;

   function void print(string tag ="");
      $display ("T=%0t [%s] addr=0x%0h data=0x%0h addr_a=0x%0h data_a =0x%0h addr_b=0x%0h data_b=0x%0h",$time ,addr,data,addr_a,data_a,addr_b,data_b);
   endfunction // print
endclass // transaction

      
