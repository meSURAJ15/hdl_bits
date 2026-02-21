//4-digit decimal counter 
//Countbcd

module top_module (
    input clk,
    input reset,
    output [3:1] ena,
    output [15:0] q
);

    wire clast; //storing last flag

    decade d0 (clk,reset,1'b1,q[3:0] ,ena[1]); // ones 
    decade d1 (clk,reset,ena[1], q[7:4],ena[2]); // tens 
    decade d2 (clk,reset,ena[2],q[11:8],ena[3]); //hundreds
    decade d3 (clk,reset,ena[3],q[15:12],clast); //thousand

endmodule
//as suggested you can use prev created decade counter(modified)

module decade ( 
    input clock,
    input resetd,      // Synchronous active-high reset
    input enable,     
    output reg [3:0] Q,
    output carry      //flag for full
);


    always @(posedge clock) begin
        if (resetd)
            Q <= 4'd0;
        else if (enable) begin
            if (Q == 4'd9)
                Q <= 4'd0;
            else
                Q <= Q + 1'b1;
        end
    end
    assign carry = enable && (Q == 4'd9); // counter full

endmodule
