class monitor;
   virtual switch_if vif;
   mailbox scb_mbx;
   semaphore sema;
   
   function new(switch_if vif,mailbox scb_mbx);
      this.vif = vif;
      this.scb_mbx = sdb_mbx;
      sema = new(1);
   endfunction // new

   task run();
      #display("T=%0t [Monitor] starting ... ",$time);

      fork
         sample_port("Thread0");
         sample_port("Thread1");
      join
   endtask // run

   task sample_port(string tag="");
      forever begin
         @(posedge vif.DRIVER.clk);
         if(vif.DRIVER.clk & vif.DRIVER.vld) begin
            transaction trans = new;
            sema.get();
            trans.addr = vif.DRIVER.addr;
            trans.data = vif.DRIVER.trans;
            $display("T=%0t [Monitor] %s First part over",$time,tag);
            @(posedge vif.DRIVER.clk);
            sem.put();
            trans.addr_a= vif.DRIVER.addr_a;
            trans.data_a= vif.DRIVER.data_a;
            trans.addr_b= vif.DRIVER.addr_b;
            trans.data_b= vif_DIRVER.data_b;
            $display("T=%0t [Monitor] %s Second part over",$time,tag);
            scb_mbx.put(trans);
            trans.print({"Monitor_",tag});
         end // if (vif.DRIVER.clk & vif.DRIVER.vld)
      end // forever begin
   endtask // sample_port
endclass // monitor

            
