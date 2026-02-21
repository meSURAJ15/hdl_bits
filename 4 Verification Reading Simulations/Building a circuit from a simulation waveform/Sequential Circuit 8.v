//Sequential Circuit 8 
//Sim_circuit8
module top_module (
    input clock,
    input a,
    output p,
    output reg q );
    
    always @(*) begin
        if (clock) p = a;
    end
    
    always @(negedge clock) begin
        q <= a;
    end
endmodule
