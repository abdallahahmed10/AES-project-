module AES_Decryption (
    input [127:0] cipher_text,
    input [0:1407] expanded_key,
    output [127:0] plain_text
);

    wire [127:0] round_0;
    wire [0:127] key0,key1,key2,key3,key4,key5,key6,key7,key8,key9,key10;
    wire [127:0] round_out1,round_out2,round_out3,round_out4,round_out5,round_out6,round_out7,round_out8,round_out9,round_out10;
    wire [127:0] sub10,shift10;
    
    // wire [0:1407] expanded_key;

    // keyExpansion key_expansion_inst (
    //     .key(key),
    //     .w(expanded_key)
    // );

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

    // Initial round (round 0)
    addRoundKey round0 (
        .data(cipher_text),
        .key(key10),
        .out(round_0)
    );

    // round 1
    invRound round1 (
        .state(round_0),
        .key(key9),
        .plain_text(round_out1)
    );

    // round 2
    invRound round2 (
        .state(round_out1),
        .key(key8),
        .plain_text(round_out2)
    );

    // round 3
    invRound round3 (
        .state(round_out2),
        .key(key7),
        .plain_text(round_out3)
    );

    // round 4
    invRound round4 (
        .state(round_out3),
        .key(key6),
        .plain_text(round_out4)
    );

    // round 5
    invRound round5 (
        .state(round_out4),
        .key(key5),
        .plain_text(round_out5)
    );

    // round 6
    invRound round6 (
        .state(round_out5),
        .key(key4),
        .plain_text(round_out6)
    );

    // round 7
    invRound round7 (
        .state(round_out6),
        .key(key3),
        .plain_text(round_out7)
    );

    // round 8
    invRound round8 (
        .state(round_out7),
        .key(key2),
        .plain_text(round_out8)
    );

    // round 9
    invRound round9 (
        .state(round_out8),
        .key(key1),
        .plain_text(round_out9)
    );

    // Final round (round 10)
    // inverse shift rows
    shiftrowsdec shiftrowsdec_inst (
        .encrypted(round_out9),
        .decrypted(shift10)
    );

    //inverse subbytes
    invsubbytes invsubbytes_inst (
        .en_reg(shift10),
        .dec_reg(sub10)
    );

    // add round key
    addRoundKey addRoundKey_inst (
        .data(sub10),
        .key(key0), 
        .out(plain_text)
    );

endmodule