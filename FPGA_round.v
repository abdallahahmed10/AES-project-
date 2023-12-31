module FPGA_round (
    input clk,
    input [127:0] state,
    input [127:0] key,
    output reg [127:0] cipher
);

    // Declare signals
    reg [127:0] subByte_reg;
    reg [127:0] shiftrow;
    reg [127:0] mixcolumn;

    // Instantiate subbytes module
    subbytes subbytes_inst (
        .state_reg(state),
        .subByte_reg(subByte_reg)
    );

    // Instantiate shiftrows module
    shiftrows shiftrows_inst (
        .state_reg(subByte_reg),
        .shiftrow_reg(shiftrow)
    );

    // Instantiate mixcolumns module
    mixcolumns mixcolumns_inst (
        .state_reg(shiftrow),
        .mixcolumn_reg(mixcolumn)
    );

    // Instantiate addRoundKey module
    addRoundKey addRoundKey_inst (
        .state_reg(mixcolumn),
        .key_reg(key),
        .cipher_reg(cipher)
    );

    always @(*) begin
        subByte_reg <= subbytes_inst.subByte_reg;
        shiftrow <= shiftrows_inst.shiftrow_reg;
        mixcolumn <= mixcolumns_inst.mixcolumn_reg;
        cipher <= addRoundKey_inst.cipher_reg;
    end
endmodule