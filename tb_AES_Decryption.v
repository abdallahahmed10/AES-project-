module tb_AES_Decryption;

    reg [127:0] cipher_text;
    reg [127:0] key;
    wire [127:0] plain_text;

    AES_Decryption en1 (
        .cipher_text(cipher_text),
        .key(key),
        .plain_text(plain_text)
    );

    // Display the output after each round
    initial begin
        cipher_text = 128'h3925841d02dc09fbdc118597196a0b32;
        key = 128'h2b7e151628aed2a6abf7158809cf4f3c;
        #10;        
        $display("Input plain text: %h", cipher_text);
        $display("Input key: %h", key);
        // You can't display round_out1 and round_out2 here because they are not visible in this scope
        $display("Final output: %h", plain_text);
    end

endmodule