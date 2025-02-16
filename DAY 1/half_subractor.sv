module half_subtractor(input a, b, output diff, borr);
  wire abar;
  
  xor x(diff,a,b);
  not n1(abar,a);
  and a2(borr,abar,b);
  
endmodule
