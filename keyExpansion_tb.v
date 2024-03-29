
`timescale 1ns / 1ps

module keyExpansion_tb;

    // Inputs
    reg [127:0] key;

    // Outputs
    wire [1407:0] w;

    // Instantiate the Unit Under Test (UUT)
    keyExpansion uut (
        .key(key), 
        .w(w)
    );

    initial begin
        // Initialize Inputs
	$monitor("k= %h , out= %h",key,w);
	key=128'h_2b7e1516_28aed2a6_abf71588_09cf4f3c;

        // Wait 100 ns for global reset to finish
        #100;
        

    end
      
endmodule 