module tb_AES;

    // Inputs
    reg [127:0] plain_text = 128'h3243f6a8885a308d313198a2e0370734;
    reg [127:0] key = 128'h2b7e151628aed2a6abf7158809cf4f3c;

    // Outputs
    wire [127:0] decrypted_text;

    // Instantiate the Unit Under Test (UUT)
    AES uut (
        .plain_text(plain_text),
        .key(key),
        .decrypted_text(decrypted_text)
    );

    initial begin
        // Initialize Inputs
        plain_text = 128'h3243f6a8885a308d313198a2e0370734;
        key = 128'h2b7e151628aed2a6abf7158809cf4f3c;

        // Wait 100 ns for AES to process
        #10;

        // display plain_text
        $display("Input plain text: %h", plain_text);

        // Check the result
        if (decrypted_text === plain_text) begin
            $display("Test Passed");
        end else begin
            $display("Test Failed");
        end

        // display decrypted text
        $display("Decrypted text: %h", decrypted_text);

        // Finish the simulation
        $finish;
    end

endmodule