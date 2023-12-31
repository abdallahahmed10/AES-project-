module MixColumns(
    input [127:0] in,
    output reg [127:0] out
);

    always @(*) begin
        // Column 0
        out[127:120] = xtimes2(in[127:120]) ^ xtimes2(in[119:112]) ^ in[119:112] ^ in[111:104] ^ in[103:96];
        out[95:88]   = xtimes2(in[95:88]) ^ xtimes2(in[87:80]) ^ in[87:80] ^ in[79:72] ^ in[71:64];
        out[63:56]   = xtimes2(in[63:56]) ^ xtimes2(in[55:48]) ^ in[55:48] ^ in[47:40] ^ in[39:32];
        out[31:24]   = xtimes2(in[31:24]) ^ xtimes2(in[23:16]) ^ in[23:16] ^ in[15:8] ^ in[7:0];

        // Column 1
        out[119:112] = in[127:120] ^ xtimes2(in[119:112]) ^ xtimes2(in[111:104]) ^ (in[111:104]) ^ in[103:96];
        out[87:80]   = in[95:88] ^ xtimes2(in[87:80]) ^ xtimes2(in[79:72]) ^ (in[79:72]) ^ in[71:64];
        out[55:48]   = in[63:56] ^ xtimes2(in[55:48]) ^ xtimes2(in[47:40]) ^ (in[47:40]) ^ in[39:32];
        out[23:16]   = in[31:24] ^ xtimes2(in[23:16]) ^ xtimes2(in[15:8]) ^ (in[15:8]) ^ in[7:0];

        // Column 2
        out[111:104] = in[127:120] ^ in[119:112] ^ xtimes2(in[111:104]) ^ xtimes2(in[103:96]) ^ in[103:96];
        out[79:72]   = in[95:88] ^ in[87:80] ^ xtimes2(in[79:72]) ^ xtimes2(in[71:64]) ^ in[71:64];
        out[47:40]   = in[63:56] ^ in[55:48] ^ xtimes2(in[47:40]) ^ xtimes2(in[39:32]) ^ in[39:32];
        out[15:8]    = in[31:24] ^ in[23:16] ^ xtimes2(in[15:8]) ^ xtimes2(in[7:0]) ^ in[7:0];

        // Column 3
        out[103:96] = xtimes2(in[127:120]) ^ in[127:120] ^ in[119:112] ^ in[111:104] ^ xtimes2(in[103:96]);
        out[71:64]  = xtimes2(in[95:88]) ^ in[95:88] ^ in[87:80] ^ in[79:72] ^ xtimes2(in[71:64]);
        out[39:32]  = xtimes2(in[63:56]) ^ in[63:56] ^ in[55:48] ^ in[47:40] ^ xtimes2(in[39:32]);
        out[7:0]    = xtimes2(in[31:24]) ^ in[31:24] ^ in[23:16] ^ in[15:8] ^ xtimes2(in[7:0]);
    end

    // Functions
    function [7:0] xtimes2;
        input [7:0] x;
        begin
            if (x[7] == 1)
                xtimes2 = ((x << 1) ^ 8'h1b);
            else
                xtimes2 = x << 1;
        end
    endfunction

endmodule