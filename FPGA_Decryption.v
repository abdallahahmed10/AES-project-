module AES_Decryption (
    input [127:0] cipher_text,
    input [0:127] key,
    input clk,
    output reg [127:0] plain_text
);

    // Declare registers for round outputs
    reg [127:0] round_reg0, round_reg1, round_reg2, round_reg3, round_reg4, round_reg5, round_reg6, round_reg7, round_reg8, round_reg9, round_reg10;
    reg [127:0] sub, shift;

    // Declare wire for expanded key
    wire [0:1407] expanded_key;

    // Instantiate key expansion module
    keyExpansion key_expansion_inst (
        .key(key),
        .w(expanded_key)
    );

    // Extract round keys
    assign key0 = expanded_key[0:127];
    assign key1 = expanded_key[128:255];
    assign key2 = expanded_key[256:383];
    assign key3 = expanded_key[384:511];
    assign key4 = expanded_key[512:639];
    assign key5 = expanded_key[640:767];
    assign key6 = expanded_key[768:895];
    assign key7 = expanded_key[896:1023];
    assign key8 = expanded_key[1024:1151];
    assign key9 = expanded_key[1152:1279];
    assign key10 = expanded_key[1280:1407];

    // Pipelined processing
    always @(posedge clk) begin
        // Initial Round (Round 10)
        addRoundKey round0 (
            .data(cipher_text),
            .key(key10),
            .out(round_reg0)
        );
    end

    // Pipelined processing for Rounds 9 to 1
    always @(posedge clk) begin
        invRound round1 (
            .state(round_reg0),
            .key(key9),
            .plain_text(round_reg1)
        );
    end

    always @(posedge clk) begin
        invRound round2 (
            .state(round_reg1),
            .key(key8),
            .plain_text(round_reg2)
        );
    end

    always @(posedge clk) begin
        invRound round3 (
            .state(round_reg2),
            .key(key7),
            .plain_text(round_reg3)
        );
    end

    always @(posedge clk) begin
        invRound round4 (
            .state(round_reg3),
            .key(key6),
            .plain_text(round_reg4)
        );
    end

    always @(posedge clk) begin
        invRound round5 (
            .state(round_reg4),
            .key(key5),
            .plain_text(round_reg5)
        );
    end

    always @(posedge clk) begin
        invRound round6 (
            .state(round_reg5),
            .key(key4),
            .plain_text(round_reg6)
        );
    end

    always @(posedge clk) begin
        invRound round7 (
            .state(round_reg6),
            .key(key3),
            .plain_text(round_reg7)
        );
    end

    always @(posedge clk) begin
        invRound round8 (
            .state(round_reg7),
            .key(key2),
            .plain_text(round_reg8)
        );
    end

    always @(posedge clk) begin
        invRound round9 (
            .state(round_reg8),
            .key(key1),
            .plain_text(round_reg9)
        );
    end

    // Final Round (Round 0)
    always @(posedge clk) begin
        shiftrowsdec shiftrowsdec_inst (
            .encrypted(round_reg9),
            .decrypted(shift)
        );

        invsubbytes invsubbytes_inst (
            .en_reg(shift),
            .dec_reg(sub)
        );

        addRoundKey addRoundKey_inst (
            .data(sub),
            .key(key0),
            .out(plain_text)
        );
    end

endmodule
