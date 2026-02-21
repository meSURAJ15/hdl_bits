//FSM: Enable shift register
//Exams/review2015 fsmshift
module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    reg [2:0] count;  // 3-bit counter (0-4)
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 3'd0;
            shift_ena <= 1'b1;
        end else begin
            if (count < 3'd3) begin
                count <= count + 1'b1;
                shift_ena <= 1'b1;
            end else begin
                shift_ena <= 1'b0;
            end
        end
    end
    
endmodule