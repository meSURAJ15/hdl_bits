//Clock
//Tb_clock
module top_module ( );
    
    reg clk;
    
    dut u_dut (.clk(clk));
    initial begin
        clk = 1'b0; //initial clock value
    end
    
    // Generate clock using always
    always #5 clk = ~clk;  // 5 ps half-period = 10 ps full period
    // very common way to generate clock
endmodule
