//Q5b: Serial two's complementer (Mealy FSM)
//ece241_2014_q5b


module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter A = 1'b0 , B = 1'b1; 
    reg state , next ; 
    always @(posedge clk or posedge areset) begin
        if(areset) state <= A ;
        else state <= next; 
    end
    always @(*) begin
        case(state) 
            A: begin
                next = x ? B : A ;
                z = x ? 1'b1 : 1'b0;
            end
            B: begin
                next = x ? B : B ;
                z = x ? 1'b0 : 1'b1;
            end
        endcase
    end

    
endmodule
