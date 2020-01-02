class env;
   driver d0;
   monitor m0;
   socreboard s0;
   mailbox scb_mbx;
   virtual reg_if vif;
   function new();
      d0 =new;
      m0 =new;
      s0 =new;
      scb_mbx = new();
   endfunction // new

   virtual task run();
      d0.vif = vif;
      m0.vif = vif;
      m0.scb_mbx = scb_mbx;
      s0.scb_mbx = scb_mbx;

      fork
         s0.run();
         d0.run();
         mo.run();
      join_any
   endtask // run
endclass // env

      
