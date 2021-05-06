// -------------------------------------------------------------
// FPGA Top LEvel - 8KHz Frequency Channel
// -------------------------------------------------------------

`timescale 1 us / 1 us

module FPGA_Top_Level
		(
		  clk,
		  clk_sinus,
		  reset,
		  clk_enable,
		  top_level_input,
		  top_level_output
		);
		 
		  
		  // Define Input and Output Variables
		  
		 input                 clk;
		 input                 clk_sinus;
		 input                 reset;
		 input                 clk_enable;
		 input         [31:0]  top_level_input;
		 output        [15:0]  top_level_output;
		 
		 // Internal Variables
		 
		 wire signed   [31:0]  filter_out;
		 wire          [31:0]  sinus;
		 wire          [31:0]  cosinus;
		 wire          [95:0]  sum_out;
		 wire          [127:0] sub_out;
		 
		 
		 // Instantiate The Filter
		 Bandpass_Filter_8KHz u_Bandpass_Filter_8KHz
       (
			  .clk(clk),
			  .reset(reset),
           .clk_enable(clk_enable),
           .filter_input(top_level_input),
			  .ce_out(filter_ce_out),
           .filter_output(filter_out)
		 );
			  
			 
			  
   // Instantiate the Delay Phase Adapter IQ Demodulator
   Delay_Phase_Adapter_Demodulator_8KHz u_Delay_Phase_Adapter_Demodulator_8KHz
       (
		     .clk(clk),
           .reset(reset),
           .clk_enable(clk_enable),
			  .clk_sinus(clk_sinus),
           .demodulator_input(filter_out),
           .ce_out(filter_ce_out),
           .subtraction_demodulator_output(sum_out),
			  .addition_demodulator_output(sub_out)
		 );
			  
	// Instantiate the Demodulation Post Processing Module
	Demodulation_Post_Processing u_Demodulation_Post_Processing
		 (
		     .post_processing_input_1(sum_out),
			  .post_processing_input_2(sub_out),
			  .post_processing_output(top_level_output)
		 );

			  
endmodule 	