module tb();
  bit clk;

  bit[11:0] sel;
  bit[7:0] a;

  always #5 clk=~clk;

  initial begin
    sel=12'd 0;
    a=8'd 0;
   @(posedge clk)
    sel=12'd 2;
    a=8'd 2;

    @(posedge clk)
    sel=12'd 4;
    a=8'd 4;

    @(posedge clk)
    sel=12'd 0;

    #100
    $finish;
  end

  a1: assert property (@(posedge clk) (sel>=0 && sel<=7) |=> (sel == a));
endmodule
