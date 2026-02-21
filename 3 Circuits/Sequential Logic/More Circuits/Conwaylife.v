//Conwaylife
module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 
    reg [255:0] next_q;
    reg [3:0] neighbour ; 
    integer i, j ,x, y;
    integer wx, wy;
    
    always @(posedge clk) begin
        if (load) q <= data;
        else q <= next_q;
    end
    
    always @(*) begin
        for (i = 0 ; i <16 ; i++) begin
            for(j = 0; j<16 ; j++) begin
                neighbour = 1'b0;
                for (x=-1 ; x <2 ; x++) begin
                    for (y=-1 ; y <2 ; y++) begin
                        if ( x == 1'b0 && y == 1'b0) continue;
                         wx =  (i + x + 16) %16;
                         wy =  (j + y + 16) %16;
                        
                        neighbour = neighbour + q[wx*16 + wy];
                        
                    end
                end
                case (neighbour) 
                    4'd2 : next_q[i*16 + j] = q[i*16 + j] ;
                    4'd3 : next_q[i*16 + j] = 1'b1;
                    default : next_q[i*16 + j] = 1'b0;
                endcase
            end
        end
    end

endmodule