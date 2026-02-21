//3-input LUT
//Exams/ece241_2013_q12
module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output reg Z
);
    
    reg [7:0] Q;  
    always @(posedge clk) begin
        if (enable) begin
            Q <= {Q[6:0], S};
        end
    end
    always @(*) begin
		 Z = Q[{A, B, C}];
    end
    
endmodule
