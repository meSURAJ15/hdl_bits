//3-bit LFSR
//Mt2015_lfsr
module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q

    lfsr s0(KEY[0], KEY[1], LEDR[2] ,SW[0], LEDR[0]);
    lfsr s1(KEY[0], KEY[1], LEDR[0] ,SW[1], LEDR[1]);
    lfsr s2(KEY[0], KEY[1], LEDR[1] ,SW[2], LEDR[2]);
    
endmodule

module lfsr(input clock,input sel, input in0 ,input in1, output q );
    always @(posedge clock) begin
        Q <= sel?in1:in0;
    end
endmodule
