//256-to-1 4-bit multiplexer
//Mux256to1v⭐
module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );
    
    /*In particular, in[ sel*4+3 : sel*4 ] does not work.
    as it does this [MSB:LSB] always require constants bits
    This is a good question help you to learn about : in[sel*4 +: 4]
    here the bit takes lowest value and moves it upward .
    */
    
    assign out = in[sel*4 +: 4];
    
endmodule