module d_ff (input clk,rst,d, output reg q);
  always@(posedge clk )begin
  if(rst)
    q<= 0;
  else 
    q<= d;
  end
endmodule


module pipo(input clk,rst,[3:0]parallel_in,output reg parallel_a,parallel_b,parallel_c,parallel_d);
  
  reg[3:0] pipo;
  
  d_ff d1(.clk(clk),.rst(rst),.d(parallel_in[0]),.q(pipo[0]));
  d_ff d2(.clk(clk),.rst(rst),.d(parallel_in[1]),.q(pipo[1]));
  d_ff d3(.clk(clk),.rst(rst),.d(parallel_in[2]),.q(pipo[2]));
  d_ff d4(.clk(clk),.rst(rst),.d(parallel_in[3]),.q(pipo[3]));

  
  always@(*) begin
    parallel_a = pipo[0];
    parallel_b = pipo[1];
    parallel_c = pipo [2];
    parallel_d = pipo[3];
  end
endmodule


module pipo_tb;
  
  reg clk, reset;
  reg  [3:0]parallel_in;
  wire parallel_out_a,parallel_out_b,parallel_out_c,parallel_out_d;
  
  pipo dut(clk, reset,parallel_in,parallel_out_a,parallel_out_b,parallel_out_c,parallel_out_d);
  
  initial  begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    
    reset = 1;
        parallel_in = 4'b0000;
        #15;

        // Release reset
        reset = 0;
        #50;

        // Input parallel data
        parallel_in = 4'b1010; #10;
    
        parallel_in =4'b1110; #10; // use this like clk pluse if not it will not shows stimulation
        
    #100 $finish;
  end
  initial  begin 
    $monitor("time%0t | reset = %0b | parallel_in = %0b | parallel_out_a = %0b | parallel_out_b = %0b| parallel_out_c = %0b| parallel_out_d = %0b ",$time,reset,parallel_in,parallel_out_a,parallel_out_b,parallel_out_c,parallel_out_d);
  end
  
  initial begin
    $dumpfile("pipo.vcd");
    $dumpvars(1,pipo_tb);
  end
endmodule
    
    
    
