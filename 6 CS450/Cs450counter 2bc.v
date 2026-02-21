//Cs450/counter 2bc

module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output [1:0] state
);
    
    parameter  SNT = 2'b00, WNT = 2'b01 , WT = 2'b10 , ST = 2'b11 ;
    always@(posedge clk  or posedge areset) begin
        if(areset) state <= WNT; 
        else if (train_valid) begin //go directly as instructed
            case (state)  //assign things as shown in fsm
                    SNT: state <= train_taken ? WNT : SNT;
                    WNT: state <= train_taken ? WT  : SNT;
                    WT:  state <= train_taken ? ST  : WNT;
                    ST:  state <= train_taken ? ST  : WT;
                    default: state <= WNT;
                endcase
        end
    end
    
    
endmodule
