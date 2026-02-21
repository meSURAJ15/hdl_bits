//256-to-1 multiplexer
//Mux256to1
module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out );

    //sel line goes to 255 number same is given in input
    assign out = in[sel];
endmodule
