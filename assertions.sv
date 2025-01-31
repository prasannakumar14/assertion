module tb();
bit clk;

 bit a;
 bit b;
 bit c;

 always #5 clk=~clk;

 initial begin	   
	 
    a=0;
    b=0;
  @(posedge clk)
    a=1;
    b=0;
  @(posedge clk)
    a=1;
  @(posedge clk)
    a=0;
    b=1;
  @(posedge clk)
    a=0;
    b=0;
  @(posedge clk)
    a=1;
    b=1;
  @(posedge clk)
    a=0;
    b=0;
  @(posedge clk)
    a=1;
    b=1;
  @(posedge clk)
    a=1;
    b=0;

/*   a=0;
   b=0;
   c=0;
   @(posedge clk)
   a=1;
   @(posedge clk)
   a=0;
   b=1;
   c=1;
   @(posedge clk)
   a=1;
   @(posedge clk)
   b=1;
   @(posedge clk)
   a=0;
   b=1;
   @(posedge clk)
   a=1;
   b=1;
   c=1;
   @(posedge clk)
   b=0;
   c=0;
   @(posedge clk)
   @(posedge clk)
   c=1;
   @(posedge clk)
   b=0;
   @(posedge clk)
   b=1;   
*/
   #100
   $finish();
  end
  
 // a1:assert property(@(posedge clk) (a&b));

 // a1:assert property(@(posedge clk) a |=> b);
 
 /*  sequence rose;
	   a|=>b;
   endsequence

   property pro;
	   @(posedge clk) rose;
   endproperty*/

  // a1:assert property(@(posedge clk) (a |-> (##1b) or (##2b) or (##3b))); //timing window for within 1-3 clock cycles.

  
  // a1:assert property(@(posedge clk) (a |-> ##1b ##1b ##1b));
  
  // a1:assert property(@(posedge clk) ($rose(a) |=> b[*4]));
  
  // a1:assert property(@(posedge clk) ($rose(a) |=> b[*3:5]));
  
  // a1:assert property(@(posedge clk) ($rose(a) |=> b[=4]));
  
  /* a2:assert property(@(posedge clk) ($rose(a) |=> b[=3:5]));
  
  // a1: assert property(@(posedge clk) (a |=>(b && $stable(c))));
 
   //a1:assert property(@(posedge clk) (a|->~b));

  // a1:assert property(@(posedge clk) (a |=> (~b && $fell(c))));*/

  a1:assert property(@(posedge clk) (a |-> ##2 b));
endmodule



