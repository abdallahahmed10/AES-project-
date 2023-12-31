module tb_FPGA_Encryption;

    reg [127:0] plain_text;
    reg [127:0] key;
    wire [127:0] cipher;
    // clock
    reg clk;

    FPGA_Encryption en1 (
        .plain_text(plain_text),
        .key(key),
        .clk(clk),
        .cipher(cipher)
    );

    // Display the output after each round
    initial begin
        plain_text = 128'h3243f6a8885a308d313198a2e0370734;
        key = 128'h2b7e151628aed2a6abf7158809cf4f3c;
        // make clock positive edge
        clk = 1'b1;
        #10;        
        $display("Input plain text: %h", plain_text);
        $display("Input key: %h", key);
        // check if the output is 3925841d02dc09fbdc118597196a0b32
        // if correct then display test passed
        if (cipher == 128'h3925841d02dc09fbdc118597196a0b32)
            $display("Test passed");
        else
            $display("Test failed");

        $display("Final output: %h", cipher);
    end

endmodule