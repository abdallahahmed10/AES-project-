module subbytes(state_reg, subByte_reg);
input [127:0] state_reg;
output reg [127:0] subByte_reg;
integer i=0;
reg [7:0] current;
reg [7:0] next;


always@(*) begin
      for (i=0; i<128 ; i=i+8) begin
          current=state_reg[i+:8];
			 next=
			 (current==8'h00)? 8'h63:
			 (current==8'h01)? 8'h7c:
			 (current==8'h02)? 8'h77:
			 (current==8'h03)? 8'h7b:
			 (current==8'h04)? 8'hf2:
			 (current==8'h05)? 8'h6b:
			 (current==8'h06)? 8'h6f:
			 (current==8'h07)? 8'hc5:
			 (current==8'h08)? 8'h30:
			 (current==8'h09)? 8'h01:
			 (current==8'h0a)? 8'h67:
			 (current==8'h0b)? 8'h2b:
			 (current==8'h0c)? 8'hfe:
			 (current==8'h0d)? 8'hd7:
			 (current==8'h0e)? 8'hab:
			 (current==8'h0f)? 8'h76:
			 
			 (current==8'h10)? 8'hca:
			 (current==8'h11)? 8'h82:
			 (current==8'h12)? 8'hc9:
			 (current==8'h13)? 8'h7d:
			 (current==8'h14)? 8'hfa:
			 (current==8'h15)? 8'h59:
			 (current==8'h16)? 8'h47:
			 (current==8'h17)? 8'hf0:
			 (current==8'h18)? 8'had:
			 (current==8'h19)? 8'hd4:
			 (current==8'h1a)? 8'ha2:
			 (current==8'h1b)? 8'haf:
			 (current==8'h1c)? 8'h9c:
			 (current==8'h1d)? 8'ha4:
			 (current==8'h1e)? 8'h72:
			 (current==8'h1f)? 8'hc0:
			 
			 (current==8'h20)? 8'hb7:
			 (current==8'h21)? 8'hfd:
			 (current==8'h22)? 8'h93:
			 (current==8'h23)? 8'h26:
			 (current==8'h24)? 8'h36:
			 (current==8'h25)? 8'h3f:
			 (current==8'h26)? 8'hf7:
			 (current==8'h27)? 8'hcc:
			 (current==8'h28)? 8'h34:
			 (current==8'h29)? 8'ha5:
			 (current==8'h2a)? 8'he5:
			 (current==8'h2b)? 8'hf1:
			 (current==8'h2c)? 8'h71:
			 (current==8'h2d)? 8'hd8:
			 (current==8'h2e)? 8'h31:
			 (current==8'h2f)? 8'h15:
			 
			 (current==8'h30)? 8'h04:
			 (current==8'h31)? 8'hc7:
			 (current==8'h32)? 8'h23:
			 (current==8'h33)? 8'hc3:
			 (current==8'h34)? 8'h18:
			 (current==8'h35)? 8'h96:
			 (current==8'h36)? 8'h05:
			 (current==8'h37)? 8'h9a:
			 (current==8'h38)? 8'h07:
			 (current==8'h39)? 8'h12:
			 (current==8'h3a)? 8'h80:
			 (current==8'h3b)? 8'he2:
			 (current==8'h3c)? 8'heb:
			 (current==8'h3d)? 8'h27:
			 (current==8'h3e)? 8'hb2:
			 (current==8'h3f)? 8'h75:
			 
			 (current==8'h40)? 8'h09:
			 (current==8'h41)? 8'h83:
			 (current==8'h42)? 8'h2c:
			 (current==8'h43)? 8'h1a:
			 (current==8'h44)? 8'h1b:
			 (current==8'h45)? 8'h6e:
			 (current==8'h46)? 8'h5a:
			 (current==8'h47)? 8'ha0:
			 (current==8'h48)? 8'h52:
			 (current==8'h49)? 8'h3b:
			 (current==8'h4a)? 8'hd6:
			 (current==8'h4b)? 8'hb3:
			 (current==8'h4c)? 8'h29:
			 (current==8'h4d)? 8'he3:
			 (current==8'h4e)? 8'h2f:
			 (current==8'h4f)? 8'h84:
			 
			 (current==8'h50)? 8'h53:
			 (current==8'h51)? 8'hd1:
			 (current==8'h52)? 8'h00:
			 (current==8'h53)? 8'hed:
			 (current==8'h54)? 8'h20:
			 (current==8'h55)? 8'hfc:
			 (current==8'h56)? 8'hb1:
			 (current==8'h57)? 8'h5b:
			 (current==8'h58)? 8'h6a:
			 (current==8'h59)? 8'hcb:
			 (current==8'h5a)? 8'hbe:
			 (current==8'h5b)? 8'h39:
			 (current==8'h5c)? 8'h4a:
			 (current==8'h5d)? 8'h4c:
			 (current==8'h5e)? 8'h58:
			 (current==8'h5f)? 8'hcf:
			 
			 (current==8'h60)? 8'hd0:
			 (current==8'h61)? 8'hef:
			 (current==8'h62)? 8'haa:
			 (current==8'h63)? 8'hfb:
			 (current==8'h64)? 8'h43:
			 (current==8'h65)? 8'h4d:
			 (current==8'h66)? 8'h33:
			 (current==8'h67)? 8'h85:
			 (current==8'h68)? 8'h45:
			 (current==8'h69)? 8'hf9:
			 (current==8'h6a)? 8'h02:
			 (current==8'h6b)? 8'h7f:
			 (current==8'h6c)? 8'h50:
			 (current==8'h6d)? 8'h3c:
			 (current==8'h6e)? 8'h9f:
			 (current==8'h6f)? 8'ha8:
			 
			 (current==8'h70)? 8'h51:
			 (current==8'h71)? 8'ha3:
			 (current==8'h72)? 8'h40:
			 (current==8'h73)? 8'h8f:
			 (current==8'h74)? 8'h92:
			 (current==8'h75)? 8'h9d:
			 (current==8'h76)? 8'h38:
			 (current==8'h77)? 8'hf5:
			 (current==8'h78)? 8'hbc:
			 (current==8'h79)? 8'hb6:
			 (current==8'h7a)? 8'hda:
			 (current==8'h7b)? 8'h21:
			 (current==8'h7c)? 8'h10:
			 (current==8'h7d)? 8'hff:
			 (current==8'h7e)? 8'hf3:
			 (current==8'h7f)? 8'hd2:
			 
			 (current==8'h80)? 8'hcd:
			 (current==8'h81)? 8'h0c:
			 (current==8'h82)? 8'h13:
			 (current==8'h83)? 8'hec:
			 (current==8'h84)? 8'h5f:
			 (current==8'h85)? 8'h97:
			 (current==8'h86)? 8'h44:
			 (current==8'h87)? 8'h17:
			 (current==8'h88)? 8'hc4:
			 (current==8'h89)? 8'ha7:
			 (current==8'h8a)? 8'h7e:
			 (current==8'h8b)? 8'h3d:
			 (current==8'h8c)? 8'h64:
			 (current==8'h8d)? 8'h5d:
			 (current==8'h8e)? 8'h19:
			 (current==8'h8f)? 8'h73:
			 
			 (current==8'h90)? 8'h60:
			 (current==8'h91)? 8'h81:
			 (current==8'h92)? 8'h4f:
			 (current==8'h93)? 8'hdc:
			 (current==8'h94)? 8'h22:
			 (current==8'h95)? 8'h2a:
			 (current==8'h96)? 8'h90:
			 (current==8'h97)? 8'h88:
			 (current==8'h98)? 8'h46:
			 (current==8'h99)? 8'hee:
			 (current==8'h9a)? 8'hb8:
			 (current==8'h9b)? 8'h14:
			 (current==8'h9c)? 8'hde:
			 (current==8'h9d)? 8'h5e:
			 (current==8'h9e)? 8'h0b:
			 (current==8'h9f)? 8'hdb:
			 
			 (current==8'ha0)? 8'he0:
			 (current==8'ha1)? 8'h32:
			 (current==8'ha2)? 8'h3a:
			 (current==8'ha3)? 8'h0a:
			 (current==8'ha4)? 8'h49:
			 (current==8'ha5)? 8'h06:
			 (current==8'ha6)? 8'h24:
			 (current==8'ha7)? 8'h5c:
			 (current==8'ha8)? 8'hc2:
			 (current==8'ha9)? 8'hd3:
			 (current==8'haa)? 8'hac:
			 (current==8'hab)? 8'h62:
			 (current==8'hac)? 8'h91:
			 (current==8'had)? 8'h95:
			 (current==8'hae)? 8'he4:
			 (current==8'haf)? 8'h79:
			 
			 (current==8'hb0)? 8'he7:
			 (current==8'hb1)? 8'hc8:
			 (current==8'hb2)? 8'h37:
			 (current==8'hb3)? 8'h6d:
			 (current==8'hb4)? 8'h8d:
			 (current==8'hb5)? 8'hd5:
			 (current==8'hb6)? 8'h4e:
			 (current==8'hb7)? 8'ha9:
			 (current==8'hb8)? 8'h6c:
			 (current==8'hb9)? 8'h56:
			 (current==8'hba)? 8'hf4:
			 (current==8'hbb)? 8'hea:
			 (current==8'hbc)? 8'h65:
			 (current==8'hbd)? 8'h7a:
			 (current==8'hbe)? 8'hae:
			 (current==8'hbf)? 8'h08:
			 
			 (current==8'hc0)? 8'hba:
			 (current==8'hc1)? 8'h78:
			 (current==8'hc2)? 8'h25:
			 (current==8'hc3)? 8'h2e:
			 (current==8'hc4)? 8'h1c:
			 (current==8'hc5)? 8'ha6:
			 (current==8'hc6)? 8'hb4:
			 (current==8'hc7)? 8'hc6:
			 (current==8'hc8)? 8'he8:
			 (current==8'hc9)? 8'hdd:
			 (current==8'hca)? 8'h74:
			 (current==8'hcb)? 8'h1f:
			 (current==8'hcc)? 8'h4b:
			 (current==8'hcd)? 8'hbd:
			 (current==8'hce)? 8'h8b:
			 (current==8'hcf)? 8'h8a:
			 
			 (current==8'hd0)? 8'h70:
			 (current==8'hd1)? 8'h3e:
			 (current==8'hd2)? 8'hb5:
			 (current==8'hd3)? 8'h66:
			 (current==8'hd4)? 8'h48:
			 (current==8'hd5)? 8'h03:
			 (current==8'hd6)? 8'hf6:
			 (current==8'hd7)? 8'h0e:
			 (current==8'hd8)? 8'h61:
			 (current==8'hd9)? 8'h35:
			 (current==8'hda)? 8'h57:
			 (current==8'hdb)? 8'hb9:
			 (current==8'hdc)? 8'h86:
			 (current==8'hdd)? 8'hc1:
			 (current==8'hde)? 8'h1d:
			 (current==8'hdf)? 8'h9e:
			 
			 (current==8'he0)? 8'he1:
			 (current==8'he1)? 8'hf8:
			 (current==8'he2)? 8'h98:
			 (current==8'he3)? 8'h11:
			 (current==8'he4)? 8'h69:
			 (current==8'he5)? 8'hd9:
			 (current==8'he6)? 8'h8e:
			 (current==8'he7)? 8'h94:
			 (current==8'he8)? 8'h9b:
			 (current==8'he9)? 8'h1e:
			 (current==8'hea)? 8'h87:
			 (current==8'heb)? 8'he9:
			 (current==8'hec)? 8'hce:
			 (current==8'hed)? 8'h55:
			 (current==8'hee)? 8'h28:
			 (current==8'hef)? 8'hdf:
			 
			 (current==8'hf0)? 8'h8c:
			 (current==8'hf1)? 8'ha1:
			 (current==8'hf2)? 8'h89:
			 (current==8'hf3)? 8'h0d:
			 (current==8'hf4)? 8'hbf:
			 (current==8'hf5)? 8'he6:
			 (current==8'hf6)? 8'h42:
			 (current==8'hf7)? 8'h68:
			 (current==8'hf8)? 8'h41:
			 (current==8'hf9)? 8'h99:
			 (current==8'hfa)? 8'h2d:
			 (current==8'hfb)? 8'h0f:
			 (current==8'hfc)? 8'hb0:
			 (current==8'hfd)? 8'h54:
			 (current==8'hfe)? 8'hbb:
			 (current==8'hff)? 8'h16: 8'hx;
			 subByte_reg[i+:8]=next;
			 end
end			 
			 
endmodule
