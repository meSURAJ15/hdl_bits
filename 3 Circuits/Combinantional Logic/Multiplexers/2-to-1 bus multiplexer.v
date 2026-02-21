//2-to-1 bus multiplexer
//Mux2to1v
module top_module( 
    input [99:0] a, b,
    input sel,
    output [99:0] out );

    assign out = sel?b:a;
endmodule
