module tb_AES_Encryption;

    reg [127:0] plain_text;
    reg [127:0] key;
    wire [127:0] cipher;

    AES_Encryption en1 (
        .plain_text(plain_text),
        .key(key),
        .cipher(cipher)
    );

    // Display the output after each round
    initial begin
        plain_text = 128'h3243f6a8885a308d313198a2e0370734;
        key = 128'h2b7e151628aed2a6abf7158809cf4f3c;
        #10;        
        $display("Input plain text: %h", plain_text);
        $display("Input key: %h", key);
        // You can't display round_out1 and round_out2 here because they are not visible in this scope
        $display("Final output: %h", cipher);
    end

endmodule