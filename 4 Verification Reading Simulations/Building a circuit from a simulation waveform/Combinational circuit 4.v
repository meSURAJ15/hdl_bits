//Combinational circuit 4
//Sim/circuit4
module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );//

    assign q = (1'b1 & b) | (c & 1'b1);

endmodule
