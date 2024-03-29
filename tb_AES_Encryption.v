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
        //plain_text = 128'h3243f6a8885a308d313198a2e0370734;
        //key = 128'h2b7e151628aed2a6abf7158809cf4f3c;
	plain_text = 128'h00112233445566778899aabbccddeeff;
	key = 128'h000102030405060708090a0b0c0d0e0f;
        #10;        
        $display("Input plain text: %h", plain_text);
        $display("Input key: %h", key);
        // check if the output is 3925841d02dc09fbdc118597196a0b32
        // if correct then display test passed
        //if (cipher == 128'h3925841d02dc09fbdc118597196a0b32)
	if (cipher == 128'h69c4e0d86a7b0430d8cdb78070b4c55a)
            $display("Test passed");
        else
            $display("Test failed");

        $display("Final output: %h", cipher);
    end

endmodule