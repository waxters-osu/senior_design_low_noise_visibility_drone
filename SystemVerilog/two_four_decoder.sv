////////////////////////////////////////////////////////////////////////////
// Company:         Oregon State University
// Engineer:        Matthew Walker, Silas Waxter
//
// Create date:     05/20/2022
// Design name:     keyboard_controlled_sprite
// Module name:     two_four_decoder
// Target devices:  DE10Lite
// Tool versions:   Quartus Prime Lite Edition 18.0
// Description:     Converts 2-bit value to 4 bit value to allow for larger range of color.
// 
////////////////////////////////////////////////////////////////////////////

module two_four_decoder (input  logic [1:0] data,
                         output logic [3:0] encoding);

  always_comb
    case(data)
      2'b00: encoding = 4'b0000; 
      2'b01: encoding = 4'b0101; 
      2'b10: encoding = 4'b1010; 
      2'b11: encoding = 4'b1111;  
      default: encoding = 4'b0000; 
    endcase
endmodule
