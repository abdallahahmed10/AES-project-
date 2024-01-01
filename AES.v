// module AES (
//     input wire [127:0] plain_text,
//     input wire [0:127] key,
//     output reg LEDR
// );
//     // Hardcoded values for plain_text and key
//     reg [127:0] hard_plain_text = 128'h3243f6a8885a308d313198a2e0370734;
//     reg [127:0] hard_key = 128'h2b7e151628aed2a6abf7158809cf4f3c;

//     // Declare wires
//     wire [127:0] wire_cipher_text;
//     wire [127:0] wire_decrypted_text;

//     wire [0:1407] expanded_key;

//     keyExpansion key_expansion_inst (
//         .key(hard_key),
//         .w(expanded_key)
//     );

//     wire [127:0] cipher_text;
//     wire [127:0] decrypted_text;

//     // Encryption
//     AES_Encryption AES_Encryption_inst (
//         .plain_text(hard_plain_text),
//         .expanded_key(expanded_key),
//         .cipher(cipher_text)
//     );

//     // Decryption
//     AES_Decryption AES_Decryption_inst (
//         .cipher_text(cipher_text),
//         .expanded_key(expanded_key),
//         .plain_text(decrypted_text)
//     );

//     always @(*) begin
//         if (hard_plain_text == decrypted_text)
//             LEDR = 1'b1;
//         else
//             LEDR = 1'b0;
//     end
// endmodule


module AES (
    LEDR, KEY
);
	
	 input [1:0] KEY;
	 output [1:0] LEDR;
    // Hardcoded values for plain_text and key
    reg [127:0] hard_plain_text = 128'h3243f6a8885a308d313198a2e0370734;
    reg [127:0] hard_key = 128'h2b7e151628aed2a6abf7158809cf4f3c;

    // Declare wires
    wire [127:0] wire_cipher_text;
    wire [127:0] wire_decrypted_text;

	 reg outputFlag;
		
    wire [0:1407] expanded_key;

    keyExpansion key_expansion_inst (
        .key(hard_key),
        .w(expanded_key)
    );

    // Encryption
    AES_Encryption AES_Encryption_inst (
        .plain_text(hard_plain_text),
        .expanded_key(expanded_key),
        .cipher(wire_cipher_text)
    );

    // Decryption
    AES_Decryption AES_Decryption_inst (
        .cipher_text(wire_cipher_text),
        .expanded_key(expanded_key),
        .plain_text(wire_decrypted_text)
    );

    always @(posedge KEY[0]) begin
        if (hard_plain_text == wire_decrypted_text)
            outputFlag <= 1'b1;
				
        else
            outputFlag <= 1'b0;
    end
	 assign LEDR[0] = outputFlag;
endmodule