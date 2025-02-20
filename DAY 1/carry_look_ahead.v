module carry_look( a,b,cin,s,cout);
  
  input [3:0] a,b;
  input cin;
  output [3:0] s;
  output cout;
  wire [3:0] ci;
  
  assign ci[0] = cin;
  assign ci[1] = (a[0] & b[0]) | ((a[0] ^ b[0]) & ci[0]);
  assign ci[2] = (a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & ci[0])));
  assign ci[3] = (a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) &   ((a[0] & b[0]) | ((a[0] ^ b[0]) & ci[0] )))));
                               
  assign cout = (a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) &   ((a[0] & b[0]) | ((a[0] ^ b[0]) & ci[0]) ))))));
                                                             
                                                             
 assign s = a^b^ci;
                                                             
endmodule




module tb;
  reg [3:0] a,b;
  reg cin;
  wire [3:0] s;
  wire cout;
  wire [3:0] ci;
  
  carry_look c1(.a(a),.b(b),.cin(cin),.s(s),.cout(cout));
  
  initial begin
    $monitor(" a= %0b b =%0b cin =%0b s=%0b cout=%0b",a,b,cin,s,cout);    
    a = 4; b = 2;cin = 1; #1;
      a = 1; b = 2; cin =1; #1;
     a = 3; b = 4; cin =1;#1;
      a = 6; b = 3;cin=1; #1;
    
  end
endmodule
