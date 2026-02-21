module top_module( 
    input [254:0] in,
    output [7:0] out 
);
    
    function automatic [7:0] count_ones;
        input [254:0] data;
        integer i;
        begin
            count_ones = 0;
            for (i = 0; i < 255; i = i + 1) begin
                count_ones = count_ones + data[i];
            end
        end
    endfunction
    
    assign out = count_ones(in);
    
endmodule