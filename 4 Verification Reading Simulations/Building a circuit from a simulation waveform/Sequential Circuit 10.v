//Sequential Circuit 10
//Sim_circuit10
module top_module (
    input clk,
    input a,
    input b,
    output q,
    output state  );

    always @(posedge clk) begin
        if (a == b) state <= a; //loads previous syored value , look carefully
        else state <= state; //else same
    end
    
    assign q = (a == b) ? state : ~state; // q depends on same
    
endmodule
