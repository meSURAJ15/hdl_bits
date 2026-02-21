//Thermostat
module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 

    assign heater = (too_cold) & (mode) & (~aircon); //when rwq on cold
    assign aircon = (too_hot) & (~mode) & (~heater); // when req on heat
    assign fan = (heater|aircon) | fan_on; // see the sattement clearly
endmodule
