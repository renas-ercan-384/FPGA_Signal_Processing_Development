// -------------------------------------------------------------
// Demodulation Module Lowpass Filter
// -------------------------------------------------------------

`timescale 1 us / 1 us

module Demod_Lowpass_Filter_8KHz
          (
			  clk,
           reset,
           clk_enable,
           filter_input,
           ce_out,
           filter_output
			 );

  // Define Input and Output Variables
  input   clk;
  input   reset;
  input   clk_enable;
  input   signed [63:0] filter_input;
  output  ce_out;
  output  signed [31:0] filter_output;

  
  // Define All Internal Module Variables

  wire enb;
  
  // Casting of the filter input variable
  wire signed [31:0] filter_input_cast;
  
  // Casting of the stage 1 output variable
  wire signed [31:0] stage_1_output_cast;

  // Gain 1 Temporary Variable
  wire signed [63:0] gain_1_stage_1_temp;
  wire signed [63:0] gain_1_stage_2_temp;

  // Gain 1 Output - Output from the multiplication of the stage input and the first gain constant
  wire signed [31:0] gain_1_stage_1;  
  wire signed [31:0] gain_1_stage_2;  

  // Delay Variables - Outputs from the 2 clock cycle delay line
  reg  signed [31:0] delay_1_stage_1; 
  reg  signed [31:0] delay_1_stage_2; 
  reg  signed [31:0] delay_2_stage_1; 
  reg  signed [31:0] delay_2_stage_2; 

  // Gain 3 Output - Output from the multiplication of the third gain constant and second delay line output
  wire signed [63:0] gain_3_stage_1;  
  wire signed [63:0] gain_3_stage_2;  

  // Casted version of the second subtraction output - Input into the delay line and first addition
  wire signed [31:0] delay_line_input_stage_1; 
  wire signed [31:0] delay_line_input_stage_2; 

  // Gain 2 Output - Output from the multiplication of the second gain constant and the first delay line output
  wire signed [63:0] gain_2_stage_1;  
  wire signed [63:0] gain_2_stage_2;  

  // Casting of the first subtraction output into required fixed point format  
  wire signed [39:0] subtraction_1_cast_1_stage_1; 
  wire signed [39:0] subtraction_1_cast_2_stage_1; 
  wire signed [39:0] subtraction_1_cast_1_stage_2;   
  wire signed [39:0] subtraction_1_cast_2_stage_2;   
  
  // First subtraction output
  wire signed [39:0] subtraction_1_out_stage_1;   
  wire signed [39:0] subtraction_1_out_stage_2;   

  // Casting of the second subtraction output into required fixed point format
  wire signed [40:0] subtraction_2_cast_1_stage_1;   
  wire signed [39:0] subtraction_2_cast_2_stage_1;   
  wire signed [40:0] subtraction_2_cast_3_stage_1;   
  wire signed [40:0] subtraction_2_cast_1_stage_2;   
  wire signed [39:0] subtraction_2_cast_2_stage_2;   
  wire signed [40:0] subtraction_2_cast_3_stage_2;   
  
  // Temporary variable of the second subtraction output
  wire signed [40:0] subtraction_2_temp_stage_1;   
  wire signed [40:0] subtraction_2_temp_stage_2;   

  // Second subtraction output
  wire signed [39:0] subtraction_2_out_stage_1;   
  wire signed [39:0] subtraction_2_out_stage_2;   

  // Fourth Gain Output
  wire signed [63:0] gain_4_stage_1;  
  wire signed [63:0] gain_4_stage_2; 
  
  // Casting of the first addition output into the required fixed point format 
  wire signed [39:0] addition_1_cast_1_stage_1;   
  wire signed [39:0] addition_1_cast_2_stage_1;   
  wire signed [39:0] addition_1_cast_1_stage_2;   
  wire signed [39:0] addition_1_cast_2_stage_2;   
  
  // Output of the first addition
  wire signed [39:0] addition_1_out_stage_1;   
  wire signed [39:0] addition_1_out_stage_2;   

  // Casting of the second addition output into the required fixed point format
  wire signed [40:0] addition_2_cast_1_stage_1;   
  wire signed [39:0] addition_2_cast_2_stage_1;   
  wire signed [40:0] addition_2_cast_3_stage_1;   
  wire signed [40:0] addition_2_cast_1_stage_2;   
  wire signed [39:0] addition_2_cast_2_stage_2;   
  wire signed [40:0] addition_2_cast_3_stage_2;   
  
  // Temporary variable of the second addition output
  wire signed [40:0] addition_2_temp_stage_1;   
  wire signed [40:0] addition_2_temp_stage_2;   

  // Output of the second addition
  wire signed [39:0] addition_2_out_stage_1;   
  wire signed [39:0] addition_2_out_stage_2;   

  // Casting of the filter output
  wire signed [31:0] filter_output_cast; 
  
  
  
  // Main Module Code - Demodulation Lowpass Filter
  
  // Casting of the filter input variable
  assign filter_input_cast = (((filter_input[63] == 1'b0) && (filter_input[62] != 1'b0)) || ((filter_input[63] == 1'b0) && 
		   (filter_input[62:31] == 32'sb01111111111111111111111111111111)) ? 32'sb01111111111111111111111111111111 :
               ((filter_input[63] == 1'b1) && (filter_input[62] != 1'b1) ? 32'sb10000000000000000000000000000000 :
              filter_input[62:31] + $signed({1'b0, filter_input[30]})));


  // Multiplication of the first gain with the filter input
  assign gain_1_stage_1_temp = 32'sb01100001110101110000010010001111 * filter_input_cast;
  assign gain_1_stage_1 = ({{4{gain_1_stage_1_temp[63]}}, gain_1_stage_1_temp[63:36]}) + $signed({1'b0, gain_1_stage_1_temp[35] & 
                          (gain_1_stage_1_temp[36] | (|gain_1_stage_1_temp[34:0]))});



  assign enb = clk_enable;

  // Second half of the delay line - Delay of 1 clock cycle
  always @(posedge clk or posedge reset)
    begin : Second_Half_Of_The_Delay_Line_Stage_1
      if (reset == 1'b1) begin
        delay_2_stage_1 <= 32'sb00000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          delay_2_stage_1 <= delay_1_stage_1;
        end
      end
    end


  // First Stage Third Gain Multiplication
  assign gain_3_stage_1 = 32'sb00111100110011010101111001100100 * delay_2_stage_1;


  // First Half Of The Delay Line - Delay of 1 clock cycle
  always @(posedge clk or posedge reset)
    begin : First_Half_Of_The_Delay_Line_Stage_1
      if (reset == 1'b1) begin
        delay_1_stage_1 <= 32'sb00000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          delay_1_stage_1 <= delay_line_input_stage_1;
        end
      end
    end


  // First Stage Second Gain Multiplication
  assign gain_2_stage_1 = 32'sb10000011010011001011010111111111 * delay_1_stage_1;


  // Casting of the First Subtraction Input Variables So That They Can Be Subtracted In A Fixed Point Format
  assign subtraction_1_cast_1_stage_1 = {{3{gain_1_stage_1[31]}}, {gain_1_stage_1, 5'b00000}};
  assign subtraction_1_cast_2_stage_1 = ({{2{gain_2_stage_1[63]}}, gain_2_stage_1[63:26]}) + $signed({1'b0, gain_2_stage_1[25] & 
                                        (gain_2_stage_1[26] | (|gain_2_stage_1[24:0]))});
  
  // Output calculation of the First Subtraction
  assign subtraction_1_out_stage_1 = subtraction_1_cast_1_stage_1 - subtraction_1_cast_2_stage_1;


  // Casting of the Second Subtraction Input Variables So That They Can Be Subtracted In A Fixed Point Format
  assign subtraction_2_cast_1_stage_1 = {subtraction_1_out_stage_1[39], subtraction_1_out_stage_1};
  assign subtraction_2_cast_2_stage_1 = ({{2{gain_3_stage_1[63]}}, gain_3_stage_1[63:26]}) + $signed({1'b0, gain_3_stage_1[25] & 
                                        (gain_3_stage_1[26] | (|gain_3_stage_1[24:0]))});
  assign subtraction_2_cast_3_stage_1 = {subtraction_2_cast_2_stage_1[39], subtraction_2_cast_2_stage_1};
  
  // Output calculation with a temp variable for the second subtraction
  assign subtraction_2_temp_stage_1 = subtraction_2_cast_1_stage_1 - subtraction_2_cast_3_stage_1;
  assign subtraction_2_out_stage_1 = ((subtraction_2_temp_stage_1[40] == 1'b0) && (subtraction_2_temp_stage_1[39] != 1'b0) ? 40'sh7FFFFFFFFF :
              ((subtraction_2_temp_stage_1[40] == 1'b1) && (subtraction_2_temp_stage_1[39] != 1'b1) ? 40'sh8000000000 :
              $signed(subtraction_2_temp_stage_1[39:0])));


  // Casting Of The Second Subtraction Output So That It Can Be Used As The Input To The Delay Line
  assign delay_line_input_stage_1 = (((subtraction_2_out_stage_1[39] == 1'b0) && (subtraction_2_out_stage_1[38:35] != 4'b0000)) || 
                                    ((subtraction_2_out_stage_1[39] == 1'b0) && (subtraction_2_out_stage_1[35:4] == 
												32'sb01111111111111111111111111111111)) ? 32'sb01111111111111111111111111111111 :
                                    ((subtraction_2_out_stage_1[39] == 1'b1) && (subtraction_2_out_stage_1[38:35] != 4'b1111) ? 
												32'sb10000000000000000000000000000000 :
                                    subtraction_2_out_stage_1[35:4] + $signed({1'b0, subtraction_2_out_stage_1[3] & (subtraction_2_out_stage_1[4] | 
												(|subtraction_2_out_stage_1[2:0]))})));


  // First Stage Fourth Gain Multiplication
  assign gain_4_stage_1 = 32'sb10100101010111101001111101110100 * delay_1_stage_1;


  // Casting of the first addition Input Variables so that they can added in a fixed point format
  assign addition_1_cast_1_stage_1 = {{4{delay_line_input_stage_1[31]}}, {delay_line_input_stage_1, 4'b0000}};
  assign addition_1_cast_2_stage_1 = ({{2{gain_4_stage_1[63]}}, gain_4_stage_1[63:26]}) + $signed({1'b0, gain_4_stage_1[25] & (gain_4_stage_1[26] | 
                                     (|gain_4_stage_1[24:0]))});
  
  // Output calculation of the first addition
  assign addition_1_out_stage_1 = addition_1_cast_1_stage_1 + addition_1_cast_2_stage_1;


  // Casting of the second addition Input Variables so that they can added in a fixed point format
  assign addition_2_cast_1_stage_1 = {addition_1_out_stage_1[39], addition_1_out_stage_1};
  assign addition_2_cast_2_stage_1 = {{4{delay_2_stage_1[31]}}, {delay_2_stage_1, 4'b0000}};
  assign addition_2_cast_3_stage_1 = {addition_2_cast_2_stage_1[39], addition_2_cast_2_stage_1};
  
  // Output calculation with a temp variable for the second addition
  assign addition_2_temp_stage_1 = addition_2_cast_1_stage_1 + addition_2_cast_3_stage_1;
  assign addition_2_out_stage_1 = ((addition_2_temp_stage_1[40] == 1'b0) && (addition_2_temp_stage_1[39] != 1'b0) ? 40'sh7FFFFFFFFF :
              ((addition_2_temp_stage_1[40] == 1'b1) && (addition_2_temp_stage_1[39] != 1'b1) ? 40'sh8000000000 :
              $signed(addition_2_temp_stage_1[39:0])));


  // Casting of the stage 1 output variable
  assign stage_1_output_cast = ((addition_2_out_stage_1[39] == 1'b0) && (addition_2_out_stage_1[38:8] == 31'b1111111111111111111111111111111) ? 
                                 32'sb01111111111111111111111111111111 :
                                 addition_2_out_stage_1[39:8] + $signed({1'b0, addition_2_out_stage_1[7] & (addition_2_out_stage_1[8] | 
											(|addition_2_out_stage_1[6:0]))}));



  assign gain_1_stage_2_temp = 32'sb00000100111110110000100011000100 * stage_1_output_cast;
  
  assign gain_1_stage_2 = ((gain_1_stage_2_temp[63] == 1'b0) && (gain_1_stage_2_temp[62:32] == 31'b1111111111111111111111111111111) ? 
                            32'sb01111111111111111111111111111111 :
                            gain_1_stage_2_temp[63:32] + $signed({1'b0, gain_1_stage_2_temp[31] & (gain_1_stage_2_temp[32] | 
									 (|gain_1_stage_2_temp[30:0]))}));



  always @(posedge clk or posedge reset)
    begin : Second_Half_Of_The_Delay_Line_Stage_2
      if (reset == 1'b1) begin
        delay_2_stage_2 <= 32'sb00000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          delay_2_stage_2 <= delay_1_stage_2;
        end
      end
    end



  assign gain_3_stage_2 = 32'sb00111110101101000010001101001101 * delay_2_stage_2;



  always @(posedge clk or posedge reset)
    begin : First_Half_Of_The_Delay_Line_Stage_2
      if (reset == 1'b1) begin
        delay_1_stage_2 <= 32'sb00000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          delay_1_stage_2 <= delay_line_input_stage_2;
        end
      end
    end



  assign gain_2_stage_2 = 32'sb10000001101001101110100001011110 * delay_1_stage_2;



  assign subtraction_1_cast_1_stage_2 = {{3{gain_1_stage_2[31]}}, {gain_1_stage_2, 5'b00000}};
  assign subtraction_1_cast_2_stage_2 = ({{2{gain_2_stage_2[63]}}, gain_2_stage_2[63:26]}) + $signed({1'b0, gain_2_stage_2[25] & (gain_2_stage_2[26] | (|gain_2_stage_2[24:0]))});
  assign subtraction_1_out_stage_2 = subtraction_1_cast_1_stage_2 - subtraction_1_cast_2_stage_2;



  assign subtraction_2_cast_1_stage_2 = {subtraction_1_out_stage_2[39], subtraction_1_out_stage_2};
  assign subtraction_2_cast_2_stage_2 = ({{2{gain_3_stage_2[63]}}, gain_3_stage_2[63:26]}) + $signed({1'b0, gain_3_stage_2[25] & (gain_3_stage_2[26] | (|gain_3_stage_2[24:0]))});
  assign subtraction_2_cast_3_stage_2 = {subtraction_2_cast_2_stage_2[39], subtraction_2_cast_2_stage_2};
  assign subtraction_2_temp_stage_2 = subtraction_2_cast_1_stage_2 - subtraction_2_cast_3_stage_2;
  assign subtraction_2_out_stage_2 = ((subtraction_2_temp_stage_2[40] == 1'b0) && (subtraction_2_temp_stage_2[39] != 1'b0) ? 40'sh7FFFFFFFFF :
              ((subtraction_2_temp_stage_2[40] == 1'b1) && (subtraction_2_temp_stage_2[39] != 1'b1) ? 40'sh8000000000 :
              $signed(subtraction_2_temp_stage_2[39:0])));



  assign delay_line_input_stage_2 = (((subtraction_2_out_stage_2[39] == 1'b0) && (subtraction_2_out_stage_2[38:35] != 4'b0000)) || ((subtraction_2_out_stage_2[39] == 1'b0) && (subtraction_2_out_stage_2[35:4] == 32'sb01111111111111111111111111111111)) ? 32'sb01111111111111111111111111111111 :
              ((subtraction_2_out_stage_2[39] == 1'b1) && (subtraction_2_out_stage_2[38:35] != 4'b1111) ? 32'sb10000000000000000000000000000000 :
              subtraction_2_out_stage_2[35:4] + $signed({1'b0, subtraction_2_out_stage_2[3] & (subtraction_2_out_stage_2[4] | (|subtraction_2_out_stage_2[2:0]))})));



  assign gain_4_stage_2 = 32'sb10000111011011111111110001011100 * delay_1_stage_2;



  assign addition_1_cast_1_stage_2 = {{4{delay_line_input_stage_2[31]}}, {delay_line_input_stage_2, 4'b0000}};
  assign addition_1_cast_2_stage_2 = ({{2{gain_4_stage_2[63]}}, gain_4_stage_2[63:26]}) + $signed({1'b0, gain_4_stage_2[25] & (gain_4_stage_2[26] | (|gain_4_stage_2[24:0]))});
  assign addition_1_out_stage_2 = addition_1_cast_1_stage_2 + addition_1_cast_2_stage_2;



  assign addition_2_cast_1_stage_2 = {addition_1_out_stage_2[39], addition_1_out_stage_2};
  assign addition_2_cast_2_stage_2 = {{4{delay_2_stage_2[31]}}, {delay_2_stage_2, 4'b0000}};
  assign addition_2_cast_3_stage_2 = {addition_2_cast_2_stage_2[39], addition_2_cast_2_stage_2};
  assign addition_2_temp_stage_2 = addition_2_cast_1_stage_2 + addition_2_cast_3_stage_2;
  assign addition_2_out_stage_2 = ((addition_2_temp_stage_2[40] == 1'b0) && (addition_2_temp_stage_2[39] != 1'b0) ? 40'sh7FFFFFFFFF :
              ((addition_2_temp_stage_2[40] == 1'b1) && (addition_2_temp_stage_2[39] != 1'b1) ? 40'sh8000000000 :
              $signed(addition_2_temp_stage_2[39:0])));



  assign filter_output_cast = ((addition_2_out_stage_2[39] == 1'b0) && (addition_2_out_stage_2[38:8] == 31'b1111111111111111111111111111111) ? 32'sb01111111111111111111111111111111 :
              addition_2_out_stage_2[39:8] + $signed({1'b0, addition_2_out_stage_2[7] & (addition_2_out_stage_2[8] | (|addition_2_out_stage_2[6:0]))}));



  assign filter_output = filter_output_cast;

  assign ce_out = clk_enable;

endmodule  // Demod_Lowpass_Filter_8KHz

