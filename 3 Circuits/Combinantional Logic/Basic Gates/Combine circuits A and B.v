//Combine circuits A and B
//Mt2015_q4
module top_module (input x, input y, output z);
    
    wire a1,a2,b1, b2,z1,z2;
    A A1(x,y,a1);
    B B1(x,y,b1);
    A A2(x,y,a2);
    B B2(x,y,b2);
    
    or(z1,a1,b1);
    and(z2,a2,b2);
    xor(z,z1,z2);
    

endmodule

module A ( input x, input y, output z );
    assign z = ~(x^y);
endmodule
//Mt2015_q4b
module B (input x, input y, output z);
    assign z = ~y&x;
endmodule
//Mt2015_q4a