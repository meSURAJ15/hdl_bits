//100-bit binary adder
//Adder100
module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
    wire [99:0] con; //store intrenal carry 
    
    genvar i ; 
    //genrate can be used for multiple instantiation
    generate 
        Fadd f0(a[0],b[0],cin,sum[0],con[0]);
        for (i = 1 ; i <100 ; i++) begin: add 
            Fadd f1(a[i],b[i],con[i-1],sum[i],con[i]);
        end
        assign cout = con[99]; //final carry
    endgenerate

endmodule


module Fadd( 
    input a, b, cin,
    output sum,cout);
    
    assign sum = a^b^cin;
    assign cout = (a&b)| cin&(a^b);

endmodule