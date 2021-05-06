// -------------------------------------------------------------
// 8 KHz Bandpass Filter
// -------------------------------------------------------------

`timescale 1 us / 1 us

module Bandpass_Filter_8KHz
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
  input   [31:0] filter_input; 
  output  ce_out;
  output  signed [21:0] filter_output;   


  // Define All Internal Module Variables
  
  wire enb;
  
  // Gain 1 Temporary Variable
  wire signed [63:0] gain_1_stage_1_temp; 
  wire signed [63:0] gain_1_stage_2_temp;   
  wire signed [63:0] gain_1_stage_3_temp;   
  wire signed [63:0] gain_1_stage_4_temp;   
  wire signed [63:0] gain_1_stage_5_temp;   
  wire signed [63:0] gain_1_stage_6_temp;   
  wire signed [63:0] gain_1_final_output_temp;   
  
  // Gain 1 Output - Output from the multiplication of the stage input and the first gain constant
  wire signed [31:0] gain_1_stage_1;   
  wire signed [31:0] gain_1_stage_2;   
  wire signed [31:0] gain_1_stage_3;   
  wire signed [31:0] gain_1_stage_4;   
  wire signed [31:0] gain_1_stage_5;   
  wire signed [31:0] gain_1_stage_6;   
  wire signed [31:0] gain_1_final_output; 
  wire signed [21:0] gain_1_final_output_22_bit;
    
  
  // Delay Variables - Outputs from the 2 clock cycle delay line
  reg  signed [31:0] delay_1_stage_1;   
  reg  signed [31:0] delay_2_stage_1;  
  reg  signed [31:0] delay_1_stage_2;   
  reg  signed [31:0] delay_2_stage_2;  
  reg  signed [31:0] delay_1_stage_3;   
  reg  signed [31:0] delay_2_stage_3; 
  reg  signed [31:0] delay_1_stage_4;   
  reg  signed [31:0] delay_2_stage_4; 
  reg  signed [31:0] delay_1_stage_5;   
  reg  signed [31:0] delay_2_stage_5; 
  reg  signed [31:0] delay_1_stage_6;   
  reg  signed [31:0] delay_2_stage_6; 
  
  // Gain Output 2 - Output from the multiplication of the first delay output and the second gain constant
  wire signed [63:0] gain_2_stage_1;   
  wire signed [63:0] gain_2_stage_2;   
  wire signed [63:0] gain_2_stage_3;   
  wire signed [63:0] gain_2_stage_4;   
  wire signed [63:0] gain_2_stage_5;   
  wire signed [63:0] gain_2_stage_6;   
  
  // Gain Output 3 - Output from the multiplication of the second delay output and the third gain constant
  wire signed [63:0] gain_3_stage_1;   
  wire signed [63:0] gain_3_stage_2;   
  wire signed [63:0] gain_3_stage_3;   
  wire signed [63:0] gain_3_stage_4;   
  wire signed [63:0] gain_3_stage_5;   
  wire signed [63:0] gain_3_stage_6;   

  
  // First Subtraction Operation Casting Operation
  wire signed [39:0] subtraction_1_cast_1_stage_1;   
  wire signed [40:0] subtraction_1_cast_2_stage_1;   
  wire signed [39:0] subtraction_1_cast_3_stage_1;   
  wire signed [40:0] subtraction_1_cast_4_stage_1;   
  
  wire signed [39:0] subtraction_1_cast_1_stage_2;   
  wire signed [40:0] subtraction_1_cast_2_stage_2;   
  wire signed [39:0] subtraction_1_cast_3_stage_2;   
  wire signed [40:0] subtraction_1_cast_4_stage_2;   
  
  wire signed [39:0] subtraction_1_cast_1_stage_3;   
  wire signed [40:0] subtraction_1_cast_2_stage_3;   
  wire signed [39:0] subtraction_1_cast_3_stage_3;   
  wire signed [40:0] subtraction_1_cast_4_stage_3;   
  
  wire signed [39:0] subtraction_1_cast_1_stage_4;   
  wire signed [40:0] subtraction_1_cast_2_stage_4;   
  wire signed [39:0] subtraction_1_cast_3_stage_4;   
  wire signed [40:0] subtraction_1_cast_4_stage_4;   
  
  wire signed [39:0] subtraction_1_cast_1_stage_5;   
  wire signed [40:0] subtraction_1_cast_2_stage_5;   
  wire signed [39:0] subtraction_1_cast_3_stage_5;   
  wire signed [40:0] subtraction_1_cast_4_stage_5;   
  
  wire signed [39:0] subtraction_1_cast_1_stage_6;   
  wire signed [40:0] subtraction_1_cast_2_stage_6;   
  wire signed [39:0] subtraction_1_cast_3_stage_6;   
  wire signed [40:0] subtraction_1_cast_4_stage_6;   
  
  // First Subtraction Operation Temporary Vairable
  wire signed [40:0] subtraction_1_temp_stage_1;   
  wire signed [40:0] subtraction_1_temp_stage_2;   
  wire signed [40:0] subtraction_1_temp_stage_3;   
  wire signed [40:0] subtraction_1_temp_stage_4;   
  wire signed [40:0] subtraction_1_temp_stage_5;   
  wire signed [40:0] subtraction_1_temp_stage_6;   

  // First Subtraction Operation Final Output Variable
  wire signed [39:0] subtraction_1_out_stage_1;   
  wire signed [39:0] subtraction_1_out_stage_2;   
  wire signed [39:0] subtraction_1_out_stage_3;   
  wire signed [39:0] subtraction_1_out_stage_4;   
  wire signed [39:0] subtraction_1_out_stage_5;   
  wire signed [39:0] subtraction_1_out_stage_6;   


  // Input vairable to the delay line and the third subtraction operation
  wire signed [31:0] delay_input_stage_1; 
  wire signed [31:0] delay_input_stage_2;  
  wire signed [31:0] delay_input_stage_3;   
  wire signed [31:0] delay_input_stage_4;   
  wire signed [31:0] delay_input_stage_5;   
  wire signed [31:0] delay_input_stage_6; 

  // Input to the stages
  wire signed [31:0] input_stage_2;   
  wire signed [31:0] input_stage_3;   
  wire signed [31:0] input_stage_4;   
  wire signed [31:0] input_stage_5;   
  wire signed [31:0] input_stage_6;  
  // Output to the final stage 
  wire signed [31:0] stage_6_output;     
  
  // Second Subtraction Operation Casting Operation
  wire signed [40:0] subtraction_2_cast_1_stage_1;   
  wire signed [39:0] subtraction_2_cast_2_stage_1;   
  wire signed [40:0] subtraction_2_cast_3_stage_1;   
  
  wire signed [40:0] subtraction_2_cast_1_stage_2;   
  wire signed [39:0] subtraction_2_cast_2_stage_2;   
  wire signed [40:0] subtraction_2_cast_3_stage_2;   
  
  wire signed [40:0] subtraction_2_cast_1_stage_3;   
  wire signed [39:0] subtraction_2_cast_2_stage_3;   
  wire signed [40:0] subtraction_2_cast_3_stage_3;   
  
  wire signed [40:0] subtraction_2_cast_1_stage_4;   
  wire signed [39:0] subtraction_2_cast_2_stage_4;   
  wire signed [40:0] subtraction_2_cast_3_stage_4;   
  
  wire signed [40:0] subtraction_2_cast_1_stage_5;   
  wire signed [39:0] subtraction_2_cast_2_stage_5;   
  wire signed [40:0] subtraction_2_cast_3_stage_5;   
  
  wire signed [40:0] subtraction_2_cast_1_stage_6;   
  wire signed [39:0] subtraction_2_cast_2_stage_6;   
  wire signed [40:0] subtraction_2_cast_3_stage_6;   
  
  // Second Subtraction Operation Temporary Variable
  wire signed [40:0] subtraction_2_temp_stage_1;   
  wire signed [40:0] subtraction_2_temp_stage_2;   
  wire signed [40:0] subtraction_2_temp_stage_3;   
  wire signed [40:0] subtraction_2_temp_stage_4;   
  wire signed [40:0] subtraction_2_temp_stage_5;   
  wire signed [40:0] subtraction_2_temp_stage_6;   

  // Second Subtraction Operation Final Output Variable
  wire signed [39:0] subtraction_2_out_stage_1;   
  wire signed [39:0] subtraction_2_out_stage_2;   
  wire signed [39:0] subtraction_2_out_stage_3;   
  wire signed [39:0] subtraction_2_out_stage_4;   
  wire signed [39:0] subtraction_2_out_stage_5;   
  wire signed [39:0] subtraction_2_out_stage_6;   
  
  // Third Subtraction Operation Casting Operation
  wire signed [39:0] subtraction_3_cast_1_stage_1;   
  wire signed [39:0] subtraction_3_cast_2_stage_1;   
  
  wire signed [39:0] subtraction_3_cast_1_stage_2;   
  wire signed [39:0] subtraction_3_cast_2_stage_2;   
  
  wire signed [39:0] subtraction_3_cast_1_stage_3;   
  wire signed [39:0] subtraction_3_cast_2_stage_3;   
  
  wire signed [39:0] subtraction_3_cast_1_stage_4;   
  wire signed [39:0] subtraction_3_cast_2_stage_4;   
  
  wire signed [39:0] subtraction_3_cast_1_stage_5;   
  wire signed [39:0] subtraction_3_cast_2_stage_5;   
  
  wire signed [39:0] subtraction_3_cast_1_stage_6;   
  wire signed [39:0] subtraction_3_cast_2_stage_6;   
  
  // Third Subtraction Operation Final Output Variable
  wire signed [39:0] subtraction_3_out_stage_1;   
  wire signed [39:0] subtraction_3_out_stage_2;   
  wire signed [39:0] subtraction_3_out_stage_3;   
  wire signed [39:0] subtraction_3_out_stage_4;   
  wire signed [39:0] subtraction_3_out_stage_5;   
  wire signed [39:0] subtraction_3_out_stage_6;   

    

  // Main Module Code - Bandpass Filter For 8KHz Frequency Channel
  
  // First Stage First Gain Multiplication
  assign  gain_1_stage_1_temp = 32'sb00000011001100100101110100000000 * filter_input;
  assign  gain_1_stage_1 = ({{4{ gain_1_stage_1_temp[63]}},  gain_1_stage_1_temp[63:36]}) + $signed({1'b0,  gain_1_stage_1_temp[35] & 
                           ( gain_1_stage_1_temp[36] | (| gain_1_stage_1_temp[34:0]))});



  assign enb = clk_enable;
  
  // Second Half Of The Delay Line - Delay of 1 clock cycle
  always @(posedge clk or posedge reset)
    begin : Second_Half_Of_The_Delay_Line_Stage_1
      if (reset == 1'b1) begin
        delay_2_stage_1 <= 32'sb00000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          delay_2_stage_1 <= delay_1_stage_1; //
        end
      end
    end


  // First Stage Third Gain Multiplication
  assign gain_3_stage_1 = 32'sb00111111110001101010001111010011 * delay_2_stage_1;


  // First Half Of The Delay Line - Delay of 1 clock cycle
  always @(posedge clk or posedge reset)
    begin : First_Half_Of_The_Delay_Line_Stage_1
      if (reset == 1'b1) begin
        delay_1_stage_1 <= 32'sb00000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          delay_1_stage_1 <= delay_input_stage_1;
        end
      end
    end


  // First Stage Second Gain Multiplication
  assign gain_2_stage_1 = 32'sb10000011011110010011111011100000 * delay_1_stage_1;


  // Casting of the First Subtraction Input Variables So That They Can Be Subtracted In A Fixed Point Format
  assign subtraction_1_cast_1_stage_1 = (( gain_1_stage_1[31] == 1'b0) && ( gain_1_stage_1[30] != 1'b0) ? 40'sh7FFFFFFFFF :
              (( gain_1_stage_1[31] == 1'b1) && ( gain_1_stage_1[30] != 1'b1) ? 40'sh8000000000 :
              { gain_1_stage_1[30:0], 9'b000000000}));
  assign subtraction_1_cast_2_stage_1 = {subtraction_1_cast_1_stage_1[39], subtraction_1_cast_1_stage_1};
  assign subtraction_1_cast_3_stage_1 = ({{2{gain_2_stage_1[63]}}, gain_2_stage_1[63:26]}) + $signed({1'b0, gain_2_stage_1[25] & (gain_2_stage_1[26] | 
                                        (|gain_2_stage_1[24:0]))});
  assign subtraction_1_cast_4_stage_1 = {subtraction_1_cast_3_stage_1[39], subtraction_1_cast_3_stage_1};
  
  assign subtraction_1_temp_stage_1 = subtraction_1_cast_2_stage_1 - subtraction_1_cast_4_stage_1;
  
  assign subtraction_1_out_stage_1 = ((subtraction_1_temp_stage_1[40] == 1'b0) && (subtraction_1_temp_stage_1[39] != 1'b0) ? 40'sh7FFFFFFFFF :
              ((subtraction_1_temp_stage_1[40] == 1'b1) && (subtraction_1_temp_stage_1[39] != 1'b1) ? 40'sh8000000000 :
              $signed(subtraction_1_temp_stage_1[39:0])));


  // Casting Of The Second Subtraction Input Variables So That They Can Be Subtracted In A Fixed Point Format
  assign subtraction_2_cast_1_stage_1 = {subtraction_1_out_stage_1[39], subtraction_1_out_stage_1};
  assign subtraction_2_cast_2_stage_1 = ({{2{gain_3_stage_1[63]}}, gain_3_stage_1[63:26]}) + $signed({1'b0, gain_3_stage_1[25] & (gain_3_stage_1[26] | 
                                        (|gain_3_stage_1[24:0]))});
  assign subtraction_2_cast_3_stage_1 = {subtraction_2_cast_2_stage_1[39], subtraction_2_cast_2_stage_1};
  
  assign subtraction_2_temp_stage_1 = subtraction_2_cast_1_stage_1 - subtraction_2_cast_3_stage_1;
  assign subtraction_2_out_stage_1 = ((subtraction_2_temp_stage_1[40] == 1'b0) && (subtraction_2_temp_stage_1[39] != 1'b0) ? 40'sh7FFFFFFFFF :
              ((subtraction_2_temp_stage_1[40] == 1'b1) && (subtraction_2_temp_stage_1[39] != 1'b1) ? 40'sh8000000000 :
              $signed(subtraction_2_temp_stage_1[39:0])));


  // Casting Of The Second Subtraction Output So That It Can Be Used As The Input To The Delay Line
  assign delay_input_stage_1 = (((subtraction_2_out_stage_1[39] == 1'b0) && (subtraction_2_out_stage_1[38:35] != 4'b0000)) || 
                               ((subtraction_2_out_stage_1[39] == 1'b0) && (subtraction_2_out_stage_1[35:4] == 32'sb01111111111111111111111111111111)) ?
										   32'sb01111111111111111111111111111111 :
                               ((subtraction_2_out_stage_1[39] == 1'b1) && (subtraction_2_out_stage_1[38:35] != 4'b1111) ? 
										   32'sb10000000000000000000000000000000 :
                                 subtraction_2_out_stage_1[35:4] + $signed({1'b0, subtraction_2_out_stage_1[3] & (subtraction_2_out_stage_1[4] | 
				                   (|subtraction_2_out_stage_1[2:0]))})));


  // Casting Of The Third Subtraction Input Variables So That They Can Be Subtracted In A Fixed Point Format
  assign subtraction_3_cast_1_stage_1 = {{4{delay_input_stage_1[31]}}, {delay_input_stage_1, 4'b0000}};
  assign subtraction_3_cast_2_stage_1 = {{4{delay_2_stage_1[31]}}, {delay_2_stage_1, 4'b0000}};
  assign subtraction_3_out_stage_1 = subtraction_3_cast_1_stage_1 - subtraction_3_cast_2_stage_1;


  // Casting Of The First Stage Output So That It Can Be Used As The Second Stage Input
  assign input_stage_2 = ((subtraction_3_out_stage_1[39] == 1'b0) && (subtraction_3_out_stage_1[38:8] == 31'b1111111111111111111111111111111) ? 
                           32'sb01111111111111111111111111111111 :
                           subtraction_3_out_stage_1[39:8] + $signed({1'b0, subtraction_3_out_stage_1[7] & (subtraction_3_out_stage_1[8] | 
									(|subtraction_3_out_stage_1[6:0]))}));



  assign gain_1_stage_2_temp = 32'sb00000011001100100101110100000000 * input_stage_2;
  assign gain_1_stage_2 = ((gain_1_stage_2_temp[63] == 1'b0) && (gain_1_stage_2_temp[62:32] == 31'b1111111111111111111111111111111) ? 
                            32'sb01111111111111111111111111111111 :
                            gain_1_stage_2_temp[63:32] + $signed({1'b0, gain_1_stage_2_temp[31] & (gain_1_stage_2_temp[32] | 
									 (|gain_1_stage_2_temp[30:0]))}));



  always @(posedge clk or posedge reset)
    begin :  Second_Half_Of_The_Delay_Line_Stage_2
      if (reset == 1'b1) begin
        delay_2_stage_2 <= 32'sb00000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          delay_2_stage_2 <= delay_1_stage_2;
        end
      end
    end



  assign gain_3_stage_2 = 32'sb00111111110100110010010101100110 * delay_2_stage_2;



  always @(posedge clk or posedge reset)
    begin : First_Half_Of_The_Delay_Line_Stage_2
      if (reset == 1'b1) begin
        delay_1_stage_2 <= 32'sb00000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          delay_1_stage_2 <= delay_input_stage_2;
        end
      end
    end



  assign gain_2_stage_2 = 32'sb10000010001001101100100100010001 * delay_1_stage_2;



  assign subtraction_1_cast_1_stage_2 = ((gain_1_stage_2[31] == 1'b0) && (gain_1_stage_2[30] != 1'b0) ? 40'sh7FFFFFFFFF :
              ((gain_1_stage_2[31] == 1'b1) && (gain_1_stage_2[30] != 1'b1) ? 40'sh8000000000 :
              {gain_1_stage_2[30:0], 9'b000000000}));
  assign subtraction_1_cast_2_stage_2 = {subtraction_1_cast_1_stage_2[39], subtraction_1_cast_1_stage_2};
  assign subtraction_1_cast_3_stage_2 = ({{2{gain_2_stage_2[63]}}, gain_2_stage_2[63:26]}) + $signed({1'b0, gain_2_stage_2[25] & (gain_2_stage_2[26] | (|gain_2_stage_2[24:0]))});
  assign subtraction_1_cast_4_stage_2 = {subtraction_1_cast_3_stage_2[39], subtraction_1_cast_3_stage_2};
  assign subtraction_1_temp_stage_2 = subtraction_1_cast_2_stage_2 - subtraction_1_cast_4_stage_2;
  assign subtraction_1_out_stage_2 = ((subtraction_1_temp_stage_2[40] == 1'b0) && (subtraction_1_temp_stage_2[39] != 1'b0) ? 40'sh7FFFFFFFFF :
              ((subtraction_1_temp_stage_2[40] == 1'b1) && (subtraction_1_temp_stage_2[39] != 1'b1) ? 40'sh8000000000 :
              $signed(subtraction_1_temp_stage_2[39:0])));



  assign subtraction_2_cast_1_stage_2 = {subtraction_1_out_stage_2[39], subtraction_1_out_stage_2};
  assign subtraction_2_cast_2_stage_2 = ({{2{gain_3_stage_2[63]}}, gain_3_stage_2[63:26]}) + $signed({1'b0, gain_3_stage_2[25] & (gain_3_stage_2[26] | (|gain_3_stage_2[24:0]))});
  assign subtraction_2_cast_3_stage_2 = {subtraction_2_cast_2_stage_2[39], subtraction_2_cast_2_stage_2};
  assign subtraction_2_temp_stage_2 = subtraction_2_cast_1_stage_2 - subtraction_2_cast_3_stage_2;
  assign subtraction_2_out_stage_2 = ((subtraction_2_temp_stage_2[40] == 1'b0) && (subtraction_2_temp_stage_2[39] != 1'b0) ? 40'sh7FFFFFFFFF :
              ((subtraction_2_temp_stage_2[40] == 1'b1) && (subtraction_2_temp_stage_2[39] != 1'b1) ? 40'sh8000000000 :
              $signed(subtraction_2_temp_stage_2[39:0])));



  assign delay_input_stage_2 = (((subtraction_2_out_stage_2[39] == 1'b0) && (subtraction_2_out_stage_2[38:35] != 4'b0000)) || ((subtraction_2_out_stage_2[39] == 1'b0) && (subtraction_2_out_stage_2[35:4] == 32'sb01111111111111111111111111111111)) ? 32'sb01111111111111111111111111111111 :
              ((subtraction_2_out_stage_2[39] == 1'b1) && (subtraction_2_out_stage_2[38:35] != 4'b1111) ? 32'sb10000000000000000000000000000000 :
              subtraction_2_out_stage_2[35:4] + $signed({1'b0, subtraction_2_out_stage_2[3] & (subtraction_2_out_stage_2[4] | (|subtraction_2_out_stage_2[2:0]))})));



  assign subtraction_3_cast_1_stage_2 = {{4{delay_input_stage_2[31]}}, {delay_input_stage_2, 4'b0000}};
  assign subtraction_3_cast_2_stage_2 = {{4{delay_2_stage_2[31]}}, {delay_2_stage_2, 4'b0000}};
  assign subtraction_3_out_stage_2 = subtraction_3_cast_1_stage_2 - subtraction_3_cast_2_stage_2;



  assign input_stage_3 = ((subtraction_3_out_stage_2[39] == 1'b0) && (subtraction_3_out_stage_2[38:8] == 31'b1111111111111111111111111111111) ? 32'sb01111111111111111111111111111111 :
              subtraction_3_out_stage_2[39:8] + $signed({1'b0, subtraction_3_out_stage_2[7] & (subtraction_3_out_stage_2[8] | (|subtraction_3_out_stage_2[6:0]))}));



  assign gain_1_stage_3_temp = 32'sb00000010011001000111000110111010 * input_stage_3;
  assign gain_1_stage_3 = ((gain_1_stage_3_temp[63] == 1'b0) && (gain_1_stage_3_temp[62:32] == 31'b1111111111111111111111111111111) ? 32'sb01111111111111111111111111111111 :
              gain_1_stage_3_temp[63:32] + $signed({1'b0, gain_1_stage_3_temp[31] & (gain_1_stage_3_temp[32] | (|gain_1_stage_3_temp[30:0]))}));



  always @(posedge clk or posedge reset)
    begin :  Second_Half_Of_The_Delay_Line_Stage_3
      if (reset == 1'b1) begin
        delay_2_stage_3 <= 32'sb00000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          delay_2_stage_3 <= delay_1_stage_3;
        end
      end
    end



  assign gain_3_stage_3 = 32'sb00111111011010000011100001110000 * delay_2_stage_3;



  always @(posedge clk or posedge reset)
    begin : First_Half_Of_The_Delay_Line_Stage_3
      if (reset == 1'b1) begin
        delay_1_stage_3 <= 32'sb00000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          delay_1_stage_3 <= delay_input_stage_3;
        end
      end
    end



  assign gain_2_stage_3 = 32'sb10000011101000000001010010000000 * delay_1_stage_3;



  assign subtraction_1_cast_1_stage_3 = ((gain_1_stage_3[31] == 1'b0) && (gain_1_stage_3[30] != 1'b0) ? 40'sh7FFFFFFFFF :
              ((gain_1_stage_3[31] == 1'b1) && (gain_1_stage_3[30] != 1'b1) ? 40'sh8000000000 :
              {gain_1_stage_3[30:0], 9'b000000000}));
  assign subtraction_1_cast_2_stage_3 = {subtraction_1_cast_1_stage_3[39], subtraction_1_cast_1_stage_3};
  assign subtraction_1_cast_3_stage_3 = ({{2{gain_2_stage_3[63]}}, gain_2_stage_3[63:26]}) + $signed({1'b0, gain_2_stage_3[25] & (gain_2_stage_3[26] | (|gain_2_stage_3[24:0]))});
  assign subtraction_1_cast_4_stage_3 = {subtraction_1_cast_3_stage_3[39], subtraction_1_cast_3_stage_3};
  assign subtraction_1_temp_stage_3 = subtraction_1_cast_2_stage_3 - subtraction_1_cast_4_stage_3;
  assign subtraction_1_out_stage_3 = ((subtraction_1_temp_stage_3[40] == 1'b0) && (subtraction_1_temp_stage_3[39] != 1'b0) ? 40'sh7FFFFFFFFF :
              ((subtraction_1_temp_stage_3[40] == 1'b1) && (subtraction_1_temp_stage_3[39] != 1'b1) ? 40'sh8000000000 :
              $signed(subtraction_1_temp_stage_3[39:0])));



  assign subtraction_2_cast_1_stage_3 = {subtraction_1_out_stage_3[39], subtraction_1_out_stage_3};
  assign subtraction_2_cast_2_stage_3 = ({{2{gain_3_stage_3[63]}}, gain_3_stage_3[63:26]}) + $signed({1'b0, gain_3_stage_3[25] & (gain_3_stage_3[26] | (|gain_3_stage_3[24:0]))});
  assign subtraction_2_cast_3_stage_3 = {subtraction_2_cast_2_stage_3[39], subtraction_2_cast_2_stage_3};
  assign subtraction_2_temp_stage_3 = subtraction_2_cast_1_stage_3 - subtraction_2_cast_3_stage_3;
  assign subtraction_2_out_stage_3 = ((subtraction_2_temp_stage_3[40] == 1'b0) && (subtraction_2_temp_stage_3[39] != 1'b0) ? 40'sh7FFFFFFFFF :
              ((subtraction_2_temp_stage_3[40] == 1'b1) && (subtraction_2_temp_stage_3[39] != 1'b1) ? 40'sh8000000000 :
              $signed(subtraction_2_temp_stage_3[39:0])));



  assign delay_input_stage_3 = (((subtraction_2_out_stage_3[39] == 1'b0) && (subtraction_2_out_stage_3[38:35] != 4'b0000)) || ((subtraction_2_out_stage_3[39] == 1'b0) && (subtraction_2_out_stage_3[35:4] == 32'sb01111111111111111111111111111111)) ? 32'sb01111111111111111111111111111111 :
              ((subtraction_2_out_stage_3[39] == 1'b1) && (subtraction_2_out_stage_3[38:35] != 4'b1111) ? 32'sb10000000000000000000000000000000 :
              subtraction_2_out_stage_3[35:4] + $signed({1'b0, subtraction_2_out_stage_3[3] & (subtraction_2_out_stage_3[4] | (|subtraction_2_out_stage_3[2:0]))})));



  assign subtraction_3_cast_1_stage_3 = {{4{delay_input_stage_3[31]}}, {delay_input_stage_3, 4'b0000}};
  assign subtraction_3_cast_2_stage_3 = {{4{delay_2_stage_3[31]}}, {delay_2_stage_3, 4'b0000}};
  assign subtraction_3_out_stage_3 = subtraction_3_cast_1_stage_3 - subtraction_3_cast_2_stage_3;



  assign input_stage_4 = ((subtraction_3_out_stage_3[39] == 1'b0) && (subtraction_3_out_stage_3[38:8] == 31'b1111111111111111111111111111111) ? 32'sb01111111111111111111111111111111 :
              subtraction_3_out_stage_3[39:8] + $signed({1'b0, subtraction_3_out_stage_3[7] & (subtraction_3_out_stage_3[8] | (|subtraction_3_out_stage_3[6:0]))}));



  assign gain_1_stage_4_temp = 32'sb00000010011001000111000110111010 * input_stage_4;
  assign gain_1_stage_4 = ((gain_1_stage_4_temp[63] == 1'b0) && (gain_1_stage_4_temp[62:32] == 31'b1111111111111111111111111111111) ? 32'sb01111111111111111111111111111111 :
              gain_1_stage_4_temp[63:32] + $signed({1'b0, gain_1_stage_4_temp[31] & (gain_1_stage_4_temp[32] | (|gain_1_stage_4_temp[30:0]))}));



  always @(posedge clk or posedge reset)
    begin :  Second_Half_Of_The_Delay_Line_Stage_4
      if (reset == 1'b1) begin
        delay_2_stage_4 <= 32'sb00000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          delay_2_stage_4 <= delay_1_stage_4;
        end
      end
    end



  assign gain_3_stage_4 = 32'sb00111111100000010011001101110011 * delay_2_stage_4;



  always @(posedge clk or posedge reset)
    begin : First_Half_Of_The_Delay_Line_Stage_4
      if (reset == 1'b1) begin
        delay_1_stage_4 <= 32'sb00000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          delay_1_stage_4 <= delay_input_stage_4;
        end
      end
    end



  assign gain_2_stage_4 = 32'sb10000010100110100011000110011000 * delay_1_stage_4;



  assign subtraction_1_cast_1_stage_4 = ((gain_1_stage_4[31] == 1'b0) && (gain_1_stage_4[30] != 1'b0) ? 40'sh7FFFFFFFFF :
              ((gain_1_stage_4[31] == 1'b1) && (gain_1_stage_4[30] != 1'b1) ? 40'sh8000000000 :
              {gain_1_stage_4[30:0], 9'b000000000}));
  assign subtraction_1_cast_2_stage_4 = {subtraction_1_cast_1_stage_4[39], subtraction_1_cast_1_stage_4};
  assign subtraction_1_cast_3_stage_4 = ({{2{gain_2_stage_4[63]}}, gain_2_stage_4[63:26]}) + $signed({1'b0, gain_2_stage_4[25] & (gain_2_stage_4[26] | (|gain_2_stage_4[24:0]))});
  assign subtraction_1_cast_4_stage_4 = {subtraction_1_cast_3_stage_4[39], subtraction_1_cast_3_stage_4};
  assign subtraction_1_temp_stage_4 = subtraction_1_cast_2_stage_4 - subtraction_1_cast_4_stage_4;
  assign subtraction_1_out_stage_4 = ((subtraction_1_temp_stage_4[40] == 1'b0) && (subtraction_1_temp_stage_4[39] != 1'b0) ? 40'sh7FFFFFFFFF :
              ((subtraction_1_temp_stage_4[40] == 1'b1) && (subtraction_1_temp_stage_4[39] != 1'b1) ? 40'sh8000000000 :
              $signed(subtraction_1_temp_stage_4[39:0])));



  assign subtraction_2_cast_1_stage_4 = {subtraction_1_out_stage_4[39], subtraction_1_out_stage_4};
  assign subtraction_2_cast_2_stage_4 = ({{2{gain_3_stage_4[63]}}, gain_3_stage_4[63:26]}) + $signed({1'b0, gain_3_stage_4[25] & (gain_3_stage_4[26] | (|gain_3_stage_4[24:0]))});
  assign subtraction_2_cast_3_stage_4 = {subtraction_2_cast_2_stage_4[39], subtraction_2_cast_2_stage_4};
  assign subtraction_2_temp_stage_4 = subtraction_2_cast_1_stage_4 - subtraction_2_cast_3_stage_4;
  assign subtraction_2_out_stage_4 = ((subtraction_2_temp_stage_4[40] == 1'b0) && (subtraction_2_temp_stage_4[39] != 1'b0) ? 40'sh7FFFFFFFFF :
              ((subtraction_2_temp_stage_4[40] == 1'b1) && (subtraction_2_temp_stage_4[39] != 1'b1) ? 40'sh8000000000 :
              $signed(subtraction_2_temp_stage_4[39:0])));



  assign delay_input_stage_4 = (((subtraction_2_out_stage_4[39] == 1'b0) && (subtraction_2_out_stage_4[38:35] != 4'b0000)) || ((subtraction_2_out_stage_4[39] == 1'b0) && (subtraction_2_out_stage_4[35:4] == 32'sb01111111111111111111111111111111)) ? 32'sb01111111111111111111111111111111 :
              ((subtraction_2_out_stage_4[39] == 1'b1) && (subtraction_2_out_stage_4[38:35] != 4'b1111) ? 32'sb10000000000000000000000000000000 :
              subtraction_2_out_stage_4[35:4] + $signed({1'b0, subtraction_2_out_stage_4[3] & (subtraction_2_out_stage_4[4] | (|subtraction_2_out_stage_4[2:0]))})));



  assign subtraction_3_cast_1_stage_4 = {{4{delay_input_stage_4[31]}}, {delay_input_stage_4, 4'b0000}};
  assign subtraction_3_cast_2_stage_4 = {{4{delay_2_stage_4[31]}}, {delay_2_stage_4, 4'b0000}};
  assign subtraction_3_out_stage_4 = subtraction_3_cast_1_stage_4 - subtraction_3_cast_2_stage_4;



  assign input_stage_5 = ((subtraction_3_out_stage_4[39] == 1'b0) && (subtraction_3_out_stage_4[38:8] == 31'b1111111111111111111111111111111) ? 32'sb01111111111111111111111111111111 :
              subtraction_3_out_stage_4[39:8] + $signed({1'b0, subtraction_3_out_stage_4[7] & (subtraction_3_out_stage_4[8] | (|subtraction_3_out_stage_4[6:0]))}));



  assign gain_1_stage_5_temp = 32'sb00000001001000010011000111101001 * input_stage_5;
  assign gain_1_stage_5 = ((gain_1_stage_5_temp[63] == 1'b0) && (gain_1_stage_5_temp[62:32] == 31'b1111111111111111111111111111111) ? 32'sb01111111111111111111111111111111 :
              gain_1_stage_5_temp[63:32] + $signed({1'b0, gain_1_stage_5_temp[31] & (gain_1_stage_5_temp[32] | (|gain_1_stage_5_temp[30:0]))}));



  always @(posedge clk or posedge reset)
    begin :  Second_Half_Of_The_Delay_Line_Stage_5
      if (reset == 1'b1) begin
        delay_2_stage_5 <= 32'sb00000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          delay_2_stage_5 <= delay_1_stage_5;
        end
      end
    end



  assign gain_3_stage_5 = 32'sb00111111001110111011011000010010 * delay_2_stage_5;



  always @(posedge clk or posedge reset)
    begin : First_Half_Of_The_Delay_Line_Stage_5
      if (reset == 1'b1) begin
        delay_1_stage_5 <= 32'sb00000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          delay_1_stage_5 <= delay_input_stage_5;
        end
      end
    end



  assign gain_2_stage_5 = 32'sb10000011011101110000011100100011 * delay_1_stage_5;



  assign subtraction_1_cast_1_stage_5 = ((gain_1_stage_5[31] == 1'b0) && (gain_1_stage_5[30] != 1'b0) ? 40'sh7FFFFFFFFF :
              ((gain_1_stage_5[31] == 1'b1) && (gain_1_stage_5[30] != 1'b1) ? 40'sh8000000000 :
              {gain_1_stage_5[30:0], 9'b000000000}));
  assign subtraction_1_cast_2_stage_5 = {subtraction_1_cast_1_stage_5[39], subtraction_1_cast_1_stage_5};
  assign subtraction_1_cast_3_stage_5 = ({{2{gain_2_stage_5[63]}}, gain_2_stage_5[63:26]}) + $signed({1'b0, gain_2_stage_5[25] & (gain_2_stage_5[26] | (|gain_2_stage_5[24:0]))});
  assign subtraction_1_cast_4_stage_5 = {subtraction_1_cast_3_stage_5[39], subtraction_1_cast_3_stage_5};
  assign subtraction_1_temp_stage_5 = subtraction_1_cast_2_stage_5 - subtraction_1_cast_4_stage_5;
  assign subtraction_1_out_stage_5 = ((subtraction_1_temp_stage_5[40] == 1'b0) && (subtraction_1_temp_stage_5[39] != 1'b0) ? 40'sh7FFFFFFFFF :
              ((subtraction_1_temp_stage_5[40] == 1'b1) && (subtraction_1_temp_stage_5[39] != 1'b1) ? 40'sh8000000000 :
              $signed(subtraction_1_temp_stage_5[39:0])));



  assign subtraction_2_cast_1_stage_5 = {subtraction_1_out_stage_5[39], subtraction_1_out_stage_5};
  assign subtraction_2_cast_2_stage_5 = ({{2{gain_3_stage_5[63]}}, gain_3_stage_5[63:26]}) + $signed({1'b0, gain_3_stage_5[25] & (gain_3_stage_5[26] | (|gain_3_stage_5[24:0]))});
  assign subtraction_2_cast_3_stage_5 = {subtraction_2_cast_2_stage_5[39], subtraction_2_cast_2_stage_5};
  assign subtraction_2_temp_stage_5 = subtraction_2_cast_1_stage_5 - subtraction_2_cast_3_stage_5;
  assign subtraction_2_out_stage_5 = ((subtraction_2_temp_stage_5[40] == 1'b0) && (subtraction_2_temp_stage_5[39] != 1'b0) ? 40'sh7FFFFFFFFF :
              ((subtraction_2_temp_stage_5[40] == 1'b1) && (subtraction_2_temp_stage_5[39] != 1'b1) ? 40'sh8000000000 :
              $signed(subtraction_2_temp_stage_5[39:0])));



  assign delay_input_stage_5 = (((subtraction_2_out_stage_5[39] == 1'b0) && (subtraction_2_out_stage_5[38:35] != 4'b0000)) || ((subtraction_2_out_stage_5[39] == 1'b0) && (subtraction_2_out_stage_5[35:4] == 32'sb01111111111111111111111111111111)) ? 32'sb01111111111111111111111111111111 :
              ((subtraction_2_out_stage_5[39] == 1'b1) && (subtraction_2_out_stage_5[38:35] != 4'b1111) ? 32'sb10000000000000000000000000000000 :
              subtraction_2_out_stage_5[35:4] + $signed({1'b0, subtraction_2_out_stage_5[3] & (subtraction_2_out_stage_5[4] | (|subtraction_2_out_stage_5[2:0]))})));



  assign subtraction_3_cast_1_stage_5 = {{4{delay_input_stage_5[31]}}, {delay_input_stage_5, 4'b0000}};
  assign subtraction_3_cast_2_stage_5 = {{4{delay_2_stage_5[31]}}, {delay_2_stage_5, 4'b0000}};
  assign subtraction_3_out_stage_5 = subtraction_3_cast_1_stage_5 - subtraction_3_cast_2_stage_5;



  assign input_stage_6 = ((subtraction_3_out_stage_5[39] == 1'b0) && (subtraction_3_out_stage_5[38:8] == 31'b1111111111111111111111111111111) ? 32'sb01111111111111111111111111111111 :
              subtraction_3_out_stage_5[39:8] + $signed({1'b0, subtraction_3_out_stage_5[7] & (subtraction_3_out_stage_5[8] | (|subtraction_3_out_stage_5[6:0]))}));



  assign gain_1_stage_6_temp = 32'sb00000001001000010011000111101001 * input_stage_6;
  assign gain_1_stage_6 = ((gain_1_stage_6_temp[63] == 1'b0) && (gain_1_stage_6_temp[62:32] == 31'b1111111111111111111111111111111) ? 32'sb01111111111111111111111111111111 :
              gain_1_stage_6_temp[63:32] + $signed({1'b0, gain_1_stage_6_temp[31] & (gain_1_stage_6_temp[32] | (|gain_1_stage_6_temp[30:0]))}));



  always @(posedge clk or posedge reset)
    begin :  Second_Half_Of_The_Delay_Line_Stage_6
      if (reset == 1'b1) begin
        delay_2_stage_6 <= 32'sb00000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          delay_2_stage_6 <= delay_1_stage_6;
        end
      end
    end



  assign gain_3_stage_6 = 32'sb00111111010010000011011011101101 * delay_2_stage_6;



  always @(posedge clk or posedge reset)
    begin : First_Half_Of_The_Delay_Line_Stage_6
      if (reset == 1'b1) begin
        delay_1_stage_6 <= 32'sb00000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          delay_1_stage_6 <= delay_input_stage_6;
        end
      end
    end



  assign gain_2_stage_6 = 32'sb10000011000101000100100100010100 * delay_1_stage_6;



  assign subtraction_1_cast_1_stage_6 = ((gain_1_stage_6[31] == 1'b0) && (gain_1_stage_6[30] != 1'b0) ? 40'sh7FFFFFFFFF :
              ((gain_1_stage_6[31] == 1'b1) && (gain_1_stage_6[30] != 1'b1) ? 40'sh8000000000 :
              {gain_1_stage_6[30:0], 9'b000000000}));
  assign subtraction_1_cast_2_stage_6 = {subtraction_1_cast_1_stage_6[39], subtraction_1_cast_1_stage_6};
  assign subtraction_1_cast_3_stage_6 = ({{2{gain_2_stage_6[63]}}, gain_2_stage_6[63:26]}) + $signed({1'b0, gain_2_stage_6[25] & (gain_2_stage_6[26] | (|gain_2_stage_6[24:0]))});
  assign subtraction_1_cast_4_stage_6 = {subtraction_1_cast_3_stage_6[39], subtraction_1_cast_3_stage_6};
  assign subtraction_1_temp_stage_6 = subtraction_1_cast_2_stage_6 - subtraction_1_cast_4_stage_6;
  assign subtraction_1_out_stage_6 = ((subtraction_1_temp_stage_6[40] == 1'b0) && (subtraction_1_temp_stage_6[39] != 1'b0) ? 40'sh7FFFFFFFFF :
              ((subtraction_1_temp_stage_6[40] == 1'b1) && (subtraction_1_temp_stage_6[39] != 1'b1) ? 40'sh8000000000 :
              $signed(subtraction_1_temp_stage_6[39:0])));



  assign subtraction_2_cast_1_stage_6 = {subtraction_1_out_stage_6[39], subtraction_1_out_stage_6};
  assign subtraction_2_cast_2_stage_6 = ({{2{gain_3_stage_6[63]}}, gain_3_stage_6[63:26]}) + $signed({1'b0, gain_3_stage_6[25] & (gain_3_stage_6[26] | (|gain_3_stage_6[24:0]))});
  assign subtraction_2_cast_3_stage_6 = {subtraction_2_cast_2_stage_6[39], subtraction_2_cast_2_stage_6};
  assign subtraction_2_temp_stage_6 = subtraction_2_cast_1_stage_6 - subtraction_2_cast_3_stage_6;
  assign subtraction_2_out_stage_6 = ((subtraction_2_temp_stage_6[40] == 1'b0) && (subtraction_2_temp_stage_6[39] != 1'b0) ? 40'sh7FFFFFFFFF :
              ((subtraction_2_temp_stage_6[40] == 1'b1) && (subtraction_2_temp_stage_6[39] != 1'b1) ? 40'sh8000000000 :
              $signed(subtraction_2_temp_stage_6[39:0])));



  assign delay_input_stage_6 = (((subtraction_2_out_stage_6[39] == 1'b0) && (subtraction_2_out_stage_6[38:35] != 4'b0000)) || ((subtraction_2_out_stage_6[39] == 1'b0) && (subtraction_2_out_stage_6[35:4] == 32'sb01111111111111111111111111111111)) ? 32'sb01111111111111111111111111111111 :
              ((subtraction_2_out_stage_6[39] == 1'b1) && (subtraction_2_out_stage_6[38:35] != 4'b1111) ? 32'sb10000000000000000000000000000000 :
              subtraction_2_out_stage_6[35:4] + $signed({1'b0, subtraction_2_out_stage_6[3] & (subtraction_2_out_stage_6[4] | (|subtraction_2_out_stage_6[2:0]))})));



  assign subtraction_3_cast_1_stage_6 = {{4{delay_input_stage_6[31]}}, {delay_input_stage_6, 4'b0000}};
  assign subtraction_3_cast_2_stage_6 = {{4{delay_2_stage_6[31]}}, {delay_2_stage_6, 4'b0000}};
  assign subtraction_3_out_stage_6 = subtraction_3_cast_1_stage_6 - subtraction_3_cast_2_stage_6;



  assign stage_6_output = ((subtraction_3_out_stage_6[39] == 1'b0) && (subtraction_3_out_stage_6[38:8] == 31'b1111111111111111111111111111111) ? 32'sb01111111111111111111111111111111 :
              subtraction_3_out_stage_6[39:8] + $signed({1'b0, subtraction_3_out_stage_6[7] & (subtraction_3_out_stage_6[8] | (|subtraction_3_out_stage_6[6:0]))}));



  assign gain_1_final_output_temp = 32'sb01110010000101001000001011000000 * stage_6_output;
  assign gain_1_final_output = (((gain_1_final_output_temp[63] == 1'b0) && (gain_1_final_output_temp[62:58] != 5'b00000)) || ((gain_1_final_output_temp[63] == 1'b0) && (gain_1_final_output_temp[58:27] == 32'sb01111111111111111111111111111111)) ? 32'sb01111111111111111111111111111111 :
              ((gain_1_final_output_temp[63] == 1'b1) && (gain_1_final_output_temp[62:58] != 5'b11111) ? 32'sb10000000000000000000000000000000 :
              gain_1_final_output_temp[58:27] + $signed({1'b0, gain_1_final_output_temp[26] & (gain_1_final_output_temp[27] | (|gain_1_final_output_temp[25:0]))})));

  assign gain_1_final_output_22_bit = gain_1_final_output[29:8];

  assign filter_output = gain_1_final_output_22_bit;

  assign ce_out = clk_enable;

endmodule  // 8KHz_Bandpass_Filter

