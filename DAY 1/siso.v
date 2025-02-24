module d_ff(input clk,rst,d, output reg q);
  always@(posedge clk)begin
  if(rst)
    q<= 0;
  else 
    q <= d;
  end
endmodule

module siso(input clk,rst,d,output reg q3,q2,q1,q0);
  d_ff d1(.clk(clk),.rst(rst),.d(d),.q(q3));
  d_ff d2(.clk(clk),.rst(rst),.d(q3),.q(q2));
  d_ff d3(.clk(clk),.rst(rst),.d(q2),.q(q1));
  d_ff d4(.clk(clk),.rst(rst),.d(q1),.q(q0));
endmodule

module tb;
  reg d,clk,rst;
  wire q3,q2,q1,q0;
  
  siso so(.clk(clk),.rst(rst),.d(d),.q3(q3),.q2(q2),.q1(q1),.q0(q0));
  
  initial begin
    clk = 0;
     forever #5 clk = ~clk;
  end
  
  initial begin
     $monitor("clk =%0b rst = %0b d = %0b q3 = %0b q2 = %0b q1 = %0b q0 = %0b",clk,rst,d,q3,q2,q1,q0);
    
    d =1;
    rst = 0;#2;
    rst = 1;#2;
    d = 1;#2;
    rst = 0;#2;
    d = 1;#2;
    d = 0;#2;
    d = 1;#2;
    d = 1;#2;
    #50 $finish;
  end
    
    initial begin
      $dumpfile("siso.vcd");
      $dumpvars(0,tb);
    end
    
    
    
 
endmodule
