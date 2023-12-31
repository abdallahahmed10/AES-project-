module invRound (
    input [127:0] state,
    input [127:0] key,
    output [127:0] plain_text
);

    // Declare signals
    wire [127:0] invSubByte_reg;
    wire [127:0] invShiftRow;
    wire [127:0] addRoundKey_reg;

    // Inverse of shift rows
    shiftrowsdec invShiftRows_inst (
        .encrypted(state),
        .decrypted(invShiftRow)
    );

    // Inverse of sub bytes
    invsubbytes invSubBytes_inst (
        .en_reg(invShiftRow),
        .dec_reg(invSubByte_reg)
    );

    // Add round key
    addRoundKey addRoundKey_inst (
        .data(invSubByte_reg),
        .key(key), 
        .out(addRoundKey_reg)
    );

    // Inverse of mix columns
    InvMixColumns invMixColumns_inst (
        .in(addRoundKey_reg),
        .out(plain_text)
    );

    // Always block for sequential execution
    always @(*) begin
        invShiftRows_inst.encrypted = state;
        invSubBytes_inst.en_reg = invShiftRow;
        addRoundKey_inst.data = invSubByte_reg;
        invMixColumns_inst.in = addRoundKey_reg;
    end
    
endmodule
