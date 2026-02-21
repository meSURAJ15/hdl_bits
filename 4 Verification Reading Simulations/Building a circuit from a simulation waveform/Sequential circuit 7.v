//Sequential circuit 7
//Sim_circuit7
module top_module (
    input clk,
    input a,
    output q );

    //is !a , and changes at each clockedge
    always @(posedge clk) begin
        q <= ~a;
    end
endmodule