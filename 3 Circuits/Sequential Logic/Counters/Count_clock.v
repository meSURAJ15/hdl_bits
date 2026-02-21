//Count_clock

module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    
    /* note : 
Note that 11:59:59 PM advances to 12:00:00 AM, and 12:59:59 PM advances to 01:00:00 PM. There is no 00:00:00

*/
    
    always @(posedge clk) begin
        if (reset) begin //reset (12:00:00 AM)
            pm <= 1'b0;
            hh <= 8'h12;
            mm <= 8'h00;
            ss <= 8'h00;
        end
        else if (ena) begin
            if (ss==8'h59) begin //rebounds second
                ss <= 8'h00;
                if (mm == 8'h59) begin //rebounds minute
                    mm<=8'h00;
                    if (hh == 8'h11) begin
                        hh <= 8'h12; //rebounds minute
                        pm <= ~pm;   // change at each 12  
                    end
                    else if (hh == 8'h12) hh <= 8'h01; // 12-> 1
                    else begin
                        if (hh[3:0] == 4'd9) begin //cases of 10 at hour
                            hh[3:0] <= 4'd0;
                            hh[7:4] <= hh[7:4] + 1'b1;
                        end
                        else
                            hh[3:0] <= hh[3:0] + 1'b1;
                    end

                end

                else begin
                    if(mm[3:0] == 4'd9) begin //cases of 10 at mins
                        mm[3:0] <= 4'd0;
                        mm[7:4] <= mm[7:4] + 1'b1;
                    end
                    else mm[3:0] <= mm[3:0] + 1'b1;
                end
            end
            else begin
                if(ss[3:0] == 4'd9) begin //cases of 10 at sec
                    ss[3:0] <= 4'd0;
                    ss[7:4] <= ss[7:4] + 1'b1;
                end
                else ss[3:0] <= ss[3:0] + 1'b1;
            end
        end 
    end   

endmodule
