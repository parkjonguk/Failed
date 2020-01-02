class dirver;
   virtual addr_if m_addr_vif;
   virtual clk_if m_clk_vif;
   event   drv_done;
   mailbox drv_mbx;

   task run();
      $display("T=%0t [Driver] starting ...",$time);
      forever begin
         packet item;

         $display ("T=%0t [Driver] waiting for item ... ",$time);
         drv_mbx.get(item);
         @(posedge m_clk_vif.tb_clk);
         item.print("Driver");
         m_addr_vif.rstn <= item.rstn;
         m_addr_vif.a <= item.a;
         m_addr_vif.b <= item.b;
         ->driv_done;
      end // forever begin
   endtask // run
endclass // dirver
