module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);
    
    always@(posedge clk) begin
        if(reset| q == 4'd10) q <= 1; //reset at 10 and start at 1
        else q <= q + 1'b1; 
    end
endmodule