// -------------------------------------------------------------
// Single Precision Floating Point Arctangent Function Module
// -------------------------------------------------------------

`timescale 1 us / 1 us

module nfp_atan_single
          (nfp_in,
           nfp_out);


  input   [31:0] nfp_in;  // ufix32
  output  [31:0] nfp_out;  // ufix32


  wire S;  // ufix1
  wire [7:0] E;  // ufix8
  wire [22:0] M;  // ufix23
  wire Constant8_out1;  // ufix1
  wire [7:0] Constant3_out1;  // uint8
  wire Compare_To_Constant_out1;
  wire Compare_To_Zero_out1;
  wire Logical_Operator_out1;
  wire Compare_To_Zero1_out1;
  wire Logical_Operator3_out1;
  wire [7:0] Constant4_out1;  // uint8
  wire signed [8:0] Constant4_out1_dtc;  // sfix9
  wire [7:0] Constant3_out1_1;  // uint8
  wire signed [8:0] Constant3_out1_dtc;  // sfix9
  wire signed [8:0] Switch1_out1;  // sfix9
  wire signed [31:0] Sum_sub_temp;  // sfix32
  wire signed [31:0] Sum_1;  // sfix32
  wire signed [31:0] Sum_2;  // sfix32
  wire signed [8:0] Sum_out1;  // sfix9
  wire Compare_To_Constant_out1_1;
  wire Constant6_out1;
  wire Constant_out1;
  wire Switch5_out1;
  wire [23:0] Bit_Concat_out1;  // ufix24
  wire [23:0] Data_Type_Conversion_out1;  // ufix24_En23
  wire [4:0] BitSlice_out1;  // ufix5
  wire [7:0] DTC_out1;  // uint8
  wire signed [26:0] coeffs_table_out1 [0:31];  // sfix27_En25 [32]
  wire signed [26:0] coeffs_table_domain_out1;  // sfix27_En25
  wire signed [26:0] DTC1_out1;  // sfix27_En25
  wire signed [53:0] res_x_mul_temp;  // sfix54_En50
  wire signed [26:0] res_x_out1;  // sfix27_En25
  wire signed [26:0] coeffs_table1_out1 [0:31];  // sfix27_En25 [32]
  wire signed [26:0] coeffs_table_domain_1_out1;  // sfix27_En25
  wire signed [31:0] res_x_coeffs_2_1_add_cast;  // sfix32_En25
  wire signed [31:0] res_x_coeffs_2_1_add_cast_1;  // sfix32_En25
  wire signed [31:0] res_x_coeffs_2_1_add_temp;  // sfix32_En25
  wire signed [26:0] res_x_coeffs_2_1_out1;  // sfix27_En26
  wire [1:0] fi_2_0_2_0_fm_out1;  // ufix2
  wire [26:0] DTC5_out1;  // ufix27_En26
  wire signed [27:0] res_d_cast;  // sfix28_En26
  wire signed [54:0] res_d_mul_temp;  // sfix55_En52
  wire signed [53:0] res_d_cast_1;  // sfix54_En52
  wire [26:0] res_d_out1;  // ufix27_En26
  wire signed [31:0] fi_2_0_2_0_fm_res_d_sub_cast;  // sfix32_En26
  wire signed [31:0] fi_2_0_2_0_fm_res_d_sub_cast_1;  // sfix32_En26
  wire signed [31:0] fi_2_0_2_0_fm_res_d_sub_temp;  // sfix32_En26
  wire [26:0] fi_2_0_2_0_fm_res_d_out1;  // ufix27_En26
  wire signed [27:0] res_fi_2_0_2_0_fm_res_cast;  // sfix28_En26
  wire signed [54:0] res_fi_2_0_2_0_fm_res_mul_temp;  // sfix55_En52
  wire signed [53:0] res_fi_2_0_2_0_fm_res_cast_1;  // sfix54_En52
  wire [26:0] res_fi_2_0_2_0_fm_res_out1;  // ufix27_En26
  wire [27:0] Abs_y;  // ufix28_En26
  wire [26:0] Abs_out1;  // ufix27_En26
  wire [26:0] Data_Type_Conversion_out1_1;  // ufix27
  wire Bit_Slice32_out1;  // ufix1
  wire [4:0] Constant32_out1;  // ufix5
  wire Bit_Slice33_out1;  // ufix1
  wire [4:0] Constant33_out1;  // ufix5
  wire [4:0] Switch32_out1;  // ufix5
  wire Bit_Slice34_out1;  // ufix1
  wire [4:0] Constant34_out1;  // ufix5
  wire [4:0] Switch33_out1;  // ufix5
  wire [4:0] Constant35_out1;  // ufix5
  wire [4:0] Switch34_out1;  // ufix5
  wire Bit_Slice25_out1;  // ufix1
  wire [4:0] Constant3_out1_2;  // ufix5
  wire Bit_Slice24_out1;  // ufix1
  wire [4:0] Constant2_out1;  // ufix5
  wire [4:0] Switch2_out1;  // ufix5
  wire Bit_Slice27_out1;  // ufix1
  wire [4:0] Constant1_out1;  // ufix5
  wire [4:0] Switch1_out1_1;  // ufix5
  wire Bit_Slice15_out1;  // ufix1
  wire [4:0] Constant124_out1;  // ufix5
  wire [4:0] Switch116_out1;  // ufix5
  wire Bit_Slice16_out1;  // ufix1
  wire [4:0] Constant28_out1;  // ufix5
  wire [4:0] Switch17_out1;  // ufix5
  wire Bit_Slice17_out1;  // ufix1
  wire [4:0] Constant26_out1;  // ufix5
  wire [4:0] Switch18_out1;  // ufix5
  wire Bit_Slice28_out1;  // ufix1
  wire [4:0] Constant27_out1;  // ufix5
  wire [4:0] Switch19_out1;  // ufix5
  wire Bit_Slice29_out1;  // ufix1
  wire [4:0] Constant29_out1;  // ufix5
  wire [4:0] Switch28_out1;  // ufix5
  wire Compare_To_Constant3_out1;
  wire [4:0] Constant30_out1;  // ufix5
  wire [4:0] Switch29_out1;  // ufix5
  wire [4:0] Switch3_out1;  // ufix5
  wire Compare_To_Constant5_out1;
  wire Bit_Slice29_out1_1;  // ufix1
  wire [4:0] Constant29_out1_1;  // ufix5
  wire Bit_Slice30_out1;  // ufix1
  wire [4:0] Constant30_out1_1;  // ufix5
  wire [4:0] Switch29_out1_1;  // ufix5
  wire Bit_Slice31_out1;  // ufix1
  wire [4:0] Constant31_out1;  // ufix5
  wire [4:0] Switch30_out1;  // ufix5
  wire Bit_Slice32_out1_1;  // ufix1
  wire [4:0] Constant32_out1_1;  // ufix5
  wire [4:0] Switch31_out1;  // ufix5
  wire Bit_Slice33_out1_1;  // ufix1
  wire [4:0] Constant33_out1_1;  // ufix5
  wire [4:0] Switch32_out1_1;  // ufix5
  wire Bit_Slice34_out1_1;  // ufix1
  wire [4:0] Constant34_out1_1;  // ufix5
  wire [4:0] Switch33_out1_1;  // ufix5
  wire Bit_Slice35_out1;  // ufix1
  wire [4:0] Constant35_out1_1;  // ufix5
  wire [4:0] Switch34_out1_1;  // ufix5
  wire Bit_Slice26_out1;  // ufix1
  wire [4:0] Constant36_out1;  // ufix5
  wire [4:0] Switch35_out1;  // ufix5
  wire [4:0] Constant3_out1_3;  // ufix5
  wire [4:0] Switch3_out1_1;  // ufix5
  wire Bit_Slice26_out1_1;  // ufix1
  wire [4:0] Constant4_out1_1;  // ufix5
  wire Bit_Slice25_out1_1;  // ufix1
  wire [4:0] Constant3_out1_4;  // ufix5
  wire [4:0] Switch3_out1_2;  // ufix5
  wire Bit_Slice24_out1_1;  // ufix1
  wire [4:0] Constant2_out1_1;  // ufix5
  wire [4:0] Switch2_out1_1;  // ufix5
  wire Bit_Slice27_out1_1;  // ufix1
  wire [4:0] Constant1_out1_1;  // ufix5
  wire [4:0] Switch1_out1_2;  // ufix5
  wire Bit_Slice15_out1_1;  // ufix1
  wire [4:0] Constant124_out1_1;  // ufix5
  wire [4:0] Switch116_out1_1;  // ufix5
  wire Bit_Slice16_out1_1;  // ufix1
  wire [4:0] Constant28_out1_1;  // ufix5
  wire [4:0] Switch17_out1_1;  // ufix5
  wire Bit_Slice17_out1_1;  // ufix1
  wire [4:0] Constant26_out1_1;  // ufix5
  wire [4:0] Switch18_out1_1;  // ufix5
  wire Bit_Slice28_out1_1;  // ufix1
  wire [4:0] Constant27_out1_1;  // ufix5
  wire [4:0] Switch19_out1_1;  // ufix5
  wire Compare_To_Constant4_out1;
  wire [4:0] Constant29_out1_2;  // ufix5
  wire [4:0] Switch28_out1_1;  // ufix5
  wire [4:0] Switch4_out1;  // ufix5
  wire [4:0] Switch5_out1_1;  // ufix5
  wire [7:0] dynamic_shift_1;  // uint8
  wire [26:0] Shift_Arithmetic_out1;  // ufix27
  wire [1:0] Bit_Slice2_out1;  // ufix2
  wire Bit_Slice4_out1;  // ufix1
  wire Bit_Slice5_out1;  // ufix1
  wire Bit_Slice3_out1;  // ufix1
  wire Bit_Slice1_out1;  // ufix1
  wire Bit_Reduce_out1;  // ufix1
  wire Logical_Operator1_out1;
  wire Logical_Operator_out1_1;
  wire [22:0] Bit_Slice1_out1_1;  // ufix23
  wire [23:0] Bit_Slice1_out1_dtc;  // ufix24
  wire [22:0] Constant2_out1_2;  // ufix23
  wire [31:0] Add1_add_temp;  // ufix32
  wire [31:0] Add1_1;  // ufix32
  wire [31:0] Add1_2;  // ufix32
  wire [23:0] Add1_out1;  // ufix24
  wire [23:0] Switch2_out1_2;  // ufix24
  wire Bit_Slice5_out1_1;  // ufix1
  wire signed [31:0] Sum2_sub_temp;  // sfix32
  wire signed [31:0] Sum2_1;  // sfix32
  wire signed [31:0] Sum2_2;  // sfix32
  wire signed [8:0] Sum2_out1;  // sfix9
  wire signed [31:0] y_e_fi_exp_fimath_y_e_sub_temp;  // sfix32
  wire signed [31:0] y_e_fi_exp_fimath_y_e_1;  // sfix32
  wire signed [31:0] y_e_fi_exp_fimath_y_e_2;  // sfix32
  wire signed [8:0] y_e_fi_exp_fimath_y_e_out1;  // sfix9
  wire signed [8:0] if_exp_1_out1;  // sfix9
  wire exp_12_out1;
  wire C1_out1;
  wire C_out1;
  wire if_exp_0_out1;
  wire alphaadjustment_out1;
  wire exp_12_adjustment_out1;
  wire exp_2_out1;
  wire x_m_1_out1;
  wire Logical_Operator_out1_2;
  wire exp_36_out1;
  wire alpha1_out1;  // ufix1
  wire [22:0] Bit_Slice6_out1;  // ufix23
  wire [22:0] Bit_Shift2_out1;  // ufix23
  wire [22:0] Switch3_out1_3;  // ufix23
  wire [23:0] Bit_Concat_out1_1;  // ufix24
  wire [23:0] reinterpretcast_y_m_numericty_out1;  // ufix24_En23
  wire [23:0] if_exp_2_out1;  // ufix24_En23
  wire signed [9:0] alphaexp_in0;  // sfix10
  wire signed [9:0] alphaexp_1;  // sfix10
  wire signed [8:0] alphaexp_out1;  // sfix9
  wire signed [8:0] shift_arithmetic_zerosig;  // sfix9
  wire signed [8:0] shift_arithmetic_selsig;  // sfix9
  wire [36:0] C2_out1;  // ufix37_En36
  wire [36:0] DTC_out1_1;  // ufix37_En36
  wire signed [8:0] dynamic_shift_zerosig;  // sfix9
  wire signed [8:0] dynamic_shift_selsig;  // sfix9
  wire signed [15:0] dynamic_shift_cast;  // int16
  wire [36:0] Shift_Arithmetic_out1_1;  // ufix37_En36
  wire [36:0] if_exp_36_out1;  // ufix37_En36
  wire [23:0] DTC_out1_2;  // ufix24_En23
  wire signed [26:0] DTC2_out1;  // sfix27_En25
  wire [5:0] BitSlice_out1_1;  // ufix6
  wire [7:0] DTC1_out1_1;  // uint8
  wire signed [26:0] coeffs_table1_out1_1 [0:63];  // sfix27_En25 [64]
  wire signed [26:0] coeffs_table_domain_1_out1_1;  // sfix27_En25
  wire signed [53:0] res_x_mul_temp_1;  // sfix54_En50
  wire signed [26:0] res_x_out1_1;  // sfix27_En25
  wire signed [26:0] coeffs_table2_out1 [0:63];  // sfix27_En25 [64]
  wire signed [26:0] coeffs_table_domain_2_out1;  // sfix27_En25
  wire signed [31:0] res_x_coeffs_3_1_add_cast;  // sfix32_En25
  wire signed [31:0] res_x_coeffs_3_1_add_cast_1;  // sfix32_En25
  wire signed [31:0] res_x_coeffs_3_1_add_temp;  // sfix32_En25
  wire signed [26:0] res_x_coeffs_3_1_out1;  // sfix27_En25
  wire signed [53:0] res_x_mul_temp_2;  // sfix54_En50
  wire signed [26:0] res_x_out1_2;  // sfix27_En25
  wire signed [26:0] coeffs_table3_out1 [0:63];  // sfix27_En25 [64]
  wire signed [26:0] coeffs_table_domain_3_out1;  // sfix27_En25
  wire signed [31:0] res_x_coeffs_2_1_add_cast_2;  // sfix32_En25
  wire signed [31:0] res_x_coeffs_2_1_add_cast_3;  // sfix32_En25
  wire signed [31:0] res_x_coeffs_2_1_add_temp_1;  // sfix32_En25
  wire signed [26:0] res_x_coeffs_2_1_out1_1;  // sfix27_En25
  wire signed [37:0] res_x_cast;  // sfix38_En36
  wire signed [64:0] res_x_mul_temp_3;  // sfix65_En61
  wire signed [63:0] res_x_out1_3;  // sfix64_En61
  wire signed [9:0] alphaexp_in0_1;  // sfix10
  wire signed [9:0] alphaexp_3;  // sfix10
  wire signed [8:0] alphaexp_out1_1;  // sfix9
  wire alphaexp_res_WordLength_out1;
  wire signed [9:0] alphaexp1_in0;  // sfix10
  wire signed [9:0] alphaexp1_1;  // sfix10
  wire signed [8:0] alphaexp1_out1;  // sfix9
  wire signed [8:0] shift_arithmetic_zerosig_1;  // sfix9
  wire signed [8:0] shift_arithmetic_selsig_1;  // sfix9
  wire exp_1_out1;
  wire signed [63:0] C_out1_1;  // sfix64_En61
  wire signed [63:0] if_x_m_1_out1;  // sfix64_En61
  wire signed [63:0] C2_out1_1;  // sfix64_En61
  wire signed [63:0] dtc_out1_3;  // sfix64_En61
  wire signed [8:0] dynamic_shift_zerosig_1;  // sfix9
  wire signed [8:0] dynamic_shift_selsig_1;  // sfix9
  wire signed [15:0] dynamic_shift_cast_1;  // int16
  wire signed [63:0] Shift_Arithmetic_out1_2;  // sfix64_En61
  wire signed [63:0] if_exp_res_WordLength_out1;  // sfix64_En61
  wire signed [63:0] if_exp_12_out1;  // sfix64_En61
  wire signed [63:0] alpha1_5707963267948966_out1;  // sfix64_En62
  wire signed [63:0] alpha1_5_res_sub_cast;  // sfix64_En61
  wire signed [63:0] alpha1_5_res_out1;  // sfix64_En61
  wire signed [63:0] if_adjustment_out1;  // sfix64_En61
  wire [61:0] DTC1_out1_2;  // ufix62_En61
  wire [62:0] Abs_y_1;  // ufix63_En61
  wire [61:0] Abs_out1_1;  // ufix62_En61
  wire [61:0] Data_Type_Conversion_out1_2;  // ufix62
  wire Bit_Slice32_out1_2;  // ufix1
  wire [5:0] Constant32_out1_2;  // ufix6
  wire Bit_Slice33_out1_2;  // ufix1
  wire [5:0] Constant33_out1_2;  // ufix6
  wire [5:0] Switch32_out1_2;  // ufix6
  wire Bit_Slice34_out1_2;  // ufix1
  wire [5:0] Constant34_out1_2;  // ufix6
  wire [5:0] Switch33_out1_2;  // ufix6
  wire Bit_Slice15_out1_2;  // ufix1
  wire [5:0] Constant35_out1_2;  // ufix6
  wire [5:0] Switch34_out1_2;  // ufix6
  wire Bit_Slice16_out1_2;  // ufix1
  wire [5:0] Constant28_out1_2;  // ufix6
  wire [5:0] Switch17_out1_2;  // ufix6
  wire Bit_Slice17_out1_2;  // ufix1
  wire [5:0] Constant26_out1_2;  // ufix6
  wire [5:0] Switch18_out1_2;  // ufix6
  wire [5:0] Constant27_out1_2;  // ufix6
  wire [5:0] Switch19_out1_2;  // ufix6
  wire Bit_Slice25_out1_2;  // ufix1
  wire [5:0] Constant3_out1_5;  // ufix6
  wire Bit_Slice24_out1_2;  // ufix1
  wire [5:0] Constant2_out1_3;  // ufix6
  wire [5:0] Switch2_out1_3;  // ufix6
  wire Bit_Slice27_out1_2;  // ufix1
  wire [5:0] Constant1_out1_2;  // ufix6
  wire [5:0] Switch1_out1_3;  // ufix6
  wire Bit_Slice15_out1_3;  // ufix1
  wire [5:0] Constant124_out1_2;  // ufix6
  wire [5:0] Switch116_out1_2;  // ufix6
  wire Bit_Slice16_out1_3;  // ufix1
  wire [5:0] Constant28_out1_3;  // ufix6
  wire [5:0] Switch17_out1_3;  // ufix6
  wire Bit_Slice17_out1_3;  // ufix1
  wire [5:0] Constant26_out1_3;  // ufix6
  wire [5:0] Switch18_out1_3;  // ufix6
  wire Bit_Slice28_out1_2;  // ufix1
  wire [5:0] Constant27_out1_3;  // ufix6
  wire [5:0] Switch19_out1_3;  // ufix6
  wire Bit_Slice29_out1_2;  // ufix1
  wire [5:0] Constant29_out1_3;  // ufix6
  wire [5:0] Switch28_out1_2;  // ufix6
  wire Compare_To_Constant1_out1;
  wire [5:0] Constant30_out1_2;  // ufix6
  wire [5:0] Switch29_out1_2;  // ufix6
  wire [5:0] Switch1_out1_4;  // ufix6
  wire Compare_To_Constant7_out1;
  wire Bit_Slice29_out1_3;  // ufix1
  wire [5:0] Constant29_out1_4;  // ufix6
  wire Bit_Slice30_out1_1;  // ufix1
  wire [5:0] Constant30_out1_3;  // ufix6
  wire [5:0] Switch29_out1_3;  // ufix6
  wire Bit_Slice31_out1_1;  // ufix1
  wire [5:0] Constant31_out1_1;  // ufix6
  wire [5:0] Switch30_out1_1;  // ufix6
  wire Bit_Slice32_out1_3;  // ufix1
  wire [5:0] Constant32_out1_3;  // ufix6
  wire [5:0] Switch31_out1_1;  // ufix6
  wire Bit_Slice33_out1_3;  // ufix1
  wire [5:0] Constant33_out1_3;  // ufix6
  wire [5:0] Switch32_out1_3;  // ufix6
  wire Bit_Slice34_out1_3;  // ufix1
  wire [5:0] Constant34_out1_3;  // ufix6
  wire [5:0] Switch33_out1_3;  // ufix6
  wire Bit_Slice35_out1_1;  // ufix1
  wire [5:0] Constant35_out1_3;  // ufix6
  wire [5:0] Switch34_out1_3;  // ufix6
  wire Bit_Slice26_out1_2;  // ufix1
  wire [5:0] Constant36_out1_1;  // ufix6
  wire [5:0] Switch35_out1_1;  // ufix6
  wire [5:0] Constant3_out1_6;  // ufix6
  wire [5:0] Switch3_out1_4;  // ufix6
  wire Bit_Slice26_out1_3;  // ufix1
  wire [5:0] Constant4_out1_2;  // ufix6
  wire Bit_Slice25_out1_3;  // ufix1
  wire [5:0] Constant3_out1_7;  // ufix6
  wire [5:0] Switch3_out1_5;  // ufix6
  wire Bit_Slice24_out1_3;  // ufix1
  wire [5:0] Constant2_out1_4;  // ufix6
  wire [5:0] Switch2_out1_4;  // ufix6
  wire Bit_Slice27_out1_3;  // ufix1
  wire [5:0] Constant1_out1_3;  // ufix6
  wire [5:0] Switch1_out1_5;  // ufix6
  wire Bit_Slice15_out1_4;  // ufix1
  wire [5:0] Constant124_out1_3;  // ufix6
  wire [5:0] Switch116_out1_3;  // ufix6
  wire Bit_Slice16_out1_4;  // ufix1
  wire [5:0] Constant28_out1_4;  // ufix6
  wire [5:0] Switch17_out1_4;  // ufix6
  wire Bit_Slice17_out1_4;  // ufix1
  wire [5:0] Constant26_out1_4;  // ufix6
  wire [5:0] Switch18_out1_4;  // ufix6
  wire Bit_Slice28_out1_3;  // ufix1
  wire [5:0] Constant27_out1_4;  // ufix6
  wire [5:0] Switch19_out1_4;  // ufix6
  wire Compare_To_Constant2_out1;
  wire [5:0] Constant29_out1_5;  // ufix6
  wire [5:0] Switch28_out1_3;  // ufix6
  wire [5:0] Switch2_out1_5;  // ufix6
  wire [5:0] Switch6_out1;  // ufix6
  wire Compare_To_Constant6_out1;
  wire Bit_Slice32_out1_4;  // ufix1
  wire [5:0] Constant32_out1_4;  // ufix6
  wire Bit_Slice33_out1_4;  // ufix1
  wire [5:0] Constant33_out1_4;  // ufix6
  wire [5:0] Switch32_out1_4;  // ufix6
  wire Bit_Slice34_out1_4;  // ufix1
  wire [5:0] Constant34_out1_4;  // ufix6
  wire [5:0] Switch33_out1_4;  // ufix6
  wire Bit_Slice15_out1_5;  // ufix1
  wire [5:0] Constant35_out1_4;  // ufix6
  wire [5:0] Switch34_out1_4;  // ufix6
  wire Bit_Slice16_out1_5;  // ufix1
  wire [5:0] Constant28_out1_5;  // ufix6
  wire [5:0] Switch17_out1_5;  // ufix6
  wire Bit_Slice17_out1_5;  // ufix1
  wire [5:0] Constant26_out1_5;  // ufix6
  wire [5:0] Switch18_out1_5;  // ufix6
  wire Bit_Slice28_out1_4;  // ufix1
  wire [5:0] Constant27_out1_5;  // ufix6
  wire [5:0] Switch19_out1_5;  // ufix6
  wire Bit_Slice29_out1_4;  // ufix1
  wire [5:0] Constant29_out1_6;  // ufix6
  wire [5:0] Switch28_out1_4;  // ufix6
  wire [5:0] Constant30_out1_4;  // ufix6
  wire [5:0] Switch29_out1_4;  // ufix6
  wire Bit_Slice25_out1_4;  // ufix1
  wire [5:0] Constant3_out1_8;  // ufix6
  wire Bit_Slice24_out1_4;  // ufix1
  wire [5:0] Constant2_out1_5;  // ufix6
  wire [5:0] Switch2_out1_6;  // ufix6
  wire Bit_Slice27_out1_4;  // ufix1
  wire [5:0] Constant1_out1_4;  // ufix6
  wire [5:0] Switch1_out1_6;  // ufix6
  wire Bit_Slice15_out1_6;  // ufix1
  wire [5:0] Constant124_out1_4;  // ufix6
  wire [5:0] Switch116_out1_4;  // ufix6
  wire Bit_Slice16_out1_6;  // ufix1
  wire [5:0] Constant28_out1_6;  // ufix6
  wire [5:0] Switch17_out1_6;  // ufix6
  wire Bit_Slice17_out1_6;  // ufix1
  wire [5:0] Constant26_out1_6;  // ufix6
  wire [5:0] Switch18_out1_6;  // ufix6
  wire Bit_Slice28_out1_5;  // ufix1
  wire [5:0] Constant27_out1_6;  // ufix6
  wire [5:0] Switch19_out1_6;  // ufix6
  wire Bit_Slice29_out1_5;  // ufix1
  wire [5:0] Constant29_out1_7;  // ufix6
  wire [5:0] Switch28_out1_5;  // ufix6
  wire Compare_To_Constant3_out1_1;
  wire [5:0] Constant30_out1_5;  // ufix6
  wire [5:0] Switch29_out1_5;  // ufix6
  wire [5:0] Switch3_out1_6;  // ufix6
  wire Compare_To_Constant5_out1_1;
  wire Bit_Slice29_out1_6;  // ufix1
  wire [5:0] Constant29_out1_8;  // ufix6
  wire Bit_Slice30_out1_2;  // ufix1
  wire [5:0] Constant30_out1_6;  // ufix6
  wire [5:0] Switch29_out1_6;  // ufix6
  wire Bit_Slice31_out1_2;  // ufix1
  wire [5:0] Constant31_out1_2;  // ufix6
  wire [5:0] Switch30_out1_2;  // ufix6
  wire Bit_Slice32_out1_5;  // ufix1
  wire [5:0] Constant32_out1_5;  // ufix6
  wire [5:0] Switch31_out1_2;  // ufix6
  wire Bit_Slice33_out1_5;  // ufix1
  wire [5:0] Constant33_out1_5;  // ufix6
  wire [5:0] Switch32_out1_5;  // ufix6
  wire Bit_Slice34_out1_5;  // ufix1
  wire [5:0] Constant34_out1_5;  // ufix6
  wire [5:0] Switch33_out1_5;  // ufix6
  wire Bit_Slice35_out1_2;  // ufix1
  wire [5:0] Constant35_out1_5;  // ufix6
  wire [5:0] Switch34_out1_5;  // ufix6
  wire Bit_Slice26_out1_4;  // ufix1
  wire [5:0] Constant36_out1_2;  // ufix6
  wire [5:0] Switch35_out1_2;  // ufix6
  wire [5:0] Constant3_out1_9;  // ufix6
  wire [5:0] Switch3_out1_7;  // ufix6
  wire Bit_Slice26_out1_5;  // ufix1
  wire [5:0] Constant4_out1_3;  // ufix6
  wire Bit_Slice25_out1_5;  // ufix1
  wire [5:0] Constant3_out1_10;  // ufix6
  wire [5:0] Switch3_out1_8;  // ufix6
  wire Bit_Slice24_out1_5;  // ufix1
  wire [5:0] Constant2_out1_6;  // ufix6
  wire [5:0] Switch2_out1_7;  // ufix6
  wire Bit_Slice27_out1_5;  // ufix1
  wire [5:0] Constant1_out1_5;  // ufix6
  wire [5:0] Switch1_out1_7;  // ufix6
  wire Bit_Slice15_out1_7;  // ufix1
  wire [5:0] Constant124_out1_5;  // ufix6
  wire [5:0] Switch116_out1_5;  // ufix6
  wire Bit_Slice16_out1_7;  // ufix1
  wire [5:0] Constant28_out1_7;  // ufix6
  wire [5:0] Switch17_out1_7;  // ufix6
  wire Bit_Slice17_out1_7;  // ufix1
  wire [5:0] Constant26_out1_7;  // ufix6
  wire [5:0] Switch18_out1_7;  // ufix6
  wire Bit_Slice28_out1_6;  // ufix1
  wire [5:0] Constant27_out1_7;  // ufix6
  wire [5:0] Switch19_out1_7;  // ufix6
  wire Compare_To_Constant4_out1_1;
  wire [5:0] Constant29_out1_9;  // ufix6
  wire [5:0] Switch28_out1_6;  // ufix6
  wire [5:0] Switch4_out1_1;  // ufix6
  wire [5:0] Switch5_out1_2;  // ufix6
  wire [5:0] Switch7_out1;  // ufix6
  wire [7:0] dynamic_shift_5;  // uint8
  wire [61:0] Shift_Arithmetic_out1_3;  // ufix62
  wire [1:0] Bit_Slice2_out1_1;  // ufix2
  wire Bit_Slice4_out1_1;  // ufix1
  wire Bit_Slice5_out1_2;  // ufix1
  wire Bit_Slice3_out1_1;  // ufix1
  wire [35:0] Bit_Slice1_out1_2;  // ufix36
  wire Bit_Reduce_out1_1;  // ufix1
  wire Logical_Operator1_out1_1;
  wire Logical_Operator_out1_3;
  wire [22:0] Bit_Slice1_out1_3;  // ufix23
  wire [23:0] Bit_Slice1_out1_dtc_1;  // ufix24
  wire [22:0] Constant2_out1_7;  // ufix23
  wire [31:0] Add1_add_temp_1;  // ufix32
  wire [31:0] Add1_4;  // ufix32
  wire [31:0] Add1_5;  // ufix32
  wire [23:0] Add1_out1_1;  // ufix24
  wire [23:0] Switch2_out1_8;  // ufix24
  wire Bit_Slice5_out1_3;  // ufix1
  wire [7:0] C1_out1_1;  // uint8
  wire signed [31:0] Sum1_sub_temp;  // sfix32
  wire signed [31:0] Sum1_1;  // sfix32
  wire signed [31:0] Sum1_2;  // sfix32
  wire [7:0] Sum1_out1;  // uint8
  wire [31:0] Sum2_add_temp;  // ufix32
  wire [31:0] Sum2_4;  // ufix32
  wire [31:0] Sum2_5;  // ufix32
  wire [7:0] Sum2_out1_1;  // uint8
  wire [7:0] reinterpretcast_exp_numericty_out1;  // uint8
  wire [7:0] C1_out1_2;  // uint8
  wire [7:0] exp_127_out1;  // uint8
  wire [7:0] if_exp_12_adjustment1_out1;  // uint8
  wire [7:0] Constant5_out1;  // uint8
  wire [7:0] Constant4_out1_4;  // uint8
  wire [7:0] Switch5_out1_3;  // uint8
  wire [7:0] Switch1_out1_8;  // uint8
  wire [7:0] Switch3_out1_9;  // uint8
  wire [22:0] Constant2_out1_8;  // ufix23
  wire [22:0] Bit_Slice6_out1_1;  // ufix23
  wire [22:0] Bit_Shift2_out1_1;  // ufix23
  wire [22:0] Switch3_out1_10;  // ufix23
  wire [22:0] BitSlice_out1_2;  // ufix23
  wire [22:0] if_exp_12_adjustment2_out1;  // ufix23
  wire [22:0] Constant6_out1_1;  // ufix23
  wire [22:0] Switch6_out1_1;  // ufix23
  wire [22:0] Switch_out1;  // ufix23
  wire [22:0] Switch2_out1_9;  // ufix23
  wire [31:0] nfp_out_pack;  // ufix32

  // 
  // 
  // 4
  // 
  // 4
  // 
  // 4


  // Split 32 bit word into FP sign, exponent, mantissa
  assign S = nfp_in[31];
  assign E = nfp_in[30:23];
  assign M = nfp_in[22:0];



  assign Constant8_out1 = 1'b1;



  assign Constant3_out1 = 8'b00000000;



  assign Compare_To_Constant_out1 = E == 8'b11111111;



  assign Compare_To_Zero_out1 = M > 23'b00000000000000000000000;



  assign Logical_Operator_out1 = Compare_To_Constant_out1 & Compare_To_Zero_out1;



  assign Compare_To_Zero1_out1 = E == 8'b00000000;



  assign Logical_Operator3_out1 = Logical_Operator_out1 | Compare_To_Zero1_out1;



  assign Constant4_out1 = 8'b01111110;



  assign Constant4_out1_dtc = {1'b0, Constant4_out1};



  assign Constant3_out1_1 = 8'b01111111;



  assign Constant3_out1_dtc = {1'b0, Constant3_out1_1};



  assign Switch1_out1 = (E == 8'b00000000 ? Constant4_out1_dtc :
              Constant3_out1_dtc);



  assign Sum_1 = {24'b0, E};
  assign Sum_2 = {{23{Switch1_out1[8]}}, Switch1_out1};
  assign Sum_sub_temp = Sum_1 - Sum_2;
  assign Sum_out1 = Sum_sub_temp[8:0];



  assign Compare_To_Constant_out1_1 = Sum_out1 >= 9'sb000000000;



  assign Constant6_out1 = 1'b0;



  assign Constant_out1 = 1'b1;



  assign Switch5_out1 = (E == 8'b00000000 ? Constant6_out1 :
              Constant_out1);



  assign Bit_Concat_out1 = {Switch5_out1, M};



  assign Data_Type_Conversion_out1 = Bit_Concat_out1;



  assign BitSlice_out1 = Data_Type_Conversion_out1[22:18];



  assign DTC_out1 = {3'b0, BitSlice_out1};



  assign coeffs_table_out1[0] = 27'sb110000011111000001111100001;
  assign coeffs_table_out1[1] = 27'sb110001011001011100001011011;
  assign coeffs_table_out1[2] = 27'sb110010001110110101111111110;
  assign coeffs_table_out1[3] = 27'sb110010111111110010111111110;
  assign coeffs_table_out1[4] = 27'sb110011101100110001111110001;
  assign coeffs_table_out1[5] = 27'sb110100010110001101101010000;
  assign coeffs_table_out1[6] = 27'sb110100111100011101010111011;
  assign coeffs_table_out1[7] = 27'sb110101011111110101011111111;
  assign coeffs_table_out1[8] = 27'sb110110000000100111111101100;
  assign coeffs_table_out1[9] = 27'sb110110011111000100100010010;
  assign coeffs_table_out1[10] = 27'sb110110111011011001001010010;
  assign coeffs_table_out1[11] = 27'sb110111010101110010001100110;
  assign coeffs_table_out1[12] = 27'sb110111101110011010101000101;
  assign coeffs_table_out1[13] = 27'sb111000000101011100010000101;
  assign coeffs_table_out1[14] = 27'sb111000011010111111110100101;
  assign coeffs_table_out1[15] = 27'sb111000101111001101001010100;
  assign coeffs_table_out1[16] = 27'sb111001000010001011010100100;
  assign coeffs_table_out1[17] = 27'sb111001010100000000101000001;
  assign coeffs_table_out1[18] = 27'sb111001100100110010110011001;
  assign coeffs_table_out1[19] = 27'sb111001110100100110111111111;
  assign coeffs_table_out1[20] = 27'sb111010000011100001111001111;
  assign coeffs_table_out1[21] = 27'sb111010010001100111110000101;
  assign coeffs_table_out1[22] = 27'sb111010011110111100011011001;
  assign coeffs_table_out1[23] = 27'sb111010101011100011011010001;
  assign coeffs_table_out1[24] = 27'sb111010110111011111111010111;
  assign coeffs_table_out1[25] = 27'sb111011000010110100111000111;
  assign coeffs_table_out1[26] = 27'sb111011001101100100111111101;
  assign coeffs_table_out1[27] = 27'sb111011010111110010101100011;
  assign coeffs_table_out1[28] = 27'sb111011100001100000001111101;
  assign coeffs_table_out1[29] = 27'sb111011101010101111101110001;
  assign coeffs_table_out1[30] = 27'sb111011110011100011000010000;
  assign coeffs_table_out1[31] = 27'sb111011111011111011111011111;



  assign coeffs_table_domain_out1 = (DTC_out1 == 8'b00000000 ? coeffs_table_out1[0] :
              (DTC_out1 == 8'b00000001 ? coeffs_table_out1[1] :
              (DTC_out1 == 8'b00000010 ? coeffs_table_out1[2] :
              (DTC_out1 == 8'b00000011 ? coeffs_table_out1[3] :
              (DTC_out1 == 8'b00000100 ? coeffs_table_out1[4] :
              (DTC_out1 == 8'b00000101 ? coeffs_table_out1[5] :
              (DTC_out1 == 8'b00000110 ? coeffs_table_out1[6] :
              (DTC_out1 == 8'b00000111 ? coeffs_table_out1[7] :
              (DTC_out1 == 8'b00001000 ? coeffs_table_out1[8] :
              (DTC_out1 == 8'b00001001 ? coeffs_table_out1[9] :
              (DTC_out1 == 8'b00001010 ? coeffs_table_out1[10] :
              (DTC_out1 == 8'b00001011 ? coeffs_table_out1[11] :
              (DTC_out1 == 8'b00001100 ? coeffs_table_out1[12] :
              (DTC_out1 == 8'b00001101 ? coeffs_table_out1[13] :
              (DTC_out1 == 8'b00001110 ? coeffs_table_out1[14] :
              (DTC_out1 == 8'b00001111 ? coeffs_table_out1[15] :
              (DTC_out1 == 8'b00010000 ? coeffs_table_out1[16] :
              (DTC_out1 == 8'b00010001 ? coeffs_table_out1[17] :
              (DTC_out1 == 8'b00010010 ? coeffs_table_out1[18] :
              (DTC_out1 == 8'b00010011 ? coeffs_table_out1[19] :
              (DTC_out1 == 8'b00010100 ? coeffs_table_out1[20] :
              (DTC_out1 == 8'b00010101 ? coeffs_table_out1[21] :
              (DTC_out1 == 8'b00010110 ? coeffs_table_out1[22] :
              (DTC_out1 == 8'b00010111 ? coeffs_table_out1[23] :
              (DTC_out1 == 8'b00011000 ? coeffs_table_out1[24] :
              (DTC_out1 == 8'b00011001 ? coeffs_table_out1[25] :
              (DTC_out1 == 8'b00011010 ? coeffs_table_out1[26] :
              (DTC_out1 == 8'b00011011 ? coeffs_table_out1[27] :
              (DTC_out1 == 8'b00011100 ? coeffs_table_out1[28] :
              (DTC_out1 == 8'b00011101 ? coeffs_table_out1[29] :
              (DTC_out1 == 8'b00011110 ? coeffs_table_out1[30] :
              coeffs_table_out1[31])))))))))))))))))))))))))))))));



  assign DTC1_out1 = {1'b0, {Data_Type_Conversion_out1, 2'b00}};



  assign res_x_mul_temp = coeffs_table_domain_out1 * DTC1_out1;
  assign res_x_out1 = res_x_mul_temp[51:25];



  assign coeffs_table1_out1[0] = 27'sb011111100000110110011011000;
  assign coeffs_table1_out1[1] = 27'sb011110100100101000000001110;
  assign coeffs_table1_out1[2] = 27'sb011101101011111001001011110;
  assign coeffs_table1_out1[3] = 27'sb011100110110010110111111011;
  assign coeffs_table1_out1[4] = 27'sb011100000011110000100111010;
  assign coeffs_table1_out1[5] = 27'sb011011010011110111000001011;
  assign coeffs_table1_out1[6] = 27'sb011010100110011100101111101;
  assign coeffs_table1_out1[7] = 27'sb011001111011010101101011001;
  assign coeffs_table1_out1[8] = 27'sb011001010010010110111001110;
  assign coeffs_table1_out1[9] = 27'sb011000101011010110100100100;
  assign coeffs_table1_out1[10] = 27'sb011000000110001011110000001;
  assign coeffs_table1_out1[11] = 27'sb010111100010101110010101101;
  assign coeffs_table1_out1[12] = 27'sb010111000000110110111100101;
  assign coeffs_table1_out1[13] = 27'sb010110100000011110110110110;
  assign coeffs_table1_out1[14] = 27'sb010110000001011111111010001;
  assign coeffs_table1_out1[15] = 27'sb010101100011110100011110100;
  assign coeffs_table1_out1[16] = 27'sb010101000111010111011000111;
  assign coeffs_table1_out1[17] = 27'sb010100101100000011111001100;
  assign coeffs_table1_out1[18] = 27'sb010100010001110101101000011;
  assign coeffs_table1_out1[19] = 27'sb010011111000101000100011100;
  assign coeffs_table1_out1[20] = 27'sb010011100000011000111100001;
  assign coeffs_table1_out1[21] = 27'sb010011001001000011010101111;
  assign coeffs_table1_out1[22] = 27'sb010010110010100100100100001;
  assign coeffs_table1_out1[23] = 27'sb010010011100111001101001011;
  assign coeffs_table1_out1[24] = 27'sb010010000111111111110101001;
  assign coeffs_table1_out1[25] = 27'sb010001110011110100100011100;
  assign coeffs_table1_out1[26] = 27'sb010001100000010101011011110;
  assign coeffs_table1_out1[27] = 27'sb010001001101100000001111010;
  assign coeffs_table1_out1[28] = 27'sb010000111011010010111001000;
  assign coeffs_table1_out1[29] = 27'sb010000101001101011011100100;
  assign coeffs_table1_out1[30] = 27'sb010000011000101000000101100;
  assign coeffs_table1_out1[31] = 27'sb010000001000000111000110101;



  assign coeffs_table_domain_1_out1 = (DTC_out1 == 8'b00000000 ? coeffs_table1_out1[0] :
              (DTC_out1 == 8'b00000001 ? coeffs_table1_out1[1] :
              (DTC_out1 == 8'b00000010 ? coeffs_table1_out1[2] :
              (DTC_out1 == 8'b00000011 ? coeffs_table1_out1[3] :
              (DTC_out1 == 8'b00000100 ? coeffs_table1_out1[4] :
              (DTC_out1 == 8'b00000101 ? coeffs_table1_out1[5] :
              (DTC_out1 == 8'b00000110 ? coeffs_table1_out1[6] :
              (DTC_out1 == 8'b00000111 ? coeffs_table1_out1[7] :
              (DTC_out1 == 8'b00001000 ? coeffs_table1_out1[8] :
              (DTC_out1 == 8'b00001001 ? coeffs_table1_out1[9] :
              (DTC_out1 == 8'b00001010 ? coeffs_table1_out1[10] :
              (DTC_out1 == 8'b00001011 ? coeffs_table1_out1[11] :
              (DTC_out1 == 8'b00001100 ? coeffs_table1_out1[12] :
              (DTC_out1 == 8'b00001101 ? coeffs_table1_out1[13] :
              (DTC_out1 == 8'b00001110 ? coeffs_table1_out1[14] :
              (DTC_out1 == 8'b00001111 ? coeffs_table1_out1[15] :
              (DTC_out1 == 8'b00010000 ? coeffs_table1_out1[16] :
              (DTC_out1 == 8'b00010001 ? coeffs_table1_out1[17] :
              (DTC_out1 == 8'b00010010 ? coeffs_table1_out1[18] :
              (DTC_out1 == 8'b00010011 ? coeffs_table1_out1[19] :
              (DTC_out1 == 8'b00010100 ? coeffs_table1_out1[20] :
              (DTC_out1 == 8'b00010101 ? coeffs_table1_out1[21] :
              (DTC_out1 == 8'b00010110 ? coeffs_table1_out1[22] :
              (DTC_out1 == 8'b00010111 ? coeffs_table1_out1[23] :
              (DTC_out1 == 8'b00011000 ? coeffs_table1_out1[24] :
              (DTC_out1 == 8'b00011001 ? coeffs_table1_out1[25] :
              (DTC_out1 == 8'b00011010 ? coeffs_table1_out1[26] :
              (DTC_out1 == 8'b00011011 ? coeffs_table1_out1[27] :
              (DTC_out1 == 8'b00011100 ? coeffs_table1_out1[28] :
              (DTC_out1 == 8'b00011101 ? coeffs_table1_out1[29] :
              (DTC_out1 == 8'b00011110 ? coeffs_table1_out1[30] :
              coeffs_table1_out1[31])))))))))))))))))))))))))))))));



  assign res_x_coeffs_2_1_add_cast = {{5{res_x_out1[26]}}, res_x_out1};
  assign res_x_coeffs_2_1_add_cast_1 = {{5{coeffs_table_domain_1_out1[26]}}, coeffs_table_domain_1_out1};
  assign res_x_coeffs_2_1_add_temp = res_x_coeffs_2_1_add_cast + res_x_coeffs_2_1_add_cast_1;
  assign res_x_coeffs_2_1_out1 = {res_x_coeffs_2_1_add_temp[25:0], 1'b0};



  assign fi_2_0_2_0_fm_out1 = 2'b10;



  assign DTC5_out1 = {DTC1_out1[25:0], 1'b0};



  assign res_d_cast = {1'b0, DTC5_out1};
  assign res_d_mul_temp = res_x_coeffs_2_1_out1 * res_d_cast;
  assign res_d_cast_1 = res_d_mul_temp[53:0];
  assign res_d_out1 = res_d_cast_1[52:26];



  assign fi_2_0_2_0_fm_res_d_sub_cast = {4'b0, {fi_2_0_2_0_fm_out1, 26'b00000000000000000000000000}};
  assign fi_2_0_2_0_fm_res_d_sub_cast_1 = {5'b0, res_d_out1};
  assign fi_2_0_2_0_fm_res_d_sub_temp = fi_2_0_2_0_fm_res_d_sub_cast - fi_2_0_2_0_fm_res_d_sub_cast_1;
  assign fi_2_0_2_0_fm_res_d_out1 = fi_2_0_2_0_fm_res_d_sub_temp[26:0];



  assign res_fi_2_0_2_0_fm_res_cast = {1'b0, fi_2_0_2_0_fm_res_d_out1};
  assign res_fi_2_0_2_0_fm_res_mul_temp = res_x_coeffs_2_1_out1 * res_fi_2_0_2_0_fm_res_cast;
  assign res_fi_2_0_2_0_fm_res_cast_1 = res_fi_2_0_2_0_fm_res_mul_temp[53:0];
  assign res_fi_2_0_2_0_fm_res_out1 = res_fi_2_0_2_0_fm_res_cast_1[52:26];



  assign Abs_y = {1'b0, res_fi_2_0_2_0_fm_res_out1};
  assign Abs_out1 = Abs_y[26:0];



  assign Data_Type_Conversion_out1_1 = Abs_out1;



  assign Bit_Slice32_out1 = Data_Type_Conversion_out1_1[24];



  assign Constant32_out1 = 5'b00011;



  assign Bit_Slice33_out1 = Data_Type_Conversion_out1_1[25];



  assign Constant33_out1 = 5'b00010;



  assign Switch32_out1 = (Bit_Slice32_out1 == 1'b0 ? Constant32_out1 :
              Constant33_out1);



  assign Bit_Slice34_out1 = Data_Type_Conversion_out1_1[26];



  assign Constant34_out1 = 5'b00001;



  assign Switch33_out1 = (Bit_Slice33_out1 == 1'b0 ? Switch32_out1 :
              Constant34_out1);



  assign Constant35_out1 = 5'b00000;



  assign Switch34_out1 = (Bit_Slice34_out1 == 1'b0 ? Switch33_out1 :
              Constant35_out1);



  assign Bit_Slice25_out1 = Data_Type_Conversion_out1_1[16];



  assign Constant3_out1_2 = 5'b01011;



  assign Bit_Slice24_out1 = Data_Type_Conversion_out1_1[17];



  assign Constant2_out1 = 5'b01010;



  assign Switch2_out1 = (Bit_Slice25_out1 == 1'b0 ? Constant3_out1_2 :
              Constant2_out1);



  assign Bit_Slice27_out1 = Data_Type_Conversion_out1_1[18];



  assign Constant1_out1 = 5'b01001;



  assign Switch1_out1_1 = (Bit_Slice24_out1 == 1'b0 ? Switch2_out1 :
              Constant1_out1);



  assign Bit_Slice15_out1 = Data_Type_Conversion_out1_1[19];



  assign Constant124_out1 = 5'b01000;



  assign Switch116_out1 = (Bit_Slice27_out1 == 1'b0 ? Switch1_out1_1 :
              Constant124_out1);



  assign Bit_Slice16_out1 = Data_Type_Conversion_out1_1[20];



  assign Constant28_out1 = 5'b00111;



  assign Switch17_out1 = (Bit_Slice15_out1 == 1'b0 ? Switch116_out1 :
              Constant28_out1);



  assign Bit_Slice17_out1 = Data_Type_Conversion_out1_1[21];



  assign Constant26_out1 = 5'b00110;



  assign Switch18_out1 = (Bit_Slice16_out1 == 1'b0 ? Switch17_out1 :
              Constant26_out1);



  assign Bit_Slice28_out1 = Data_Type_Conversion_out1_1[22];



  assign Constant27_out1 = 5'b00101;



  assign Switch19_out1 = (Bit_Slice17_out1 == 1'b0 ? Switch18_out1 :
              Constant27_out1);



  assign Bit_Slice29_out1 = Data_Type_Conversion_out1_1[23];



  assign Constant29_out1 = 5'b00100;



  assign Switch28_out1 = (Bit_Slice28_out1 == 1'b0 ? Switch19_out1 :
              Constant29_out1);



  assign Compare_To_Constant3_out1 = Switch34_out1 < 5'b00011;



  assign Constant30_out1 = 5'b00011;



  assign Switch29_out1 = (Bit_Slice29_out1 == 1'b0 ? Switch28_out1 :
              Constant30_out1);



  assign Switch3_out1 = (Compare_To_Constant3_out1 == 1'b0 ? Switch29_out1 :
              Switch34_out1);



  assign Compare_To_Constant5_out1 = Switch3_out1 < 5'b01011;



  assign Bit_Slice29_out1_1 = Data_Type_Conversion_out1_1[8];



  assign Constant29_out1_1 = 5'b10011;



  assign Bit_Slice30_out1 = Data_Type_Conversion_out1_1[9];



  assign Constant30_out1_1 = 5'b10010;



  assign Switch29_out1_1 = (Bit_Slice29_out1_1 == 1'b0 ? Constant29_out1_1 :
              Constant30_out1_1);



  assign Bit_Slice31_out1 = Data_Type_Conversion_out1_1[10];



  assign Constant31_out1 = 5'b10001;



  assign Switch30_out1 = (Bit_Slice30_out1 == 1'b0 ? Switch29_out1_1 :
              Constant31_out1);



  assign Bit_Slice32_out1_1 = Data_Type_Conversion_out1_1[11];



  assign Constant32_out1_1 = 5'b10000;



  assign Switch31_out1 = (Bit_Slice31_out1 == 1'b0 ? Switch30_out1 :
              Constant32_out1_1);



  assign Bit_Slice33_out1_1 = Data_Type_Conversion_out1_1[12];



  assign Constant33_out1_1 = 5'b01111;



  assign Switch32_out1_1 = (Bit_Slice32_out1_1 == 1'b0 ? Switch31_out1 :
              Constant33_out1_1);



  assign Bit_Slice34_out1_1 = Data_Type_Conversion_out1_1[13];



  assign Constant34_out1_1 = 5'b01110;



  assign Switch33_out1_1 = (Bit_Slice33_out1_1 == 1'b0 ? Switch32_out1_1 :
              Constant34_out1_1);



  assign Bit_Slice35_out1 = Data_Type_Conversion_out1_1[14];



  assign Constant35_out1_1 = 5'b01101;



  assign Switch34_out1_1 = (Bit_Slice34_out1_1 == 1'b0 ? Switch33_out1_1 :
              Constant35_out1_1);



  assign Bit_Slice26_out1 = Data_Type_Conversion_out1_1[15];



  assign Constant36_out1 = 5'b01100;



  assign Switch35_out1 = (Bit_Slice35_out1 == 1'b0 ? Switch34_out1_1 :
              Constant36_out1);



  assign Constant3_out1_3 = 5'b01011;



  assign Switch3_out1_1 = (Bit_Slice26_out1 == 1'b0 ? Switch35_out1 :
              Constant3_out1_3);



  assign Bit_Slice26_out1_1 = Data_Type_Conversion_out1_1[0];



  assign Constant4_out1_1 = 5'b11011;



  assign Bit_Slice25_out1_1 = Data_Type_Conversion_out1_1[1];



  assign Constant3_out1_4 = 5'b11010;



  assign Switch3_out1_2 = (Bit_Slice26_out1_1 == 1'b0 ? Constant4_out1_1 :
              Constant3_out1_4);



  assign Bit_Slice24_out1_1 = Data_Type_Conversion_out1_1[2];



  assign Constant2_out1_1 = 5'b11001;



  assign Switch2_out1_1 = (Bit_Slice25_out1_1 == 1'b0 ? Switch3_out1_2 :
              Constant2_out1_1);



  assign Bit_Slice27_out1_1 = Data_Type_Conversion_out1_1[3];



  assign Constant1_out1_1 = 5'b11000;



  assign Switch1_out1_2 = (Bit_Slice24_out1_1 == 1'b0 ? Switch2_out1_1 :
              Constant1_out1_1);



  assign Bit_Slice15_out1_1 = Data_Type_Conversion_out1_1[4];



  assign Constant124_out1_1 = 5'b10111;



  assign Switch116_out1_1 = (Bit_Slice27_out1_1 == 1'b0 ? Switch1_out1_2 :
              Constant124_out1_1);



  assign Bit_Slice16_out1_1 = Data_Type_Conversion_out1_1[5];



  assign Constant28_out1_1 = 5'b10110;



  assign Switch17_out1_1 = (Bit_Slice15_out1_1 == 1'b0 ? Switch116_out1_1 :
              Constant28_out1_1);



  assign Bit_Slice17_out1_1 = Data_Type_Conversion_out1_1[6];



  assign Constant26_out1_1 = 5'b10101;



  assign Switch18_out1_1 = (Bit_Slice16_out1_1 == 1'b0 ? Switch17_out1_1 :
              Constant26_out1_1);



  assign Bit_Slice28_out1_1 = Data_Type_Conversion_out1_1[7];



  assign Constant27_out1_1 = 5'b10100;



  assign Switch19_out1_1 = (Bit_Slice17_out1_1 == 1'b0 ? Switch18_out1_1 :
              Constant27_out1_1);



  assign Compare_To_Constant4_out1 = Switch3_out1_1 < 5'b10011;



  assign Constant29_out1_2 = 5'b10011;



  assign Switch28_out1_1 = (Bit_Slice28_out1_1 == 1'b0 ? Switch19_out1_1 :
              Constant29_out1_2);



  assign Switch4_out1 = (Compare_To_Constant4_out1 == 1'b0 ? Switch28_out1_1 :
              Switch3_out1_1);



  assign Switch5_out1_1 = (Compare_To_Constant5_out1 == 1'b0 ? Switch4_out1 :
              Switch3_out1);



  assign dynamic_shift_1 = {3'b0, Switch5_out1_1};
  assign Shift_Arithmetic_out1 = Data_Type_Conversion_out1_1 <<< dynamic_shift_1;



  assign Bit_Slice2_out1 = Shift_Arithmetic_out1[2:1];



  assign Bit_Slice4_out1 = Bit_Slice2_out1[0];



  assign Bit_Slice5_out1 = Bit_Slice2_out1[1];



  assign Bit_Slice3_out1 = Shift_Arithmetic_out1[3];



  assign Bit_Slice1_out1 = Shift_Arithmetic_out1[0];



  assign Bit_Reduce_out1 = Bit_Slice1_out1;



  assign Logical_Operator1_out1 = Bit_Reduce_out1 | (Bit_Slice4_out1 | Bit_Slice3_out1);



  assign Logical_Operator_out1_1 = Bit_Slice5_out1 & Logical_Operator1_out1;



  assign Bit_Slice1_out1_1 = Shift_Arithmetic_out1[25:3];



  assign Bit_Slice1_out1_dtc = {1'b0, Bit_Slice1_out1_1};



  assign Constant2_out1_2 = 23'b00000000000000000000001;



  assign Add1_1 = {9'b0, Constant2_out1_2};
  assign Add1_2 = {9'b0, Bit_Slice1_out1_1};
  assign Add1_add_temp = Add1_1 + Add1_2;
  assign Add1_out1 = Add1_add_temp[23:0];



  assign Switch2_out1_2 = (Logical_Operator_out1_1 == 1'b0 ? Bit_Slice1_out1_dtc :
              Add1_out1);



  assign Bit_Slice5_out1_1 = Switch2_out1_2[23];



  assign Sum2_1 = {31'b0, Bit_Slice5_out1_1};
  assign Sum2_2 = {27'b0, Switch5_out1_1};
  assign Sum2_sub_temp = Sum2_1 - Sum2_2;
  assign Sum2_out1 = Sum2_sub_temp[8:0];



  assign y_e_fi_exp_fimath_y_e_1 = {{23{Sum2_out1[8]}}, Sum2_out1};
  assign y_e_fi_exp_fimath_y_e_2 = {{23{Sum_out1[8]}}, Sum_out1};
  assign y_e_fi_exp_fimath_y_e_sub_temp = y_e_fi_exp_fimath_y_e_1 - y_e_fi_exp_fimath_y_e_2;
  assign y_e_fi_exp_fimath_y_e_out1 = y_e_fi_exp_fimath_y_e_sub_temp[8:0];



  assign if_exp_1_out1 = (Compare_To_Constant_out1_1 == 1'b0 ? Sum_out1 :
              y_e_fi_exp_fimath_y_e_out1);



  assign exp_12_out1 = if_exp_1_out1 < 9'sb111110100;



  assign C1_out1 = 1'b0;



  assign C_out1 = 1'b1;



  assign if_exp_0_out1 = (Compare_To_Constant_out1_1 == 1'b0 ? C1_out1 :
              C_out1);



  assign alphaadjustment_out1 =  ~ if_exp_0_out1;



  assign exp_12_adjustment_out1 = exp_12_out1 & alphaadjustment_out1;



  assign exp_2_out1 = if_exp_1_out1 == 9'sb000000000;



  assign x_m_1_out1 = Data_Type_Conversion_out1 == 24'b100000000000000000000000;



  assign Logical_Operator_out1_2 = exp_2_out1 & x_m_1_out1;



  assign exp_36_out1 = if_exp_1_out1 >= 9'sb111011100;



  assign alpha1_out1 = 1'b1;



  assign Bit_Slice6_out1 = Switch2_out1_2[22:0];



  assign Bit_Shift2_out1 = Bit_Slice6_out1 >>> 8'd1;



  assign Switch3_out1_3 = (Bit_Slice5_out1_1 == 1'b0 ? Bit_Slice6_out1 :
              Bit_Shift2_out1);



  assign Bit_Concat_out1_1 = {alpha1_out1, Switch3_out1_3};



  assign reinterpretcast_y_m_numericty_out1 = Bit_Concat_out1_1;



  assign if_exp_2_out1 = (Compare_To_Constant_out1_1 == 1'b0 ? Data_Type_Conversion_out1 :
              reinterpretcast_y_m_numericty_out1);



  assign alphaexp_1 = {if_exp_1_out1[8], if_exp_1_out1};
  assign alphaexp_in0 =  - (alphaexp_1);
  assign alphaexp_out1 = alphaexp_in0[8:0];



  assign shift_arithmetic_zerosig = 9'sb000000000;



  assign shift_arithmetic_selsig = (alphaexp_out1 >= shift_arithmetic_zerosig ? alphaexp_out1 :
              shift_arithmetic_zerosig);



  assign C2_out1 = 37'h0000000000;



  assign DTC_out1_1 = {if_exp_2_out1, 13'b0000000000000};



  assign dynamic_shift_zerosig = 9'sb000000000;



  assign dynamic_shift_selsig = (shift_arithmetic_selsig >= dynamic_shift_zerosig ? shift_arithmetic_selsig :
              dynamic_shift_zerosig);



  assign dynamic_shift_cast = {{7{dynamic_shift_selsig[8]}}, dynamic_shift_selsig};
  assign Shift_Arithmetic_out1_1 = DTC_out1_1 >>> dynamic_shift_cast;



  assign if_exp_36_out1 = (exp_36_out1 == 1'b0 ? C2_out1 :
              Shift_Arithmetic_out1_1);



  assign DTC_out1_2 = if_exp_36_out1[36:13];



  assign DTC2_out1 = {1'b0, {DTC_out1_2, 2'b00}};



  assign BitSlice_out1_1 = DTC_out1_2[22:17];



  assign DTC1_out1_1 = {2'b0, BitSlice_out1_1};



  assign coeffs_table1_out1_1[0] = 27'sb111010101010110000011101101;
  assign coeffs_table1_out1_1[1] = 27'sb111010101011010110110100011;
  assign coeffs_table1_out1_1[2] = 27'sb111010101100100011010100110;
  assign coeffs_table1_out1_1[3] = 27'sb111010101110010101100101011;
  assign coeffs_table1_out1_1[4] = 27'sb111010110000101101000000011;
  assign coeffs_table1_out1_1[5] = 27'sb111010110011101000110011111;
  assign coeffs_table1_out1_1[6] = 27'sb111010110111001000000010100;
  assign coeffs_table1_out1_1[7] = 27'sb111010111011001001100011111;
  assign coeffs_table1_out1_1[8] = 27'sb111010111111101100000101101;
  assign coeffs_table1_out1_1[9] = 27'sb111011000100101110001100001;
  assign coeffs_table1_out1_1[10] = 27'sb111011001010001110010011010;
  assign coeffs_table1_out1_1[11] = 27'sb111011010000001010101111011;
  assign coeffs_table1_out1_1[12] = 27'sb111011010110100001101110100;
  assign coeffs_table1_out1_1[13] = 27'sb111011011101010001011001011;
  assign coeffs_table1_out1_1[14] = 27'sb111011100100010111110100000;
  assign coeffs_table1_out1_1[15] = 27'sb111011101011110010111111101;
  assign coeffs_table1_out1_1[16] = 27'sb111011110011100000111010101;
  assign coeffs_table1_out1_1[17] = 27'sb111011111011011111100010100;
  assign coeffs_table1_out1_1[18] = 27'sb111100000011101100110100100;
  assign coeffs_table1_out1_1[19] = 27'sb111100001100000110101110011;
  assign coeffs_table1_out1_1[20] = 27'sb111100010100101011001111011;
  assign coeffs_table1_out1_1[21] = 27'sb111100011101011000011001011;
  assign coeffs_table1_out1_1[22] = 27'sb111100100110001100010001000;
  assign coeffs_table1_out1_1[23] = 27'sb111100101111000100111110110;
  assign coeffs_table1_out1_1[24] = 27'sb111100111000000000101111101;
  assign coeffs_table1_out1_1[25] = 27'sb111101000000111101110101000;
  assign coeffs_table1_out1_1[26] = 27'sb111101001001111010100110000;
  assign coeffs_table1_out1_1[27] = 27'sb111101010010110101011111010;
  assign coeffs_table1_out1_1[28] = 27'sb111101011011101101000011000;
  assign coeffs_table1_out1_1[29] = 27'sb111101100100011111111010000;
  assign coeffs_table1_out1_1[30] = 27'sb111101101101001100110011000;
  assign coeffs_table1_out1_1[31] = 27'sb111101110101110010100011010;
  assign coeffs_table1_out1_1[32] = 27'sb111101111110010000000110000;
  assign coeffs_table1_out1_1[33] = 27'sb111110000110100100011101000;
  assign coeffs_table1_out1_1[34] = 27'sb111110001110101110110000011;
  assign coeffs_table1_out1_1[35] = 27'sb111110010110101110001110001;
  assign coeffs_table1_out1_1[36] = 27'sb111110011110100010001010001;
  assign coeffs_table1_out1_1[37] = 27'sb111110100110001001111110000;
  assign coeffs_table1_out1_1[38] = 27'sb111110101101100101001001000;
  assign coeffs_table1_out1_1[39] = 27'sb111110110100110011001111010;
  assign coeffs_table1_out1_1[40] = 27'sb111110111011110011111010011;
  assign coeffs_table1_out1_1[41] = 27'sb111111000010100110111000001;
  assign coeffs_table1_out1_1[42] = 27'sb111111001001001011111011000;
  assign coeffs_table1_out1_1[43] = 27'sb111111001111100010111001101;
  assign coeffs_table1_out1_1[44] = 27'sb111111010101101011101110011;
  assign coeffs_table1_out1_1[45] = 27'sb111111011011100110010111000;
  assign coeffs_table1_out1_1[46] = 27'sb111111100001010010110100110;
  assign coeffs_table1_out1_1[47] = 27'sb111111100110110001001011110;
  assign coeffs_table1_out1_1[48] = 27'sb111111101100000001100010110;
  assign coeffs_table1_out1_1[49] = 27'sb111111110001000100000010111;
  assign coeffs_table1_out1_1[50] = 27'sb111111110101111000110111110;
  assign coeffs_table1_out1_1[51] = 27'sb111111111010100000001110100;
  assign coeffs_table1_out1_1[52] = 27'sb111111111110111010010110011;
  assign coeffs_table1_out1_1[53] = 27'sb000000000011000111011111101;
  assign coeffs_table1_out1_1[54] = 27'sb000000000111000111111100010;
  assign coeffs_table1_out1_1[55] = 27'sb000000001010111011111111000;
  assign coeffs_table1_out1_1[56] = 27'sb000000001110100011111011111;
  assign coeffs_table1_out1_1[57] = 27'sb000000010010000000000111001;
  assign coeffs_table1_out1_1[58] = 27'sb000000010101010000110110001;
  assign coeffs_table1_out1_1[59] = 27'sb000000011000010110011110011;
  assign coeffs_table1_out1_1[60] = 27'sb000000011011010001010101110;
  assign coeffs_table1_out1_1[61] = 27'sb000000011110000001110010100;
  assign coeffs_table1_out1_1[62] = 27'sb000000100000101000001010110;
  assign coeffs_table1_out1_1[63] = 27'sb000000100011000100110100110;



  assign coeffs_table_domain_1_out1_1 = (DTC1_out1_1 == 8'b00000000 ? coeffs_table1_out1_1[0] :
              (DTC1_out1_1 == 8'b00000001 ? coeffs_table1_out1_1[1] :
              (DTC1_out1_1 == 8'b00000010 ? coeffs_table1_out1_1[2] :
              (DTC1_out1_1 == 8'b00000011 ? coeffs_table1_out1_1[3] :
              (DTC1_out1_1 == 8'b00000100 ? coeffs_table1_out1_1[4] :
              (DTC1_out1_1 == 8'b00000101 ? coeffs_table1_out1_1[5] :
              (DTC1_out1_1 == 8'b00000110 ? coeffs_table1_out1_1[6] :
              (DTC1_out1_1 == 8'b00000111 ? coeffs_table1_out1_1[7] :
              (DTC1_out1_1 == 8'b00001000 ? coeffs_table1_out1_1[8] :
              (DTC1_out1_1 == 8'b00001001 ? coeffs_table1_out1_1[9] :
              (DTC1_out1_1 == 8'b00001010 ? coeffs_table1_out1_1[10] :
              (DTC1_out1_1 == 8'b00001011 ? coeffs_table1_out1_1[11] :
              (DTC1_out1_1 == 8'b00001100 ? coeffs_table1_out1_1[12] :
              (DTC1_out1_1 == 8'b00001101 ? coeffs_table1_out1_1[13] :
              (DTC1_out1_1 == 8'b00001110 ? coeffs_table1_out1_1[14] :
              (DTC1_out1_1 == 8'b00001111 ? coeffs_table1_out1_1[15] :
              (DTC1_out1_1 == 8'b00010000 ? coeffs_table1_out1_1[16] :
              (DTC1_out1_1 == 8'b00010001 ? coeffs_table1_out1_1[17] :
              (DTC1_out1_1 == 8'b00010010 ? coeffs_table1_out1_1[18] :
              (DTC1_out1_1 == 8'b00010011 ? coeffs_table1_out1_1[19] :
              (DTC1_out1_1 == 8'b00010100 ? coeffs_table1_out1_1[20] :
              (DTC1_out1_1 == 8'b00010101 ? coeffs_table1_out1_1[21] :
              (DTC1_out1_1 == 8'b00010110 ? coeffs_table1_out1_1[22] :
              (DTC1_out1_1 == 8'b00010111 ? coeffs_table1_out1_1[23] :
              (DTC1_out1_1 == 8'b00011000 ? coeffs_table1_out1_1[24] :
              (DTC1_out1_1 == 8'b00011001 ? coeffs_table1_out1_1[25] :
              (DTC1_out1_1 == 8'b00011010 ? coeffs_table1_out1_1[26] :
              (DTC1_out1_1 == 8'b00011011 ? coeffs_table1_out1_1[27] :
              (DTC1_out1_1 == 8'b00011100 ? coeffs_table1_out1_1[28] :
              (DTC1_out1_1 == 8'b00011101 ? coeffs_table1_out1_1[29] :
              (DTC1_out1_1 == 8'b00011110 ? coeffs_table1_out1_1[30] :
              (DTC1_out1_1 == 8'b00011111 ? coeffs_table1_out1_1[31] :
              (DTC1_out1_1 == 8'b00100000 ? coeffs_table1_out1_1[32] :
              (DTC1_out1_1 == 8'b00100001 ? coeffs_table1_out1_1[33] :
              (DTC1_out1_1 == 8'b00100010 ? coeffs_table1_out1_1[34] :
              (DTC1_out1_1 == 8'b00100011 ? coeffs_table1_out1_1[35] :
              (DTC1_out1_1 == 8'b00100100 ? coeffs_table1_out1_1[36] :
              (DTC1_out1_1 == 8'b00100101 ? coeffs_table1_out1_1[37] :
              (DTC1_out1_1 == 8'b00100110 ? coeffs_table1_out1_1[38] :
              (DTC1_out1_1 == 8'b00100111 ? coeffs_table1_out1_1[39] :
              (DTC1_out1_1 == 8'b00101000 ? coeffs_table1_out1_1[40] :
              (DTC1_out1_1 == 8'b00101001 ? coeffs_table1_out1_1[41] :
              (DTC1_out1_1 == 8'b00101010 ? coeffs_table1_out1_1[42] :
              (DTC1_out1_1 == 8'b00101011 ? coeffs_table1_out1_1[43] :
              (DTC1_out1_1 == 8'b00101100 ? coeffs_table1_out1_1[44] :
              (DTC1_out1_1 == 8'b00101101 ? coeffs_table1_out1_1[45] :
              (DTC1_out1_1 == 8'b00101110 ? coeffs_table1_out1_1[46] :
              (DTC1_out1_1 == 8'b00101111 ? coeffs_table1_out1_1[47] :
              (DTC1_out1_1 == 8'b00110000 ? coeffs_table1_out1_1[48] :
              (DTC1_out1_1 == 8'b00110001 ? coeffs_table1_out1_1[49] :
              (DTC1_out1_1 == 8'b00110010 ? coeffs_table1_out1_1[50] :
              (DTC1_out1_1 == 8'b00110011 ? coeffs_table1_out1_1[51] :
              (DTC1_out1_1 == 8'b00110100 ? coeffs_table1_out1_1[52] :
              (DTC1_out1_1 == 8'b00110101 ? coeffs_table1_out1_1[53] :
              (DTC1_out1_1 == 8'b00110110 ? coeffs_table1_out1_1[54] :
              (DTC1_out1_1 == 8'b00110111 ? coeffs_table1_out1_1[55] :
              (DTC1_out1_1 == 8'b00111000 ? coeffs_table1_out1_1[56] :
              (DTC1_out1_1 == 8'b00111001 ? coeffs_table1_out1_1[57] :
              (DTC1_out1_1 == 8'b00111010 ? coeffs_table1_out1_1[58] :
              (DTC1_out1_1 == 8'b00111011 ? coeffs_table1_out1_1[59] :
              (DTC1_out1_1 == 8'b00111100 ? coeffs_table1_out1_1[60] :
              (DTC1_out1_1 == 8'b00111101 ? coeffs_table1_out1_1[61] :
              (DTC1_out1_1 == 8'b00111110 ? coeffs_table1_out1_1[62] :
              coeffs_table1_out1_1[63])))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));



  assign res_x_mul_temp_1 = coeffs_table_domain_1_out1_1 * DTC2_out1;
  assign res_x_out1_1 = res_x_mul_temp_1[51:25];



  assign coeffs_table2_out1[0] = 27'sb111111111111111111111101000;
  assign coeffs_table2_out1[1] = 27'sb111111111111111110101010010;
  assign coeffs_table2_out1[2] = 27'sb111111111111111001110010011;
  assign coeffs_table2_out1[3] = 27'sb111111111111101110111110111;
  assign coeffs_table2_out1[4] = 27'sb111111111111011011111101110;
  assign coeffs_table2_out1[5] = 27'sb111111111110111110100010001;
  assign coeffs_table2_out1[6] = 27'sb111111111110010100100110000;
  assign coeffs_table2_out1[7] = 27'sb111111111101011100001011011;
  assign coeffs_table2_out1[8] = 27'sb111111111100010011011101111;
  assign coeffs_table2_out1[9] = 27'sb111111111010111000110011010;
  assign coeffs_table2_out1[10] = 27'sb111111111001001010101100100;
  assign coeffs_table2_out1[11] = 27'sb111111110111000111110110100;
  assign coeffs_table2_out1[12] = 27'sb111111110100101111001010111;
  assign coeffs_table2_out1[13] = 27'sb111111110001111111101111110;
  assign coeffs_table2_out1[14] = 27'sb111111101110111000111000101;
  assign coeffs_table2_out1[15] = 27'sb111111101011011010000110001;
  assign coeffs_table2_out1[16] = 27'sb111111100111100011000101111;
  assign coeffs_table2_out1[17] = 27'sb111111100011010011110010010;
  assign coeffs_table2_out1[18] = 27'sb111111011110101100010010000;
  assign coeffs_table2_out1[19] = 27'sb111111011001101100110111110;
  assign coeffs_table2_out1[20] = 27'sb111111010100010110000001101;
  assign coeffs_table2_out1[21] = 27'sb111111001110101000010111111;
  assign coeffs_table2_out1[22] = 27'sb111111001000100100101100110;
  assign coeffs_table2_out1[23] = 27'sb111111000010001011111011010;
  assign coeffs_table2_out1[24] = 27'sb111110111011011111000110011;
  assign coeffs_table2_out1[25] = 27'sb111110110100011111011000000;
  assign coeffs_table2_out1[26] = 27'sb111110101101001110000000011;
  assign coeffs_table2_out1[27] = 27'sb111110100101101100010100100;
  assign coeffs_table2_out1[28] = 27'sb111110011101111011101101110;
  assign coeffs_table2_out1[29] = 27'sb111110010101111101101000110;
  assign coeffs_table2_out1[30] = 27'sb111110001101110011100100011;
  assign coeffs_table2_out1[31] = 27'sb111110000101011111000000111;
  assign coeffs_table2_out1[32] = 27'sb111101111101000001011111100;
  assign coeffs_table2_out1[33] = 27'sb111101110100011100100001010;
  assign coeffs_table2_out1[34] = 27'sb111101101011110001100110010;
  assign coeffs_table2_out1[35] = 27'sb111101100011000010001101100;
  assign coeffs_table2_out1[36] = 27'sb111101011010001111110011111;
  assign coeffs_table2_out1[37] = 27'sb111101010001011011110011110;
  assign coeffs_table2_out1[38] = 27'sb111101001000100111100100110;
  assign coeffs_table2_out1[39] = 27'sb111100111111110100011011001;
  assign coeffs_table2_out1[40] = 27'sb111100110111000011100111100;
  assign coeffs_table2_out1[41] = 27'sb111100101110010110010110100;
  assign coeffs_table2_out1[42] = 27'sb111100100101101101110000111;
  assign coeffs_table2_out1[43] = 27'sb111100011101001010111010111;
  assign coeffs_table2_out1[44] = 27'sb111100010100101110110100101;
  assign coeffs_table2_out1[45] = 27'sb111100001100011010011001110;
  assign coeffs_table2_out1[46] = 27'sb111100000100001110100001001;
  assign coeffs_table2_out1[47] = 27'sb111011111100001011111101101;
  assign coeffs_table2_out1[48] = 27'sb111011110100010011011101011;
  assign coeffs_table2_out1[49] = 27'sb111011101100100101101010001;
  assign coeffs_table2_out1[50] = 27'sb111011100101000011001001110;
  assign coeffs_table2_out1[51] = 27'sb111011011101101100011101100;
  assign coeffs_table2_out1[52] = 27'sb111011010110100010000010111;
  assign coeffs_table2_out1[53] = 27'sb111011001111100100010011100;
  assign coeffs_table2_out1[54] = 27'sb111011001000110011100101001;
  assign coeffs_table2_out1[55] = 27'sb111011000010010000001010010;
  assign coeffs_table2_out1[56] = 27'sb111010111011111010010001110;
  assign coeffs_table2_out1[57] = 27'sb111010110101110010000111100;
  assign coeffs_table2_out1[58] = 27'sb111010101111110111110100000;
  assign coeffs_table2_out1[59] = 27'sb111010101010001011011101100;
  assign coeffs_table2_out1[60] = 27'sb111010100100101101000111010;
  assign coeffs_table2_out1[61] = 27'sb111010011111011100110010001;
  assign coeffs_table2_out1[62] = 27'sb111010011010011010011100110;
  assign coeffs_table2_out1[63] = 27'sb111010010101100110000011100;



  assign coeffs_table_domain_2_out1 = (DTC1_out1_1 == 8'b00000000 ? coeffs_table2_out1[0] :
              (DTC1_out1_1 == 8'b00000001 ? coeffs_table2_out1[1] :
              (DTC1_out1_1 == 8'b00000010 ? coeffs_table2_out1[2] :
              (DTC1_out1_1 == 8'b00000011 ? coeffs_table2_out1[3] :
              (DTC1_out1_1 == 8'b00000100 ? coeffs_table2_out1[4] :
              (DTC1_out1_1 == 8'b00000101 ? coeffs_table2_out1[5] :
              (DTC1_out1_1 == 8'b00000110 ? coeffs_table2_out1[6] :
              (DTC1_out1_1 == 8'b00000111 ? coeffs_table2_out1[7] :
              (DTC1_out1_1 == 8'b00001000 ? coeffs_table2_out1[8] :
              (DTC1_out1_1 == 8'b00001001 ? coeffs_table2_out1[9] :
              (DTC1_out1_1 == 8'b00001010 ? coeffs_table2_out1[10] :
              (DTC1_out1_1 == 8'b00001011 ? coeffs_table2_out1[11] :
              (DTC1_out1_1 == 8'b00001100 ? coeffs_table2_out1[12] :
              (DTC1_out1_1 == 8'b00001101 ? coeffs_table2_out1[13] :
              (DTC1_out1_1 == 8'b00001110 ? coeffs_table2_out1[14] :
              (DTC1_out1_1 == 8'b00001111 ? coeffs_table2_out1[15] :
              (DTC1_out1_1 == 8'b00010000 ? coeffs_table2_out1[16] :
              (DTC1_out1_1 == 8'b00010001 ? coeffs_table2_out1[17] :
              (DTC1_out1_1 == 8'b00010010 ? coeffs_table2_out1[18] :
              (DTC1_out1_1 == 8'b00010011 ? coeffs_table2_out1[19] :
              (DTC1_out1_1 == 8'b00010100 ? coeffs_table2_out1[20] :
              (DTC1_out1_1 == 8'b00010101 ? coeffs_table2_out1[21] :
              (DTC1_out1_1 == 8'b00010110 ? coeffs_table2_out1[22] :
              (DTC1_out1_1 == 8'b00010111 ? coeffs_table2_out1[23] :
              (DTC1_out1_1 == 8'b00011000 ? coeffs_table2_out1[24] :
              (DTC1_out1_1 == 8'b00011001 ? coeffs_table2_out1[25] :
              (DTC1_out1_1 == 8'b00011010 ? coeffs_table2_out1[26] :
              (DTC1_out1_1 == 8'b00011011 ? coeffs_table2_out1[27] :
              (DTC1_out1_1 == 8'b00011100 ? coeffs_table2_out1[28] :
              (DTC1_out1_1 == 8'b00011101 ? coeffs_table2_out1[29] :
              (DTC1_out1_1 == 8'b00011110 ? coeffs_table2_out1[30] :
              (DTC1_out1_1 == 8'b00011111 ? coeffs_table2_out1[31] :
              (DTC1_out1_1 == 8'b00100000 ? coeffs_table2_out1[32] :
              (DTC1_out1_1 == 8'b00100001 ? coeffs_table2_out1[33] :
              (DTC1_out1_1 == 8'b00100010 ? coeffs_table2_out1[34] :
              (DTC1_out1_1 == 8'b00100011 ? coeffs_table2_out1[35] :
              (DTC1_out1_1 == 8'b00100100 ? coeffs_table2_out1[36] :
              (DTC1_out1_1 == 8'b00100101 ? coeffs_table2_out1[37] :
              (DTC1_out1_1 == 8'b00100110 ? coeffs_table2_out1[38] :
              (DTC1_out1_1 == 8'b00100111 ? coeffs_table2_out1[39] :
              (DTC1_out1_1 == 8'b00101000 ? coeffs_table2_out1[40] :
              (DTC1_out1_1 == 8'b00101001 ? coeffs_table2_out1[41] :
              (DTC1_out1_1 == 8'b00101010 ? coeffs_table2_out1[42] :
              (DTC1_out1_1 == 8'b00101011 ? coeffs_table2_out1[43] :
              (DTC1_out1_1 == 8'b00101100 ? coeffs_table2_out1[44] :
              (DTC1_out1_1 == 8'b00101101 ? coeffs_table2_out1[45] :
              (DTC1_out1_1 == 8'b00101110 ? coeffs_table2_out1[46] :
              (DTC1_out1_1 == 8'b00101111 ? coeffs_table2_out1[47] :
              (DTC1_out1_1 == 8'b00110000 ? coeffs_table2_out1[48] :
              (DTC1_out1_1 == 8'b00110001 ? coeffs_table2_out1[49] :
              (DTC1_out1_1 == 8'b00110010 ? coeffs_table2_out1[50] :
              (DTC1_out1_1 == 8'b00110011 ? coeffs_table2_out1[51] :
              (DTC1_out1_1 == 8'b00110100 ? coeffs_table2_out1[52] :
              (DTC1_out1_1 == 8'b00110101 ? coeffs_table2_out1[53] :
              (DTC1_out1_1 == 8'b00110110 ? coeffs_table2_out1[54] :
              (DTC1_out1_1 == 8'b00110111 ? coeffs_table2_out1[55] :
              (DTC1_out1_1 == 8'b00111000 ? coeffs_table2_out1[56] :
              (DTC1_out1_1 == 8'b00111001 ? coeffs_table2_out1[57] :
              (DTC1_out1_1 == 8'b00111010 ? coeffs_table2_out1[58] :
              (DTC1_out1_1 == 8'b00111011 ? coeffs_table2_out1[59] :
              (DTC1_out1_1 == 8'b00111100 ? coeffs_table2_out1[60] :
              (DTC1_out1_1 == 8'b00111101 ? coeffs_table2_out1[61] :
              (DTC1_out1_1 == 8'b00111110 ? coeffs_table2_out1[62] :
              coeffs_table2_out1[63])))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));



  assign res_x_coeffs_3_1_add_cast = {{5{res_x_out1_1[26]}}, res_x_out1_1};
  assign res_x_coeffs_3_1_add_cast_1 = {{5{coeffs_table_domain_2_out1[26]}}, coeffs_table_domain_2_out1};
  assign res_x_coeffs_3_1_add_temp = res_x_coeffs_3_1_add_cast + res_x_coeffs_3_1_add_cast_1;
  assign res_x_coeffs_3_1_out1 = res_x_coeffs_3_1_add_temp[26:0];



  assign res_x_mul_temp_2 = DTC2_out1 * res_x_coeffs_3_1_out1;
  assign res_x_out1_2 = res_x_mul_temp_2[51:25];



  assign coeffs_table3_out1[0] = 27'sb010000000000000000000000000;
  assign coeffs_table3_out1[1] = 27'sb010000000000000000000000110;
  assign coeffs_table3_out1[2] = 27'sb010000000000000000000101110;
  assign coeffs_table3_out1[3] = 27'sb010000000000000000010110001;
  assign coeffs_table3_out1[4] = 27'sb010000000000000000111100011;
  assign coeffs_table3_out1[5] = 27'sb010000000000000010000110010;
  assign coeffs_table3_out1[6] = 27'sb010000000000000100000100011;
  assign coeffs_table3_out1[7] = 27'sb010000000000000111001010001;
  assign coeffs_table3_out1[8] = 27'sb010000000000001011101101011;
  assign coeffs_table3_out1[9] = 27'sb010000000000010010000101111;
  assign coeffs_table3_out1[10] = 27'sb010000000000011010101100111;
  assign coeffs_table3_out1[11] = 27'sb010000000000100101111101000;
  assign coeffs_table3_out1[12] = 27'sb010000000000110100010001101;
  assign coeffs_table3_out1[13] = 27'sb010000000001000110000110011;
  assign coeffs_table3_out1[14] = 27'sb010000000001011011110110111;
  assign coeffs_table3_out1[15] = 27'sb010000000001110101111110011;
  assign coeffs_table3_out1[16] = 27'sb010000000010010100110110111;
  assign coeffs_table3_out1[17] = 27'sb010000000010111000111001100;
  assign coeffs_table3_out1[18] = 27'sb010000000011100010011101100;
  assign coeffs_table3_out1[19] = 27'sb010000000100010001111000011;
  assign coeffs_table3_out1[20] = 27'sb010000000101000111011101010;
  assign coeffs_table3_out1[21] = 27'sb010000000110000011011100111;
  assign coeffs_table3_out1[22] = 27'sb010000000111000110000101110;
  assign coeffs_table3_out1[23] = 27'sb010000001000001111100010111;
  assign coeffs_table3_out1[24] = 27'sb010000001001011111111101000;
  assign coeffs_table3_out1[25] = 27'sb010000001010110111011001110;
  assign coeffs_table3_out1[26] = 27'sb010000001100010101111011110;
  assign coeffs_table3_out1[27] = 27'sb010000001101111011100010101;
  assign coeffs_table3_out1[28] = 27'sb010000001111101000001011001;
  assign coeffs_table3_out1[29] = 27'sb010000010001011011101111010;
  assign coeffs_table3_out1[30] = 27'sb010000010011010110000110010;
  assign coeffs_table3_out1[31] = 27'sb010000010101010111000100110;
  assign coeffs_table3_out1[32] = 27'sb010000010111011110011100111;
  assign coeffs_table3_out1[33] = 27'sb010000011001101011111110110;
  assign coeffs_table3_out1[34] = 27'sb010000011011111111011000001;
  assign coeffs_table3_out1[35] = 27'sb010000011110011000010101001;
  assign coeffs_table3_out1[36] = 27'sb010000100000110110100000000;
  assign coeffs_table3_out1[37] = 27'sb010000100011011001100001100;
  assign coeffs_table3_out1[38] = 27'sb010000100110000001000001101;
  assign coeffs_table3_out1[39] = 27'sb010000101000101100100110100;
  assign coeffs_table3_out1[40] = 27'sb010000101011011011110110001;
  assign coeffs_table3_out1[41] = 27'sb010000101110001110010101100;
  assign coeffs_table3_out1[42] = 27'sb010000110001000011101001011;
  assign coeffs_table3_out1[43] = 27'sb010000110011111011010101111;
  assign coeffs_table3_out1[44] = 27'sb010000110110110100111111011;
  assign coeffs_table3_out1[45] = 27'sb010000111001110000001010001;
  assign coeffs_table3_out1[46] = 27'sb010000111100101100011010111;
  assign coeffs_table3_out1[47] = 27'sb010000111111101001010110001;
  assign coeffs_table3_out1[48] = 27'sb010001000010100110100001101;
  assign coeffs_table3_out1[49] = 27'sb010001000101100011100010111;
  assign coeffs_table3_out1[50] = 27'sb010001001000100000000000111;
  assign coeffs_table3_out1[51] = 27'sb010001001011011011100010110;
  assign coeffs_table3_out1[52] = 27'sb010001001110010101110000111;
  assign coeffs_table3_out1[53] = 27'sb010001010001001110010100010;
  assign coeffs_table3_out1[54] = 27'sb010001010100000100110111000;
  assign coeffs_table3_out1[55] = 27'sb010001010110111001000100011;
  assign coeffs_table3_out1[56] = 27'sb010001011001101010101000010;
  assign coeffs_table3_out1[57] = 27'sb010001011100011001010000001;
  assign coeffs_table3_out1[58] = 27'sb010001011111000100101010010;
  assign coeffs_table3_out1[59] = 27'sb010001100001101100100101111;
  assign coeffs_table3_out1[60] = 27'sb010001100100010000110011101;
  assign coeffs_table3_out1[61] = 27'sb010001100110110001000101000;
  assign coeffs_table3_out1[62] = 27'sb010001101001001101001100101;
  assign coeffs_table3_out1[63] = 27'sb010001101011100100111110011;



  assign coeffs_table_domain_3_out1 = (DTC1_out1_1 == 8'b00000000 ? coeffs_table3_out1[0] :
              (DTC1_out1_1 == 8'b00000001 ? coeffs_table3_out1[1] :
              (DTC1_out1_1 == 8'b00000010 ? coeffs_table3_out1[2] :
              (DTC1_out1_1 == 8'b00000011 ? coeffs_table3_out1[3] :
              (DTC1_out1_1 == 8'b00000100 ? coeffs_table3_out1[4] :
              (DTC1_out1_1 == 8'b00000101 ? coeffs_table3_out1[5] :
              (DTC1_out1_1 == 8'b00000110 ? coeffs_table3_out1[6] :
              (DTC1_out1_1 == 8'b00000111 ? coeffs_table3_out1[7] :
              (DTC1_out1_1 == 8'b00001000 ? coeffs_table3_out1[8] :
              (DTC1_out1_1 == 8'b00001001 ? coeffs_table3_out1[9] :
              (DTC1_out1_1 == 8'b00001010 ? coeffs_table3_out1[10] :
              (DTC1_out1_1 == 8'b00001011 ? coeffs_table3_out1[11] :
              (DTC1_out1_1 == 8'b00001100 ? coeffs_table3_out1[12] :
              (DTC1_out1_1 == 8'b00001101 ? coeffs_table3_out1[13] :
              (DTC1_out1_1 == 8'b00001110 ? coeffs_table3_out1[14] :
              (DTC1_out1_1 == 8'b00001111 ? coeffs_table3_out1[15] :
              (DTC1_out1_1 == 8'b00010000 ? coeffs_table3_out1[16] :
              (DTC1_out1_1 == 8'b00010001 ? coeffs_table3_out1[17] :
              (DTC1_out1_1 == 8'b00010010 ? coeffs_table3_out1[18] :
              (DTC1_out1_1 == 8'b00010011 ? coeffs_table3_out1[19] :
              (DTC1_out1_1 == 8'b00010100 ? coeffs_table3_out1[20] :
              (DTC1_out1_1 == 8'b00010101 ? coeffs_table3_out1[21] :
              (DTC1_out1_1 == 8'b00010110 ? coeffs_table3_out1[22] :
              (DTC1_out1_1 == 8'b00010111 ? coeffs_table3_out1[23] :
              (DTC1_out1_1 == 8'b00011000 ? coeffs_table3_out1[24] :
              (DTC1_out1_1 == 8'b00011001 ? coeffs_table3_out1[25] :
              (DTC1_out1_1 == 8'b00011010 ? coeffs_table3_out1[26] :
              (DTC1_out1_1 == 8'b00011011 ? coeffs_table3_out1[27] :
              (DTC1_out1_1 == 8'b00011100 ? coeffs_table3_out1[28] :
              (DTC1_out1_1 == 8'b00011101 ? coeffs_table3_out1[29] :
              (DTC1_out1_1 == 8'b00011110 ? coeffs_table3_out1[30] :
              (DTC1_out1_1 == 8'b00011111 ? coeffs_table3_out1[31] :
              (DTC1_out1_1 == 8'b00100000 ? coeffs_table3_out1[32] :
              (DTC1_out1_1 == 8'b00100001 ? coeffs_table3_out1[33] :
              (DTC1_out1_1 == 8'b00100010 ? coeffs_table3_out1[34] :
              (DTC1_out1_1 == 8'b00100011 ? coeffs_table3_out1[35] :
              (DTC1_out1_1 == 8'b00100100 ? coeffs_table3_out1[36] :
              (DTC1_out1_1 == 8'b00100101 ? coeffs_table3_out1[37] :
              (DTC1_out1_1 == 8'b00100110 ? coeffs_table3_out1[38] :
              (DTC1_out1_1 == 8'b00100111 ? coeffs_table3_out1[39] :
              (DTC1_out1_1 == 8'b00101000 ? coeffs_table3_out1[40] :
              (DTC1_out1_1 == 8'b00101001 ? coeffs_table3_out1[41] :
              (DTC1_out1_1 == 8'b00101010 ? coeffs_table3_out1[42] :
              (DTC1_out1_1 == 8'b00101011 ? coeffs_table3_out1[43] :
              (DTC1_out1_1 == 8'b00101100 ? coeffs_table3_out1[44] :
              (DTC1_out1_1 == 8'b00101101 ? coeffs_table3_out1[45] :
              (DTC1_out1_1 == 8'b00101110 ? coeffs_table3_out1[46] :
              (DTC1_out1_1 == 8'b00101111 ? coeffs_table3_out1[47] :
              (DTC1_out1_1 == 8'b00110000 ? coeffs_table3_out1[48] :
              (DTC1_out1_1 == 8'b00110001 ? coeffs_table3_out1[49] :
              (DTC1_out1_1 == 8'b00110010 ? coeffs_table3_out1[50] :
              (DTC1_out1_1 == 8'b00110011 ? coeffs_table3_out1[51] :
              (DTC1_out1_1 == 8'b00110100 ? coeffs_table3_out1[52] :
              (DTC1_out1_1 == 8'b00110101 ? coeffs_table3_out1[53] :
              (DTC1_out1_1 == 8'b00110110 ? coeffs_table3_out1[54] :
              (DTC1_out1_1 == 8'b00110111 ? coeffs_table3_out1[55] :
              (DTC1_out1_1 == 8'b00111000 ? coeffs_table3_out1[56] :
              (DTC1_out1_1 == 8'b00111001 ? coeffs_table3_out1[57] :
              (DTC1_out1_1 == 8'b00111010 ? coeffs_table3_out1[58] :
              (DTC1_out1_1 == 8'b00111011 ? coeffs_table3_out1[59] :
              (DTC1_out1_1 == 8'b00111100 ? coeffs_table3_out1[60] :
              (DTC1_out1_1 == 8'b00111101 ? coeffs_table3_out1[61] :
              (DTC1_out1_1 == 8'b00111110 ? coeffs_table3_out1[62] :
              coeffs_table3_out1[63])))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));



  assign res_x_coeffs_2_1_add_cast_2 = {{5{res_x_out1_2[26]}}, res_x_out1_2};
  assign res_x_coeffs_2_1_add_cast_3 = {{5{coeffs_table_domain_3_out1[26]}}, coeffs_table_domain_3_out1};
  assign res_x_coeffs_2_1_add_temp_1 = res_x_coeffs_2_1_add_cast_2 + res_x_coeffs_2_1_add_cast_3;
  assign res_x_coeffs_2_1_out1_1 = res_x_coeffs_2_1_add_temp_1[26:0];



  assign res_x_cast = {1'b0, if_exp_36_out1};
  assign res_x_mul_temp_3 = res_x_coeffs_2_1_out1_1 * res_x_cast;
  assign res_x_out1_3 = res_x_mul_temp_3[63:0];



  assign alphaexp_3 = {if_exp_1_out1[8], if_exp_1_out1};
  assign alphaexp_in0_1 =  - (alphaexp_3);
  assign alphaexp_out1_1 = alphaexp_in0_1[8:0];



  assign alphaexp_res_WordLength_out1 = alphaexp_out1_1 < 9'sb001000000;



  assign alphaexp1_1 = {if_exp_1_out1[8], if_exp_1_out1};
  assign alphaexp1_in0 =  - (alphaexp1_1);
  assign alphaexp1_out1 = alphaexp1_in0[8:0];



  assign shift_arithmetic_zerosig_1 = 9'sb000000000;



  assign shift_arithmetic_selsig_1 = (alphaexp1_out1 >= shift_arithmetic_zerosig_1 ? alphaexp1_out1 :
              shift_arithmetic_zerosig_1);



  assign exp_1_out1 = if_exp_1_out1 < 9'sb111110100;



  assign C_out1_1 = 64'sh1921FB54442D1800;



  assign if_x_m_1_out1 = (Logical_Operator_out1_2 == 1'b0 ? res_x_out1_3 :
              C_out1_1);



  assign C2_out1_1 = 64'sh0000000000000000;



  assign dtc_out1_3 = {2'b0, {if_exp_2_out1, 38'b00000000000000000000000000000000000000}};



  assign dynamic_shift_zerosig_1 = 9'sb000000000;



  assign dynamic_shift_selsig_1 = (shift_arithmetic_selsig_1 >= dynamic_shift_zerosig_1 ? shift_arithmetic_selsig_1 :
              dynamic_shift_zerosig_1);



  assign dynamic_shift_cast_1 = {{7{dynamic_shift_selsig_1[8]}}, dynamic_shift_selsig_1};
  assign Shift_Arithmetic_out1_2 = dtc_out1_3 >>> dynamic_shift_cast_1;



  assign if_exp_res_WordLength_out1 = (alphaexp_res_WordLength_out1 == 1'b0 ? C2_out1_1 :
              Shift_Arithmetic_out1_2);



  assign if_exp_12_out1 = (exp_1_out1 == 1'b0 ? if_x_m_1_out1 :
              if_exp_res_WordLength_out1);



  assign alpha1_5707963267948966_out1 = 64'sh6487ED5110B46000;



  assign alpha1_5_res_sub_cast = {alpha1_5707963267948966_out1[63], alpha1_5707963267948966_out1[63:1]};
  assign alpha1_5_res_out1 = alpha1_5_res_sub_cast - if_exp_12_out1;



  assign if_adjustment_out1 = (if_exp_0_out1 == 1'b0 ? if_exp_12_out1 :
              alpha1_5_res_out1);



  assign DTC1_out1_2 = if_adjustment_out1[61:0];



  assign Abs_y_1 = {1'b0, DTC1_out1_2};
  assign Abs_out1_1 = Abs_y_1[61:0];



  assign Data_Type_Conversion_out1_2 = Abs_out1_1;



  assign Bit_Slice32_out1_2 = Data_Type_Conversion_out1_2[56];



  assign Constant32_out1_2 = 6'b000110;



  assign Bit_Slice33_out1_2 = Data_Type_Conversion_out1_2[57];



  assign Constant33_out1_2 = 6'b000101;



  assign Switch32_out1_2 = (Bit_Slice32_out1_2 == 1'b0 ? Constant32_out1_2 :
              Constant33_out1_2);



  assign Bit_Slice34_out1_2 = Data_Type_Conversion_out1_2[58];



  assign Constant34_out1_2 = 6'b000100;



  assign Switch33_out1_2 = (Bit_Slice33_out1_2 == 1'b0 ? Switch32_out1_2 :
              Constant34_out1_2);



  assign Bit_Slice15_out1_2 = Data_Type_Conversion_out1_2[59];



  assign Constant35_out1_2 = 6'b000011;



  assign Switch34_out1_2 = (Bit_Slice34_out1_2 == 1'b0 ? Switch33_out1_2 :
              Constant35_out1_2);



  assign Bit_Slice16_out1_2 = Data_Type_Conversion_out1_2[60];



  assign Constant28_out1_2 = 6'b000010;



  assign Switch17_out1_2 = (Bit_Slice15_out1_2 == 1'b0 ? Switch34_out1_2 :
              Constant28_out1_2);



  assign Bit_Slice17_out1_2 = Data_Type_Conversion_out1_2[61];



  assign Constant26_out1_2 = 6'b000001;



  assign Switch18_out1_2 = (Bit_Slice16_out1_2 == 1'b0 ? Switch17_out1_2 :
              Constant26_out1_2);



  assign Constant27_out1_2 = 6'b000000;



  assign Switch19_out1_2 = (Bit_Slice17_out1_2 == 1'b0 ? Switch18_out1_2 :
              Constant27_out1_2);



  assign Bit_Slice25_out1_2 = Data_Type_Conversion_out1_2[48];



  assign Constant3_out1_5 = 6'b001110;



  assign Bit_Slice24_out1_2 = Data_Type_Conversion_out1_2[49];



  assign Constant2_out1_3 = 6'b001101;



  assign Switch2_out1_3 = (Bit_Slice25_out1_2 == 1'b0 ? Constant3_out1_5 :
              Constant2_out1_3);



  assign Bit_Slice27_out1_2 = Data_Type_Conversion_out1_2[50];



  assign Constant1_out1_2 = 6'b001100;



  assign Switch1_out1_3 = (Bit_Slice24_out1_2 == 1'b0 ? Switch2_out1_3 :
              Constant1_out1_2);



  assign Bit_Slice15_out1_3 = Data_Type_Conversion_out1_2[51];



  assign Constant124_out1_2 = 6'b001011;



  assign Switch116_out1_2 = (Bit_Slice27_out1_2 == 1'b0 ? Switch1_out1_3 :
              Constant124_out1_2);



  assign Bit_Slice16_out1_3 = Data_Type_Conversion_out1_2[52];



  assign Constant28_out1_3 = 6'b001010;



  assign Switch17_out1_3 = (Bit_Slice15_out1_3 == 1'b0 ? Switch116_out1_2 :
              Constant28_out1_3);



  assign Bit_Slice17_out1_3 = Data_Type_Conversion_out1_2[53];



  assign Constant26_out1_3 = 6'b001001;



  assign Switch18_out1_3 = (Bit_Slice16_out1_3 == 1'b0 ? Switch17_out1_3 :
              Constant26_out1_3);



  assign Bit_Slice28_out1_2 = Data_Type_Conversion_out1_2[54];



  assign Constant27_out1_3 = 6'b001000;



  assign Switch19_out1_3 = (Bit_Slice17_out1_3 == 1'b0 ? Switch18_out1_3 :
              Constant27_out1_3);



  assign Bit_Slice29_out1_2 = Data_Type_Conversion_out1_2[55];



  assign Constant29_out1_3 = 6'b000111;



  assign Switch28_out1_2 = (Bit_Slice28_out1_2 == 1'b0 ? Switch19_out1_3 :
              Constant29_out1_3);



  assign Compare_To_Constant1_out1 = Switch19_out1_2 < 6'b000110;



  assign Constant30_out1_2 = 6'b000110;



  assign Switch29_out1_2 = (Bit_Slice29_out1_2 == 1'b0 ? Switch28_out1_2 :
              Constant30_out1_2);



  assign Switch1_out1_4 = (Compare_To_Constant1_out1 == 1'b0 ? Switch29_out1_2 :
              Switch19_out1_2);



  assign Compare_To_Constant7_out1 = Switch1_out1_4 < 6'b001110;



  assign Bit_Slice29_out1_3 = Data_Type_Conversion_out1_2[40];



  assign Constant29_out1_4 = 6'b010110;



  assign Bit_Slice30_out1_1 = Data_Type_Conversion_out1_2[41];



  assign Constant30_out1_3 = 6'b010101;



  assign Switch29_out1_3 = (Bit_Slice29_out1_3 == 1'b0 ? Constant29_out1_4 :
              Constant30_out1_3);



  assign Bit_Slice31_out1_1 = Data_Type_Conversion_out1_2[42];



  assign Constant31_out1_1 = 6'b010100;



  assign Switch30_out1_1 = (Bit_Slice30_out1_1 == 1'b0 ? Switch29_out1_3 :
              Constant31_out1_1);



  assign Bit_Slice32_out1_3 = Data_Type_Conversion_out1_2[43];



  assign Constant32_out1_3 = 6'b010011;



  assign Switch31_out1_1 = (Bit_Slice31_out1_1 == 1'b0 ? Switch30_out1_1 :
              Constant32_out1_3);



  assign Bit_Slice33_out1_3 = Data_Type_Conversion_out1_2[44];



  assign Constant33_out1_3 = 6'b010010;



  assign Switch32_out1_3 = (Bit_Slice32_out1_3 == 1'b0 ? Switch31_out1_1 :
              Constant33_out1_3);



  assign Bit_Slice34_out1_3 = Data_Type_Conversion_out1_2[45];



  assign Constant34_out1_3 = 6'b010001;



  assign Switch33_out1_3 = (Bit_Slice33_out1_3 == 1'b0 ? Switch32_out1_3 :
              Constant34_out1_3);



  assign Bit_Slice35_out1_1 = Data_Type_Conversion_out1_2[46];



  assign Constant35_out1_3 = 6'b010000;



  assign Switch34_out1_3 = (Bit_Slice34_out1_3 == 1'b0 ? Switch33_out1_3 :
              Constant35_out1_3);



  assign Bit_Slice26_out1_2 = Data_Type_Conversion_out1_2[47];



  assign Constant36_out1_1 = 6'b001111;



  assign Switch35_out1_1 = (Bit_Slice35_out1_1 == 1'b0 ? Switch34_out1_3 :
              Constant36_out1_1);



  assign Constant3_out1_6 = 6'b001110;



  assign Switch3_out1_4 = (Bit_Slice26_out1_2 == 1'b0 ? Switch35_out1_1 :
              Constant3_out1_6);



  assign Bit_Slice26_out1_3 = Data_Type_Conversion_out1_2[32];



  assign Constant4_out1_2 = 6'b011110;



  assign Bit_Slice25_out1_3 = Data_Type_Conversion_out1_2[33];



  assign Constant3_out1_7 = 6'b011101;



  assign Switch3_out1_5 = (Bit_Slice26_out1_3 == 1'b0 ? Constant4_out1_2 :
              Constant3_out1_7);



  assign Bit_Slice24_out1_3 = Data_Type_Conversion_out1_2[34];



  assign Constant2_out1_4 = 6'b011100;



  assign Switch2_out1_4 = (Bit_Slice25_out1_3 == 1'b0 ? Switch3_out1_5 :
              Constant2_out1_4);



  assign Bit_Slice27_out1_3 = Data_Type_Conversion_out1_2[35];



  assign Constant1_out1_3 = 6'b011011;



  assign Switch1_out1_5 = (Bit_Slice24_out1_3 == 1'b0 ? Switch2_out1_4 :
              Constant1_out1_3);



  assign Bit_Slice15_out1_4 = Data_Type_Conversion_out1_2[36];



  assign Constant124_out1_3 = 6'b011010;



  assign Switch116_out1_3 = (Bit_Slice27_out1_3 == 1'b0 ? Switch1_out1_5 :
              Constant124_out1_3);



  assign Bit_Slice16_out1_4 = Data_Type_Conversion_out1_2[37];



  assign Constant28_out1_4 = 6'b011001;



  assign Switch17_out1_4 = (Bit_Slice15_out1_4 == 1'b0 ? Switch116_out1_3 :
              Constant28_out1_4);



  assign Bit_Slice17_out1_4 = Data_Type_Conversion_out1_2[38];



  assign Constant26_out1_4 = 6'b011000;



  assign Switch18_out1_4 = (Bit_Slice16_out1_4 == 1'b0 ? Switch17_out1_4 :
              Constant26_out1_4);



  assign Bit_Slice28_out1_3 = Data_Type_Conversion_out1_2[39];



  assign Constant27_out1_4 = 6'b010111;



  assign Switch19_out1_4 = (Bit_Slice17_out1_4 == 1'b0 ? Switch18_out1_4 :
              Constant27_out1_4);



  assign Compare_To_Constant2_out1 = Switch3_out1_4 < 6'b010110;



  assign Constant29_out1_5 = 6'b010110;



  assign Switch28_out1_3 = (Bit_Slice28_out1_3 == 1'b0 ? Switch19_out1_4 :
              Constant29_out1_5);



  assign Switch2_out1_5 = (Compare_To_Constant2_out1 == 1'b0 ? Switch28_out1_3 :
              Switch3_out1_4);



  assign Switch6_out1 = (Compare_To_Constant7_out1 == 1'b0 ? Switch2_out1_5 :
              Switch1_out1_4);



  assign Compare_To_Constant6_out1 = Switch6_out1 < 6'b011110;



  assign Bit_Slice32_out1_4 = Data_Type_Conversion_out1_2[24];



  assign Constant32_out1_4 = 6'b100110;



  assign Bit_Slice33_out1_4 = Data_Type_Conversion_out1_2[25];



  assign Constant33_out1_4 = 6'b100101;



  assign Switch32_out1_4 = (Bit_Slice32_out1_4 == 1'b0 ? Constant32_out1_4 :
              Constant33_out1_4);



  assign Bit_Slice34_out1_4 = Data_Type_Conversion_out1_2[26];



  assign Constant34_out1_4 = 6'b100100;



  assign Switch33_out1_4 = (Bit_Slice33_out1_4 == 1'b0 ? Switch32_out1_4 :
              Constant34_out1_4);



  assign Bit_Slice15_out1_5 = Data_Type_Conversion_out1_2[27];



  assign Constant35_out1_4 = 6'b100011;



  assign Switch34_out1_4 = (Bit_Slice34_out1_4 == 1'b0 ? Switch33_out1_4 :
              Constant35_out1_4);



  assign Bit_Slice16_out1_5 = Data_Type_Conversion_out1_2[28];



  assign Constant28_out1_5 = 6'b100010;



  assign Switch17_out1_5 = (Bit_Slice15_out1_5 == 1'b0 ? Switch34_out1_4 :
              Constant28_out1_5);



  assign Bit_Slice17_out1_5 = Data_Type_Conversion_out1_2[29];



  assign Constant26_out1_5 = 6'b100001;



  assign Switch18_out1_5 = (Bit_Slice16_out1_5 == 1'b0 ? Switch17_out1_5 :
              Constant26_out1_5);



  assign Bit_Slice28_out1_4 = Data_Type_Conversion_out1_2[30];



  assign Constant27_out1_5 = 6'b100000;



  assign Switch19_out1_5 = (Bit_Slice17_out1_5 == 1'b0 ? Switch18_out1_5 :
              Constant27_out1_5);



  assign Bit_Slice29_out1_4 = Data_Type_Conversion_out1_2[31];



  assign Constant29_out1_6 = 6'b011111;



  assign Switch28_out1_4 = (Bit_Slice28_out1_4 == 1'b0 ? Switch19_out1_5 :
              Constant29_out1_6);



  assign Constant30_out1_4 = 6'b011110;



  assign Switch29_out1_4 = (Bit_Slice29_out1_4 == 1'b0 ? Switch28_out1_4 :
              Constant30_out1_4);



  assign Bit_Slice25_out1_4 = Data_Type_Conversion_out1_2[16];



  assign Constant3_out1_8 = 6'b101110;



  assign Bit_Slice24_out1_4 = Data_Type_Conversion_out1_2[17];



  assign Constant2_out1_5 = 6'b101101;



  assign Switch2_out1_6 = (Bit_Slice25_out1_4 == 1'b0 ? Constant3_out1_8 :
              Constant2_out1_5);



  assign Bit_Slice27_out1_4 = Data_Type_Conversion_out1_2[18];



  assign Constant1_out1_4 = 6'b101100;



  assign Switch1_out1_6 = (Bit_Slice24_out1_4 == 1'b0 ? Switch2_out1_6 :
              Constant1_out1_4);



  assign Bit_Slice15_out1_6 = Data_Type_Conversion_out1_2[19];



  assign Constant124_out1_4 = 6'b101011;



  assign Switch116_out1_4 = (Bit_Slice27_out1_4 == 1'b0 ? Switch1_out1_6 :
              Constant124_out1_4);



  assign Bit_Slice16_out1_6 = Data_Type_Conversion_out1_2[20];



  assign Constant28_out1_6 = 6'b101010;



  assign Switch17_out1_6 = (Bit_Slice15_out1_6 == 1'b0 ? Switch116_out1_4 :
              Constant28_out1_6);



  assign Bit_Slice17_out1_6 = Data_Type_Conversion_out1_2[21];



  assign Constant26_out1_6 = 6'b101001;



  assign Switch18_out1_6 = (Bit_Slice16_out1_6 == 1'b0 ? Switch17_out1_6 :
              Constant26_out1_6);



  assign Bit_Slice28_out1_5 = Data_Type_Conversion_out1_2[22];



  assign Constant27_out1_6 = 6'b101000;



  assign Switch19_out1_6 = (Bit_Slice17_out1_6 == 1'b0 ? Switch18_out1_6 :
              Constant27_out1_6);



  assign Bit_Slice29_out1_5 = Data_Type_Conversion_out1_2[23];



  assign Constant29_out1_7 = 6'b100111;



  assign Switch28_out1_5 = (Bit_Slice28_out1_5 == 1'b0 ? Switch19_out1_6 :
              Constant29_out1_7);



  assign Compare_To_Constant3_out1_1 = Switch29_out1_4 < 6'b100110;



  assign Constant30_out1_5 = 6'b100110;



  assign Switch29_out1_5 = (Bit_Slice29_out1_5 == 1'b0 ? Switch28_out1_5 :
              Constant30_out1_5);



  assign Switch3_out1_6 = (Compare_To_Constant3_out1_1 == 1'b0 ? Switch29_out1_5 :
              Switch29_out1_4);



  assign Compare_To_Constant5_out1_1 = Switch3_out1_6 < 6'b101110;



  assign Bit_Slice29_out1_6 = Data_Type_Conversion_out1_2[8];



  assign Constant29_out1_8 = 6'b110110;



  assign Bit_Slice30_out1_2 = Data_Type_Conversion_out1_2[9];



  assign Constant30_out1_6 = 6'b110101;



  assign Switch29_out1_6 = (Bit_Slice29_out1_6 == 1'b0 ? Constant29_out1_8 :
              Constant30_out1_6);



  assign Bit_Slice31_out1_2 = Data_Type_Conversion_out1_2[10];



  assign Constant31_out1_2 = 6'b110100;



  assign Switch30_out1_2 = (Bit_Slice30_out1_2 == 1'b0 ? Switch29_out1_6 :
              Constant31_out1_2);



  assign Bit_Slice32_out1_5 = Data_Type_Conversion_out1_2[11];



  assign Constant32_out1_5 = 6'b110011;



  assign Switch31_out1_2 = (Bit_Slice31_out1_2 == 1'b0 ? Switch30_out1_2 :
              Constant32_out1_5);



  assign Bit_Slice33_out1_5 = Data_Type_Conversion_out1_2[12];



  assign Constant33_out1_5 = 6'b110010;



  assign Switch32_out1_5 = (Bit_Slice32_out1_5 == 1'b0 ? Switch31_out1_2 :
              Constant33_out1_5);



  assign Bit_Slice34_out1_5 = Data_Type_Conversion_out1_2[13];



  assign Constant34_out1_5 = 6'b110001;



  assign Switch33_out1_5 = (Bit_Slice33_out1_5 == 1'b0 ? Switch32_out1_5 :
              Constant34_out1_5);



  assign Bit_Slice35_out1_2 = Data_Type_Conversion_out1_2[14];



  assign Constant35_out1_5 = 6'b110000;



  assign Switch34_out1_5 = (Bit_Slice34_out1_5 == 1'b0 ? Switch33_out1_5 :
              Constant35_out1_5);



  assign Bit_Slice26_out1_4 = Data_Type_Conversion_out1_2[15];



  assign Constant36_out1_2 = 6'b101111;



  assign Switch35_out1_2 = (Bit_Slice35_out1_2 == 1'b0 ? Switch34_out1_5 :
              Constant36_out1_2);



  assign Constant3_out1_9 = 6'b101110;



  assign Switch3_out1_7 = (Bit_Slice26_out1_4 == 1'b0 ? Switch35_out1_2 :
              Constant3_out1_9);



  assign Bit_Slice26_out1_5 = Data_Type_Conversion_out1_2[0];



  assign Constant4_out1_3 = 6'b111110;



  assign Bit_Slice25_out1_5 = Data_Type_Conversion_out1_2[1];



  assign Constant3_out1_10 = 6'b111101;



  assign Switch3_out1_8 = (Bit_Slice26_out1_5 == 1'b0 ? Constant4_out1_3 :
              Constant3_out1_10);



  assign Bit_Slice24_out1_5 = Data_Type_Conversion_out1_2[2];



  assign Constant2_out1_6 = 6'b111100;



  assign Switch2_out1_7 = (Bit_Slice25_out1_5 == 1'b0 ? Switch3_out1_8 :
              Constant2_out1_6);



  assign Bit_Slice27_out1_5 = Data_Type_Conversion_out1_2[3];



  assign Constant1_out1_5 = 6'b111011;



  assign Switch1_out1_7 = (Bit_Slice24_out1_5 == 1'b0 ? Switch2_out1_7 :
              Constant1_out1_5);



  assign Bit_Slice15_out1_7 = Data_Type_Conversion_out1_2[4];



  assign Constant124_out1_5 = 6'b111010;



  assign Switch116_out1_5 = (Bit_Slice27_out1_5 == 1'b0 ? Switch1_out1_7 :
              Constant124_out1_5);



  assign Bit_Slice16_out1_7 = Data_Type_Conversion_out1_2[5];



  assign Constant28_out1_7 = 6'b111001;



  assign Switch17_out1_7 = (Bit_Slice15_out1_7 == 1'b0 ? Switch116_out1_5 :
              Constant28_out1_7);



  assign Bit_Slice17_out1_7 = Data_Type_Conversion_out1_2[6];



  assign Constant26_out1_7 = 6'b111000;



  assign Switch18_out1_7 = (Bit_Slice16_out1_7 == 1'b0 ? Switch17_out1_7 :
              Constant26_out1_7);



  assign Bit_Slice28_out1_6 = Data_Type_Conversion_out1_2[7];



  assign Constant27_out1_7 = 6'b110111;



  assign Switch19_out1_7 = (Bit_Slice17_out1_7 == 1'b0 ? Switch18_out1_7 :
              Constant27_out1_7);



  assign Compare_To_Constant4_out1_1 = Switch3_out1_7 < 6'b110110;



  assign Constant29_out1_9 = 6'b110110;



  assign Switch28_out1_6 = (Bit_Slice28_out1_6 == 1'b0 ? Switch19_out1_7 :
              Constant29_out1_9);



  assign Switch4_out1_1 = (Compare_To_Constant4_out1_1 == 1'b0 ? Switch28_out1_6 :
              Switch3_out1_7);



  assign Switch5_out1_2 = (Compare_To_Constant5_out1_1 == 1'b0 ? Switch4_out1_1 :
              Switch3_out1_6);



  assign Switch7_out1 = (Compare_To_Constant6_out1 == 1'b0 ? Switch5_out1_2 :
              Switch6_out1);



  assign dynamic_shift_5 = {2'b0, Switch7_out1};
  assign Shift_Arithmetic_out1_3 = Data_Type_Conversion_out1_2 <<< dynamic_shift_5;



  assign Bit_Slice2_out1_1 = Shift_Arithmetic_out1_3[37:36];



  assign Bit_Slice4_out1_1 = Bit_Slice2_out1_1[0];



  assign Bit_Slice5_out1_2 = Bit_Slice2_out1_1[1];



  assign Bit_Slice3_out1_1 = Shift_Arithmetic_out1_3[38];



  assign Bit_Slice1_out1_2 = Shift_Arithmetic_out1_3[35:0];



  assign Bit_Reduce_out1_1 = (|Bit_Slice1_out1_2[35:0]);



  assign Logical_Operator1_out1_1 = Bit_Reduce_out1_1 | (Bit_Slice4_out1_1 | Bit_Slice3_out1_1);



  assign Logical_Operator_out1_3 = Bit_Slice5_out1_2 & Logical_Operator1_out1_1;



  assign Bit_Slice1_out1_3 = Shift_Arithmetic_out1_3[60:38];



  assign Bit_Slice1_out1_dtc_1 = {1'b0, Bit_Slice1_out1_3};



  assign Constant2_out1_7 = 23'b00000000000000000000001;



  assign Add1_4 = {9'b0, Constant2_out1_7};
  assign Add1_5 = {9'b0, Bit_Slice1_out1_3};
  assign Add1_add_temp_1 = Add1_4 + Add1_5;
  assign Add1_out1_1 = Add1_add_temp_1[23:0];



  assign Switch2_out1_8 = (Logical_Operator_out1_3 == 1'b0 ? Bit_Slice1_out1_dtc_1 :
              Add1_out1_1);



  assign Bit_Slice5_out1_3 = Switch2_out1_8[23];



  assign C1_out1_1 = 8'b01111111;



  assign Sum1_1 = {24'b0, C1_out1_1};
  assign Sum1_2 = {26'b0, Switch7_out1};
  assign Sum1_sub_temp = Sum1_1 - Sum1_2;
  assign Sum1_out1 = Sum1_sub_temp[7:0];



  assign Sum2_4 = {31'b0, Bit_Slice5_out1_3};
  assign Sum2_5 = {24'b0, Sum1_out1};
  assign Sum2_add_temp = Sum2_4 + Sum2_5;
  assign Sum2_out1_1 = Sum2_add_temp[7:0];



  assign reinterpretcast_exp_numericty_out1 = if_exp_1_out1[7:0];



  assign C1_out1_2 = 8'b01111111;



  assign exp_127_out1 = reinterpretcast_exp_numericty_out1 + C1_out1_2;



  assign if_exp_12_adjustment1_out1 = (exp_12_adjustment_out1 == 1'b0 ? Sum2_out1_1 :
              exp_127_out1);



  assign Constant5_out1 = 8'b00000000;



  assign Constant4_out1_4 = 8'b11111111;



  assign Switch5_out1_3 = (Logical_Operator_out1 == 1'b0 ? Constant5_out1 :
              Constant4_out1_4);



  assign Switch1_out1_8 = (Logical_Operator3_out1 == 1'b0 ? if_exp_12_adjustment1_out1 :
              Switch5_out1_3);



  assign Switch3_out1_9 = (Constant8_out1 == 1'b0 ? Constant3_out1 :
              Switch1_out1_8);



  assign Constant2_out1_8 = 23'b00000000000000000000000;



  assign Bit_Slice6_out1_1 = Switch2_out1_8[22:0];



  assign Bit_Shift2_out1_1 = Bit_Slice6_out1_1 >>> 8'd1;



  assign Switch3_out1_10 = (Bit_Slice5_out1_3 == 1'b0 ? Bit_Slice6_out1_1 :
              Bit_Shift2_out1_1);



  assign BitSlice_out1_2 = Data_Type_Conversion_out1[22:0];



  assign if_exp_12_adjustment2_out1 = (exp_12_adjustment_out1 == 1'b0 ? Switch3_out1_10 :
              BitSlice_out1_2);



  assign Constant6_out1_1 = 23'b10000000000000000000000;



  assign Switch6_out1_1 = (Logical_Operator_out1 == 1'b0 ? M :
              Constant6_out1_1);



  assign Switch_out1 = (Logical_Operator3_out1 == 1'b0 ? if_exp_12_adjustment2_out1 :
              Switch6_out1_1);



  assign Switch2_out1_9 = (Constant8_out1 == 1'b0 ? Constant2_out1_8 :
              Switch_out1);



  // Combine FP sign, exponent, mantissa into 32 bit word
  assign nfp_out_pack = {S, Switch3_out1_9, Switch2_out1_9};



  assign nfp_out = nfp_out_pack;

endmodule  // nfp_atan_single

