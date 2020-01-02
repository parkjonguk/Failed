`include "Enviroment.sv"

program test(switch_vif vif);
   
   enviroment env;
   
   initial begin
      env = new(vif);
      env.g0.num = 100;
      env.run();
   end
endprogram // test
   
     
q
