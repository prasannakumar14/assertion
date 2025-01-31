module tb();
 bit clk,a,b;

 always #5 clk=~clk;

 initial begin
  a=0;
  b=0;

  @(posedge clk)
  a=1;
  b=0;
 
  repeat(15) begin
    @(posedge clk)
    b=1;
  end

  @(posedge clk) 
  b=0;
 

  #200
  $finish();
  end

   a1: assert property(@(posedge clk)($rose(a) |=> b[*15]));
   //a2: assert property(@(posedge clk)($rose(a) |=> b[*15]));
endmodule
    
