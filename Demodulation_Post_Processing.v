// -----------------------------------------------------------------------------------------------------------------
// Post-Processing of the Delay Phase Adapter Demodulation Outputs
//
// This block applied a division, arctangent function and finally and gain to produce the final demodulation result
// -----------------------------------------------------------------------------------------------------------------

`timescale 1 us / 1 us

module Demodulation_Post_Processing
          (
			   post_processing_input_1,
            post_processing_input_2,
            post_processing_output
			 );

  // Define Input and Output Variables
  input   signed [95:0]  post_processing_input_1;
  input   signed [127:0] post_processing_input_2;
  output         [15:0]  post_processing_output;

  // Define All Internal Module Variables
  wire [31:0] post_proc_floating_point_input_1;
  wire [31:0] final_gain_constant;
  wire [31:0] post_proc_floating_point_input_2;
  wire [31:0] division_output;
  wire [31:0] arctan_out;
  wire [31:0] final_gain_output;
  wire [15:0] half_prec_gain_output;

  
  // Main Module Code - Demodulation Post Processing Code
  
  // Instantiate Module to convert post processing input 1 from N96.Q79 singed fixed point to single precision floating point  
  nfp_convert_sfix_96_En79_to_single u_N96Q79_Signed_Fixed_Point_To_Single_Floating_Point 
         (
			  .nfp_in(post_processing_input_1),
           .nfp_out(post_proc_floating_point_input_1)
         );
			
			
  // Assignment of the final gain constant
  assign final_gain_constant = 32'h43953530; // Constant Equal to 7.5/((0.000004)*(pi*2000))


  // Instantiate Module to convert post processing input 2 from N128.Q110 signed fixed point to single precision floation point
  nfp_convert_sfix_128_En110_to_single u_N128Q110_Signed_Fixed_Point_To_Single_Floating_Point 
         (
			  .nfp_in(post_processing_input_2),
           .nfp_out(post_proc_floating_point_input_2)
         );
			
			
  // Instantiate Module to divide the two post processing inputs 
  //This equates to a division of the demodulation subtraction output with the demodulation addition output
  nfp_div_single u_floating_point_division 
         (
			  .nfp_in1(post_proc_floating_point_input_1),
           .nfp_in2(post_proc_floating_point_input_2),
           .nfp_out(division_output)
         );

  // Instantiate Module to compute an arctangent function of the division output			
  nfp_atan_single u_floating_point_arctan 
         (
			  .nfp_in(division_output),
           .nfp_out(arctan_out)
         );

  // Instantiate Module to multiply the arctan output with the final gain constant			
  nfp_mul_single u_floating_point_multiplication 
         (
			  .nfp_in1(final_gain_constant),
           .nfp_in2(arctan_out),
           .nfp_out(final_gain_output)
         );
			
  // Convert the output from single precision to half precision to reduce I/O count
  Convert_Single2Half u_Single_float_to_Half_float 
         (
			  .nfp_in(final_gain_output),  // single
           .nfp_out(half_prec_gain_output)  // half
         );
			
  // Assign multiplication output the module output
  assign post_processing_output = half_prec_gain_output;
  
  

endmodule  // Demodulation_Post_Processing

