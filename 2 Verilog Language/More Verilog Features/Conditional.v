module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//
    reg [7:0] con1,con2;

    // assign intermediate_result1 = compare? true: false;
    assign con1 = (a>b) ?b:a;
    assign con2 = (c>d) ?d:c;
    assign min = (con1>con2)?con2:con1;

endmodule
