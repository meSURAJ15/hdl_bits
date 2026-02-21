//Adder
//Exams_m2014 q4j
module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire [2:0] con; //for internal carry
    //use it by instantiation
    FA f0(x[0],y[0],1'b0,sum[0],con[0]); //default carry input be 0 
    FA f1(x[1],y[1],con[0],sum[1],con[1]);
    FA f2(x[2],y[2],con[1],sum[2],con[2]);
    FA f3(x[3],y[3],con[2],sum[3],sum[4]);

endmodule

module FA( 
    input a, b, cin,
    output sum, cout );
    assign sum = a^b^cin;
    assign cout = (a&b)| cin&(a^b);

endmodule
