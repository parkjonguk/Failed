class test;
   env e0;
   mailbox drv_done;

   function new();
      drv_mbx = new();
      e0 = new();
   endfunction // new

   virtual task run();
      e0.d0.drv_done = drv_mbx;
      e0.run();
   endtask // run
endclass // test
