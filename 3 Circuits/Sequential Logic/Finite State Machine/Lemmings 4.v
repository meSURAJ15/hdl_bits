//Lemmings 4
//lemmings4
module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    
    
    parameter LEFT=0, RIGHT=1, FALL_R = 2 , FALL_L = 3, DIG_L = 4 , DIG_R = 5 , SPLAT = 6;
    reg [2:0] state, next_state;
    reg [5:0] fall_count; // you need to add a counter

    /*be careful while assigning, here it is
    fall>dig>bump
    assign fall counter carefully
    use main encoding in same manner 
    you need to devlop another clock logic for fall count of 20
    */

    always @(*) begin
        // State transition logic
        case (state)
            LEFT : next_state =  ~ground ? FALL_L  : ( dig ? DIG_L: ((bump_left) ? RIGHT : LEFT)) ;
            RIGHT : next_state = ~ground ? FALL_R  : ( dig ? DIG_R: ((bump_right) ? LEFT : RIGHT)) ; 
            FALL_R : next_state = ground ? ((fall_count>=20)? SPLAT : RIGHT) : FALL_R;
            FALL_L : next_state = ground ? ((fall_count>=20)? SPLAT : LEFT) : FALL_L;
            DIG_L : next_state = ~ground ? FALL_L : DIG_L;
            DIG_R : next_state = ~ground ? FALL_R : DIG_R;
            SPLAT : next_state = SPLAT;
            default : next_state = LEFT ;
        endcase
        
    end

    always @(posedge clk or posedge areset) begin
        // State flip-flops with asynchronous reset
        if (areset) state <= LEFT;
        else state <= next_state ;
    end
    
    always @(posedge clk or posedge areset) begin
        if (areset)
            fall_count <= 0;

        // Count only while falling
        else if (state == FALL_L || state == FALL_R) begin
            if (fall_count <= 20)   // prevent unnecessary overflow
                fall_count <= fall_count + 1;
        end

        // Reset counter when not falling
        else
            fall_count <= 0;
    end

    // Output logic
        assign walk_left = (state == LEFT ) ; 
   		assign walk_right = (state == RIGHT);
        assign aaah = (state == FALL_R || state == FALL_L) ; 
        assign digging = (state == DIG_L || state == DIG_R);
endmodule