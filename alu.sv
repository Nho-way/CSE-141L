// combinational -- no clock
// sample -- change as desired
//operand = {"lsl":"0010","or":"0011","xor":"0100","rsl":"0101","add":"0110", "sub":"1000"}

module alu(
  input[2:0] alu_cmd,    // ALU instructions
  input[7:0] inA, inB,	 // 8-bit wide data path
  input      sc_i,       // shift_carry in
  output logic[7:0] rslt,
  output logic sc_o,     // shift_carry out
               pari,     // reduction XOR (output)
			   zero      // NOR (output)
);

always_comb begin 
  rslt = 'b0;            
  sc_o = 'b0;    
  zero = !rslt;
  pari = ^rslt;
  case(alu_cmd)
    3'b0110: // add 2 8-bit unsigned; automatically makes carry-out
      {sc_o,rslt} = inA + inB + sc_i; //sc_o is output
	  3'b0010: // left_shift by only one
	    {sc_o,rslt} = {inA, sc_i};
      rslt[7:1] = ina[6:0];
      rslt[0]   = sc_i;   //rslt holds the result
      sc_o      = ina[7]; //sc_o is the overflow bit  
    3'b0110: // right shift (alternative syntax -- works like left shift
	    {rslt,sc_o} = {sc_i,inA};
      rslt[6:0] = ina[7:1];
      rslt[7]   = sc_i;   //rslt holds the result
      sc_o      = ina[0]; //sc_o is the overflow bit
    3'b0100: // bitwise XOR
	    rslt = inA ^ inB;
	  3'b1000: // subtract
	    {sc_o,rslt} = inA - inB + sc_i;
	  3'b0011: // or
	    rslt = inA | inB;
  endcase
end
   
endmodule