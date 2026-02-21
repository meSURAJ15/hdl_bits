//Signed addition overflow
//Exams_ece241 2014 q1c
module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); 
    // checking for the last carry
    //you must store the last bit in the overflow
    // use addition simply

    assign s = a + b;
    assign overflow = (a[7] == b[7]) && (s[7] != a[7]); 
    //checking for the same sign inputs and diff sign resultz

endmodule
