module top_module (
    input clk,
    input d,
    output q
);
    reg q1, q2;
    always @(posedge clk) begin
        q1 <= d ^ q2; // keeps check on posedge value
    end
    always @(posedge clk) begin
        q2 <= d ^ q1; // keeps check on negedge value
    end
    
    assign q = q1^q2; // represents posede and negedge to final reg

endmodule
