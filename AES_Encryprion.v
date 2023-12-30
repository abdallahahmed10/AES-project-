module AES_Encryption (
input [127:0] plain_text,
input [0:127] key,
output[127:0] cipher
);

// // Declare plain_text, key and cipher
// reg [127:0] plain_text;
// reg [0:127] key;
// wire [127:0] cipher;

wire [127:0] round_0;
wire [0:127] key0,key1,key2,key3,key4,key5,key6,key7,key8,key9,key10;
wire [127:0] round_out1,round_out2,round_out3,round_out4,round_out5,round_out6,round_out7,round_out8,round_out9,round_out10;
wire [127:0] sub10,shift10;

// might need reg
wire [0:1407] expanded_key;  // Expanded key is now 1408 bits


// Instantiate key expansion module
keyExpansion key_expansion_inst (
    .key(key),
    .w(expanded_key)  // Connect to expanded_key
);

// now we have the keys for 11 rounds
// the keys should be partitioned to 11 partitions of 128 bits for each round
// the first 128 bits of the expanded key is the first round key and so on

// Corrected part-select ranges
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
    .data(plain_text),
    .key(key0),
    .out(round_0)
);

// round 1
round round1 (
    .state(round_0),
    .key(key1),
    .cipher(round_out1)
);

// round 2
round round2 (
    .state(round_out1),
    .key(key2),
    .cipher(round_out2)
);

// round 3
round round3 (
    .state(round_out2),
    .key(key3),
    .cipher(round_out3)
);

// round 4

round round4 (
    .state(round_out3),
    .key(key4),
    .cipher(round_out4)
);

// round 5

round round5 (
    .state(round_out4),
    .key(key5),
    .cipher(round_out5)
);

// round 6

round round6 (
    .state(round_out5),
    .key(key6),
    .cipher(round_out6)
);

// round 7

round round7 (
    .state(round_out6),
    .key(key7),
    .cipher(round_out7)
);

// round 8

round round8 (
    .state(round_out7),
    .key(key8),
    .cipher(round_out8)
);

// round 9

round round9 (
    .state(round_out8),
    .key(key9),
    .cipher(round_out9)
);

// round 10
subbytes s10 (
    .state_reg(round_out9),
    .subByte_reg(sub10)
);
shiftrows sh10 (
    .state(sub10),
    .shiftrow(shift10)
);
addRoundKey ad10 (
    .data(shift10),
    .key(key10),
    .out(round_out10)
);

// in terms of columns
assign cipher = round_out10;

endmodule
