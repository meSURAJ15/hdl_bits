module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    wire con[99:0];

    genvar i ;
    
    generate
        bcd_fadd add1(a[3:0],b[3:0],cin ,con[0], sum[3:0]);
        for(i = 1 ; i <100; i++) begin : start
            bcd_fadd add2(a[((4*i +3)):(4*i)] ,b[((4*i)+3): (4*i)],con[i-1] , con[i], sum[((4*i)+3): (4*i)]);
        end
    endgenerate
    assign cout = con[99];
endmodule
