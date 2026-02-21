//3-bit binary adder
//Adder3
module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    
    Fadd f0(a[0],b[0],cin,sum[0],cout[0]);
    Fadd f1(a[1],b[1],cout[0],sum[1],cout[1]);
    Fadd f2(a[2],b[2],cout[1],sum[2],cout[2]);
endmodule

module Fadd( 
    input a, b, cin,
    output sum, cout );
    
    assign sum = a^b^cin;
    assign cout = (a&b)| cin&(a^b);

endmodule
