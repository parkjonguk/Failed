`include "Gnerator.sv"
`include "Driver.sv"
`include "Monitor.sv"
`include "Scoreboard.sv"

class enviroment;
   driver d0;
   generator g0;
   monitor m0;
   scoreboard s0;
   mailbox drv_mbx;
   mailbox scb_mbx;
   event   drv_done;
   virtual switch_if vif;

   function new(virtual vif);
      this.vif = vif;
      drv_mbx=new();
      scv_mbx=new();
      d0 = new(vif,drv_mbx,drv_done);
      g0 = new(drv_mbx,drv_done);
      m0 = new(vif,scb_mbx);
      s0 = new(sdb_mbx);
   endfunction // new
   

   virtual task run();
      fork
         d0.run();
         m0.run();
         g0.run();
         s0.run();
      join_any
   endtask // run
endclass // enviroment

   
