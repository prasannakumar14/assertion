module tb();
  bit clk;
  parameter tp =10;
  parameter dutycycle=50;
  parameter ton=tp*dutycycle/100;
  parameter toff=tp-ton;
  
  always begin
    #toff clk=1;
    #ton clk=0;
  end

   initial begin
      #100;
      $finish();
  end

  property clock;
	  time prev_time;
          @(posedge clk)(1,prev_time=$realtime) |=> (tp == $realtime-prev_time);
  endproperty

  property tonclock;
	  time ton_time;
	  @(posedge clk)(1,ton_time=$realtime) |=> @(negedge clk)(ton == ($realtime-ton_time));
  endproperty

  property toffclock;
	  time toff_time;
	  @(negedge clk)(1,toff_time=$realtime) |=> @(posedge clk)(toff == $realtime-toff_time);
  endproperty

 a1: assert property(clock);
 a2: assert property(tonclock);
 a3: assert property(toffclock);
 
endmodule
