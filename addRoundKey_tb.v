`timescale 1ns / 1ps

module addRoundKey_tb;

    // Inputs to the addRoundKey module
    reg [127:0] data;
    reg [127:0] key;
    
    // Output from the addRoundKey module
    wire [127:0] out;

    // Instantiate the addRoundKey module
    addRoundKey uut (
        .data(data), 
        .key(key), 
        .out(out)
    );

    // Begin testing
    initial begin
        // Initialize Inputs
        data = 0;
        key = 0;
	$monitor("input= %H, key= %h, output = %h", data, key , out);
        // Add Stimulus here
        // Waiting for the global reset to finish is not required because there is no state to reset in this combinational circuit.
        // Applying a first test vector
//        data = 32'h01234567; // Example data
//        key = 32'h89abcdef; // Example key
//
//        #10; // Wait for 10 ns - not strictly necessary for combinational logic, but useful if you later insert delays in your module for simulation realism
//        
//        // Apply another test vector
//        data = 32'hdeadbeef; // New example data
//        key = 32'h12345678; // New example key
//        
//        #10; // Wait for another 10 ns


	data = 128'h_046681e5_e0cb199a_48f8d37a_2806264c;
	key = 128'h_a0fafe17_88542cb1_23a33939_2a6c7605;

        // You can add more test vectors as needed, e.g., using a file to read them or generating them procedurally

        // Finish the simulation (Only necessary if you want to stop before the default simulation time)
        #10; // Wait for any pending operations
        $finish;

    end
      
endmodule
