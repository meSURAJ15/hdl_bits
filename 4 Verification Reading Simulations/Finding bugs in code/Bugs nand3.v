//Bugs nand3
module top_module (input a, input b, input c, output out);//

    reg on;
    andgate a1( on , a,  b,  c, 1'b1, 1'b1 );
    assign out = ~on ;
endmodule
