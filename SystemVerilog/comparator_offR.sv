////////////////////////////////////////////////////////////////////////////
// Company:         Oregon State University
// Engineer:        Matthew Walker, Silas Waxter
//
// Create date:     05/20/2022
// Design name:     keyboard_controlled_sprite
// Module name:     comparator_offR
// Target devices:  DE10Lite
// Tool versions:   Quartus Prime Lite Edition 18.0
// Description:     Checks to see wether a is within the parameter bound M and the changing offcount.
// 
////////////////////////////////////////////////////////////////////////////

module comparator_offR #(parameter N = 10, M = 10)
                        (input  logic [N-1:0] a, offcount,
                         output logic offset);
						  
  assign offset  = ((a >= offcount) && (a < (M+offcount)));
endmodule
