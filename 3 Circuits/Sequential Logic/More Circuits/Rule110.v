//Rule110
module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q ); 
    integer i ;
    
    always@(posedge clk) begin
        if (load) q <= data;
        else begin
            q[0] <= (q[0]^1'b0); //boundry conditions
            q[511] <= (q[511]^q[510])|( q[511] & q [510]);
            for (i = 1; i < 511; i++) begin
                q[i] <= (q[i]^q[i-1])|(~q[i+1] & q[i] & q [i-1]);  // general case
            end  
        end
    end
endmodule

