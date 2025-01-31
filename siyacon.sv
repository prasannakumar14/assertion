module tb();
  bit clk;

  bit a;
  bit b;
  bit c;
  bit d;

  always #5 clk=~clk;

  initial begin
    a=1;
    #10
    b=1;
    #10
    d=1;
    #10
    b=0;
    #10
    c=0;
    
   #100
   $finish();
  end

  a1:assert property(@(posedge clk) a |=> (b|c));

endmodule

