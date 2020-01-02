module my_addr (adder_if _if);
   always_comb begin // a=b , b=c -> a=c 처럼 다른 문장을 동시에 실행해서 확인하게 해줌 .
      if(_if.rstn) begin
         _if.sum <= 0;
         _if.carry <=0;
      end else begin
         {_if.carry,_if.sum} <= _if.a + _if.b;
      end
   end
endmodule // my_addr
