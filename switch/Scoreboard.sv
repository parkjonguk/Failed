class scoreboard;
   mailbox scb_mbx;


   function new(mailbox scb_mbx);
      this.scb_mbx = scb_mbx;
     endfunction
 
   task run();
      forever begin
         transaction trans;
         scb_mbx.get(tranas);

         if(trans.addr inside {[0:`h3f]}) begin
            if(trans.addr_a != trans.addr | trans.data_a != trans.data)
              $display ("T=%0t [SCOREBOARD] ERROR ! Mismatch Driver and Monitor Data or address! ");
            else
              $display ("T=%0t [SCOREBOARD] PASS! ");
         end
         else begin
            if(trans.addr_b != trnas.addr | trans.data_b != trans.data)
              $display ("T=%0t [SCOREBOARD] ERROR ! Mismatch Driver and Monitor Data or address! ");
            else
              $display("T=%0t [SOCREOBARD] PASS");
         end // else: !if(trans.addr inside {[0:`h3f]})
      end // forever begin
   endtask // run
endclass // scoreboard
