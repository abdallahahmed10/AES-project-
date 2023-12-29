module tb_InvMixColumns;
    reg [127:0] state;
    wire [127:0] out;

    // Instantiate the MixColumns module
    InvMixColumns u1 (
        .in(state),
        .out(out)
    );

    initial begin
        // Test case 1
        state = 128'h2ec27d03c428e061c5529e8f9d9a53de;
        #10;

        // Display the input state
        $display("Input state: %h", state);

        if (out == 128'hd4e0b81ebfb441275d52119830aef1e5) begin
            $display("Test case 1 passed");
        end else begin
            $display("Test case 1 failed");
        end

        // // Display the initial columns
        // $display("Initial column0: %h", u1.column0);
        // $display("Initial column1: %h", u1.column1);
        // $display("Initial column2: %h", u1.column2);
        // $display("Initial column3: %h", u1.column3);

        // Display the output state
        $display("Output state: %h", out);

        // // Display all the new columns
        // $display("column0New: %h", u1.column0New);
        // $display("column1New: %h", u1.column1New);
        // $display("column2New: %h", u1.column2New);
        // $display("column3New: %h", u1.column3New);

        // Add more test cases as needed...

        // End the simulation
        $finish;
    end
endmodule