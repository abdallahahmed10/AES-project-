module Logic2Project(flag,plainRegister,keyRegister,resultRegister),;
//module Logic2Project (plain,key,result);
	
	//input [127:0] plain;
	//input [127:0] key;
	//output [127:0] result;
	output flag;
	wire [127:0] keys [9:0];
	wire [127:0] encrypted;
	wire [127:0] decrypted;
	input [127:0] plainRegister;
	//input [127:0] keyRegister;
	output [127:0] resultRegister;
	reg flagRegister;
	
	
	KeyExpansion module1 (.key(key),.keys(keys))
	
	encryption module2 (.plain(plainRegister),.keys(keys),.encrypted(encrypted));
	
	decryption module3 (.encrypted(encrypted),.keys(keys),.decrypted(decrypted));
	
	
	always @(*) begin 
		plainRegister <= //TODO: add test case from documentation, Note: Use _ for readability
		keyRegister <= //TODO: add test case from documentation, Note: Use _ for readability
		resultRegister <= decrypted
		
		//TODO: add some signals that turn on encryption and decryption
		
		if (plainRegister [0] == resultRegister[0]) begin
		flagRegister <= 1'b1;
		end
	end
	
	assign flag = flagRegister;
	
  

endmodule

module encryption (plain,keys,encrypted);
 input [127:0] plain;
 input [127:0] keys [9:0];
 //input [1279:0] keys;
 output [127:0] encrypted;
 reg [127:0] state;
 reg [127:0] key;
 integer counter = 0;
 wire [127:0] AddRowsOut;
 wire [127:0] MixColumnsOut;
 wire [127:0] SubBytesOut;
 wire [127:0] AddRoundKeyOut;
 wire [127:0] keyBuffer;
 

 
 shiftrows module1 (.state(state),.out(AddRowsOut));
 MixColumns module2 (.state(state),.out(MixColumnsOut));
 subbytes module3 (.state(state),.out(SubBytesOut));
 addRoundKey module4 (.state(state),.key(key),.out(AddRoundKeyOut));
	
 
 always @(*) begin 
 //TODO: this shouldnt be initial, it should somehow be an always but I'm not sure how to implement it
 
	state <= plain;
	for (counter = 0; i < 9;i = i + 1) begin 
	key <= keys[i];
	//key <= keys[(i*128)+ 127:(i*128)]
	state <= SubBytesOut;
	state <= AddRowsOut;
	state <= MixColumnsOut;
	state <= AddRoundKeyOut;
	end
	
	key <= keys[9];
	//key <= keys[(9*128)+ 127:(9*128)]
	
	state <= SubBytesOut;
	state <= AddRowsOut;
	state <= AddRoundKeyOut;
	
 end
 
 
 assign encrypted = state;
 assign keyBuffer = key;
 

endmodule


module decryption (encrypted,keys,decrypted);
 input [127:0] encrypted;
 input [127:0] keys [9:0];
 //input [1279:0] keys;
 output [127:0] decrypted;
 reg [127:0] state;
 reg [127:0] key;
 integer counter = 0;
 wire [127:0] InverseAddRowsOut;
 wire [127:0] InverseMixColumnsOut;
 wire [127:0] InverseSubBytesOut;
 wire [127:0] InverseAddRoundKeyOut;
 wire [127:0] keyBuffer;
 

 
 shiftrowsdec module1 (.state(state),.out(InverseAddRowsOut));
 InvMixColumns module2 (.state(state),.out(InverseMixColumnsOut));
 invsubbytes module3 (.state(state),.out(InverseSubBytesOut));
 invRound module4 (.state(state),.key(key),.out(InverseAddRoundKeyOut));
	
 
 always @(*) begin 
	//TODO: this shouldnt be initial, it should somehow be an always but I'm not sure how to implement it
 
	state <= encrypted;
	for (counter = 0; i < 9;i = i + 1) begin 
	key <= keys[i];
	//key <= keys[(i*128)+ 127:(i*128)]
	state <= InverseSubBytesOut;
	state <= InverseAddRowsOut;
	state <= InverseMixColumnsOut;
	state <= InverseAddRoundKeyOut;
	end
	
	key <= keys[9];
	//key <= keys[(9*128)+ 127:(9*128)]
	
	state <= InverseSubBytesOut;
	state <= InverseAddRowsOut;
	state <= InverseAddRoundKeyOut;
	
 end
 
 
 assign decrypted = state;
 assign keyBuffer = key;
 

endmodule

