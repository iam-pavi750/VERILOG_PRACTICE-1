module comparator( input [3:0] A,B, output reg A_grt_B, A_less_B, A_equal_B);
  
  always@( *) begin
    A_grt_B= 0;
    A_less_B = 0;
    A_equal_B = 0;
    
    if(A>B)
      A_grt_B = 1;
    else if(A<B)
      A_less_B = 1;
    else
      A_equal_B = 1;
    
  end
  
endmodule


module tb;
  reg [3:0] A,B;
  wire A_grt_B,A_equal_B,A_less_B;
  
  comparator dut(.A(A),.B(B),.A_grt_B(A_grt_B),.A_less_B(A_less_B),.A_equal_B(A_equal_B));
                 
 initial begin
   $monitor("A =%0d,B =%0d , A_grt_B = %0b ,A_less_B = %0b ,A_equal_B = %0b",A,B,A_grt_B ,A_less_B ,A_equal_B);
  
   repeat(5) begin
   
   A = $random;
   B = $random;#1;
   
     end
   
 end
  initial begin
    $dumpfile("comparator.vcd");
    $dumpvars(0,tb);
  end
                 
                 endmodule
