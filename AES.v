module AES (
    input [127:0] plain_text,
    input [0:127] key,
    output [127:0] decrypted_text
);

    wire [127:0] cipher_text;

    // Encryption
    AES_Encryption AES_Encryption_inst (
        .plain_text(plain_text),
        .key(key),
        .cipher(cipher_text)
    );

    // Decryption
    AES_Decryption AES_Decryption_inst (
        .cipher_text(cipher_text),
        .key(key),
        .plain_text(decrypted_text)
    );

endmodule