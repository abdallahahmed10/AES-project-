module AES (
    input [127:0] plain_text,
    input [0:127] key,
    output [127:0] decrypted_text
    output LEDR
);

    wire [127:0] cipher_text;
    reg flag;
    assign LEDR = flag;
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
    always@(*) begin 
        flag = (plain_text == decrypted_text) ? 1'b1: 1'b0
        // if (plain_text == decrypted_text)begin
        //     flag <= 1'b1
        // end
        // else begin
        //     flag

    end

endmodule