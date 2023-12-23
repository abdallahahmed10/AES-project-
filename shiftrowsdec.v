module shiftrowsdec(
input [127:0] encrypted,
output reg [127:0] decrypted
);

always@(*) begin
//first row not shifted
decrypted[127:120]=encrypted[127:120];
decrypted[95:88]=encrypted[95:88];
decrypted[63:56]=encrypted[63:56];
decrypted[31:24]=encrypted[31:24];

//second row shifted one byte right
decrypted[119:112]=encrypted[23:16];
decrypted[87:80]=encrypted[119:112];
decrypted[55:48]=encrypted[87:80];
decrypted[23:16]=encrypted[55:48];

//third row shifted two bytes right
decrypted[111:104]=encrypted[47:40];
decrypted[79:72]=encrypted[15:8];
decrypted[47:40]=encrypted[111:104];
decrypted[15:8]=encrypted[79:72];

//fourth row shifted one byte left
decrypted[103:96]=encrypted[71:64];
decrypted[71:64]=encrypted[39:32];
decrypted[39:32]=encrypted[7:0];
decrypted[7:0]=encrypted[103:96];
end
endmodule