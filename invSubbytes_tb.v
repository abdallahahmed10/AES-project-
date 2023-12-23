module decSubBytes_tb();

reg [127:0] en ;

wire [127:0] dec;
 

decSubBytes s (
 .en_reg(en),
 .dec_reg(dec)
);


 
initial begin

	en= 128'h637c777bf26b6fc53001672bfed7ab76;
	
	#10
	
	en= 128'hb7fd9326363ff7cc34a5e5f171d83115;
	
	#20 $finish;


end 

endmodule
