module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] prev , capture;
    always@(posedge clk) begin
        prev <= in; //stores the previous value of the input signal
    end
    assign capture = prev & ~in; //  check and store the negedge cycle
    always @(posedge clk) begin
        if(reset) out <= 0;
        else out <= out|capture; // last output or last negedge stored
    end

endmodule