//Shift register2
//Exams_2014_q4b
module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    
    MUXDFF f0 (KEY[0], KEY[1] , KEY[2],  LEDR[1], SW[0], LEDR[0] );  // last bitinput w
    MUXDFF f1 (KEY[0], KEY[1] , KEY[2],  LEDR[2], SW[1], LEDR[1] ); 
    MUXDFF f2 (KEY[0], KEY[1] , KEY[2],  LEDR[3], SW[2], LEDR[2] ); 
    MUXDFF f3 (KEY[0], KEY[1] , KEY[2],  KEY[3], SW[3], LEDR[3] ); 

endmodule

module MUXDFF (input clk,E,L,W,r_in, output q); // go with pic naming

    always@(posedge clk)
        begin
            case({E,L}) //assert together
                2'b00: q<=q;
                2'b01: q<=r_in; //2'bx1
                2'b10: q<=W;
                2'b11: q<=r_in; //2'bx1
                default: q<=1'bx; //dont forget
            endcase
        end
		
endmodule
