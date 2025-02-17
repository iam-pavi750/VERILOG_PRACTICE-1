module full_adder(input a,b,cin, output sum,carry);
  assign sum =a^b^cin;
  assign carry = a&b|b&cin|cin&a;
endmodule

module ripple(input [3:0]a,b,input cin,output[3:0] sum,carry);
    full_adder f1f1(a[0],b[0],cin,sum[0],carry[0]);
    full_adder f2f2(a[1],b[1],carry[0],sum[1],carry[1]);
    full_adder f3f3(a[2],b[2],carry[1],sum[2],carry[2]);
    full_adder f4f4(a[3],b[3],carry[2],sum[3],carry[3]);
 endmodule


module rip;
  reg [3:0] a,b;
  reg cin;
  wire [3:0]sum,carry;
  
  ripple r1(.a(a),.b(b),.cin(cin),.sum(sum),.carry(carry));
  
  initial begin
    $monitor("a=%0b b=%0b cin=%0b sum=%0b carry=%0b ",a,b,cin, sum,carry[3]);
    a=3; b=2;cin=3;
    #1a=5; b=3;cin=8;
     #1a=9; b=1;cin=4;
     #1a=12; b=8;cin=1;
  end
  
 initial begin
    $dumpfile("ripple.vcd");
       $dumpvars(0,rip);
  end
endmodule
    
