//Counter with period 1000
//Exams/review2015 count1k
module top_module (
    input clk,
    input reset,
    output [9:0] q);

    always @(posedge clk) begin
        if(reset || q == 10'd999) q <= 10'd0;
        else q <= q + 1'd1;
    end
endmodule
