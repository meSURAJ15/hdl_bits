//Simple Fsm 3(sync)
//Fsm3s
module top_module(
    input clk,
    input in,
    input reset,
    output out); //

    // State transition logic
    parameter A = 0, B = 1 , C = 2 , D = 3;
    reg [1:0] state , next ; 

    // State flip-flops with asynchronous reset
    always@(posedge clk) begin
        if(reset) state <= A;
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

