module round (
    input [127:0] state,
    input [127:0] key,
    output [127:0] cipher
);

    // Declare signals
    wire [127:0] subByte_reg;
    wire [127:0] shiftrow;
    wire [127:0] mixcolumn;

    // Instantiate subbytes module
    subbytes subbytes_inst (
        .state_reg(state),
        .subByte_reg(subByte_reg)
    );

    // Instantiate shiftrows module
    shiftrows shiftrows_inst (
        .state(subByte_reg),
        .shiftrow(shiftrow)
    );

    // Instantiate mix columns
    MixColumns mixcolumns_inst (
        .in(shiftrow),
        .out(mixcolumn)
    );

    // Use the expanded key in your other modules
    // Note: You'll need to select the correct 128 bits from the expanded key
    addRoundKey addRoundKey_inst (
        .data(mixcolumn),
        .key(key),  // Use the first 128 bits of the expanded key
        .out(cipher)
    );

endmodule