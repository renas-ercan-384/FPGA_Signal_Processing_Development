// -------------------------------------------------------------
// Delay Phase Adapter IQ Demodulator Module -- 8KHz
// -------------------------------------------------------------

`timescale 1 us / 1 us

module Delay_Phase_Adapter_Demodulator_8KHz
         (
			  clk,
           reset,
           clk_enable,
           clk_sinus,
           demodulator_input,
           ce_out,
           subtraction_demodulator_output,
           addition_demodulator_output
			);

			
  // Define Input and Output Variables
  input                  clk;
  input                  reset;
  input                  clk_enable;
  input                  clk_sinus;
  input   signed [22:0]  demodulator_input;
  output                 ce_out;
  output  signed [95:0]  subtraction_demodulator_output;
  output  signed [127:0] addition_demodulator_output;


  // Define All Internal Module Variables
  
  wire                enb;
  
  wire        [31:0]  sinus;
  wire        [31:0]  cosinus;
  
  // Conversion of the Sine and Cosine waves from Single Floating Point to Fixed Point
  wire signed [31:0]  sinus_fixed_point;
  wire signed [31:0]  cosinus_fixed_point;

  // Baseband Version of the demodulator input
  //Sine and Cosine Mixed Input to bring the demodulator input down from the passband to baseband
  wire signed [63:0]  demodulator_input_baseband_sinus;
  wire signed [63:0]  demodulator_input_baseband_cosinus;
  
  // Multiplier outputs for the four multipliers
  wire signed [95:0]  multiplier_2_output;
  wire signed [95:0]  multiplier_3_output;
  wire signed [63:0]  multiplier_1_output;
  wire signed [127:0] multiplier_4_output;

  // Lowpass Filter Outputs for the Baseband Sinus and Cosinus
  wire signed [31:0]  sinus_LPF_output;  
  wire signed [31:0]  cosinus_LPF_output;  
  
  // Negative LPF output for cosinus
  wire signed [63:0]  negative_filtered_cosinus_output;

  
  // Delayed Filtered Variable for Sinus and Cosinus signals 
  reg  signed [31:0]  delayed_filtered_sinus;  
  reg  signed [63:0]  delayed_negative_filtered_cosinus;

  // Casting of the negative filtered cosinus output to prepare it for fixed point arithmetic
  wire signed [32:0]  cast_1_neg_filt_cosinus;
  wire signed [32:0]  cast_2_neg_filt_cosinus;
  
  // Subtraction Variable of the Multiplier 2 and Multiplier 3 Outputs
  wire signed [95:0]  mult_2_mult_3_subtraction;
  
  // Casting of the multiplier 1 and multiplier 4 addition output to prepare it for fixed point arithmetic
  wire signed [127:0] cast_mult_1_mult_4_addition;
  
  // Addition Variable of the Multiplier 1 and Multiplier 4 Outputs
  wire signed [127:0] mult_1_mult_4_addition;
  
  // Extended demodulator input by 10 bits to keep 32 bits in the demodulator
  wire signed [31:0] demodulator_input_extended;
  
  
  
  

  // Main Module Code - Delay Phase Adapter Demodulation Algorithm Code
  
  
  // Instantiate the Sine Wave Generator
	    Sine_Cosine_Generator_8KHz u_Sine_Cosine_Generator_8KHz
       (
			  .clk(clk_sinus),
           .sinus(sinus),
			  .cosinus(cosinus)
		 );
  

  // Extended demodulator input by 10 bits to keep 32 bits in the demodulator
  assign demodulator_input_extended = {demodulator_input, 10'b0000000000};
  
  // Convert The Floating Point Sine wave to fixed point Sine wave
  nfp_convert_single_to_sfix_32_En28 u_sinus_fp_to_fixp 
						(.nfp_in(sinus),
						 .nfp_out(sinus_fixed_point)
                  );
  
  // Convert The Floating Point Cosine wave to fixed point Cosine wave  
  nfp_convert_single_to_sfix_32_En28 u_cosinus_fp_to_fixp
						(.nfp_in(cosinus),
						 .nfp_out(cosinus_fixed_point)
                  );
  

  // Bring the Sine Demodulator Input down to Baseband
  assign demodulator_input_baseband_sinus = demodulator_input_extended * sinus_fixed_point;


  // Filter the Baseband Sine wave of frequencies higher than 8KHz
  Demod_Lowpass_Filter_8KHz u_Demod_Lowpass_Filter_8KHz 
         (
			 .clk(clk),
          .reset(reset),
          .clk_enable(clk_enable),
          .filter_input(demodulator_input_baseband_sinus),
          .filter_output(sinus_LPF_output)  
         );

  assign enb = clk_enable;

  // Delay the filtered sine wave by one clock cycle
  always @(posedge clk or posedge reset)
    begin : Delay1_process
      if (reset == 1'b1) begin
        delayed_filtered_sinus <= 32'sb00000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          delayed_filtered_sinus <= sinus_LPF_output;
        end
      end
    end


  // Bring the Cosine Demodulator Input down to Baseband
  assign demodulator_input_baseband_cosinus = cosinus_fixed_point *  demodulator_input_extended;


  // Filter the Baseband Cosine wave of frequencies higher than 8KHz
  Demod_Lowpass_Filter_8KHz u_Demod_Lowpass_Filter_8KHz_2 
         (
			 .clk(clk),
          .reset(reset),
          .clk_enable(clk_enable),
          .filter_input(demodulator_input_baseband_cosinus),
          .filter_output(cosinus_LPF_output)  
         );
			
  // Cast the inverted filtered cosine wave to prepare it for fixed point arithmetic
  assign cast_1_neg_filt_cosinus = {cosinus_LPF_output[31], cosinus_LPF_output};
  assign cast_2_neg_filt_cosinus =  - (cast_1_neg_filt_cosinus);
  
  // Invert the filtered cosine wave
  assign negative_filtered_cosinus_output = {cast_2_neg_filt_cosinus, 31'b0000000000000000000000000000000};


  // Multiplier 2 - Multiplication of the delayed filtered sine wave with the inverted filtered cosine wave
  assign multiplier_2_output = delayed_filtered_sinus * negative_filtered_cosinus_output;


  // Delay the filtered and inverted cosine wave by one clock cycle
  always @(posedge clk or posedge reset)
    begin : Delay_process
      if (reset == 1'b1) begin
        delayed_negative_filtered_cosinus <= 64'sh0000000000000000;
      end
      else begin
        if (enb) begin
          delayed_negative_filtered_cosinus <= negative_filtered_cosinus_output;
        end
      end
    end


  // Multiplier 3 - Multiplication of the filtered sine wave with the delayed inverted filtered cosine wave
  assign multiplier_3_output = sinus_LPF_output * delayed_negative_filtered_cosinus;


  // Subtraction of the multiplier 2 output with the multiplier 3 output
  assign mult_2_mult_3_subtraction = multiplier_2_output - multiplier_3_output;


  // Assignment of the subtraction output as a output of the demodulator
  assign subtraction_demodulator_output = mult_2_mult_3_subtraction;
  
  // Multiplier 1 - Multiplication of the filtered sine wave with the delayed filtered sine wave
  assign multiplier_1_output = sinus_LPF_output * delayed_filtered_sinus;


  // Multiplier 4 - Multiplication of the delayed inverted filtered cosine wave with the inverted filtered cosine wave
  assign multiplier_4_output = delayed_negative_filtered_cosinus * negative_filtered_cosinus_output;


  // Casting of the multiplier 1 and multiplier 4 outputs to prepare for fixed point arithmetic
  assign cast_mult_1_mult_4_addition = {{2{multiplier_1_output[63]}}, {multiplier_1_output, 
                                         62'b00000000000000000000000000000000000000000000000000000000000000}};
  // Addition of the multiplication 1 and multiplication 4 outputs
  assign mult_1_mult_4_addition = cast_mult_1_mult_4_addition + multiplier_4_output;


  // Assignment of the addition output as a output of the demodulator
  assign addition_demodulator_output = mult_1_mult_4_addition;

  assign ce_out = clk_enable;
  

endmodule  // Delay_Phase_Adapter_Demodulator_8KHz

