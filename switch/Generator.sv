class generator;
   rand transaction trans;
   int num ;
   mailbox drv_mbx;
   event   drv_done;

   function new(mailbox drv_mbx,event drv_done);
      this.drv_mbx = drv.mbx;
      this.drv_done = drv_done;
   endfunction // new
   
   task run();
      for(int i=0;i<num;i++)begin
         trans = new();
         if(!trans.randomize()) $fatal("GEN:: trnas randomization failed");
         $display ("T=%0t [Generator] Loop: %0d/%0d create next trans" $time, i+1,num);
         drv_mbx.put(trans);
         ->drv_done;
      end
      $display ("T=%0t [Generator] Doen Generator of %0d trans"$time , num);
   endtask // run
endclass // generator
