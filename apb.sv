module tb; 
  bit pclk,pwrite,psel,penable,pready;
  bit [7:0] pwdata,paddr;
  
  default clocking @(posedge pclk); endclocking
 initial forever #10 pclk=!pclk;
  
 
 property p1;
   
   @(posedge pclk) $rose (pwrite && psel) |-> ($stable(paddr && pwdata)[*2]) ##1 $rose (penable && pready) ##1 $fell (pwrite && psel && penable && pready);
endproperty
 
 
  a1: assert property (p1) $display ("Assertion passed",$time);
    
    
    
    
            initial begin
              $dumpfile ("hello.vcd");
              $dumpvars (0,tb);
            end
              
 initial begin 
   repeat(100) begin 
     repeat(1) @(posedge pclk) #1 ;  
     if (!randomize(pwrite,psel,penable,pready) with
         {pwrite dist    {1'b1:=1,1'b0:=1};
          psel dist { 1'b1:=1,1'b0:=1};
          penable dist { 1'b1:=1,1'b0:=1};
          pready dist { 1'b1:=1,1'b0:=1};
         }) 
	$display("MYERR", "This is a randomize error");
      repeat (2) @ (posedge pclk) #1;
     if (!randomize(paddr,pwdata))
       $display("MYERR", "This is a randomize error");
        end 
   $stop;
 end 
endmodule
