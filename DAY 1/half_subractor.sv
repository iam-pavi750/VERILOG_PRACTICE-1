module half_subtractor(input a, b, output diff, borr);
  wire abar;
  
  xor x(diff,a,b);
  not n1(abar,a);
  and a2(borr,abar,b);
  
endmodule


module half;
  
  reg a,b;
  wire diff,borr;
  
  half_subtractor h1(.a(a),.b(b),.diff(diff),.borr(borr));
  
  
  initial begin
     a= 0 ;b = 0;
    #1 a =0; b= 1;
    #1 a= 1; b= 0;
    #1 a = 1; b= 1;
    
    #1 $finish;
  end
  
  initial begin
    $dumpfile("half_subtractor.vcd");
    $dumpvars(0,half);
    
  end
  
  always@(a or b)
    $display(" a= %0b b= %0b diff = %0b borr =%0b",a,b,diff,borr);
  
endmodule

