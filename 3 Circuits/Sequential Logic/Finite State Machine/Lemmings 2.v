//Lemmings 2
//lemmings2
module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    
    
    parameter LEFT=0, RIGHT=1, FALL_R = 2 , FALL_L = 3;
    reg [1:0] state, next_state;

    always @(*) begin
        // State transition logic
        case (state)
            LEFT : next_state = ~ground ? FALL_L : ((bump_left) ? RIGHT : LEFT) ;
            RIGHT : next_state = ~ground ? FALL_R: ((bump_right) ? LEFT : RIGHT) ; 
            FALL_R : next_state = ground ? RIGHT : FALL_R;
            FALL_L : next_state = ground ? LEFT : FALL_L;
            default : next_state = LEFT ;
        endcase
        
    end

    always @(posedge clk or posedge areset) begin
        // State flip-flops with asynchronous reset
        if (areset) state <= LEFT;
        else state <= next_state ;
    end

    // Output logic
        assign walk_left = (state == LEFT); 
        assign walk_right = (state == RIGHT);
        assign aaah = (state == FALL_R |  state == FALL_L) ; 

endmodule


    

