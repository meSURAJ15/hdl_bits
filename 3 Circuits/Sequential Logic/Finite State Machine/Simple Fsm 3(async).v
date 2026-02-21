//Simple Fsm 3(async)
//Fsm3
module top_module(
    input clk,
    input in,
    input areset,
    output out); //

    // State transition logic
    parameter A = 0, B = 1 , C = 2 , D = 3;
    reg [1:0] state , next ; 

    // State flip-flops with asynchronous reset
    always@(posedge clk or posedge areset) begin
        if(areset) state <= A;
        else state <= next;
    end

    always @(*) begin
        case(state)
            A : next = in ? B:A;
            B : next = in ? B:C;
            C : next = in ? D:A;
            D : next = in ? B:C;
        endcase
    end
    // Output logic

    assign out = (state == D);
endmodule
v