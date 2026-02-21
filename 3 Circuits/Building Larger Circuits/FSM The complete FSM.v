//FSM: The complete FSM
//review2015_fsm
// FSM: The complete FSM
// review2015_fsm
module top_module (
    input clk,
    input reset,        // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack
);
    
   
    parameter S = 4'd0, S1 = 4'd1, S11 = 4'd2, S110 = 4'd3, B0 = 4'd4, B1 = 4'd5, B2 = 4'd6, B3 = 4'd7, Count = 4'd8,Wait = 4'd9;
    reg [3:0] state, next_state;
    
    
    always @(posedge clk) begin
        if (reset)state <= S;
        else state <= next_state;
    end
    
    // State transition logic
    always @(*) begin
        case (state)
            S:      next_state = data ? S1 : S;
            S1:     next_state = data ? S11 : S;
            S11:    next_state = data ? S11 : S110;
            S110:   next_state = data ? B0 : S;
            B0:     next_state = B1;
            B1:     next_state = B2;
            B2:     next_state = B3;
            B3:     next_state = Count;
            Count:  next_state = done_counting ? Wait : Count;
            Wait:   next_state = ack ? S : Wait;
            default: next_state = S;
        endcase
    end
    
    
    always @(*) begin
        shift_ena = 1'b0;
        counting = 1'b0;
        done = 1'b0;
        case (state)
            B0, B1, B2, B3: shift_ena = 1'b1;
            Count: counting = 1'b1;
            Wait: done = 1'b1;
        endcase
    end

endmodule