module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
 
    always@(posedge clk) begin
        if(reset) q <= 0; //reset at 9
        else if (slowena)  begin
            if (q == 4'd9)  q <= 0; 
            else q <= q + 1'b1;
        end
    end
   
endmodule
/* here if there is no reset , then movement should be controlled  by only  slowena signal , 
and movement be controlled by the reset ahead
*/