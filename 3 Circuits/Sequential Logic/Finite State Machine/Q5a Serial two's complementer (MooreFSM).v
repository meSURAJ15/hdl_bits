//Q5a: Serial two's complementer (Moore FSM)
//Exams/ece241 2014 q5a

module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    
    reg state ; 
     always @(posedge clk or posedge areset) begin
        if (areset) begin
            state <= 1'b0;
            z <= 1'b0;
        end else begin
            if (~state) begin  
                z <= x;
                if (x) state <= 1'b1; 
            end else begin     
                z <= ~x;
            end
        end
    end

endmodule
