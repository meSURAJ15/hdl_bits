module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); 
    /*
    ece241_2014_q7b Counter1000
    we have to bring 1000 to 1 , mod 10 count divides by 10 , 
    3 such counters be needed
    */
    wire [3:0] q0 ,q1, q2; // wires to count result of each counter
    assign c_enable[0] = 1'b1; // intial enable high
    bcdcount counter0 (clk, reset, c_enable[0],q0);
    assign c_enable[1] = (q0 == 4'd9); // high on 9
    bcdcount counter1 (clk, reset, c_enable[1],q1);
    assign c_enable[2] = (q1 == 4'd9) && (q0 == 4'd9); // prev and current check
    bcdcount counter2 (clk, reset, c_enable[2],q2);
    assign OneHertz = (q0 == 4'd9) && (q1 == 4'd9) && (q2 == 4'd9); // prev and current check

endmodule
