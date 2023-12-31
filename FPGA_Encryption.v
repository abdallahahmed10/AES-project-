module FPGA_Encryption (
    input [127:0] plain_text,
    input [0:127] key,
    input clk,
    output reg [127:0] cipher
);

    // Declare registers for FPGA_round outputs
    reg [127:0] round_reg0, round_reg1, round_reg2, round_reg3, round_reg4, round_reg5, round_reg6, round_reg7, round_reg8, round_reg9, round_reg10;
    reg [127:0] sub, shift;

    // Declare wire for expanded key
    wire [0:1407] expanded_key;

    // Instantiate key expansion module
    keyExpansion key_expansion_inst (
        .key(key),
        .w(expanded_key)
    );

    // Extract FPGA_round keys
    assign key0 = expanded_key[0:127];
    assign key1 = expanded_key[128:255];
    assign key2 = expanded_key[256:383];
    assign key3 = expanded_key[384:511];
    assign key4 = expanded_key[512:639];
    assign key5 = expanded_key[640:767];
    assign key6 = expanded_key[768:895];
    assign key7 = expanded_key[896:1023];
    assign key8 = expanded_key[1024:1151];
    assign key9 = expanded_key[1152:1279];
    assign key10 = expanded_key[1280:1407];

    // FPGA_round 0
    always @(posedge clk) begin
        addRoundKey round0 (
            .data(plain_text),
            .key(key0),
            .out(round_reg0)
        );
    end

    // FPGA_round 1
    always @(posedge clk) begin
        FPGA_round round1 (
            .state(round_reg0),
            .key(key1),
            .cipher(round_reg1)
        );
    end

    // FPGA_round 2
    always @(posedge clk) begin
        FPGA_round round2 (
            .state(round_reg1),
            .key(key2),
            .cipher(round_reg2)
        );
    end

	// FPGA_round 3
	always @(posedge clk) begin
		FPGA_round round3 (
			.state(round_reg2),
			.key(key3),
			.cipher(round_reg3)
		);
	end

	// FPGA_round 4
	always @(posedge clk) begin
		FPGA_round round4 (
			.state(round_reg3),
			.key(key4),
			.cipher(round_reg4)
		);
	end

	// FPGA_round 5
	always @(posedge clk) begin
		FPGA_round round5 (
			.state(round_reg4),
			.key(key5),
			.cipher(round_reg5)
		);
	end

	// FPGA_round 6
	always @(posedge clk) begin
		FPGA_round round6 (
			.state(round_reg5),
			.key(key6),
			.cipher(round_reg6)
		);
	end

	// FPGA_round 7
	always @(posedge clk) begin
		FPGA_round round7 (
			.state(round_reg6),
			.key(key7),
			.cipher(round_reg7)
		);
	end

	// FPGA_round 8
	always @(posedge clk) begin
		FPGA_round round8 (
			.state(round_reg7),
			.key(key8),
			.cipher(round_reg8)
		);
	end

    // FPGA_round 9
    always @(posedge clk) begin
        FPGA_round round9 (
            .state(round_reg8),
            .key(key9),
            .cipher(round_reg9)
        );
    end

    // FPGA_round 10
    always @(posedge clk) begin
        subbytes s10 (.state_reg(round_reg9), .subByte_reg(sub));
        shiftrows sh10 (.state(sub), .shiftrow(shift));
        addRoundKey ad10 (.data(shift), .key(key10), .out(cipher));
    end

endmodule
