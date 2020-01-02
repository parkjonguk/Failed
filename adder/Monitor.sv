class monitor;
   virtual addr_if m_addr_vif;
   virtual clk_if m_clk_vif;
   mailbox scb_mbx;
   task run();
      $display ("T=%0t [Monitor] starting ... ", $time);

      forever begin
         packet m_pkt = new();
         @(posedge m_clk_vif.tb_clk);
         #1;
         m_pkt.a = m_addr_vif.a;
         m_pkt.b = m_addr_vif.b;
         m_pkt.rstn = m_addr_vif.rstn;
         m_pkt.sum = m_addr_vif.sum;
         m_pkt.carry = m_addr_vif.carry;
         m_pkt.print("Monitor");
         scb_mbx.put(m_pkt);
      end // forever begin
   endtask // run
endclass // monitor

         
