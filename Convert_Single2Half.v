// ------------------------------------------------------------------------
// Convert the demodulator output from a double precision floating-point to
// a half precision floating poit to reduce the I/O count
// ------------------------------------------------------------------------

`timescale 1 us / 1 us

module Convert_Single2Half
          (nfp_in,
           nfp_out);


  input   [31:0] nfp_in;  // ufix32
  output  [15:0] nfp_out;  // ufix16


  wire aSign;  // ufix1
  wire [7:0] aExponent;  // ufix8
  wire [22:0] aMantissa;  // ufix23
  wire alpha142_out1;  // ufix1
  wire alpha102_out1;  // ufix1
  wire alpha113_out1;  // ufix1
  wire [10:0] Bit_Slice1_out1;  // ufix11
  wire Constant8_out1;  // ufix1
  wire [11:0] Bit_Concat_out1;  // ufix12
  wire [7:0] Constant4_out1;  // ufix8
  wire [7:0] Subtract_out1;  // ufix8
  wire [3:0] Data_Type_Conversion_out1;  // ufix4
  wire [7:0] dynamic_shift_1;  // uint8
  wire [11:0] Shift_Arithmetic_out1;  // ufix12
  wire [10:0] Bit_Slice2_out1;  // ufix11
  wire [10:0] Switch4_out1;  // ufix11
  wire LSB_out1;  // ufix1
  wire [11:0] Bit_Slice_out1;  // ufix12
  wire Compare_To_Zero_out1;  // ufix1
  wire Bit_Slice1_out1_1;  // ufix1
  wire Bit_Slice4_out1;  // ufix1
  wire Bit_Slice3_out1;  // ufix1
  wire Bit_Slice5_out1;  // ufix1
  wire Constant_out1;  // ufix1
  wire Bit_Slice11_out1;  // ufix1
  wire Bit_Slice10_out1;  // ufix1
  wire Bit_Slice9_out1;  // ufix1
  wire Bit_Slice8_out1;  // ufix1
  wire Bit_Slice7_out1;  // ufix1
  wire Bit_Slice6_out1;  // ufix1
  wire Bit_Slice5_out1_1;  // ufix1
  wire Bit_Slice4_out1_1;  // ufix1
  wire Bit_Slice3_out1_1;  // ufix1
  wire Bit_Slice2_out1_1;  // ufix1
  wire Bit_Slice1_out1_2;  // ufix1
  wire Bit_Slice_out1_1;  // ufix1
  wire Logical_Operator_out1;  // ufix1
  wire Logical_Operator1_out1;  // ufix1
  wire Logical_Operator2_out1;  // ufix1
  wire Logical_Operator3_out1;  // ufix1
  wire Logical_Operator4_out1;  // ufix1
  wire Logical_Operator5_out1;  // ufix1
  wire Logical_Operator6_out1;  // ufix1
  wire Logical_Operator7_out1;  // ufix1
  wire Logical_Operator8_out1;  // ufix1
  wire Logical_Operator9_out1;  // ufix1
  wire Logical_Operator10_out1;  // ufix1
  wire [11:0] Bit_Concat_out1_1;  // ufix12
  wire Bit_Slice8_out1_1;  // ufix1
  wire Switch6_out1;  // ufix1
  wire Bit_Slice9_out1_1;  // ufix1
  wire Bit_Slice12_out1;  // ufix1
  wire Switch1_out1;  // ufix1
  wire Switch8_out1;  // ufix1
  wire Bit_Slice13_out1;  // ufix1
  wire Bit_Slice14_out1;  // ufix1
  wire Switch2_out1;  // ufix1
  wire Bit_Slice15_out1;  // ufix1
  wire Bit_Slice16_out1;  // ufix1
  wire Switch3_out1;  // ufix1
  wire Switch9_out1;  // ufix1
  wire Switch7_out1;  // ufix1
  wire Bit_Slice17_out1;  // ufix1
  wire Bit_Slice18_out1;  // ufix1
  wire Switch4_out1_1;  // ufix1
  wire Bit_Slice19_out1;  // ufix1
  wire Bit_Slice10_out1_1;  // ufix1
  wire Switch5_out1;  // ufix1
  wire Switch10_out1;  // ufix1
  wire Bit_Slice11_out1_1;  // ufix1
  wire Switch11_out1;  // ufix1
  wire Switch12_out1;  // ufix1
  wire Logical_Operator4_out1_1;  // ufix1
  wire Round_out1;  // ufix1
  wire Logical_Operator3_out1_1;  // ufix1
  wire Logical_Operator6_out1_1;  // ufix1
  wire Logical_Operator5_out1_1;  // ufix1
  wire [10:0] Bit_Shift_out1;  // ufix11
  wire [10:0] Constant6_out1;  // ufix11
  wire [10:0] Subtract2_out1;  // ufix11
  wire [10:0] Switch5_out1_1;  // ufix11
  wire Round1_out1;  // ufix1
  wire [7:0] Constant5_out1;  // ufix8
  wire [7:0] Subtract1_out1;  // ufix8
  wire [4:0] Data_Type_Conversion1_out1;  // ufix5
  wire [4:0] Constant1_out1;  // ufix5
  wire [4:0] Switch1_out1_1;  // ufix5
  wire [4:0] Constant7_out1;  // ufix5
  wire [4:0] Subtract3_out1;  // ufix5
  wire [4:0] Switch6_out1_1;  // ufix5
  wire [4:0] Constant9_out1;  // ufix5
  wire [4:0] Switch7_out1_1;  // ufix5
  wire [4:0] Constant_out1_1;  // ufix5
  wire [4:0] Switch_out1;  // ufix5
  wire alpha255_out1;  // ufix1
  wire Compare_To_Zero1_out1;  // ufix1
  wire Logical_Operator_out1_1;  // ufix1
  wire [9:0] Round2_out1;  // ufix10
  wire Logical_Operator2_out1_1;  // ufix1
  wire Logical_Operator1_out1_1;  // ufix1
  wire [9:0] Constant3_out1;  // ufix10
  wire [9:0] Switch3_out1_1;  // ufix10
  wire [9:0] Constant2_out1;  // ufix10
  wire [9:0] Switch2_out1_1;  // ufix10
  wire [15:0] nfp_out_pack;  // ufix16


  // Split 32 bit word into FP sign, exponent, mantissa
  assign aSign = nfp_in[31];
  assign aExponent = nfp_in[30:23];
  assign aMantissa = nfp_in[22:0];



  assign alpha142_out1 = aExponent > 8'b10001110;



  assign alpha102_out1 = aExponent < 8'b01100110;



  assign alpha113_out1 = aExponent < 8'b01110001;



  assign Bit_Slice1_out1 = aMantissa[22:12];



  assign Constant8_out1 = 1'b1;



  assign Bit_Concat_out1 = {Constant8_out1, Bit_Slice1_out1};



  assign Constant4_out1 = 8'b01110001;



  assign Subtract_out1 = Constant4_out1 - aExponent;



  assign Data_Type_Conversion_out1 = Subtract_out1[3:0];



  assign dynamic_shift_1 = {4'b0, Data_Type_Conversion_out1};
  assign Shift_Arithmetic_out1 = Bit_Concat_out1 >>> dynamic_shift_1;



  assign Bit_Slice2_out1 = Shift_Arithmetic_out1[10:0];



  assign Switch4_out1 = (alpha113_out1 == 1'b0 ? Bit_Slice1_out1 :
              Bit_Slice2_out1);



  assign LSB_out1 = Switch4_out1[1];



  assign Bit_Slice_out1 = aMantissa[11:0];



  assign Compare_To_Zero_out1 = Bit_Slice_out1 != 12'b000000000000;



  assign Bit_Slice1_out1_1 = Data_Type_Conversion_out1[3];



  assign Bit_Slice4_out1 = Data_Type_Conversion_out1[2];



  assign Bit_Slice3_out1 = Data_Type_Conversion_out1[1];



  assign Bit_Slice5_out1 = Data_Type_Conversion_out1[0];



  assign Constant_out1 = 1'b0;



  assign Bit_Slice11_out1 = Bit_Concat_out1[11];



  assign Bit_Slice10_out1 = Bit_Concat_out1[10];



  assign Bit_Slice9_out1 = Bit_Concat_out1[9];



  assign Bit_Slice8_out1 = Bit_Concat_out1[8];



  assign Bit_Slice7_out1 = Bit_Concat_out1[7];



  assign Bit_Slice6_out1 = Bit_Concat_out1[6];



  assign Bit_Slice5_out1_1 = Bit_Concat_out1[5];



  assign Bit_Slice4_out1_1 = Bit_Concat_out1[4];



  assign Bit_Slice3_out1_1 = Bit_Concat_out1[3];



  assign Bit_Slice2_out1_1 = Bit_Concat_out1[2];



  assign Bit_Slice1_out1_2 = Bit_Concat_out1[1];



  assign Bit_Slice_out1_1 = Bit_Concat_out1[0];



  assign Logical_Operator_out1 = Bit_Slice1_out1_2 | Bit_Slice_out1_1;



  assign Logical_Operator1_out1 = Bit_Slice2_out1_1 | Logical_Operator_out1;



  assign Logical_Operator2_out1 = Bit_Slice3_out1_1 | Logical_Operator1_out1;



  assign Logical_Operator3_out1 = Bit_Slice4_out1_1 | Logical_Operator2_out1;



  assign Logical_Operator4_out1 = Bit_Slice5_out1_1 | Logical_Operator3_out1;



  assign Logical_Operator5_out1 = Bit_Slice6_out1 | Logical_Operator4_out1;



  assign Logical_Operator6_out1 = Bit_Slice7_out1 | Logical_Operator5_out1;



  assign Logical_Operator7_out1 = Bit_Slice8_out1 | Logical_Operator6_out1;



  assign Logical_Operator8_out1 = Bit_Slice9_out1 | Logical_Operator7_out1;



  assign Logical_Operator9_out1 = Bit_Slice10_out1 | Logical_Operator8_out1;



  assign Logical_Operator10_out1 = Bit_Slice11_out1 | Logical_Operator9_out1;



  assign Bit_Concat_out1_1 = {Logical_Operator10_out1, Logical_Operator9_out1, Logical_Operator8_out1, Logical_Operator7_out1, Logical_Operator6_out1, Logical_Operator5_out1, Logical_Operator4_out1, Logical_Operator3_out1, Logical_Operator2_out1, Logical_Operator1_out1, Logical_Operator_out1, Bit_Slice_out1_1};



  assign Bit_Slice8_out1_1 = Bit_Concat_out1_1[0];



  assign Switch6_out1 = (Bit_Slice5_out1 == 1'b0 ? Constant_out1 :
              Bit_Slice8_out1_1);



  assign Bit_Slice9_out1_1 = Bit_Concat_out1_1[1];



  assign Bit_Slice12_out1 = Bit_Concat_out1_1[2];



  assign Switch1_out1 = (Bit_Slice5_out1 == 1'b0 ? Bit_Slice9_out1_1 :
              Bit_Slice12_out1);



  assign Switch8_out1 = (Bit_Slice3_out1 == 1'b0 ? Switch6_out1 :
              Switch1_out1);



  assign Bit_Slice13_out1 = Bit_Concat_out1_1[3];



  assign Bit_Slice14_out1 = Bit_Concat_out1_1[4];



  assign Switch2_out1 = (Bit_Slice5_out1 == 1'b0 ? Bit_Slice13_out1 :
              Bit_Slice14_out1);



  assign Bit_Slice15_out1 = Bit_Concat_out1_1[5];



  assign Bit_Slice16_out1 = Bit_Concat_out1_1[6];



  assign Switch3_out1 = (Bit_Slice5_out1 == 1'b0 ? Bit_Slice15_out1 :
              Bit_Slice16_out1);



  assign Switch9_out1 = (Bit_Slice3_out1 == 1'b0 ? Switch2_out1 :
              Switch3_out1);



  assign Switch7_out1 = (Bit_Slice4_out1 == 1'b0 ? Switch8_out1 :
              Switch9_out1);



  assign Bit_Slice17_out1 = Bit_Concat_out1_1[7];



  assign Bit_Slice18_out1 = Bit_Concat_out1_1[8];



  assign Switch4_out1_1 = (Bit_Slice5_out1 == 1'b0 ? Bit_Slice17_out1 :
              Bit_Slice18_out1);



  assign Bit_Slice19_out1 = Bit_Concat_out1_1[9];



  assign Bit_Slice10_out1_1 = Bit_Concat_out1_1[10];



  assign Switch5_out1 = (Bit_Slice5_out1 == 1'b0 ? Bit_Slice19_out1 :
              Bit_Slice10_out1_1);



  assign Switch10_out1 = (Bit_Slice3_out1 == 1'b0 ? Switch4_out1_1 :
              Switch5_out1);



  assign Bit_Slice11_out1_1 = Bit_Concat_out1_1[11];



  assign Switch11_out1 = (Bit_Slice4_out1 == 1'b0 ? Switch10_out1 :
              Bit_Slice11_out1_1);



  assign Switch12_out1 = (Bit_Slice1_out1_1 == 1'b0 ? Switch7_out1 :
              Switch11_out1);



  assign Logical_Operator4_out1_1 = alpha113_out1 & Switch12_out1;



  assign Round_out1 = Switch4_out1[0];



  assign Logical_Operator3_out1_1 = Compare_To_Zero_out1 | Logical_Operator4_out1_1;



  assign Logical_Operator6_out1_1 = LSB_out1 | Logical_Operator3_out1_1;



  assign Logical_Operator5_out1_1 = Round_out1 & Logical_Operator6_out1_1;



  assign Bit_Shift_out1 = Switch4_out1 >> 8'd1;



  assign Constant6_out1 = 11'b00000000001;



  assign Subtract2_out1 = Constant6_out1 + Bit_Shift_out1;



  assign Switch5_out1_1 = (Logical_Operator5_out1_1 == 1'b0 ? Bit_Shift_out1 :
              Subtract2_out1);



  assign Round1_out1 = Switch5_out1_1[10];



  assign Constant5_out1 = 8'b01110000;



  assign Subtract1_out1 = aExponent - Constant5_out1;



  assign Data_Type_Conversion1_out1 = Subtract1_out1[4:0];



  assign Constant1_out1 = 5'b00000;



  assign Switch1_out1_1 = (alpha113_out1 == 1'b0 ? Data_Type_Conversion1_out1 :
              Constant1_out1);



  assign Constant7_out1 = 5'b00001;



  assign Subtract3_out1 = Switch1_out1_1 + Constant7_out1;



  assign Switch6_out1_1 = (Round1_out1 == 1'b0 ? Switch1_out1_1 :
              Subtract3_out1);



  assign Constant9_out1 = 5'b00000;



  assign Switch7_out1_1 = (alpha102_out1 == 1'b0 ? Switch6_out1_1 :
              Constant9_out1);



  assign Constant_out1_1 = 5'b11111;



  assign Switch_out1 = (alpha142_out1 == 1'b0 ? Switch7_out1_1 :
              Constant_out1_1);



  assign alpha255_out1 = aExponent == 8'b11111111;



  assign Compare_To_Zero1_out1 = Bit_Slice1_out1 != 11'b00000000000;



  assign Logical_Operator_out1_1 = alpha142_out1 | alpha102_out1;



  assign Round2_out1 = Switch5_out1_1[9:0];



  assign Logical_Operator2_out1_1 = Compare_To_Zero_out1 | Compare_To_Zero1_out1;



  assign Logical_Operator1_out1_1 = alpha255_out1 & Logical_Operator2_out1_1;



  assign Constant3_out1 = 10'b0000000000;



  assign Switch3_out1_1 = (Logical_Operator_out1_1 == 1'b0 ? Round2_out1 :
              Constant3_out1);



  assign Constant2_out1 = 10'b1000000000;



  assign Switch2_out1_1 = (Logical_Operator1_out1_1 == 1'b0 ? Switch3_out1_1 :
              Constant2_out1);



  // Combine FP sign, exponent, mantissa into 16 bit word
  assign nfp_out_pack = {aSign, Switch_out1, Switch2_out1_1};



  assign nfp_out = nfp_out_pack;

endmodule  // Convert_Single2Half

