// module AES (
//     input wire [127:0] plain_text,
//     input wire [0:127] key,
//     output reg LEDR
// );
//     // Hardcoded values for plain_text and key
//     reg [127:0] hard_plain_text = 128'h3243f6a8885a308d313198a2e0370734;
//     reg [127:0] hard_key = 128'h2b7e151628aed2a6abf7158809cf4f3c;

//     // Declare wires
//     wire [127:0] wire_cipher_text;
//     wire [127:0] wire_decrypted_text;

//     wire [0:1407] expanded_key;

//     keyExpansion key_expansion_inst (
//         .key(hard_key),
//         .w(expanded_key)
//     );

//     wire [127:0] cipher_text;
//     wire [127:0] decrypted_text;

//     // Encryption
//     AES_Encryption AES_Encryption_inst (
//         .plain_text(hard_plain_text),
//         .expanded_key(expanded_key),
//         .cipher(cipher_text)
//     );

//     // Decryption
//     AES_Decryption AES_Decryption_inst (
//         .cipher_text(cipher_text),
//         .expanded_key(expanded_key),
//         .plain_text(decrypted_text)
//     );

//     always @(*) begin
//         if (hard_plain_text == decrypted_text)
//             LEDR = 1'b1;
//         else
//             LEDR = 1'b0;
//     end
// endmodule


module AES (
    KEY, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5
);
	
	 input [1:0] KEY;
	 //output [1:0] LEDR;
     output reg [6:0] HEX0;
     output reg [6:0] HEX1;
     output reg [6:0] HEX2;
     output reg [6:0] HEX3;
     output reg [6:0] HEX4;
     output reg [6:0] HEX5;
    // Hardcoded values for plain_text and key
    //reg [127:0] hard_plain_text = 128'h3243f6a8885a308d313198a2e0370734;
	 //reg [127:0] hard_key = 128'h2b7e151628aed2a6abf7158809cf4f3c;
	 //reg [127:0] hard_plain_text = 128'h00112233445566778899aabbccddeabc;
	 reg [127:0] hard_key = 128'h00010203040506070888888888888888;
	 
	 reg [127:0] hard_cipher_text = 128'h00112233445566778899aabbccddeabc;

    //declare wires for HEX
//    wire [7:0] HEX0wire;
//    wire [7:0] HEX1wire;
//    wire [7:0] HEX2wire;
    wire [7:0] HEX3wire;
    wire [7:0] HEX4wire;
    wire [7:0] HEX5wire;
    
    

    // Declare wires
    wire [127:0] wire_cipher_text;
    wire [127:0] wire_decrypted_text;

	 //reg outputFlag;
		
    wire [0:1407] expanded_key;

    keyExpansion key_expansion_inst (
        .key(hard_key),
        .w(expanded_key)
    );

    // Encryption
//    AES_Encryption AES_Encryption_inst (
//        .plain_text(hard_plain_text),
//        .expanded_key(expanded_key),
//        .cipher(wire_cipher_text)
//    );

    // Decryption
    AES_Decryption AES_Decryption_inst (
        .cipher_text(hard_cipher_text),
        .expanded_key(expanded_key),
        .plain_text(wire_decrypted_text)
    );
//    segment bcd1Encrypted (
//        .bcd(wire_cipher_text[3:0]),
//        .seg(HEX0wire)
//    );
//    
//
//    segment bcd2Encrypted (
//        .bcd(wire_cipher_text[7:4]),
//        .seg(HEX1wire)
//    );
//    
//
//    //bcd3Encrypted
//    segment bcd3Encrypted (
//        .bcd(wire_cipher_text[11:8]),
//        .seg(HEX2wire)
//    );
    
    
    //bcd1Decrypted
    segment bcd1Decrypted (
        .bcd(wire_decrypted_text[3:0]),
        .seg(HEX3wire)
    );
    

    //bcd2Decrypted
    segment bcd2Decrypted (
        .bcd(wire_decrypted_text[7:4]),
        .seg(HEX4wire)
    );
    

    //bcd3Decrypted
    segment bcd3Decrypted (
        .bcd(wire_decrypted_text[11:8]),
        .seg(HEX5wire)
    );
    

    always @(posedge KEY[0]) 
    begin
        //assigning HEX registers to  HEX wires
//        HEX0 <= HEX0wire;
//        HEX1 <= HEX1wire;
//        HEX2 <= HEX2wire;
        HEX3 <= HEX3wire;
        HEX4 <= HEX4wire;
        HEX5 <= HEX5wire;
//        if (hard_plain_text == wire_decrypted_text)
//            outputFlag <= 1'b1;
//				
//        else
//            outputFlag <= 1'b0;
    end
	 //assign LEDR[0] = outputFlag;
     //assign HEX[0] = 

endmodule

// module BCDConverter(
//     input [127:0] binaryInput,
//     output reg [15:0] bcdOutput
// );
//     always @* begin
//         // Convert least significant 3 bytes to BCD
//         bcdOutput = binaryInput[23:0];
//     end
// endmodule

module segment(
     bcd,
     seg
    );
     
     input [3:0] bcd;
     output [6:0] seg;
     reg [6:0] seg;

    always @(bcd)
    begin
        case (bcd) 
            0 : seg = 7'b1000000;
            1 : seg = 7'b1111001;
            2 : seg = 7'b0100100;
            3 : seg = 7'b0110000;
            4 : seg = 7'b0011001;
            5 : seg = 7'b0010010;
            6 : seg = 7'b0000010;
            7 : seg = 7'b1111000;
            8 : seg = 7'b0000000;
            9 : seg = 7'b0010000;
            10: seg = 7'b0001000; // A
            11: seg = 7'b0000011; // B
            12: seg = 7'b1000110; // C
            13: seg = 7'b0100001; // D
            14: seg = 7'b0000110; // E
            15: seg = 7'b0001110; // F
            default : seg = 7'b1111111; 
        endcase
    end
    
endmodule
