module shiftrowsdec_tb();

reg [127:0] state ;

wire [127:0] out;
 

shiftrowsdec srdec (
 .encrypted(state),
 .decrypted(out)
);



 
initial begin

	state= 128'h546E6E6F4F6977204E546F2020776565;
	
	#10 $finish;

end 

endmodule
