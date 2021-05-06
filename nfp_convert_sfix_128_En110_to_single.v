// --------------------------------------------------------------------------------
// Conversion From Signed N128.Q110 Fixed Point to Single Precision Floating Point 
// --------------------------------------------------------------------------------

`timescale 1 us / 1 us

module nfp_convert_sfix_128_En110_to_single
          (nfp_in,
           nfp_out);


  input   signed [127:0] nfp_in;  // sfix128_En110
  output         [31:0] nfp_out;  // ufix32


  wire CompareToZero1_out1;
  wire Constant3_out1;
  wire Compare_To_Zero_out1;
  wire Logical_Operator_out1;
  wire Constant2_out1;
  wire Switch3_out1;
  wire [7:0] Constant9_out1;  // uint8
  wire [127:0] Delay_out1_dtc;  // ufix128_En110
  wire signed [127:0] ConstantS;  // sfix128_En110
  wire signed [127:0] Unary_Minus_out1;  // sfix128_En110
  wire [127:0] Unary_Minus_out1_dtc;  // ufix128_En110
  wire [127:0] Switch_out1;  // ufix128_En110
  wire [63:0] Bit_Slice14_out1;  // ufix64
  wire Bit_Slice32_out1;  // ufix1
  wire [7:0] Constant32_out1;  // uint8
  wire Bit_Slice33_out1;  // ufix1
  wire [7:0] Constant33_out1;  // uint8
  wire [7:0] Switch32_out1;  // uint8
  wire Bit_Slice34_out1;  // ufix1
  wire [7:0] Constant34_out1;  // uint8
  wire [7:0] Switch33_out1;  // uint8
  wire Bit_Slice1_out1;  // ufix1
  wire [7:0] Constant35_out1;  // uint8
  wire [7:0] Switch34_out1;  // uint8
  wire Bit_Slice2_out1;  // ufix1
  wire [7:0] Constant1_out1;  // uint8
  wire [7:0] Switch1_out1;  // uint8
  wire Bit_Slice3_out1;  // ufix1
  wire [7:0] Constant2_out1_1;  // uint8
  wire [7:0] Switch2_out1;  // uint8
  wire Bit_Slice4_out1;  // ufix1
  wire [7:0] Constant3_out1_1;  // uint8
  wire [7:0] Switch3_out1_1;  // uint8
  wire Bit_Slice5_out1;  // ufix1
  wire [7:0] Constant4_out1;  // uint8
  wire [7:0] Switch4_out1;  // uint8
  wire [7:0] Constant5_out1;  // uint8
  wire [7:0] Switch5_out1;  // uint8
  wire Bit_Slice27_out1;  // ufix1
  wire [7:0] Constant6_out1;  // uint8
  wire Bit_Slice15_out1;  // ufix1
  wire [7:0] Constant124_out1;  // uint8
  wire [7:0] Switch116_out1;  // uint8
  wire Bit_Slice16_out1;  // ufix1
  wire [7:0] Constant28_out1;  // uint8
  wire [7:0] Switch17_out1;  // uint8
  wire Bit_Slice17_out1;  // ufix1
  wire [7:0] Constant26_out1;  // uint8
  wire [7:0] Switch18_out1;  // uint8
  wire Bit_Slice28_out1;  // ufix1
  wire [7:0] Constant27_out1;  // uint8
  wire [7:0] Switch19_out1;  // uint8
  wire Bit_Slice29_out1;  // ufix1
  wire [7:0] Constant29_out1;  // uint8
  wire [7:0] Switch28_out1;  // uint8
  wire Bit_Slice30_out1;  // ufix1
  wire [7:0] Constant30_out1;  // uint8
  wire [7:0] Switch29_out1;  // uint8
  wire Bit_Slice31_out1;  // ufix1
  wire [7:0] Constant31_out1;  // uint8
  wire [7:0] Switch30_out1;  // uint8
  wire Compare_To_Constant_out1;
  wire [7:0] Constant7_out1;  // uint8
  wire [7:0] Switch31_out1;  // uint8
  wire [7:0] Switch_out1_1;  // uint8
  wire Compare_To_Constant2_out1;
  wire Bit_Slice6_out1;  // ufix1
  wire [7:0] Constant15_out1;  // uint8
  wire Bit_Slice7_out1;  // ufix1
  wire [7:0] Constant11_out1;  // uint8
  wire [7:0] Switch9_out1;  // uint8
  wire Bit_Slice8_out1;  // ufix1
  wire [7:0] Constant12_out1;  // uint8
  wire [7:0] Switch10_out1;  // uint8
  wire Bit_Slice9_out1;  // ufix1
  wire [7:0] Constant13_out1;  // uint8
  wire [7:0] Switch11_out1;  // uint8
  wire Bit_Slice35_out1;  // ufix1
  wire [7:0] Constant14_out1;  // uint8
  wire [7:0] Switch12_out1;  // uint8
  wire Bit_Slice26_out1;  // ufix1
  wire [7:0] Constant36_out1;  // uint8
  wire [7:0] Switch35_out1;  // uint8
  wire Bit_Slice25_out1;  // ufix1
  wire [7:0] Constant10_out1;  // uint8
  wire [7:0] Switch8_out1;  // uint8
  wire Bit_Slice24_out1;  // ufix1
  wire [7:0] Constant9_out1_1;  // uint8
  wire [7:0] Switch7_out1;  // uint8
  wire [7:0] Constant8_out1;  // uint8
  wire [7:0] Switch6_out1;  // uint8
  wire Bit_Slice13_out1;  // ufix1
  wire [7:0] Constant18_out1;  // uint8
  wire Bit_Slice14_out1_1;  // ufix1
  wire [7:0] Constant16_out1;  // uint8
  wire [7:0] Switch13_out1;  // uint8
  wire Bit_Slice10_out1;  // ufix1
  wire [7:0] Constant17_out1;  // uint8
  wire [7:0] Switch14_out1;  // uint8
  wire Bit_Slice11_out1;  // ufix1
  wire [7:0] Constant21_out1;  // uint8
  wire [7:0] Switch15_out1;  // uint8
  wire Bit_Slice12_out1;  // ufix1
  wire [7:0] Constant19_out1;  // uint8
  wire [7:0] Switch16_out1;  // uint8
  wire Bit_Slice18_out1;  // ufix1
  wire [7:0] Constant20_out1;  // uint8
  wire [7:0] Switch20_out1;  // uint8
  wire Bit_Slice19_out1;  // ufix1
  wire [7:0] Constant22_out1;  // uint8
  wire [7:0] Switch21_out1;  // uint8
  wire Bit_Slice20_out1;  // ufix1
  wire [7:0] Constant23_out1;  // uint8
  wire [7:0] Switch22_out1;  // uint8
  wire Compare_To_Constant1_out1;
  wire [7:0] Constant24_out1;  // uint8
  wire [7:0] Switch23_out1;  // uint8
  wire [7:0] Switch1_out1_1;  // uint8
  wire [7:0] Switch2_out1_1;  // uint8
  wire Compare_To_Constant6_out1;
  wire Bit_Slice30_out1_1;  // ufix1
  wire [7:0] Constant30_out1_1;  // uint8
  wire Bit_Slice31_out1_1;  // ufix1
  wire [7:0] Constant31_out1_1;  // uint8
  wire [7:0] Switch30_out1_1;  // uint8
  wire Bit_Slice32_out1_1;  // ufix1
  wire [7:0] Constant32_out1_1;  // uint8
  wire [7:0] Switch31_out1_1;  // uint8
  wire Bit_Slice33_out1_1;  // ufix1
  wire [7:0] Constant33_out1_1;  // uint8
  wire [7:0] Switch32_out1_1;  // uint8
  wire Bit_Slice34_out1_1;  // ufix1
  wire [7:0] Constant34_out1_1;  // uint8
  wire [7:0] Switch33_out1_1;  // uint8
  wire Bit_Slice35_out1_1;  // ufix1
  wire [7:0] Constant35_out1_1;  // uint8
  wire [7:0] Switch34_out1_1;  // uint8
  wire Bit_Slice26_out1_1;  // ufix1
  wire [7:0] Constant36_out1_1;  // uint8
  wire [7:0] Switch35_out1_1;  // uint8
  wire Bit_Slice25_out1_1;  // ufix1
  wire [7:0] Constant3_out1_2;  // uint8
  wire [7:0] Switch3_out1_2;  // uint8
  wire [7:0] Constant2_out1_2;  // uint8
  wire [7:0] Switch2_out1_2;  // uint8
  wire Bit_Slice1_out1_1;  // ufix1
  wire [7:0] Constant5_out1_1;  // uint8
  wire Bit_Slice24_out1_1;  // ufix1
  wire [7:0] Constant4_out1_1;  // uint8
  wire [7:0] Switch4_out1_1;  // uint8
  wire Bit_Slice27_out1_1;  // ufix1
  wire [7:0] Constant1_out1_1;  // uint8
  wire [7:0] Switch1_out1_2;  // uint8
  wire Bit_Slice15_out1_1;  // ufix1
  wire [7:0] Constant124_out1_1;  // uint8
  wire [7:0] Switch116_out1_1;  // uint8
  wire Bit_Slice16_out1_1;  // ufix1
  wire [7:0] Constant28_out1_1;  // uint8
  wire [7:0] Switch17_out1_1;  // uint8
  wire Bit_Slice17_out1_1;  // ufix1
  wire [7:0] Constant26_out1_1;  // uint8
  wire [7:0] Switch18_out1_1;  // uint8
  wire Bit_Slice28_out1_1;  // ufix1
  wire [7:0] Constant27_out1_1;  // uint8
  wire [7:0] Switch19_out1_1;  // uint8
  wire Bit_Slice29_out1_1;  // ufix1
  wire [7:0] Constant29_out1_1;  // uint8
  wire [7:0] Switch28_out1_1;  // uint8
  wire Compare_To_Constant3_out1;
  wire [7:0] Constant6_out1_1;  // uint8
  wire [7:0] Switch29_out1_1;  // uint8
  wire [7:0] Switch3_out1_3;  // uint8
  wire Compare_To_Constant5_out1;
  wire Bit_Slice3_out1_1;  // ufix1
  wire [7:0] Constant7_out1_1;  // uint8
  wire Bit_Slice4_out1_1;  // ufix1
  wire [7:0] Constant9_out1_2;  // uint8
  wire [7:0] Switch5_out1_1;  // uint8
  wire Bit_Slice5_out1_1;  // ufix1
  wire [7:0] Constant10_out1_1;  // uint8
  wire [7:0] Switch7_out1_1;  // uint8
  wire Bit_Slice6_out1_1;  // ufix1
  wire [7:0] Constant11_out1_1;  // uint8
  wire [7:0] Switch8_out1_1;  // uint8
  wire Bit_Slice7_out1_1;  // ufix1
  wire [7:0] Constant12_out1_1;  // uint8
  wire [7:0] Switch9_out1_1;  // uint8
  wire Bit_Slice8_out1_1;  // ufix1
  wire [7:0] Constant13_out1_1;  // uint8
  wire [7:0] Switch10_out1_1;  // uint8
  wire Bit_Slice9_out1_1;  // ufix1
  wire [7:0] Constant14_out1_1;  // uint8
  wire [7:0] Switch11_out1_1;  // uint8
  wire Bit_Slice2_out1_1;  // ufix1
  wire [7:0] Constant15_out1_1;  // uint8
  wire [7:0] Switch12_out1_1;  // uint8
  wire [7:0] Constant8_out1_1;  // uint8
  wire [7:0] Switch6_out1_1;  // uint8
  wire Bit_Slice18_out1_1;  // ufix1
  wire [7:0] Constant24_out1_1;  // uint8
  wire Bit_Slice14_out1_2;  // ufix1
  wire [7:0] Constant23_out1_1;  // uint8
  wire [7:0] Switch23_out1_1;  // uint8
  wire Bit_Slice13_out1_1;  // ufix1
  wire [7:0] Constant18_out1_1;  // uint8
  wire [7:0] Switch21_out1_1;  // uint8
  wire Bit_Slice19_out1_1;  // ufix1
  wire [7:0] Constant16_out1_1;  // uint8
  wire [7:0] Switch13_out1_1;  // uint8
  wire Bit_Slice10_out1_1;  // ufix1
  wire [7:0] Constant17_out1_1;  // uint8
  wire [7:0] Switch14_out1_1;  // uint8
  wire Bit_Slice11_out1_1;  // ufix1
  wire [7:0] Constant21_out1_1;  // uint8
  wire [7:0] Switch15_out1_1;  // uint8
  wire Bit_Slice12_out1_1;  // ufix1
  wire [7:0] Constant19_out1_1;  // uint8
  wire [7:0] Switch16_out1_1;  // uint8
  wire Bit_Slice20_out1_1;  // ufix1
  wire [7:0] Constant20_out1_1;  // uint8
  wire [7:0] Switch20_out1_1;  // uint8
  wire Compare_To_Constant4_out1;
  wire [7:0] Constant22_out1_1;  // uint8
  wire [7:0] Switch22_out1_1;  // uint8
  wire [7:0] Switch4_out1_2;  // uint8
  wire [7:0] Switch5_out1_2;  // uint8
  wire [7:0] Switch6_out1_2;  // uint8
  wire [7:0] Sum7_out1;  // uint8
  wire Compare_To_Constant2_out1_1;
  wire [63:0] Bit_Slice13_out1_2;  // ufix64
  wire Bit_Slice13_out1_3;  // ufix1
  wire [7:0] Constant19_out1_2;  // uint8
  wire Bit_Slice14_out1_3;  // ufix1
  wire [7:0] Constant20_out1_2;  // uint8
  wire [7:0] Switch16_out1_2;  // uint8
  wire Bit_Slice18_out1_2;  // ufix1
  wire [7:0] Constant21_out1_2;  // uint8
  wire [7:0] Switch20_out1_2;  // uint8
  wire Bit_Slice10_out1_2;  // ufix1
  wire [7:0] Constant22_out1_2;  // uint8
  wire [7:0] Switch21_out1_2;  // uint8
  wire Bit_Slice11_out1_2;  // ufix1
  wire [7:0] Constant16_out1_2;  // uint8
  wire [7:0] Switch13_out1_2;  // uint8
  wire Bit_Slice12_out1_2;  // ufix1
  wire [7:0] Constant17_out1_2;  // uint8
  wire [7:0] Switch14_out1_2;  // uint8
  wire Bit_Slice19_out1_2;  // ufix1
  wire [7:0] Constant18_out1_2;  // uint8
  wire [7:0] Switch15_out1_2;  // uint8
  wire Bit_Slice20_out1_2;  // ufix1
  wire [7:0] Constant23_out1_2;  // uint8
  wire [7:0] Switch22_out1_2;  // uint8
  wire [7:0] Constant24_out1_2;  // uint8
  wire [7:0] Switch23_out1_2;  // uint8
  wire Bit_Slice5_out1_2;  // ufix1
  wire [7:0] Constant7_out1_2;  // uint8
  wire Bit_Slice2_out1_2;  // ufix1
  wire [7:0] Constant8_out1_2;  // uint8
  wire [7:0] Switch5_out1_3;  // uint8
  wire Bit_Slice3_out1_2;  // ufix1
  wire [7:0] Constant11_out1_2;  // uint8
  wire [7:0] Switch6_out1_3;  // uint8
  wire Bit_Slice4_out1_2;  // ufix1
  wire [7:0] Constant9_out1_3;  // uint8
  wire [7:0] Switch7_out1_2;  // uint8
  wire Bit_Slice6_out1_2;  // ufix1
  wire [7:0] Constant10_out1_2;  // uint8
  wire [7:0] Switch8_out1_2;  // uint8
  wire Bit_Slice7_out1_2;  // ufix1
  wire [7:0] Constant12_out1_2;  // uint8
  wire [7:0] Switch9_out1_2;  // uint8
  wire Bit_Slice8_out1_2;  // ufix1
  wire [7:0] Constant13_out1_2;  // uint8
  wire [7:0] Switch10_out1_2;  // uint8
  wire Bit_Slice9_out1_2;  // ufix1
  wire [7:0] Constant14_out1_2;  // uint8
  wire [7:0] Switch11_out1_2;  // uint8
  wire Compare_To_Constant_out1_1;
  wire [7:0] Constant15_out1_2;  // uint8
  wire [7:0] Switch12_out1_2;  // uint8
  wire [7:0] Switch_out1_2;  // uint8
  wire Compare_To_Constant2_out1_2;
  wire Bit_Slice31_out1_2;  // ufix1
  wire [7:0] Constant5_out1_2;  // uint8
  wire Bit_Slice32_out1_2;  // ufix1
  wire [7:0] Constant32_out1_2;  // uint8
  wire [7:0] Switch31_out1_2;  // uint8
  wire Bit_Slice33_out1_2;  // ufix1
  wire [7:0] Constant33_out1_2;  // uint8
  wire [7:0] Switch32_out1_2;  // uint8
  wire Bit_Slice34_out1_2;  // ufix1
  wire [7:0] Constant34_out1_2;  // uint8
  wire [7:0] Switch33_out1_2;  // uint8
  wire Bit_Slice35_out1_2;  // ufix1
  wire [7:0] Constant35_out1_2;  // uint8
  wire [7:0] Switch34_out1_2;  // uint8
  wire Bit_Slice26_out1_2;  // ufix1
  wire [7:0] Constant36_out1_2;  // uint8
  wire [7:0] Switch35_out1_2;  // uint8
  wire Bit_Slice25_out1_2;  // ufix1
  wire [7:0] Constant3_out1_3;  // uint8
  wire [7:0] Switch3_out1_4;  // uint8
  wire Bit_Slice1_out1_2;  // ufix1
  wire [7:0] Constant6_out1_2;  // uint8
  wire [7:0] Switch2_out1_3;  // uint8
  wire [7:0] Constant4_out1_2;  // uint8
  wire [7:0] Switch4_out1_3;  // uint8
  wire Bit_Slice24_out1_2;  // ufix1
  wire [7:0] Constant2_out1_3;  // uint8
  wire Bit_Slice27_out1_2;  // ufix1
  wire [7:0] Constant1_out1_2;  // uint8
  wire [7:0] Switch1_out1_3;  // uint8
  wire Bit_Slice15_out1_2;  // ufix1
  wire [7:0] Constant124_out1_2;  // uint8
  wire [7:0] Switch116_out1_2;  // uint8
  wire Bit_Slice16_out1_2;  // ufix1
  wire [7:0] Constant28_out1_2;  // uint8
  wire [7:0] Switch17_out1_2;  // uint8
  wire Bit_Slice17_out1_2;  // ufix1
  wire [7:0] Constant26_out1_2;  // uint8
  wire [7:0] Switch18_out1_2;  // uint8
  wire Bit_Slice28_out1_2;  // ufix1
  wire [7:0] Constant27_out1_2;  // uint8
  wire [7:0] Switch19_out1_2;  // uint8
  wire Bit_Slice29_out1_2;  // ufix1
  wire [7:0] Constant29_out1_2;  // uint8
  wire [7:0] Switch28_out1_2;  // uint8
  wire Bit_Slice30_out1_2;  // ufix1
  wire [7:0] Constant30_out1_2;  // uint8
  wire [7:0] Switch29_out1_2;  // uint8
  wire Compare_To_Constant1_out1_1;
  wire [7:0] Constant31_out1_2;  // uint8
  wire [7:0] Switch30_out1_2;  // uint8
  wire [7:0] Switch1_out1_4;  // uint8
  wire [7:0] Switch2_out1_4;  // uint8
  wire Compare_To_Constant6_out1_1;
  wire Bit_Slice30_out1_3;  // ufix1
  wire [7:0] Constant30_out1_3;  // uint8
  wire Bit_Slice31_out1_3;  // ufix1
  wire [7:0] Constant31_out1_3;  // uint8
  wire [7:0] Switch30_out1_3;  // uint8
  wire Bit_Slice32_out1_3;  // ufix1
  wire [7:0] Constant32_out1_3;  // uint8
  wire [7:0] Switch31_out1_3;  // uint8
  wire Bit_Slice33_out1_3;  // ufix1
  wire [7:0] Constant33_out1_3;  // uint8
  wire [7:0] Switch32_out1_3;  // uint8
  wire Bit_Slice34_out1_3;  // ufix1
  wire [7:0] Constant34_out1_3;  // uint8
  wire [7:0] Switch33_out1_3;  // uint8
  wire Bit_Slice35_out1_3;  // ufix1
  wire [7:0] Constant35_out1_3;  // uint8
  wire [7:0] Switch34_out1_3;  // uint8
  wire Bit_Slice26_out1_3;  // ufix1
  wire [7:0] Constant36_out1_3;  // uint8
  wire [7:0] Switch35_out1_3;  // uint8
  wire Bit_Slice25_out1_3;  // ufix1
  wire [7:0] Constant3_out1_4;  // uint8
  wire [7:0] Switch3_out1_5;  // uint8
  wire [7:0] Constant2_out1_4;  // uint8
  wire [7:0] Switch2_out1_5;  // uint8
  wire Bit_Slice1_out1_3;  // ufix1
  wire [7:0] Constant5_out1_3;  // uint8
  wire Bit_Slice24_out1_3;  // ufix1
  wire [7:0] Constant4_out1_3;  // uint8
  wire [7:0] Switch4_out1_4;  // uint8
  wire Bit_Slice27_out1_3;  // ufix1
  wire [7:0] Constant1_out1_3;  // uint8
  wire [7:0] Switch1_out1_5;  // uint8
  wire Bit_Slice15_out1_3;  // ufix1
  wire [7:0] Constant124_out1_3;  // uint8
  wire [7:0] Switch116_out1_3;  // uint8
  wire Bit_Slice16_out1_3;  // ufix1
  wire [7:0] Constant28_out1_3;  // uint8
  wire [7:0] Switch17_out1_3;  // uint8
  wire Bit_Slice17_out1_3;  // ufix1
  wire [7:0] Constant26_out1_3;  // uint8
  wire [7:0] Switch18_out1_3;  // uint8
  wire Bit_Slice28_out1_3;  // ufix1
  wire [7:0] Constant27_out1_3;  // uint8
  wire [7:0] Switch19_out1_3;  // uint8
  wire Bit_Slice29_out1_3;  // ufix1
  wire [7:0] Constant29_out1_3;  // uint8
  wire [7:0] Switch28_out1_3;  // uint8
  wire Compare_To_Constant3_out1_1;
  wire [7:0] Constant6_out1_3;  // uint8
  wire [7:0] Switch29_out1_3;  // uint8
  wire [7:0] Switch3_out1_6;  // uint8
  wire Compare_To_Constant5_out1_1;
  wire Bit_Slice3_out1_3;  // ufix1
  wire [7:0] Constant7_out1_3;  // uint8
  wire Bit_Slice4_out1_3;  // ufix1
  wire [7:0] Constant9_out1_4;  // uint8
  wire [7:0] Switch5_out1_4;  // uint8
  wire Bit_Slice5_out1_3;  // ufix1
  wire [7:0] Constant10_out1_3;  // uint8
  wire [7:0] Switch7_out1_3;  // uint8
  wire Bit_Slice6_out1_3;  // ufix1
  wire [7:0] Constant11_out1_3;  // uint8
  wire [7:0] Switch8_out1_3;  // uint8
  wire Bit_Slice7_out1_3;  // ufix1
  wire [7:0] Constant12_out1_3;  // uint8
  wire [7:0] Switch9_out1_3;  // uint8
  wire Bit_Slice8_out1_3;  // ufix1
  wire [7:0] Constant13_out1_3;  // uint8
  wire [7:0] Switch10_out1_3;  // uint8
  wire Bit_Slice9_out1_3;  // ufix1
  wire [7:0] Constant14_out1_3;  // uint8
  wire [7:0] Switch11_out1_3;  // uint8
  wire Bit_Slice2_out1_3;  // ufix1
  wire [7:0] Constant15_out1_3;  // uint8
  wire [7:0] Switch12_out1_3;  // uint8
  wire [7:0] Constant8_out1_3;  // uint8
  wire [7:0] Switch6_out1_4;  // uint8
  wire Bit_Slice18_out1_3;  // ufix1
  wire [7:0] Constant24_out1_3;  // uint8
  wire Bit_Slice14_out1_4;  // ufix1
  wire [7:0] Constant23_out1_3;  // uint8
  wire [7:0] Switch23_out1_3;  // uint8
  wire Bit_Slice13_out1_4;  // ufix1
  wire [7:0] Constant18_out1_3;  // uint8
  wire [7:0] Switch21_out1_3;  // uint8
  wire Bit_Slice19_out1_3;  // ufix1
  wire [7:0] Constant16_out1_3;  // uint8
  wire [7:0] Switch13_out1_3;  // uint8
  wire Bit_Slice10_out1_3;  // ufix1
  wire [7:0] Constant17_out1_3;  // uint8
  wire [7:0] Switch14_out1_3;  // uint8
  wire Bit_Slice11_out1_3;  // ufix1
  wire [7:0] Constant21_out1_3;  // uint8
  wire [7:0] Switch15_out1_3;  // uint8
  wire Bit_Slice12_out1_3;  // ufix1
  wire [7:0] Constant19_out1_3;  // uint8
  wire [7:0] Switch16_out1_3;  // uint8
  wire Bit_Slice20_out1_3;  // ufix1
  wire [7:0] Constant20_out1_3;  // uint8
  wire [7:0] Switch20_out1_3;  // uint8
  wire Compare_To_Constant4_out1_1;
  wire [7:0] Constant22_out1_3;  // uint8
  wire [7:0] Switch22_out1_3;  // uint8
  wire [7:0] Switch4_out1_5;  // uint8
  wire [7:0] Switch5_out1_5;  // uint8
  wire [7:0] Switch6_out1_5;  // uint8
  wire [7:0] Switch14_out1_4;  // uint8
  wire signed [7:0] Constant_out1;  // int8
  wire signed [9:0] Subtract_add_temp;  // sfix10
  wire signed [9:0] Subtract_2;  // sfix10
  wire signed [9:0] Subtract_3;  // sfix10
  wire signed [8:0] Subtract_out1;  // sfix9
  wire [7:0] Subtract_out1_dtc;  // uint8
  wire [7:0] Switch_out1_3;  // uint8
  wire [7:0] Constant_out1_1;  // uint8
  wire signed [8:0] Subtract_5;  // sfix9
  wire signed [8:0] Subtract_6;  // sfix9
  wire signed [8:0] Subtract_out1_1;  // sfix9
  wire signed [8:0] shift_arithmetic_zerosig;  // sfix9
  wire signed [8:0] shift_arithmetic_selsig;  // sfix9
  wire signed [8:0] dynamic_shift_zerosig;  // sfix9
  wire signed [8:0] dynamic_shift_selsig;  // sfix9
  wire signed [15:0] dynamic_shift_cast;  // int16
  wire [127:0] Shift_Arithmetic_out1;  // ufix128_En110
  wire [59:0] Bit_Slice1_out1_4;  // ufix60
  wire [1:0] Bit_Slice2_out1_4;  // ufix2
  wire Bit_Slice4_out1_4;  // ufix1
  wire [34:0] Bit_Slice1_out1_5;  // ufix35
  wire Bit_Reduce_out1;  // ufix1
  wire Bit_Slice5_out1_4;  // ufix1
  wire Bit_Slice3_out1_4;  // ufix1
  wire Logical_Operator1_out1;
  wire Logical_Operator_out1_1;
  wire Constant1_out1_4;  // ufix1
  wire [22:0] Bit_Slice1_out1_6;  // ufix23
  wire [22:0] Constant_out1_2;  // ufix23
  wire [31:0] Add_add_temp;  // ufix32
  wire [31:0] Add_1;  // ufix32
  wire [31:0] Add_2;  // ufix32
  wire [23:0] Add_out1;  // ufix24
  wire Bit_Slice_out1;  // ufix1
  wire Switch1_out1_6;  // ufix1
  wire [7:0] Add1_1;  // ufix8
  wire [7:0] Add1_out1;  // uint8
  wire [7:0] Constant_out1_3;  // uint8
  wire [7:0] Switch1_out1_7;  // uint8
  wire [22:0] Bit_Slice2_out1_5;  // ufix23
  wire [22:0] Switch_out1_4;  // ufix23
  wire [22:0] Constant1_out1_5;  // ufix23
  wire [22:0] Switch2_out1_6;  // ufix23
  wire [31:0] nfp_out_pack;  // ufix32

  // 4
  // 
  // 4


  assign CompareToZero1_out1 = nfp_in == 128'sh00000000000000000000000000000000;



  assign Constant3_out1 = 1'b1;



  assign Compare_To_Zero_out1 = nfp_in < 128'sh00000000000000000000000000000000;



  assign Logical_Operator_out1 = Constant3_out1 & Compare_To_Zero_out1;



  assign Constant2_out1 = 1'b0;



  assign Switch3_out1 = (CompareToZero1_out1 == 1'b0 ? Logical_Operator_out1 :
              Constant2_out1);



  assign Constant9_out1 = 8'b01000000;



  assign Delay_out1_dtc = nfp_in;



  assign ConstantS = 128'sh00000000000000000000000000000000;



  assign Unary_Minus_out1 = ConstantS - nfp_in;



  assign Unary_Minus_out1_dtc = Unary_Minus_out1;



  assign Switch_out1 = (Logical_Operator_out1 == 1'b0 ? Delay_out1_dtc :
              Unary_Minus_out1_dtc);



  assign Bit_Slice14_out1 = Switch_out1[127:64];



  assign Bit_Slice32_out1 = Bit_Slice14_out1[56];



  assign Constant32_out1 = 8'b00111000;



  assign Bit_Slice33_out1 = Bit_Slice14_out1[57];



  assign Constant33_out1 = 8'b00111001;



  assign Switch32_out1 = (Bit_Slice32_out1 == 1'b0 ? Constant32_out1 :
              Constant33_out1);



  assign Bit_Slice34_out1 = Bit_Slice14_out1[58];



  assign Constant34_out1 = 8'b00111010;



  assign Switch33_out1 = (Bit_Slice33_out1 == 1'b0 ? Switch32_out1 :
              Constant34_out1);



  assign Bit_Slice1_out1 = Bit_Slice14_out1[59];



  assign Constant35_out1 = 8'b00111011;



  assign Switch34_out1 = (Bit_Slice34_out1 == 1'b0 ? Switch33_out1 :
              Constant35_out1);



  assign Bit_Slice2_out1 = Bit_Slice14_out1[60];



  assign Constant1_out1 = 8'b00111100;



  assign Switch1_out1 = (Bit_Slice1_out1 == 1'b0 ? Switch34_out1 :
              Constant1_out1);



  assign Bit_Slice3_out1 = Bit_Slice14_out1[61];



  assign Constant2_out1_1 = 8'b00111101;



  assign Switch2_out1 = (Bit_Slice2_out1 == 1'b0 ? Switch1_out1 :
              Constant2_out1_1);



  assign Bit_Slice4_out1 = Bit_Slice14_out1[62];



  assign Constant3_out1_1 = 8'b00111110;



  assign Switch3_out1_1 = (Bit_Slice3_out1 == 1'b0 ? Switch2_out1 :
              Constant3_out1_1);



  assign Bit_Slice5_out1 = Bit_Slice14_out1[63];



  assign Constant4_out1 = 8'b00111111;



  assign Switch4_out1 = (Bit_Slice4_out1 == 1'b0 ? Switch3_out1_1 :
              Constant4_out1);



  assign Constant5_out1 = 8'b01000000;



  assign Switch5_out1 = (Bit_Slice5_out1 == 1'b0 ? Switch4_out1 :
              Constant5_out1);



  assign Bit_Slice27_out1 = Bit_Slice14_out1[48];



  assign Constant6_out1 = 8'b00110000;



  assign Bit_Slice15_out1 = Bit_Slice14_out1[49];



  assign Constant124_out1 = 8'b00110001;



  assign Switch116_out1 = (Bit_Slice27_out1 == 1'b0 ? Constant6_out1 :
              Constant124_out1);



  assign Bit_Slice16_out1 = Bit_Slice14_out1[50];



  assign Constant28_out1 = 8'b00110010;



  assign Switch17_out1 = (Bit_Slice15_out1 == 1'b0 ? Switch116_out1 :
              Constant28_out1);



  assign Bit_Slice17_out1 = Bit_Slice14_out1[51];



  assign Constant26_out1 = 8'b00110011;



  assign Switch18_out1 = (Bit_Slice16_out1 == 1'b0 ? Switch17_out1 :
              Constant26_out1);



  assign Bit_Slice28_out1 = Bit_Slice14_out1[52];



  assign Constant27_out1 = 8'b00110100;



  assign Switch19_out1 = (Bit_Slice17_out1 == 1'b0 ? Switch18_out1 :
              Constant27_out1);



  assign Bit_Slice29_out1 = Bit_Slice14_out1[53];



  assign Constant29_out1 = 8'b00110101;



  assign Switch28_out1 = (Bit_Slice28_out1 == 1'b0 ? Switch19_out1 :
              Constant29_out1);



  assign Bit_Slice30_out1 = Bit_Slice14_out1[54];



  assign Constant30_out1 = 8'b00110110;



  assign Switch29_out1 = (Bit_Slice29_out1 == 1'b0 ? Switch28_out1 :
              Constant30_out1);



  assign Bit_Slice31_out1 = Bit_Slice14_out1[55];



  assign Constant31_out1 = 8'b00110111;



  assign Switch30_out1 = (Bit_Slice30_out1 == 1'b0 ? Switch29_out1 :
              Constant31_out1);



  assign Compare_To_Constant_out1 = Switch5_out1 > 8'b00111000;



  assign Constant7_out1 = 8'b00111000;



  assign Switch31_out1 = (Bit_Slice31_out1 == 1'b0 ? Switch30_out1 :
              Constant7_out1);



  assign Switch_out1_1 = (Compare_To_Constant_out1 == 1'b0 ? Switch31_out1 :
              Switch5_out1);



  assign Compare_To_Constant2_out1 = Switch_out1_1 > 8'b00110000;



  assign Bit_Slice6_out1 = Bit_Slice14_out1[40];



  assign Constant15_out1 = 8'b00101000;



  assign Bit_Slice7_out1 = Bit_Slice14_out1[41];



  assign Constant11_out1 = 8'b00101001;



  assign Switch9_out1 = (Bit_Slice6_out1 == 1'b0 ? Constant15_out1 :
              Constant11_out1);



  assign Bit_Slice8_out1 = Bit_Slice14_out1[42];



  assign Constant12_out1 = 8'b00101010;



  assign Switch10_out1 = (Bit_Slice7_out1 == 1'b0 ? Switch9_out1 :
              Constant12_out1);



  assign Bit_Slice9_out1 = Bit_Slice14_out1[43];



  assign Constant13_out1 = 8'b00101011;



  assign Switch11_out1 = (Bit_Slice8_out1 == 1'b0 ? Switch10_out1 :
              Constant13_out1);



  assign Bit_Slice35_out1 = Bit_Slice14_out1[44];



  assign Constant14_out1 = 8'b00101100;



  assign Switch12_out1 = (Bit_Slice9_out1 == 1'b0 ? Switch11_out1 :
              Constant14_out1);



  assign Bit_Slice26_out1 = Bit_Slice14_out1[45];



  assign Constant36_out1 = 8'b00101101;



  assign Switch35_out1 = (Bit_Slice35_out1 == 1'b0 ? Switch12_out1 :
              Constant36_out1);



  assign Bit_Slice25_out1 = Bit_Slice14_out1[46];



  assign Constant10_out1 = 8'b00101110;



  assign Switch8_out1 = (Bit_Slice26_out1 == 1'b0 ? Switch35_out1 :
              Constant10_out1);



  assign Bit_Slice24_out1 = Bit_Slice14_out1[47];



  assign Constant9_out1_1 = 8'b00101111;



  assign Switch7_out1 = (Bit_Slice25_out1 == 1'b0 ? Switch8_out1 :
              Constant9_out1_1);



  assign Constant8_out1 = 8'b00110000;



  assign Switch6_out1 = (Bit_Slice24_out1 == 1'b0 ? Switch7_out1 :
              Constant8_out1);



  assign Bit_Slice13_out1 = Bit_Slice14_out1[32];



  assign Constant18_out1 = 8'b00100000;



  assign Bit_Slice14_out1_1 = Bit_Slice14_out1[33];



  assign Constant16_out1 = 8'b00100001;



  assign Switch13_out1 = (Bit_Slice13_out1 == 1'b0 ? Constant18_out1 :
              Constant16_out1);



  assign Bit_Slice10_out1 = Bit_Slice14_out1[34];



  assign Constant17_out1 = 8'b00100010;



  assign Switch14_out1 = (Bit_Slice14_out1_1 == 1'b0 ? Switch13_out1 :
              Constant17_out1);



  assign Bit_Slice11_out1 = Bit_Slice14_out1[35];



  assign Constant21_out1 = 8'b00100011;



  assign Switch15_out1 = (Bit_Slice10_out1 == 1'b0 ? Switch14_out1 :
              Constant21_out1);



  assign Bit_Slice12_out1 = Bit_Slice14_out1[36];



  assign Constant19_out1 = 8'b00100100;



  assign Switch16_out1 = (Bit_Slice11_out1 == 1'b0 ? Switch15_out1 :
              Constant19_out1);



  assign Bit_Slice18_out1 = Bit_Slice14_out1[37];



  assign Constant20_out1 = 8'b00100101;



  assign Switch20_out1 = (Bit_Slice12_out1 == 1'b0 ? Switch16_out1 :
              Constant20_out1);



  assign Bit_Slice19_out1 = Bit_Slice14_out1[38];



  assign Constant22_out1 = 8'b00100110;



  assign Switch21_out1 = (Bit_Slice18_out1 == 1'b0 ? Switch20_out1 :
              Constant22_out1);



  assign Bit_Slice20_out1 = Bit_Slice14_out1[39];



  assign Constant23_out1 = 8'b00100111;



  assign Switch22_out1 = (Bit_Slice19_out1 == 1'b0 ? Switch21_out1 :
              Constant23_out1);



  assign Compare_To_Constant1_out1 = Switch6_out1 > 8'b00101000;



  assign Constant24_out1 = 8'b00101000;



  assign Switch23_out1 = (Bit_Slice20_out1 == 1'b0 ? Switch22_out1 :
              Constant24_out1);



  assign Switch1_out1_1 = (Compare_To_Constant1_out1 == 1'b0 ? Switch23_out1 :
              Switch6_out1);



  assign Switch2_out1_1 = (Compare_To_Constant2_out1 == 1'b0 ? Switch1_out1_1 :
              Switch_out1_1);



  assign Compare_To_Constant6_out1 = Switch2_out1_1 > 8'b00100000;



  assign Bit_Slice30_out1_1 = Bit_Slice14_out1[24];



  assign Constant30_out1_1 = 8'b00011000;



  assign Bit_Slice31_out1_1 = Bit_Slice14_out1[25];



  assign Constant31_out1_1 = 8'b00011001;



  assign Switch30_out1_1 = (Bit_Slice30_out1_1 == 1'b0 ? Constant30_out1_1 :
              Constant31_out1_1);



  assign Bit_Slice32_out1_1 = Bit_Slice14_out1[26];



  assign Constant32_out1_1 = 8'b00011010;



  assign Switch31_out1_1 = (Bit_Slice31_out1_1 == 1'b0 ? Switch30_out1_1 :
              Constant32_out1_1);



  assign Bit_Slice33_out1_1 = Bit_Slice14_out1[27];



  assign Constant33_out1_1 = 8'b00011011;



  assign Switch32_out1_1 = (Bit_Slice32_out1_1 == 1'b0 ? Switch31_out1_1 :
              Constant33_out1_1);



  assign Bit_Slice34_out1_1 = Bit_Slice14_out1[28];



  assign Constant34_out1_1 = 8'b00011100;



  assign Switch33_out1_1 = (Bit_Slice33_out1_1 == 1'b0 ? Switch32_out1_1 :
              Constant34_out1_1);



  assign Bit_Slice35_out1_1 = Bit_Slice14_out1[29];



  assign Constant35_out1_1 = 8'b00011101;



  assign Switch34_out1_1 = (Bit_Slice34_out1_1 == 1'b0 ? Switch33_out1_1 :
              Constant35_out1_1);



  assign Bit_Slice26_out1_1 = Bit_Slice14_out1[30];



  assign Constant36_out1_1 = 8'b00011110;



  assign Switch35_out1_1 = (Bit_Slice35_out1_1 == 1'b0 ? Switch34_out1_1 :
              Constant36_out1_1);



  assign Bit_Slice25_out1_1 = Bit_Slice14_out1[31];



  assign Constant3_out1_2 = 8'b00011111;



  assign Switch3_out1_2 = (Bit_Slice26_out1_1 == 1'b0 ? Switch35_out1_1 :
              Constant3_out1_2);



  assign Constant2_out1_2 = 8'b00100000;



  assign Switch2_out1_2 = (Bit_Slice25_out1_1 == 1'b0 ? Switch3_out1_2 :
              Constant2_out1_2);



  assign Bit_Slice1_out1_1 = Bit_Slice14_out1[16];



  assign Constant5_out1_1 = 8'b00010000;



  assign Bit_Slice24_out1_1 = Bit_Slice14_out1[17];



  assign Constant4_out1_1 = 8'b00010001;



  assign Switch4_out1_1 = (Bit_Slice1_out1_1 == 1'b0 ? Constant5_out1_1 :
              Constant4_out1_1);



  assign Bit_Slice27_out1_1 = Bit_Slice14_out1[18];



  assign Constant1_out1_1 = 8'b00010010;



  assign Switch1_out1_2 = (Bit_Slice24_out1_1 == 1'b0 ? Switch4_out1_1 :
              Constant1_out1_1);



  assign Bit_Slice15_out1_1 = Bit_Slice14_out1[19];



  assign Constant124_out1_1 = 8'b00010011;



  assign Switch116_out1_1 = (Bit_Slice27_out1_1 == 1'b0 ? Switch1_out1_2 :
              Constant124_out1_1);



  assign Bit_Slice16_out1_1 = Bit_Slice14_out1[20];



  assign Constant28_out1_1 = 8'b00010100;



  assign Switch17_out1_1 = (Bit_Slice15_out1_1 == 1'b0 ? Switch116_out1_1 :
              Constant28_out1_1);



  assign Bit_Slice17_out1_1 = Bit_Slice14_out1[21];



  assign Constant26_out1_1 = 8'b00010101;



  assign Switch18_out1_1 = (Bit_Slice16_out1_1 == 1'b0 ? Switch17_out1_1 :
              Constant26_out1_1);



  assign Bit_Slice28_out1_1 = Bit_Slice14_out1[22];



  assign Constant27_out1_1 = 8'b00010110;



  assign Switch19_out1_1 = (Bit_Slice17_out1_1 == 1'b0 ? Switch18_out1_1 :
              Constant27_out1_1);



  assign Bit_Slice29_out1_1 = Bit_Slice14_out1[23];



  assign Constant29_out1_1 = 8'b00010111;



  assign Switch28_out1_1 = (Bit_Slice28_out1_1 == 1'b0 ? Switch19_out1_1 :
              Constant29_out1_1);



  assign Compare_To_Constant3_out1 = Switch2_out1_2 > 8'b00011000;



  assign Constant6_out1_1 = 8'b00011000;



  assign Switch29_out1_1 = (Bit_Slice29_out1_1 == 1'b0 ? Switch28_out1_1 :
              Constant6_out1_1);



  assign Switch3_out1_3 = (Compare_To_Constant3_out1 == 1'b0 ? Switch29_out1_1 :
              Switch2_out1_2);



  assign Compare_To_Constant5_out1 = Switch3_out1_3 > 8'b00010000;



  assign Bit_Slice3_out1_1 = Bit_Slice14_out1[8];



  assign Constant7_out1_1 = 8'b00001000;



  assign Bit_Slice4_out1_1 = Bit_Slice14_out1[9];



  assign Constant9_out1_2 = 8'b00001001;



  assign Switch5_out1_1 = (Bit_Slice3_out1_1 == 1'b0 ? Constant7_out1_1 :
              Constant9_out1_2);



  assign Bit_Slice5_out1_1 = Bit_Slice14_out1[10];



  assign Constant10_out1_1 = 8'b00001010;



  assign Switch7_out1_1 = (Bit_Slice4_out1_1 == 1'b0 ? Switch5_out1_1 :
              Constant10_out1_1);



  assign Bit_Slice6_out1_1 = Bit_Slice14_out1[11];



  assign Constant11_out1_1 = 8'b00001011;



  assign Switch8_out1_1 = (Bit_Slice5_out1_1 == 1'b0 ? Switch7_out1_1 :
              Constant11_out1_1);



  assign Bit_Slice7_out1_1 = Bit_Slice14_out1[12];



  assign Constant12_out1_1 = 8'b00001100;



  assign Switch9_out1_1 = (Bit_Slice6_out1_1 == 1'b0 ? Switch8_out1_1 :
              Constant12_out1_1);



  assign Bit_Slice8_out1_1 = Bit_Slice14_out1[13];



  assign Constant13_out1_1 = 8'b00001101;



  assign Switch10_out1_1 = (Bit_Slice7_out1_1 == 1'b0 ? Switch9_out1_1 :
              Constant13_out1_1);



  assign Bit_Slice9_out1_1 = Bit_Slice14_out1[14];



  assign Constant14_out1_1 = 8'b00001110;



  assign Switch11_out1_1 = (Bit_Slice8_out1_1 == 1'b0 ? Switch10_out1_1 :
              Constant14_out1_1);



  assign Bit_Slice2_out1_1 = Bit_Slice14_out1[15];



  assign Constant15_out1_1 = 8'b00001111;



  assign Switch12_out1_1 = (Bit_Slice9_out1_1 == 1'b0 ? Switch11_out1_1 :
              Constant15_out1_1);



  assign Constant8_out1_1 = 8'b00010000;



  assign Switch6_out1_1 = (Bit_Slice2_out1_1 == 1'b0 ? Switch12_out1_1 :
              Constant8_out1_1);



  assign Bit_Slice18_out1_1 = Bit_Slice14_out1[0];



  assign Constant24_out1_1 = 8'b00000000;



  assign Bit_Slice14_out1_2 = Bit_Slice14_out1[1];



  assign Constant23_out1_1 = 8'b00000001;



  assign Switch23_out1_1 = (Bit_Slice18_out1_1 == 1'b0 ? Constant24_out1_1 :
              Constant23_out1_1);



  assign Bit_Slice13_out1_1 = Bit_Slice14_out1[2];



  assign Constant18_out1_1 = 8'b00000010;



  assign Switch21_out1_1 = (Bit_Slice14_out1_2 == 1'b0 ? Switch23_out1_1 :
              Constant18_out1_1);



  assign Bit_Slice19_out1_1 = Bit_Slice14_out1[3];



  assign Constant16_out1_1 = 8'b00000011;



  assign Switch13_out1_1 = (Bit_Slice13_out1_1 == 1'b0 ? Switch21_out1_1 :
              Constant16_out1_1);



  assign Bit_Slice10_out1_1 = Bit_Slice14_out1[4];



  assign Constant17_out1_1 = 8'b00000100;



  assign Switch14_out1_1 = (Bit_Slice19_out1_1 == 1'b0 ? Switch13_out1_1 :
              Constant17_out1_1);



  assign Bit_Slice11_out1_1 = Bit_Slice14_out1[5];



  assign Constant21_out1_1 = 8'b00000101;



  assign Switch15_out1_1 = (Bit_Slice10_out1_1 == 1'b0 ? Switch14_out1_1 :
              Constant21_out1_1);



  assign Bit_Slice12_out1_1 = Bit_Slice14_out1[6];



  assign Constant19_out1_1 = 8'b00000110;



  assign Switch16_out1_1 = (Bit_Slice11_out1_1 == 1'b0 ? Switch15_out1_1 :
              Constant19_out1_1);



  assign Bit_Slice20_out1_1 = Bit_Slice14_out1[7];



  assign Constant20_out1_1 = 8'b00000111;



  assign Switch20_out1_1 = (Bit_Slice12_out1_1 == 1'b0 ? Switch16_out1_1 :
              Constant20_out1_1);



  assign Compare_To_Constant4_out1 = Switch6_out1_1 > 8'b00001000;



  assign Constant22_out1_1 = 8'b00001000;



  assign Switch22_out1_1 = (Bit_Slice20_out1_1 == 1'b0 ? Switch20_out1_1 :
              Constant22_out1_1);



  assign Switch4_out1_2 = (Compare_To_Constant4_out1 == 1'b0 ? Switch22_out1_1 :
              Switch6_out1_1);



  assign Switch5_out1_2 = (Compare_To_Constant5_out1 == 1'b0 ? Switch4_out1_2 :
              Switch3_out1_3);



  assign Switch6_out1_2 = (Compare_To_Constant6_out1 == 1'b0 ? Switch5_out1_2 :
              Switch2_out1_1);



  assign Sum7_out1 = Constant9_out1 + Switch6_out1_2;



  assign Compare_To_Constant2_out1_1 = Sum7_out1 > 8'b01000000;



  assign Bit_Slice13_out1_2 = Switch_out1[63:0];



  assign Bit_Slice13_out1_3 = Bit_Slice13_out1_2[56];



  assign Constant19_out1_2 = 8'b00111000;



  assign Bit_Slice14_out1_3 = Bit_Slice13_out1_2[57];



  assign Constant20_out1_2 = 8'b00111001;



  assign Switch16_out1_2 = (Bit_Slice13_out1_3 == 1'b0 ? Constant19_out1_2 :
              Constant20_out1_2);



  assign Bit_Slice18_out1_2 = Bit_Slice13_out1_2[58];



  assign Constant21_out1_2 = 8'b00111010;



  assign Switch20_out1_2 = (Bit_Slice14_out1_3 == 1'b0 ? Switch16_out1_2 :
              Constant21_out1_2);



  assign Bit_Slice10_out1_2 = Bit_Slice13_out1_2[59];



  assign Constant22_out1_2 = 8'b00111011;



  assign Switch21_out1_2 = (Bit_Slice18_out1_2 == 1'b0 ? Switch20_out1_2 :
              Constant22_out1_2);



  assign Bit_Slice11_out1_2 = Bit_Slice13_out1_2[60];



  assign Constant16_out1_2 = 8'b00111100;



  assign Switch13_out1_2 = (Bit_Slice10_out1_2 == 1'b0 ? Switch21_out1_2 :
              Constant16_out1_2);



  assign Bit_Slice12_out1_2 = Bit_Slice13_out1_2[61];



  assign Constant17_out1_2 = 8'b00111101;



  assign Switch14_out1_2 = (Bit_Slice11_out1_2 == 1'b0 ? Switch13_out1_2 :
              Constant17_out1_2);



  assign Bit_Slice19_out1_2 = Bit_Slice13_out1_2[62];



  assign Constant18_out1_2 = 8'b00111110;



  assign Switch15_out1_2 = (Bit_Slice12_out1_2 == 1'b0 ? Switch14_out1_2 :
              Constant18_out1_2);



  assign Bit_Slice20_out1_2 = Bit_Slice13_out1_2[63];



  assign Constant23_out1_2 = 8'b00111111;



  assign Switch22_out1_2 = (Bit_Slice19_out1_2 == 1'b0 ? Switch15_out1_2 :
              Constant23_out1_2);



  assign Constant24_out1_2 = 8'b01000000;



  assign Switch23_out1_2 = (Bit_Slice20_out1_2 == 1'b0 ? Switch22_out1_2 :
              Constant24_out1_2);



  assign Bit_Slice5_out1_2 = Bit_Slice13_out1_2[48];



  assign Constant7_out1_2 = 8'b00110000;



  assign Bit_Slice2_out1_2 = Bit_Slice13_out1_2[49];



  assign Constant8_out1_2 = 8'b00110001;



  assign Switch5_out1_3 = (Bit_Slice5_out1_2 == 1'b0 ? Constant7_out1_2 :
              Constant8_out1_2);



  assign Bit_Slice3_out1_2 = Bit_Slice13_out1_2[50];



  assign Constant11_out1_2 = 8'b00110010;



  assign Switch6_out1_3 = (Bit_Slice2_out1_2 == 1'b0 ? Switch5_out1_3 :
              Constant11_out1_2);



  assign Bit_Slice4_out1_2 = Bit_Slice13_out1_2[51];



  assign Constant9_out1_3 = 8'b00110011;



  assign Switch7_out1_2 = (Bit_Slice3_out1_2 == 1'b0 ? Switch6_out1_3 :
              Constant9_out1_3);



  assign Bit_Slice6_out1_2 = Bit_Slice13_out1_2[52];



  assign Constant10_out1_2 = 8'b00110100;



  assign Switch8_out1_2 = (Bit_Slice4_out1_2 == 1'b0 ? Switch7_out1_2 :
              Constant10_out1_2);



  assign Bit_Slice7_out1_2 = Bit_Slice13_out1_2[53];



  assign Constant12_out1_2 = 8'b00110101;



  assign Switch9_out1_2 = (Bit_Slice6_out1_2 == 1'b0 ? Switch8_out1_2 :
              Constant12_out1_2);



  assign Bit_Slice8_out1_2 = Bit_Slice13_out1_2[54];



  assign Constant13_out1_2 = 8'b00110110;



  assign Switch10_out1_2 = (Bit_Slice7_out1_2 == 1'b0 ? Switch9_out1_2 :
              Constant13_out1_2);



  assign Bit_Slice9_out1_2 = Bit_Slice13_out1_2[55];



  assign Constant14_out1_2 = 8'b00110111;



  assign Switch11_out1_2 = (Bit_Slice8_out1_2 == 1'b0 ? Switch10_out1_2 :
              Constant14_out1_2);



  assign Compare_To_Constant_out1_1 = Switch23_out1_2 > 8'b00111000;



  assign Constant15_out1_2 = 8'b00111000;



  assign Switch12_out1_2 = (Bit_Slice9_out1_2 == 1'b0 ? Switch11_out1_2 :
              Constant15_out1_2);



  assign Switch_out1_2 = (Compare_To_Constant_out1_1 == 1'b0 ? Switch12_out1_2 :
              Switch23_out1_2);



  assign Compare_To_Constant2_out1_2 = Switch_out1_2 > 8'b00110000;



  assign Bit_Slice31_out1_2 = Bit_Slice13_out1_2[40];



  assign Constant5_out1_2 = 8'b00101000;



  assign Bit_Slice32_out1_2 = Bit_Slice13_out1_2[41];



  assign Constant32_out1_2 = 8'b00101001;



  assign Switch31_out1_2 = (Bit_Slice31_out1_2 == 1'b0 ? Constant5_out1_2 :
              Constant32_out1_2);



  assign Bit_Slice33_out1_2 = Bit_Slice13_out1_2[42];



  assign Constant33_out1_2 = 8'b00101010;



  assign Switch32_out1_2 = (Bit_Slice32_out1_2 == 1'b0 ? Switch31_out1_2 :
              Constant33_out1_2);



  assign Bit_Slice34_out1_2 = Bit_Slice13_out1_2[43];



  assign Constant34_out1_2 = 8'b00101011;



  assign Switch33_out1_2 = (Bit_Slice33_out1_2 == 1'b0 ? Switch32_out1_2 :
              Constant34_out1_2);



  assign Bit_Slice35_out1_2 = Bit_Slice13_out1_2[44];



  assign Constant35_out1_2 = 8'b00101100;



  assign Switch34_out1_2 = (Bit_Slice34_out1_2 == 1'b0 ? Switch33_out1_2 :
              Constant35_out1_2);



  assign Bit_Slice26_out1_2 = Bit_Slice13_out1_2[45];



  assign Constant36_out1_2 = 8'b00101101;



  assign Switch35_out1_2 = (Bit_Slice35_out1_2 == 1'b0 ? Switch34_out1_2 :
              Constant36_out1_2);



  assign Bit_Slice25_out1_2 = Bit_Slice13_out1_2[46];



  assign Constant3_out1_3 = 8'b00101110;



  assign Switch3_out1_4 = (Bit_Slice26_out1_2 == 1'b0 ? Switch35_out1_2 :
              Constant3_out1_3);



  assign Bit_Slice1_out1_2 = Bit_Slice13_out1_2[47];



  assign Constant6_out1_2 = 8'b00101111;



  assign Switch2_out1_3 = (Bit_Slice25_out1_2 == 1'b0 ? Switch3_out1_4 :
              Constant6_out1_2);



  assign Constant4_out1_2 = 8'b00110000;



  assign Switch4_out1_3 = (Bit_Slice1_out1_2 == 1'b0 ? Switch2_out1_3 :
              Constant4_out1_2);



  assign Bit_Slice24_out1_2 = Bit_Slice13_out1_2[32];



  assign Constant2_out1_3 = 8'b00100000;



  assign Bit_Slice27_out1_2 = Bit_Slice13_out1_2[33];



  assign Constant1_out1_2 = 8'b00100001;



  assign Switch1_out1_3 = (Bit_Slice24_out1_2 == 1'b0 ? Constant2_out1_3 :
              Constant1_out1_2);



  assign Bit_Slice15_out1_2 = Bit_Slice13_out1_2[34];



  assign Constant124_out1_2 = 8'b00100010;



  assign Switch116_out1_2 = (Bit_Slice27_out1_2 == 1'b0 ? Switch1_out1_3 :
              Constant124_out1_2);



  assign Bit_Slice16_out1_2 = Bit_Slice13_out1_2[35];



  assign Constant28_out1_2 = 8'b00100011;



  assign Switch17_out1_2 = (Bit_Slice15_out1_2 == 1'b0 ? Switch116_out1_2 :
              Constant28_out1_2);



  assign Bit_Slice17_out1_2 = Bit_Slice13_out1_2[36];



  assign Constant26_out1_2 = 8'b00100100;



  assign Switch18_out1_2 = (Bit_Slice16_out1_2 == 1'b0 ? Switch17_out1_2 :
              Constant26_out1_2);



  assign Bit_Slice28_out1_2 = Bit_Slice13_out1_2[37];



  assign Constant27_out1_2 = 8'b00100101;



  assign Switch19_out1_2 = (Bit_Slice17_out1_2 == 1'b0 ? Switch18_out1_2 :
              Constant27_out1_2);



  assign Bit_Slice29_out1_2 = Bit_Slice13_out1_2[38];



  assign Constant29_out1_2 = 8'b00100110;



  assign Switch28_out1_2 = (Bit_Slice28_out1_2 == 1'b0 ? Switch19_out1_2 :
              Constant29_out1_2);



  assign Bit_Slice30_out1_2 = Bit_Slice13_out1_2[39];



  assign Constant30_out1_2 = 8'b00100111;



  assign Switch29_out1_2 = (Bit_Slice29_out1_2 == 1'b0 ? Switch28_out1_2 :
              Constant30_out1_2);



  assign Compare_To_Constant1_out1_1 = Switch4_out1_3 > 8'b00101000;



  assign Constant31_out1_2 = 8'b00101000;



  assign Switch30_out1_2 = (Bit_Slice30_out1_2 == 1'b0 ? Switch29_out1_2 :
              Constant31_out1_2);



  assign Switch1_out1_4 = (Compare_To_Constant1_out1_1 == 1'b0 ? Switch30_out1_2 :
              Switch4_out1_3);



  assign Switch2_out1_4 = (Compare_To_Constant2_out1_2 == 1'b0 ? Switch1_out1_4 :
              Switch_out1_2);



  assign Compare_To_Constant6_out1_1 = Switch2_out1_4 > 8'b00100000;



  assign Bit_Slice30_out1_3 = Bit_Slice13_out1_2[24];



  assign Constant30_out1_3 = 8'b00011000;



  assign Bit_Slice31_out1_3 = Bit_Slice13_out1_2[25];



  assign Constant31_out1_3 = 8'b00011001;



  assign Switch30_out1_3 = (Bit_Slice30_out1_3 == 1'b0 ? Constant30_out1_3 :
              Constant31_out1_3);



  assign Bit_Slice32_out1_3 = Bit_Slice13_out1_2[26];



  assign Constant32_out1_3 = 8'b00011010;



  assign Switch31_out1_3 = (Bit_Slice31_out1_3 == 1'b0 ? Switch30_out1_3 :
              Constant32_out1_3);



  assign Bit_Slice33_out1_3 = Bit_Slice13_out1_2[27];



  assign Constant33_out1_3 = 8'b00011011;



  assign Switch32_out1_3 = (Bit_Slice32_out1_3 == 1'b0 ? Switch31_out1_3 :
              Constant33_out1_3);



  assign Bit_Slice34_out1_3 = Bit_Slice13_out1_2[28];



  assign Constant34_out1_3 = 8'b00011100;



  assign Switch33_out1_3 = (Bit_Slice33_out1_3 == 1'b0 ? Switch32_out1_3 :
              Constant34_out1_3);



  assign Bit_Slice35_out1_3 = Bit_Slice13_out1_2[29];



  assign Constant35_out1_3 = 8'b00011101;



  assign Switch34_out1_3 = (Bit_Slice34_out1_3 == 1'b0 ? Switch33_out1_3 :
              Constant35_out1_3);



  assign Bit_Slice26_out1_3 = Bit_Slice13_out1_2[30];



  assign Constant36_out1_3 = 8'b00011110;



  assign Switch35_out1_3 = (Bit_Slice35_out1_3 == 1'b0 ? Switch34_out1_3 :
              Constant36_out1_3);



  assign Bit_Slice25_out1_3 = Bit_Slice13_out1_2[31];



  assign Constant3_out1_4 = 8'b00011111;



  assign Switch3_out1_5 = (Bit_Slice26_out1_3 == 1'b0 ? Switch35_out1_3 :
              Constant3_out1_4);



  assign Constant2_out1_4 = 8'b00100000;



  assign Switch2_out1_5 = (Bit_Slice25_out1_3 == 1'b0 ? Switch3_out1_5 :
              Constant2_out1_4);



  assign Bit_Slice1_out1_3 = Bit_Slice13_out1_2[16];



  assign Constant5_out1_3 = 8'b00010000;



  assign Bit_Slice24_out1_3 = Bit_Slice13_out1_2[17];



  assign Constant4_out1_3 = 8'b00010001;



  assign Switch4_out1_4 = (Bit_Slice1_out1_3 == 1'b0 ? Constant5_out1_3 :
              Constant4_out1_3);



  assign Bit_Slice27_out1_3 = Bit_Slice13_out1_2[18];



  assign Constant1_out1_3 = 8'b00010010;



  assign Switch1_out1_5 = (Bit_Slice24_out1_3 == 1'b0 ? Switch4_out1_4 :
              Constant1_out1_3);



  assign Bit_Slice15_out1_3 = Bit_Slice13_out1_2[19];



  assign Constant124_out1_3 = 8'b00010011;



  assign Switch116_out1_3 = (Bit_Slice27_out1_3 == 1'b0 ? Switch1_out1_5 :
              Constant124_out1_3);



  assign Bit_Slice16_out1_3 = Bit_Slice13_out1_2[20];



  assign Constant28_out1_3 = 8'b00010100;



  assign Switch17_out1_3 = (Bit_Slice15_out1_3 == 1'b0 ? Switch116_out1_3 :
              Constant28_out1_3);



  assign Bit_Slice17_out1_3 = Bit_Slice13_out1_2[21];



  assign Constant26_out1_3 = 8'b00010101;



  assign Switch18_out1_3 = (Bit_Slice16_out1_3 == 1'b0 ? Switch17_out1_3 :
              Constant26_out1_3);



  assign Bit_Slice28_out1_3 = Bit_Slice13_out1_2[22];



  assign Constant27_out1_3 = 8'b00010110;



  assign Switch19_out1_3 = (Bit_Slice17_out1_3 == 1'b0 ? Switch18_out1_3 :
              Constant27_out1_3);



  assign Bit_Slice29_out1_3 = Bit_Slice13_out1_2[23];



  assign Constant29_out1_3 = 8'b00010111;



  assign Switch28_out1_3 = (Bit_Slice28_out1_3 == 1'b0 ? Switch19_out1_3 :
              Constant29_out1_3);



  assign Compare_To_Constant3_out1_1 = Switch2_out1_5 > 8'b00011000;



  assign Constant6_out1_3 = 8'b00011000;



  assign Switch29_out1_3 = (Bit_Slice29_out1_3 == 1'b0 ? Switch28_out1_3 :
              Constant6_out1_3);



  assign Switch3_out1_6 = (Compare_To_Constant3_out1_1 == 1'b0 ? Switch29_out1_3 :
              Switch2_out1_5);



  assign Compare_To_Constant5_out1_1 = Switch3_out1_6 > 8'b00010000;



  assign Bit_Slice3_out1_3 = Bit_Slice13_out1_2[8];



  assign Constant7_out1_3 = 8'b00001000;



  assign Bit_Slice4_out1_3 = Bit_Slice13_out1_2[9];



  assign Constant9_out1_4 = 8'b00001001;



  assign Switch5_out1_4 = (Bit_Slice3_out1_3 == 1'b0 ? Constant7_out1_3 :
              Constant9_out1_4);



  assign Bit_Slice5_out1_3 = Bit_Slice13_out1_2[10];



  assign Constant10_out1_3 = 8'b00001010;



  assign Switch7_out1_3 = (Bit_Slice4_out1_3 == 1'b0 ? Switch5_out1_4 :
              Constant10_out1_3);



  assign Bit_Slice6_out1_3 = Bit_Slice13_out1_2[11];



  assign Constant11_out1_3 = 8'b00001011;



  assign Switch8_out1_3 = (Bit_Slice5_out1_3 == 1'b0 ? Switch7_out1_3 :
              Constant11_out1_3);



  assign Bit_Slice7_out1_3 = Bit_Slice13_out1_2[12];



  assign Constant12_out1_3 = 8'b00001100;



  assign Switch9_out1_3 = (Bit_Slice6_out1_3 == 1'b0 ? Switch8_out1_3 :
              Constant12_out1_3);



  assign Bit_Slice8_out1_3 = Bit_Slice13_out1_2[13];



  assign Constant13_out1_3 = 8'b00001101;



  assign Switch10_out1_3 = (Bit_Slice7_out1_3 == 1'b0 ? Switch9_out1_3 :
              Constant13_out1_3);



  assign Bit_Slice9_out1_3 = Bit_Slice13_out1_2[14];



  assign Constant14_out1_3 = 8'b00001110;



  assign Switch11_out1_3 = (Bit_Slice8_out1_3 == 1'b0 ? Switch10_out1_3 :
              Constant14_out1_3);



  assign Bit_Slice2_out1_3 = Bit_Slice13_out1_2[15];



  assign Constant15_out1_3 = 8'b00001111;



  assign Switch12_out1_3 = (Bit_Slice9_out1_3 == 1'b0 ? Switch11_out1_3 :
              Constant15_out1_3);



  assign Constant8_out1_3 = 8'b00010000;



  assign Switch6_out1_4 = (Bit_Slice2_out1_3 == 1'b0 ? Switch12_out1_3 :
              Constant8_out1_3);



  assign Bit_Slice18_out1_3 = Bit_Slice13_out1_2[0];



  assign Constant24_out1_3 = 8'b00000000;



  assign Bit_Slice14_out1_4 = Bit_Slice13_out1_2[1];



  assign Constant23_out1_3 = 8'b00000001;



  assign Switch23_out1_3 = (Bit_Slice18_out1_3 == 1'b0 ? Constant24_out1_3 :
              Constant23_out1_3);



  assign Bit_Slice13_out1_4 = Bit_Slice13_out1_2[2];



  assign Constant18_out1_3 = 8'b00000010;



  assign Switch21_out1_3 = (Bit_Slice14_out1_4 == 1'b0 ? Switch23_out1_3 :
              Constant18_out1_3);



  assign Bit_Slice19_out1_3 = Bit_Slice13_out1_2[3];



  assign Constant16_out1_3 = 8'b00000011;



  assign Switch13_out1_3 = (Bit_Slice13_out1_4 == 1'b0 ? Switch21_out1_3 :
              Constant16_out1_3);



  assign Bit_Slice10_out1_3 = Bit_Slice13_out1_2[4];



  assign Constant17_out1_3 = 8'b00000100;



  assign Switch14_out1_3 = (Bit_Slice19_out1_3 == 1'b0 ? Switch13_out1_3 :
              Constant17_out1_3);



  assign Bit_Slice11_out1_3 = Bit_Slice13_out1_2[5];



  assign Constant21_out1_3 = 8'b00000101;



  assign Switch15_out1_3 = (Bit_Slice10_out1_3 == 1'b0 ? Switch14_out1_3 :
              Constant21_out1_3);



  assign Bit_Slice12_out1_3 = Bit_Slice13_out1_2[6];



  assign Constant19_out1_3 = 8'b00000110;



  assign Switch16_out1_3 = (Bit_Slice11_out1_3 == 1'b0 ? Switch15_out1_3 :
              Constant19_out1_3);



  assign Bit_Slice20_out1_3 = Bit_Slice13_out1_2[7];



  assign Constant20_out1_3 = 8'b00000111;



  assign Switch20_out1_3 = (Bit_Slice12_out1_3 == 1'b0 ? Switch16_out1_3 :
              Constant20_out1_3);



  assign Compare_To_Constant4_out1_1 = Switch6_out1_4 > 8'b00001000;



  assign Constant22_out1_3 = 8'b00001000;



  assign Switch22_out1_3 = (Bit_Slice20_out1_3 == 1'b0 ? Switch20_out1_3 :
              Constant22_out1_3);



  assign Switch4_out1_5 = (Compare_To_Constant4_out1_1 == 1'b0 ? Switch22_out1_3 :
              Switch6_out1_4);



  assign Switch5_out1_5 = (Compare_To_Constant5_out1_1 == 1'b0 ? Switch4_out1_5 :
              Switch3_out1_6);



  assign Switch6_out1_5 = (Compare_To_Constant6_out1_1 == 1'b0 ? Switch5_out1_5 :
              Switch2_out1_4);



  assign Switch14_out1_4 = (Compare_To_Constant2_out1_1 == 1'b0 ? Switch6_out1_5 :
              Sum7_out1);



  assign Constant_out1 = 8'sb00010000;



  assign Subtract_2 = {2'b0, Switch14_out1_4};
  assign Subtract_3 = {{2{Constant_out1[7]}}, Constant_out1};
  assign Subtract_add_temp = Subtract_2 + Subtract_3;
  assign Subtract_out1 = Subtract_add_temp[8:0];



  assign Subtract_out1_dtc = Subtract_out1[7:0];



  assign Switch_out1_3 = (Switch14_out1_4 == 8'b00000000 ? Switch14_out1_4 :
              Subtract_out1_dtc);



  assign Constant_out1_1 = 8'b10000000;



  assign Subtract_5 = {1'b0, Constant_out1_1};
  assign Subtract_6 = {1'b0, Switch14_out1_4};
  assign Subtract_out1_1 = Subtract_5 - Subtract_6;



  assign shift_arithmetic_zerosig = 9'sb000000000;



  assign shift_arithmetic_selsig = (Subtract_out1_1 >= shift_arithmetic_zerosig ? Subtract_out1_1 :
              shift_arithmetic_zerosig);



  assign dynamic_shift_zerosig = 9'sb000000000;



  assign dynamic_shift_selsig = (shift_arithmetic_selsig >= dynamic_shift_zerosig ? shift_arithmetic_selsig :
              dynamic_shift_zerosig);



  assign dynamic_shift_cast = {{7{dynamic_shift_selsig[8]}}, dynamic_shift_selsig};
  assign Shift_Arithmetic_out1 = Switch_out1 <<< dynamic_shift_cast;



  assign Bit_Slice1_out1_4 = Shift_Arithmetic_out1[126:67];



  assign Bit_Slice2_out1_4 = Bit_Slice1_out1_4[36:35];



  assign Bit_Slice4_out1_4 = Bit_Slice2_out1_4[0];



  assign Bit_Slice1_out1_5 = Bit_Slice1_out1_4[34:0];



  assign Bit_Reduce_out1 = (|Bit_Slice1_out1_5[34:0]);



  assign Bit_Slice5_out1_4 = Bit_Slice2_out1_4[1];



  assign Bit_Slice3_out1_4 = Bit_Slice1_out1_4[37];



  assign Logical_Operator1_out1 = Bit_Slice3_out1_4 | (Bit_Slice4_out1_4 | Bit_Reduce_out1);



  assign Logical_Operator_out1_1 = Bit_Slice5_out1_4 & Logical_Operator1_out1;



  assign Constant1_out1_4 = 1'b0;



  assign Bit_Slice1_out1_6 = Bit_Slice1_out1_4[59:37];



  assign Constant_out1_2 = 23'b00000000000000000000001;



  assign Add_1 = {9'b0, Bit_Slice1_out1_6};
  assign Add_2 = {9'b0, Constant_out1_2};
  assign Add_add_temp = Add_1 + Add_2;
  assign Add_out1 = Add_add_temp[23:0];



  assign Bit_Slice_out1 = Add_out1[23];



  assign Switch1_out1_6 = (Logical_Operator_out1_1 == 1'b0 ? Constant1_out1_4 :
              Bit_Slice_out1);



  assign Add1_1 = {7'b0, Switch1_out1_6};
  assign Add1_out1 = Switch_out1_3 + Add1_1;



  assign Constant_out1_3 = 8'b00000000;



  assign Switch1_out1_7 = (CompareToZero1_out1 == 1'b0 ? Add1_out1 :
              Constant_out1_3);



  assign Bit_Slice2_out1_5 = Add_out1[22:0];



  assign Switch_out1_4 = (Logical_Operator_out1_1 == 1'b0 ? Bit_Slice1_out1_6 :
              Bit_Slice2_out1_5);



  assign Constant1_out1_5 = 23'b00000000000000000000000;



  assign Switch2_out1_6 = (CompareToZero1_out1 == 1'b0 ? Switch_out1_4 :
              Constant1_out1_5);



  // Combine FP sign, exponent, mantissa into 32 bit word
  assign nfp_out_pack = {Switch3_out1, Switch1_out1_7, Switch2_out1_6};



  assign nfp_out = nfp_out_pack;

endmodule  // nfp_convert_sfix_128_En110_to_single

