module InvMixColumns(
    output wire [0:127] out,
    input wire [0:127] in
);

wire [0:127] temp;
// Column 0
assign temp[120:127] = xtime11(in[96:103])^xtime13(in[104:111])^xtimes9(in[112:119])^xtime14(in[120:127]);
assign temp[88:95] = xtime11(in[64:71])^xtime13(in[72:79])^xtimes9(in[80:87])^xtime14(in[88:95]);
assign temp[56:63] = xtime11(in[32:39])^xtime13(in[40:47])^xtimes9(in[48:55])^xtime14(in[56:63]);
assign temp[24:31] = xtime11(in[0:7])^xtime13(in[8:15])^xtimes9(in[16:23])^xtime14(in[24:31]);

// Column 1
assign temp[112:119] = xtime13(in[96:103])^xtimes9(in[104:111])^xtime14(in[112:119])^xtime11(in[120:127]);
assign temp[80:87] = xtime13(in[64:71])^xtimes9(in[72:79])^xtime14(in[80:87])^xtime11(in[88:95]);
assign temp[48:55] = xtime13(in[32:39])^xtimes9(in[40:47])^xtime14(in[48:55])^xtime11(in[56:63]);
assign temp[16:23] = xtime13(in[0:7])^xtimes9(in[8:15])^xtime14(in[16:23])^xtime11(in[24:31]);

// Column 2
assign temp[104:111] = xtimes9(in[96:103])^xtime14(in[104:111])^xtime11(in[112:119])^xtime13(in[120:127]);
assign temp[72:79] = xtimes9(in[64:71])^xtime14(in[72:79])^xtime11(in[80:87])^xtime13(in[88:95]);
assign temp[40:47] = xtimes9(in[32:39])^xtime14(in[40:47])^xtime11(in[48:55])^xtime13(in[56:63]);
assign temp[8:15] = xtimes9(in[0:7])^xtime14(in[8:15])^xtime11(in[16:23])^xtime13(in[24:31]);

// Column 3
assign temp[96:103] = xtime14(in[96:103])^xtime11(in[104:111])^xtime13(in[112:119])^xtimes9(in[120:127]);
assign temp[64:71] = xtime14(in[64:71])^xtime11(in[72:79])^xtime13(in[80:87])^xtimes9(in[88:95]);
assign temp[32:39] = xtime14(in[32:39])^xtime11(in[40:47])^xtime13(in[48:55])^xtimes9(in[56:63]);
assign temp[0:7] = xtime14(in[0:7])^xtime11(in[8:15])^xtime13(in[16:23])^xtimes9(in[24:31]);


assign out = temp;

// all xtimes functions needed generated from the x2 function
// xtimes2 function multiplies the input by 2 from MixColumn module
function [7:0] xtimes2;
    input [7:0] x;
    begin 
        if(x[7] == 1)
            xtimes2 = ((x << 1) ^ 8'h1b);
        else 
            xtimes2 = x << 1; 
    end     
endfunction

// xtimes9 function multiplies the input by 9  
function [7:0] xtimes9;
    input [7:0] y;
    begin 
        xtimes9 = (xtimes2(xtimes2(xtimes2(y)))) ^ y;
    end     
endfunction

// xtime11 function multiplies the input by 11  
function [7:0] xtime11;
    input [7:0] z;
    begin 
        xtime11 =(xtimes2( ( xtimes2(xtimes2(z)) ) ^ z)) ^ z;
    end     
endfunction

// xtime13 function multiplies the input by 13  
function [7:0] xtime13;
    input [7:0] k;
    begin 
        xtime13 = (xtimes2(xtimes2(xtimes2(k)^k)))^k;
    end     
endfunction

// xtime14 function multiplies the input by 14  
function [7:0] xtime14;
    input [7:0] l;
    begin 
        xtime14 = xtimes2(xtimes2((xtimes2(l)^l))^l);
    end     
endfunction

endmodule