module shiftrows(
input [127:0] state,
output reg [127:0] shiftrow
);

always@(*) begin
//first row not shifted
shiftrow[127:120]=state[127:120];
shiftrow[95:88]=state[95:88];
shiftrow[63:56]=state[63:56];
shiftrow[31:24]=state[31:24];

//second row shifted one byte left
shiftrow[119:112]=state[87:80];
shiftrow[87:80]=state[55:48];
shiftrow[55:48]=state[23:16];
shiftrow[23:16]=state[119:112];

//third row shifted two bytes left
shiftrow[111:104]=state[47:40];
shiftrow[79:72]=state[15:8];
shiftrow[47:40]=state[111:104];
shiftrow[15:8]=state[79:72];

//fourth row shifted three bytes left
shiftrow[103:96]=state[7:0];
shiftrow[71:64]=state[103:96];
shiftrow[39:32]=state[71:64];
shiftrow[7:0]=state[39:32];
end
endmodule