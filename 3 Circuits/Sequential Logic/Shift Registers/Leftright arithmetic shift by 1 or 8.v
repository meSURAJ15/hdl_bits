//Left/right arithmetic shift by 1 or 8
//Shift18

module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 

    /*left shisgt is same in arithmetica nd logical , but 
     for the arithmetic right we would look for preserving msb
    */
    always @(posedge clk) begin
        if(load) q <= data;
        else if(ena) begin
            case(amount)
                2'b00 : q <= {q[62:0],1'd0}; //left 1bit
                2'b01 : q <= {q[55:0], 8'd0};  //left8
                2'b10 : q <= {q[63] ,q[63:1]};  //right1
                2'b11 : q <= {{8{q[63]}},q[63:8]}; //right8
                default : q <= q ;
            endcase
        end
            
    end
endmodule
