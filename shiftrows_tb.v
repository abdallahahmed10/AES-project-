module shiftrows_tb();

reg [127:0] state ;

wire [127:0] out;
 

shiftrows sr (
 .state(state),
 .shiftrow(out)
);



 
initial begin

	state= 128'h54776F204F6E65204E696E652054776F;
	
	#10
	
	state= 128'hBA75F47A84A48D32E88D060E1B407D5D;
	
	#20 $finish;


end 

endmodule
