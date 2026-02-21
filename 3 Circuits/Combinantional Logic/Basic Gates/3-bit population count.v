//3-bit population count
//Popcount3
module top_module( 
    input [2:0] in,
    output [1:0] out );
    integer i;
    
    always @(*) begin
        out = 2'b00;
        for(i=0 ; i<3 ; i++) begin
            if(in[i])out = out+1'b1;
            else out = out ; 
        end
    end

endmodule
