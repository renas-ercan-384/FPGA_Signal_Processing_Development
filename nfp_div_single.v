// -------------------------------------------------------------
// Single Precision Floating Point Division
// -------------------------------------------------------------

`timescale 1 us / 1 us

module nfp_div_single
          (nfp_in1,
           nfp_in2,
           nfp_out);


  input   [31:0] nfp_in1;  // ufix32
  input   [31:0] nfp_in2;  // ufix32
  output  [31:0] nfp_out;  // ufix32


  wire aSign;  // ufix1
  wire [7:0] aExponent;  // ufix8
  wire [22:0] aMantissa;  // ufix23
  wire bSign;  // ufix1
  wire [7:0] bExponent;  // ufix8
  wire [22:0] bMantissa;  // ufix23
  wire tmp_out1;  // ufix1
  wire aExponent_cfType_Exponent_I_out1;  // ufix1
  wire bExponent_cfType_Exponent_I_out1;  // ufix1
  wire alphaaExponent_cfType_Exponent_out1;  // ufix1
  wire aExponent_0_out1;  // ufix1
  wire [22:0] Constant_out1;  // ufix23
  wire [22:0] Switch_out1;  // ufix23
  wire aMantissa_0_out1;  // ufix1
  wire alphaaExponent_0_aMantissa_out1;  // ufix1
  wire bExponent_0_out1;  // ufix1
  wire [22:0] Constant_out1_1;  // ufix23
  wire [22:0] Switch_out1_1;  // ufix23
  wire bMantissa_0_out1;  // ufix1
  wire alphabExponent_0_bMantissa_out1;  // ufix1
  wire alphaExponent_0_cfType_Exp_out1;  // ufix1
  wire alpha1_out1;  // ufix1
  wire alpha0_out1;  // ufix1
  wire if_Exponent_0_cfType_Exp_out1;  // ufix1
  wire [23:0] Bit_Concat1_out1;  // ufix24
  wire alphaExponent_0_cfType_Exp_out1_1;  // ufix1
  wire alpha1_out1_1;  // ufix1
  wire alpha0_out1_1;  // ufix1
  wire if_Exponent_0_cfType_Exp_out1_1;  // ufix1
  wire [23:0] Bit_Concat1_out1_1;  // ufix24
  wire mant_a_norm_mant_b_norm_relop1;
  wire [7:0] C_out1;  // ufix8
  wire [7:0] if_Exponent_0_out1;  // ufix8
  wire signed [9:0] DTC_out1;  // sfix10
  wire signed [9:0] cast_1_out1;  // sfix10
  wire signed [9:0] exp_a_norm_cast_1_out1;  // sfix10
  wire [7:0] C_out1_1;  // ufix8
  wire signed [9:0] if_mant_a_norm_mant_b_norm_out1;  // sfix10
  wire [7:0] if_Exponent_0_out1_1;  // ufix8
  wire signed [9:0] DTC1_out1;  // sfix10
  wire signed [9:0] exp_a_norm_exp_b_norm_out1;  // sfix10
  wire signed [9:0] cast_cfType_ExponentBias_lik_out1;  // sfix10
  wire signed [9:0] exp_a_norm_exp_b_norm_cast_out1;  // sfix10
  wire exp_tmp_2_cfType_ExponentBi_out1;  // ufix1
  wire exp_tmp_1_out1;  // ufix1
  wire [4:0] C3_out1;  // ufix5
  wire exp_tmp_0_out1;  // ufix1
  wire [4:0] C1_out1;  // ufix5
  wire [4:0] C_out1_2;  // ufix5
  wire [4:0] if_exp_tmp_0_out1;  // ufix5
  wire [4:0] if_exp_tmp_1_1_out1;  // ufix5
  wire [4:0] C5_out1;  // ufix5
  wire [4:0] if_exp_tmp_2_cfType_ExponentB_1_out1;  // ufix5
  wire shift_length_1_out1;  // ufix1
  wire shift_length_1_out1_1;  // ufix1
  wire C_out1_3;  // ufix1
  wire [3:0] alpha0_out1_2;  // ufix4
  wire [27:0] Bit_Concat_out1;  // ufix28
  wire signed [27:0] reinterpretcast_bitconcat_fi_0_out1;  // sfix28
  wire signed [27:0] bitsll_mant_a_norm_1_out1;  // sfix28
  wire signed [27:0] if_mant_a_norm_mant_b_norm_1_out1;  // sfix28
  wire [25:0] Bit_Slice1_out1;  // ufix26
  wire signed [25:0] Data_Type_Conversion1_out1;  // sfix26
  wire [3:0] alpha1_out1_2;  // ufix4
  wire [27:0] Bit_Concat1_out1_2;  // ufix28
  wire signed [27:0] reinterpretcast_bitconcat_fi_0_out1_1;  // sfix28
  wire signed [28:0] Unary_Minus2_in0;  // sfix29
  wire signed [28:0] Unary_Minus2_1;  // sfix29
  wire signed [27:0] Unary_Minus2_out1;  // sfix28
  wire [25:0] Bit_Slice_out1;  // ufix26
  wire signed [25:0] Data_Type_Conversion_out1;  // sfix26
  wire signed [25:0] R_mant_b_norm_out1;  // sfix26
  wire signed [25:0] bitsll_R_1_out1;  // sfix26
  wire signed [25:0] R_mant_b_norm_out1_1;  // sfix26
  wire Bit_Slice_out1_1;  // ufix1
  wire Logical_Operator_out1;
  wire [1:0] Bit_Concat_out1_1;  // ufix2
  wire signed [25:0] if_tmp_0_1_out1;  // sfix26
  wire signed [25:0] bitsll_R_1_out1_1;  // sfix26
  wire signed [25:0] R_mant_b_norm_out1_2;  // sfix26
  wire Bit_Slice_out1_2;  // ufix1
  wire Logical_Operator_out1_1;
  wire [2:0] Bit_Concat_out1_2;  // ufix3
  wire signed [25:0] if_tmp_0_1_out1_1;  // sfix26
  wire signed [25:0] bitsll_R_1_out1_2;  // sfix26
  wire signed [25:0] R_mant_b_norm_out1_3;  // sfix26
  wire Bit_Slice_out1_3;  // ufix1
  wire Logical_Operator_out1_2;
  wire [3:0] Bit_Concat_out1_3;  // ufix4
  wire signed [25:0] if_tmp_0_1_out1_2;  // sfix26
  wire signed [25:0] bitsll_R_1_out1_3;  // sfix26
  wire signed [25:0] R_mant_b_norm_out1_4;  // sfix26
  wire Bit_Slice_out1_4;  // ufix1
  wire Logical_Operator_out1_3;
  wire [4:0] Bit_Concat_out1_4;  // ufix5
  wire signed [25:0] if_tmp_0_1_out1_3;  // sfix26
  wire signed [25:0] bitsll_R_1_out1_4;  // sfix26
  wire signed [25:0] R_mant_b_norm_out1_5;  // sfix26
  wire Bit_Slice_out1_5;  // ufix1
  wire Logical_Operator_out1_4;
  wire [5:0] Bit_Concat_out1_5;  // ufix6
  wire signed [25:0] if_tmp_0_1_out1_4;  // sfix26
  wire signed [25:0] bitsll_R_1_out1_5;  // sfix26
  wire signed [25:0] R_mant_b_norm_out1_6;  // sfix26
  wire Bit_Slice_out1_6;  // ufix1
  wire Logical_Operator_out1_5;
  wire [6:0] Bit_Concat_out1_6;  // ufix7
  wire signed [25:0] if_tmp_0_1_out1_5;  // sfix26
  wire signed [25:0] bitsll_R_1_out1_6;  // sfix26
  wire signed [25:0] R_mant_b_norm_out1_7;  // sfix26
  wire Bit_Slice_out1_7;  // ufix1
  wire Logical_Operator_out1_6;
  wire [7:0] Bit_Concat_out1_7;  // uint8
  wire signed [25:0] if_tmp_0_1_out1_6;  // sfix26
  wire signed [25:0] bitsll_R_1_out1_7;  // sfix26
  wire signed [25:0] R_mant_b_norm_out1_8;  // sfix26
  wire Bit_Slice_out1_8;  // ufix1
  wire Logical_Operator_out1_7;
  wire [8:0] Bit_Concat_out1_8;  // ufix9
  wire signed [25:0] if_tmp_0_1_out1_7;  // sfix26
  wire signed [25:0] bitsll_R_1_out1_8;  // sfix26
  wire signed [25:0] R_mant_b_norm_out1_9;  // sfix26
  wire Bit_Slice_out1_9;  // ufix1
  wire Logical_Operator_out1_8;
  wire [9:0] Bit_Concat_out1_9;  // ufix10
  wire signed [25:0] if_tmp_0_1_out1_8;  // sfix26
  wire signed [25:0] bitsll_R_1_out1_9;  // sfix26
  wire signed [25:0] R_mant_b_norm_out1_10;  // sfix26
  wire Bit_Slice_out1_10;  // ufix1
  wire Logical_Operator_out1_9;
  wire [10:0] Bit_Concat_out1_10;  // ufix11
  wire signed [25:0] if_tmp_0_1_out1_9;  // sfix26
  wire signed [25:0] bitsll_R_1_out1_10;  // sfix26
  wire signed [25:0] R_mant_b_norm_out1_11;  // sfix26
  wire Bit_Slice_out1_11;  // ufix1
  wire Logical_Operator_out1_10;
  wire [11:0] Bit_Concat_out1_11;  // ufix12
  wire signed [25:0] if_tmp_0_1_out1_10;  // sfix26
  wire signed [25:0] bitsll_R_1_out1_11;  // sfix26
  wire signed [25:0] R_mant_b_norm_out1_12;  // sfix26
  wire Bit_Slice_out1_12;  // ufix1
  wire Logical_Operator_out1_11;
  wire [12:0] Bit_Concat_out1_12;  // ufix13
  wire signed [25:0] if_tmp_0_1_out1_11;  // sfix26
  wire signed [25:0] bitsll_R_1_out1_12;  // sfix26
  wire signed [25:0] R_mant_b_norm_out1_13;  // sfix26
  wire Bit_Slice_out1_13;  // ufix1
  wire Logical_Operator_out1_12;
  wire [13:0] Bit_Concat_out1_13;  // ufix14
  wire signed [25:0] if_tmp_0_1_out1_12;  // sfix26
  wire signed [25:0] bitsll_R_1_out1_13;  // sfix26
  wire signed [25:0] R_mant_b_norm_out1_14;  // sfix26
  wire Bit_Slice_out1_14;  // ufix1
  wire Logical_Operator_out1_13;
  wire [14:0] Bit_Concat_out1_14;  // ufix15
  wire signed [25:0] if_tmp_0_1_out1_13;  // sfix26
  wire signed [25:0] bitsll_R_1_out1_14;  // sfix26
  wire signed [25:0] R_mant_b_norm_out1_15;  // sfix26
  wire Bit_Slice_out1_15;  // ufix1
  wire Logical_Operator_out1_14;
  wire [15:0] Bit_Concat_out1_15;  // uint16
  wire signed [25:0] if_tmp_0_1_out1_14;  // sfix26
  wire signed [25:0] bitsll_R_1_out1_15;  // sfix26
  wire signed [25:0] R_mant_b_norm_out1_16;  // sfix26
  wire Bit_Slice_out1_16;  // ufix1
  wire Logical_Operator_out1_15;
  wire [16:0] Bit_Concat_out1_16;  // ufix17
  wire signed [25:0] if_tmp_0_1_out1_15;  // sfix26
  wire signed [25:0] bitsll_R_1_out1_16;  // sfix26
  wire signed [25:0] R_mant_b_norm_out1_17;  // sfix26
  wire Bit_Slice_out1_17;  // ufix1
  wire Logical_Operator_out1_16;
  wire [17:0] Bit_Concat_out1_17;  // ufix18
  wire signed [25:0] if_tmp_0_1_out1_16;  // sfix26
  wire signed [25:0] bitsll_R_1_out1_17;  // sfix26
  wire signed [25:0] R_mant_b_norm_out1_18;  // sfix26
  wire Bit_Slice_out1_18;  // ufix1
  wire Logical_Operator_out1_17;
  wire [18:0] Bit_Concat_out1_18;  // ufix19
  wire signed [25:0] if_tmp_0_1_out1_17;  // sfix26
  wire signed [25:0] bitsll_R_1_out1_18;  // sfix26
  wire signed [25:0] R_mant_b_norm_out1_19;  // sfix26
  wire Bit_Slice_out1_19;  // ufix1
  wire Logical_Operator_out1_18;
  wire [19:0] Bit_Concat_out1_19;  // ufix20
  wire signed [25:0] if_tmp_0_1_out1_18;  // sfix26
  wire signed [25:0] bitsll_R_1_out1_19;  // sfix26
  wire signed [25:0] R_mant_b_norm_out1_20;  // sfix26
  wire Bit_Slice_out1_20;  // ufix1
  wire Logical_Operator_out1_19;
  wire [20:0] Bit_Concat_out1_20;  // ufix21
  wire signed [25:0] if_tmp_0_1_out1_19;  // sfix26
  wire signed [25:0] bitsll_R_1_out1_20;  // sfix26
  wire signed [25:0] R_mant_b_norm_out1_21;  // sfix26
  wire Bit_Slice_out1_21;  // ufix1
  wire Logical_Operator_out1_20;
  wire [21:0] Bit_Concat_out1_21;  // ufix22
  wire signed [25:0] if_tmp_0_1_out1_20;  // sfix26
  wire signed [25:0] bitsll_R_1_out1_21;  // sfix26
  wire signed [25:0] R_mant_b_norm_out1_22;  // sfix26
  wire Bit_Slice_out1_22;  // ufix1
  wire Logical_Operator_out1_21;
  wire [22:0] Bit_Concat_out1_22;  // ufix23
  wire signed [25:0] if_tmp_0_1_out1_21;  // sfix26
  wire signed [25:0] bitsll_R_1_out1_22;  // sfix26
  wire signed [25:0] R_mant_b_norm_out1_23;  // sfix26
  wire Bit_Slice_out1_23;  // ufix1
  wire Logical_Operator_out1_22;
  wire [23:0] Bit_Concat_out1_23;  // ufix24
  wire signed [25:0] if_tmp_0_1_out1_22;  // sfix26
  wire signed [25:0] bitsll_R_1_out1_23;  // sfix26
  wire signed [25:0] R_mant_b_norm_out1_24;  // sfix26
  wire Bit_Slice_out1_24;  // ufix1
  wire Logical_Operator_out1_23;
  wire [24:0] Bit_Concat_out1_24;  // ufix25
  wire [24:0] C_out1_4;  // ufix25
  wire [24:0] if_shift_length_1_out1;  // ufix25
  wire [24:0] bitsrl_Q_1_out1;  // ufix25
  wire [24:0] if_shift_length_1_out1_1;  // ufix25
  wire [23:0] BitSlice_out1;  // ufix24
  wire Bit_Slice10_out1;  // ufix1
  wire Bit_Slice9_out1;  // ufix1
  wire Bit_Slice7_out1;  // ufix1
  wire Bit_Slice8_out1;  // ufix1
  wire Bit_Slice11_out1;  // ufix1
  wire [2:0] Bit_Slice_out1_25;  // ufix3
  wire Constant_out1_2;  // ufix1
  wire [3:0] Bit_Concat_out1_25;  // ufix4
  wire Bit_Slice_out1_26;  // ufix1
  wire Bit_Slice1_out1_1;  // ufix1
  wire Logical_Operator_out1_24;  // ufix1
  wire Switch6_out1;  // ufix1
  wire Bit_Slice2_out1;  // ufix1
  wire Logical_Operator1_out1;  // ufix1
  wire Bit_Slice3_out1;  // ufix1
  wire Logical_Operator2_out1;  // ufix1
  wire Switch7_out1;  // ufix1
  wire Switch3_out1;  // ufix1
  wire [3:0] Bit_Slice1_out1_2;  // ufix4
  wire Bit_Slice_out1_27;  // ufix1
  wire Logical_Operator3_out1;  // ufix1
  wire Bit_Slice1_out1_3;  // ufix1
  wire Logical_Operator_out1_25;  // ufix1
  wire Switch6_out1_1;  // ufix1
  wire Bit_Slice2_out1_1;  // ufix1
  wire Logical_Operator1_out1_1;  // ufix1
  wire Bit_Slice3_out1_1;  // ufix1
  wire Logical_Operator2_out1_1;  // ufix1
  wire Switch7_out1_1;  // ufix1
  wire Switch3_out1_1;  // ufix1
  wire Switch6_out1_2;  // ufix1
  wire [3:0] Bit_Slice2_out1_2;  // ufix4
  wire Bit_Slice_out1_28;  // ufix1
  wire Logical_Operator3_out1_1;  // ufix1
  wire Bit_Slice1_out1_4;  // ufix1
  wire Logical_Operator_out1_26;  // ufix1
  wire Switch6_out1_3;  // ufix1
  wire Bit_Slice2_out1_3;  // ufix1
  wire Logical_Operator1_out1_2;  // ufix1
  wire Bit_Slice3_out1_2;  // ufix1
  wire Logical_Operator2_out1_2;  // ufix1
  wire Switch7_out1_2;  // ufix1
  wire Switch3_out1_2;  // ufix1
  wire [3:0] Bit_Slice3_out1_3;  // ufix4
  wire Bit_Slice_out1_29;  // ufix1
  wire Logical_Operator3_out1_2;  // ufix1
  wire Bit_Slice1_out1_5;  // ufix1
  wire Logical_Operator_out1_27;  // ufix1
  wire Switch6_out1_4;  // ufix1
  wire Bit_Slice2_out1_4;  // ufix1
  wire Logical_Operator1_out1_3;  // ufix1
  wire Bit_Slice3_out1_4;  // ufix1
  wire Logical_Operator2_out1_3;  // ufix1
  wire Switch7_out1_3;  // ufix1
  wire Switch3_out1_3;  // ufix1
  wire Switch7_out1_4;  // ufix1
  wire Switch3_out1_4;  // ufix1
  wire [3:0] Bit_Slice4_out1;  // ufix4
  wire Bit_Slice_out1_30;  // ufix1
  wire Logical_Operator3_out1_3;  // ufix1
  wire Bit_Slice1_out1_6;  // ufix1
  wire Logical_Operator_out1_28;  // ufix1
  wire Switch6_out1_5;  // ufix1
  wire Bit_Slice2_out1_5;  // ufix1
  wire Logical_Operator1_out1_4;  // ufix1
  wire Bit_Slice3_out1_5;  // ufix1
  wire Logical_Operator2_out1_4;  // ufix1
  wire Switch7_out1_5;  // ufix1
  wire Switch3_out1_5;  // ufix1
  wire [3:0] Bit_Slice5_out1;  // ufix4
  wire Bit_Slice_out1_31;  // ufix1
  wire Logical_Operator3_out1_4;  // ufix1
  wire Bit_Slice1_out1_7;  // ufix1
  wire Logical_Operator_out1_29;  // ufix1
  wire Switch6_out1_6;  // ufix1
  wire Bit_Slice2_out1_6;  // ufix1
  wire Logical_Operator1_out1_5;  // ufix1
  wire Bit_Slice3_out1_6;  // ufix1
  wire Logical_Operator2_out1_5;  // ufix1
  wire Switch7_out1_6;  // ufix1
  wire Switch3_out1_6;  // ufix1
  wire Switch4_out1;  // ufix1
  wire Logical_Operator_out1_30;  // ufix1
  wire [1:0] Bit_Slice6_out1;  // ufix2
  wire Bit_Slice_out1_32;  // ufix1
  wire Logical_Operator3_out1_5;  // ufix1
  wire Bit_Slice1_out1_8;  // ufix1
  wire Logical_Operator_out1_31;  // ufix1
  wire Switch7_out1_7;  // ufix1
  wire BitSlice_out1_1;  // ufix1
  wire BitSlice1_out1;  // ufix1
  wire signed [25:0] if_tmp_0_1_out1_23;  // sfix26
  wire signed [25:0] bitsll_R_1_out1_24;  // sfix26
  wire R_0_out1;  // ufix1
  wire Switch1_out1;  // ufix1
  wire Switch2_out1;  // ufix1
  wire sticky_bitsll_Q_Q_WordLen_out1;  // ufix1
  wire alphabitget_Mant_tmp_2_0_out1;  // ufix1
  wire alphabitget_Mant_tmp_1_0_out1;  // ufix1
  wire alpha0_out1_3;  // ufix1
  wire [22:0] BitSlice4_out1;  // ufix23
  wire [23:0] Bit_Concat_out1_26;  // ufix24
  wire [23:0] alpha2_out1;  // ufix24
  wire [23:0] Mant_tmp_2_out1;  // ufix24
  wire [23:0] if_bitget_Mant_tmp_1_0_out1;  // ufix24
  wire BitSlice2_out1;  // ufix1
  wire [7:0] DTC1_out1_1;  // ufix8
  wire [7:0] C2_out1;  // ufix8
  wire [7:0] if_exp_tmp_1_out1;  // ufix8
  wire [7:0] C4_out1;  // ufix8
  wire [7:0] if_exp_tmp_2_cfType_ExponentB_out1;  // ufix8
  wire [7:0] alpha1_out1_3;  // ufix8
  wire [7:0] Exp_1_out1;  // ufix8
  wire [7:0] if_bitget_Mant_tmp_Mant_tmp_Wor_out1;  // ufix8
  wire [7:0] C4_out1_1;  // ufix8
  wire [7:0] if_bExponent_0_bMantissa_out1;  // ufix8
  wire [7:0] C1_out1_1;  // ufix8
  wire [7:0] C_out1_5;  // ufix8
  wire [7:0] if_bExponent_0_bMantissa_out1_1;  // ufix8
  wire [7:0] if_aExponent_0_aMantissa_out1;  // ufix8
  wire [7:0] C1_out1_2;  // ufix8
  wire [7:0] if_mant_b_0_out1;  // ufix8
  wire [7:0] if_exp_a_cfType_Exponent_Inf_out1;  // ufix8
  wire [7:0] if_aExponent_cfType_Exponent_out1;  // ufix8
  wire Compare_To_Zero_out1;  // ufix1
  wire Logical_Operator_out1_32;  // ufix1
  wire [22:0] BitSlice3_out1;  // ufix23
  wire [22:0] C_out1_6;  // ufix23
  wire [22:0] if_bitget_Mant_tmp_Mant_tmp_Wor_1_out1;  // ufix23
  wire [22:0] C5_out1_1;  // ufix23
  wire [22:0] if_bExponent_0_bMantissa_1_out1;  // ufix23
  wire [22:0] C3_out1_1;  // ufix23
  wire [22:0] C2_out1_1;  // ufix23
  wire [22:0] if_bExponent_0_bMantissa_1_out1_1;  // ufix23
  wire [22:0] if_aExponent_0_aMantissa_1_out1;  // ufix23
  wire [22:0] C2_out1_2;  // ufix23
  wire [22:0] if_mant_b_0_1_out1;  // ufix23
  wire [22:0] C_out1_7;  // ufix23
  wire [22:0] if_exp_b_cfType_Exponent_Inf_out1;  // ufix23
  wire [22:0] if_exp_a_cfType_Exponent_Inf_1_out1;  // ufix23
  wire [22:0] if_aExponent_cfType_Exponent_1_out1;  // ufix23
  wire [31:0] nfp_out_pack;  // ufix32


  // Split 32 bit word into FP sign, exponent, mantissa
  assign aSign = nfp_in1[31];
  assign aExponent = nfp_in1[30:23];
  assign aMantissa = nfp_in1[22:0];



  // Split 32 bit word into FP sign, exponent, mantissa
  assign bSign = nfp_in2[31];
  assign bExponent = nfp_in2[30:23];
  assign bMantissa = nfp_in2[22:0];



  assign tmp_out1 = aSign ^ bSign;



  assign aExponent_cfType_Exponent_I_out1 = aExponent == 8'b11111111;



  assign bExponent_cfType_Exponent_I_out1 = bExponent == 8'b11111111;



  assign alphaaExponent_cfType_Exponent_out1 = aExponent_cfType_Exponent_I_out1 | bExponent_cfType_Exponent_I_out1;



  assign aExponent_0_out1 = aExponent == 8'b00000000;



  assign Constant_out1 = 23'b00000000000000000000000;



  assign Switch_out1 = (aExponent_0_out1 == 1'b0 ? aMantissa :
              Constant_out1);



  assign aMantissa_0_out1 = Switch_out1 == 23'b00000000000000000000000;



  assign alphaaExponent_0_aMantissa_out1 = aExponent_0_out1 & aMantissa_0_out1;



  assign bExponent_0_out1 = bExponent == 8'b00000000;



  assign Constant_out1_1 = 23'b00000000000000000000000;



  assign Switch_out1_1 = (bExponent_0_out1 == 1'b0 ? bMantissa :
              Constant_out1_1);



  assign bMantissa_0_out1 = Switch_out1_1 == 23'b00000000000000000000000;



  assign alphabExponent_0_bMantissa_out1 = bExponent_0_out1 & bMantissa_0_out1;



  assign alphaExponent_0_cfType_Exp_out1 = aExponent_0_out1 | aExponent_cfType_Exponent_I_out1;



  assign alpha1_out1 = 1'b1;



  assign alpha0_out1 = 1'b0;



  assign if_Exponent_0_cfType_Exp_out1 = (alphaExponent_0_cfType_Exp_out1 == 1'b0 ? alpha1_out1 :
              alpha0_out1);



  assign Bit_Concat1_out1 = {if_Exponent_0_cfType_Exp_out1, Switch_out1};



  assign alphaExponent_0_cfType_Exp_out1_1 = bExponent_0_out1 | bExponent_cfType_Exponent_I_out1;



  assign alpha1_out1_1 = 1'b1;



  assign alpha0_out1_1 = 1'b0;



  assign if_Exponent_0_cfType_Exp_out1_1 = (alphaExponent_0_cfType_Exp_out1_1 == 1'b0 ? alpha1_out1_1 :
              alpha0_out1_1);



  assign Bit_Concat1_out1_1 = {if_Exponent_0_cfType_Exp_out1_1, Switch_out1_1};



  assign mant_a_norm_mant_b_norm_relop1 = Bit_Concat1_out1 < Bit_Concat1_out1_1;



  assign C_out1 = 8'b00000001;



  assign if_Exponent_0_out1 = (aExponent_0_out1 == 1'b0 ? aExponent :
              C_out1);



  assign DTC_out1 = {2'b0, if_Exponent_0_out1};



  assign cast_1_out1 = 10'sb0000000001;



  assign exp_a_norm_cast_1_out1 = DTC_out1 - cast_1_out1;



  assign C_out1_1 = 8'b00000001;



  assign if_mant_a_norm_mant_b_norm_out1 = (mant_a_norm_mant_b_norm_relop1 == 1'b0 ? DTC_out1 :
              exp_a_norm_cast_1_out1);



  assign if_Exponent_0_out1_1 = (bExponent_0_out1 == 1'b0 ? bExponent :
              C_out1_1);



  assign DTC1_out1 = {2'b0, if_Exponent_0_out1_1};



  assign exp_a_norm_exp_b_norm_out1 = if_mant_a_norm_mant_b_norm_out1 - DTC1_out1;



  assign cast_cfType_ExponentBias_lik_out1 = 10'sb0001111111;



  assign exp_a_norm_exp_b_norm_cast_out1 = exp_a_norm_exp_b_norm_out1 + cast_cfType_ExponentBias_lik_out1;



  assign exp_tmp_2_cfType_ExponentBi_out1 = exp_a_norm_exp_b_norm_cast_out1 >= 10'sb0011111111;



  assign exp_tmp_1_out1 = exp_a_norm_exp_b_norm_cast_out1 < 10'sb0000000001;



  assign C3_out1 = 5'b00000;



  assign exp_tmp_0_out1 = exp_a_norm_exp_b_norm_cast_out1 == 10'sb0000000000;



  assign C1_out1 = 5'b11001;



  assign C_out1_2 = 5'b00001;



  assign if_exp_tmp_0_out1 = (exp_tmp_0_out1 == 1'b0 ? C1_out1 :
              C_out1_2);



  assign if_exp_tmp_1_1_out1 = (exp_tmp_1_out1 == 1'b0 ? C3_out1 :
              if_exp_tmp_0_out1);



  assign C5_out1 = 5'b11001;



  assign if_exp_tmp_2_cfType_ExponentB_1_out1 = (exp_tmp_2_cfType_ExponentBi_out1 == 1'b0 ? if_exp_tmp_1_1_out1 :
              C5_out1);



  assign shift_length_1_out1 = if_exp_tmp_2_cfType_ExponentB_1_out1 == 5'b00001;



  assign shift_length_1_out1_1 = if_exp_tmp_2_cfType_ExponentB_1_out1 > 5'b00001;



  assign C_out1_3 = 1'b1;



  assign alpha0_out1_2 = 4'b0000;



  assign Bit_Concat_out1 = {alpha0_out1_2, Bit_Concat1_out1};



  assign reinterpretcast_bitconcat_fi_0_out1 = Bit_Concat_out1;



  assign bitsll_mant_a_norm_1_out1 = reinterpretcast_bitconcat_fi_0_out1 <<< 8'd1;



  assign if_mant_a_norm_mant_b_norm_1_out1 = (mant_a_norm_mant_b_norm_relop1 == 1'b0 ? reinterpretcast_bitconcat_fi_0_out1 :
              bitsll_mant_a_norm_1_out1);



  assign Bit_Slice1_out1 = if_mant_a_norm_mant_b_norm_1_out1[25:0];



  assign Data_Type_Conversion1_out1 = Bit_Slice1_out1;



  assign alpha1_out1_2 = 4'b0000;



  assign Bit_Concat1_out1_2 = {alpha1_out1_2, Bit_Concat1_out1_1};



  assign reinterpretcast_bitconcat_fi_0_out1_1 = Bit_Concat1_out1_2;



  assign Unary_Minus2_1 = {reinterpretcast_bitconcat_fi_0_out1_1[27], reinterpretcast_bitconcat_fi_0_out1_1};
  assign Unary_Minus2_in0 =  - (Unary_Minus2_1);
  assign Unary_Minus2_out1 = Unary_Minus2_in0[27:0];



  assign Bit_Slice_out1 = Unary_Minus2_out1[25:0];



  assign Data_Type_Conversion_out1 = Bit_Slice_out1;



  assign R_mant_b_norm_out1 = Data_Type_Conversion1_out1 + Data_Type_Conversion_out1;



  assign bitsll_R_1_out1 = R_mant_b_norm_out1 <<< 8'd1;



  assign R_mant_b_norm_out1_1 = bitsll_R_1_out1 + Data_Type_Conversion_out1;



  assign Bit_Slice_out1_1 = R_mant_b_norm_out1_1[25];



  assign Logical_Operator_out1 =  ~ Bit_Slice_out1_1;



  assign Bit_Concat_out1_1 = {C_out1_3, Logical_Operator_out1};



  assign if_tmp_0_1_out1 = (Bit_Slice_out1_1 == 1'b0 ? R_mant_b_norm_out1_1 :
              bitsll_R_1_out1);



  assign bitsll_R_1_out1_1 = if_tmp_0_1_out1 <<< 8'd1;



  assign R_mant_b_norm_out1_2 = bitsll_R_1_out1_1 + Data_Type_Conversion_out1;



  assign Bit_Slice_out1_2 = R_mant_b_norm_out1_2[25];



  assign Logical_Operator_out1_1 =  ~ Bit_Slice_out1_2;



  assign Bit_Concat_out1_2 = {Bit_Concat_out1_1, Logical_Operator_out1_1};



  assign if_tmp_0_1_out1_1 = (Bit_Slice_out1_2 == 1'b0 ? R_mant_b_norm_out1_2 :
              bitsll_R_1_out1_1);



  assign bitsll_R_1_out1_2 = if_tmp_0_1_out1_1 <<< 8'd1;



  assign R_mant_b_norm_out1_3 = bitsll_R_1_out1_2 + Data_Type_Conversion_out1;



  assign Bit_Slice_out1_3 = R_mant_b_norm_out1_3[25];



  assign Logical_Operator_out1_2 =  ~ Bit_Slice_out1_3;



  assign Bit_Concat_out1_3 = {Bit_Concat_out1_2, Logical_Operator_out1_2};



  assign if_tmp_0_1_out1_2 = (Bit_Slice_out1_3 == 1'b0 ? R_mant_b_norm_out1_3 :
              bitsll_R_1_out1_2);



  assign bitsll_R_1_out1_3 = if_tmp_0_1_out1_2 <<< 8'd1;



  assign R_mant_b_norm_out1_4 = bitsll_R_1_out1_3 + Data_Type_Conversion_out1;



  assign Bit_Slice_out1_4 = R_mant_b_norm_out1_4[25];



  assign Logical_Operator_out1_3 =  ~ Bit_Slice_out1_4;



  assign Bit_Concat_out1_4 = {Bit_Concat_out1_3, Logical_Operator_out1_3};



  assign if_tmp_0_1_out1_3 = (Bit_Slice_out1_4 == 1'b0 ? R_mant_b_norm_out1_4 :
              bitsll_R_1_out1_3);



  assign bitsll_R_1_out1_4 = if_tmp_0_1_out1_3 <<< 8'd1;



  assign R_mant_b_norm_out1_5 = bitsll_R_1_out1_4 + Data_Type_Conversion_out1;



  assign Bit_Slice_out1_5 = R_mant_b_norm_out1_5[25];



  assign Logical_Operator_out1_4 =  ~ Bit_Slice_out1_5;



  assign Bit_Concat_out1_5 = {Bit_Concat_out1_4, Logical_Operator_out1_4};



  assign if_tmp_0_1_out1_4 = (Bit_Slice_out1_5 == 1'b0 ? R_mant_b_norm_out1_5 :
              bitsll_R_1_out1_4);



  assign bitsll_R_1_out1_5 = if_tmp_0_1_out1_4 <<< 8'd1;



  assign R_mant_b_norm_out1_6 = bitsll_R_1_out1_5 + Data_Type_Conversion_out1;



  assign Bit_Slice_out1_6 = R_mant_b_norm_out1_6[25];



  assign Logical_Operator_out1_5 =  ~ Bit_Slice_out1_6;



  assign Bit_Concat_out1_6 = {Bit_Concat_out1_5, Logical_Operator_out1_5};



  assign if_tmp_0_1_out1_5 = (Bit_Slice_out1_6 == 1'b0 ? R_mant_b_norm_out1_6 :
              bitsll_R_1_out1_5);



  assign bitsll_R_1_out1_6 = if_tmp_0_1_out1_5 <<< 8'd1;



  assign R_mant_b_norm_out1_7 = bitsll_R_1_out1_6 + Data_Type_Conversion_out1;



  assign Bit_Slice_out1_7 = R_mant_b_norm_out1_7[25];



  assign Logical_Operator_out1_6 =  ~ Bit_Slice_out1_7;



  assign Bit_Concat_out1_7 = {Bit_Concat_out1_6, Logical_Operator_out1_6};



  assign if_tmp_0_1_out1_6 = (Bit_Slice_out1_7 == 1'b0 ? R_mant_b_norm_out1_7 :
              bitsll_R_1_out1_6);



  assign bitsll_R_1_out1_7 = if_tmp_0_1_out1_6 <<< 8'd1;



  assign R_mant_b_norm_out1_8 = bitsll_R_1_out1_7 + Data_Type_Conversion_out1;



  assign Bit_Slice_out1_8 = R_mant_b_norm_out1_8[25];



  assign Logical_Operator_out1_7 =  ~ Bit_Slice_out1_8;



  assign Bit_Concat_out1_8 = {Bit_Concat_out1_7, Logical_Operator_out1_7};



  assign if_tmp_0_1_out1_7 = (Bit_Slice_out1_8 == 1'b0 ? R_mant_b_norm_out1_8 :
              bitsll_R_1_out1_7);



  assign bitsll_R_1_out1_8 = if_tmp_0_1_out1_7 <<< 8'd1;



  assign R_mant_b_norm_out1_9 = bitsll_R_1_out1_8 + Data_Type_Conversion_out1;



  assign Bit_Slice_out1_9 = R_mant_b_norm_out1_9[25];



  assign Logical_Operator_out1_8 =  ~ Bit_Slice_out1_9;



  assign Bit_Concat_out1_9 = {Bit_Concat_out1_8, Logical_Operator_out1_8};



  assign if_tmp_0_1_out1_8 = (Bit_Slice_out1_9 == 1'b0 ? R_mant_b_norm_out1_9 :
              bitsll_R_1_out1_8);



  assign bitsll_R_1_out1_9 = if_tmp_0_1_out1_8 <<< 8'd1;



  assign R_mant_b_norm_out1_10 = bitsll_R_1_out1_9 + Data_Type_Conversion_out1;



  assign Bit_Slice_out1_10 = R_mant_b_norm_out1_10[25];



  assign Logical_Operator_out1_9 =  ~ Bit_Slice_out1_10;



  assign Bit_Concat_out1_10 = {Bit_Concat_out1_9, Logical_Operator_out1_9};



  assign if_tmp_0_1_out1_9 = (Bit_Slice_out1_10 == 1'b0 ? R_mant_b_norm_out1_10 :
              bitsll_R_1_out1_9);



  assign bitsll_R_1_out1_10 = if_tmp_0_1_out1_9 <<< 8'd1;



  assign R_mant_b_norm_out1_11 = bitsll_R_1_out1_10 + Data_Type_Conversion_out1;



  assign Bit_Slice_out1_11 = R_mant_b_norm_out1_11[25];



  assign Logical_Operator_out1_10 =  ~ Bit_Slice_out1_11;



  assign Bit_Concat_out1_11 = {Bit_Concat_out1_10, Logical_Operator_out1_10};



  assign if_tmp_0_1_out1_10 = (Bit_Slice_out1_11 == 1'b0 ? R_mant_b_norm_out1_11 :
              bitsll_R_1_out1_10);



  assign bitsll_R_1_out1_11 = if_tmp_0_1_out1_10 <<< 8'd1;



  assign R_mant_b_norm_out1_12 = bitsll_R_1_out1_11 + Data_Type_Conversion_out1;



  assign Bit_Slice_out1_12 = R_mant_b_norm_out1_12[25];



  assign Logical_Operator_out1_11 =  ~ Bit_Slice_out1_12;



  assign Bit_Concat_out1_12 = {Bit_Concat_out1_11, Logical_Operator_out1_11};



  assign if_tmp_0_1_out1_11 = (Bit_Slice_out1_12 == 1'b0 ? R_mant_b_norm_out1_12 :
              bitsll_R_1_out1_11);



  assign bitsll_R_1_out1_12 = if_tmp_0_1_out1_11 <<< 8'd1;



  assign R_mant_b_norm_out1_13 = bitsll_R_1_out1_12 + Data_Type_Conversion_out1;



  assign Bit_Slice_out1_13 = R_mant_b_norm_out1_13[25];



  assign Logical_Operator_out1_12 =  ~ Bit_Slice_out1_13;



  assign Bit_Concat_out1_13 = {Bit_Concat_out1_12, Logical_Operator_out1_12};



  assign if_tmp_0_1_out1_12 = (Bit_Slice_out1_13 == 1'b0 ? R_mant_b_norm_out1_13 :
              bitsll_R_1_out1_12);



  assign bitsll_R_1_out1_13 = if_tmp_0_1_out1_12 <<< 8'd1;



  assign R_mant_b_norm_out1_14 = bitsll_R_1_out1_13 + Data_Type_Conversion_out1;



  assign Bit_Slice_out1_14 = R_mant_b_norm_out1_14[25];



  assign Logical_Operator_out1_13 =  ~ Bit_Slice_out1_14;



  assign Bit_Concat_out1_14 = {Bit_Concat_out1_13, Logical_Operator_out1_13};



  assign if_tmp_0_1_out1_13 = (Bit_Slice_out1_14 == 1'b0 ? R_mant_b_norm_out1_14 :
              bitsll_R_1_out1_13);



  assign bitsll_R_1_out1_14 = if_tmp_0_1_out1_13 <<< 8'd1;



  assign R_mant_b_norm_out1_15 = bitsll_R_1_out1_14 + Data_Type_Conversion_out1;



  assign Bit_Slice_out1_15 = R_mant_b_norm_out1_15[25];



  assign Logical_Operator_out1_14 =  ~ Bit_Slice_out1_15;



  assign Bit_Concat_out1_15 = {Bit_Concat_out1_14, Logical_Operator_out1_14};



  assign if_tmp_0_1_out1_14 = (Bit_Slice_out1_15 == 1'b0 ? R_mant_b_norm_out1_15 :
              bitsll_R_1_out1_14);



  assign bitsll_R_1_out1_15 = if_tmp_0_1_out1_14 <<< 8'd1;



  assign R_mant_b_norm_out1_16 = bitsll_R_1_out1_15 + Data_Type_Conversion_out1;



  assign Bit_Slice_out1_16 = R_mant_b_norm_out1_16[25];



  assign Logical_Operator_out1_15 =  ~ Bit_Slice_out1_16;



  assign Bit_Concat_out1_16 = {Bit_Concat_out1_15, Logical_Operator_out1_15};



  assign if_tmp_0_1_out1_15 = (Bit_Slice_out1_16 == 1'b0 ? R_mant_b_norm_out1_16 :
              bitsll_R_1_out1_15);



  assign bitsll_R_1_out1_16 = if_tmp_0_1_out1_15 <<< 8'd1;



  assign R_mant_b_norm_out1_17 = bitsll_R_1_out1_16 + Data_Type_Conversion_out1;



  assign Bit_Slice_out1_17 = R_mant_b_norm_out1_17[25];



  assign Logical_Operator_out1_16 =  ~ Bit_Slice_out1_17;



  assign Bit_Concat_out1_17 = {Bit_Concat_out1_16, Logical_Operator_out1_16};



  assign if_tmp_0_1_out1_16 = (Bit_Slice_out1_17 == 1'b0 ? R_mant_b_norm_out1_17 :
              bitsll_R_1_out1_16);



  assign bitsll_R_1_out1_17 = if_tmp_0_1_out1_16 <<< 8'd1;



  assign R_mant_b_norm_out1_18 = bitsll_R_1_out1_17 + Data_Type_Conversion_out1;



  assign Bit_Slice_out1_18 = R_mant_b_norm_out1_18[25];



  assign Logical_Operator_out1_17 =  ~ Bit_Slice_out1_18;



  assign Bit_Concat_out1_18 = {Bit_Concat_out1_17, Logical_Operator_out1_17};



  assign if_tmp_0_1_out1_17 = (Bit_Slice_out1_18 == 1'b0 ? R_mant_b_norm_out1_18 :
              bitsll_R_1_out1_17);



  assign bitsll_R_1_out1_18 = if_tmp_0_1_out1_17 <<< 8'd1;



  assign R_mant_b_norm_out1_19 = bitsll_R_1_out1_18 + Data_Type_Conversion_out1;



  assign Bit_Slice_out1_19 = R_mant_b_norm_out1_19[25];



  assign Logical_Operator_out1_18 =  ~ Bit_Slice_out1_19;



  assign Bit_Concat_out1_19 = {Bit_Concat_out1_18, Logical_Operator_out1_18};



  assign if_tmp_0_1_out1_18 = (Bit_Slice_out1_19 == 1'b0 ? R_mant_b_norm_out1_19 :
              bitsll_R_1_out1_18);



  assign bitsll_R_1_out1_19 = if_tmp_0_1_out1_18 <<< 8'd1;



  assign R_mant_b_norm_out1_20 = bitsll_R_1_out1_19 + Data_Type_Conversion_out1;



  assign Bit_Slice_out1_20 = R_mant_b_norm_out1_20[25];



  assign Logical_Operator_out1_19 =  ~ Bit_Slice_out1_20;



  assign Bit_Concat_out1_20 = {Bit_Concat_out1_19, Logical_Operator_out1_19};



  assign if_tmp_0_1_out1_19 = (Bit_Slice_out1_20 == 1'b0 ? R_mant_b_norm_out1_20 :
              bitsll_R_1_out1_19);



  assign bitsll_R_1_out1_20 = if_tmp_0_1_out1_19 <<< 8'd1;



  assign R_mant_b_norm_out1_21 = bitsll_R_1_out1_20 + Data_Type_Conversion_out1;



  assign Bit_Slice_out1_21 = R_mant_b_norm_out1_21[25];



  assign Logical_Operator_out1_20 =  ~ Bit_Slice_out1_21;



  assign Bit_Concat_out1_21 = {Bit_Concat_out1_20, Logical_Operator_out1_20};



  assign if_tmp_0_1_out1_20 = (Bit_Slice_out1_21 == 1'b0 ? R_mant_b_norm_out1_21 :
              bitsll_R_1_out1_20);



  assign bitsll_R_1_out1_21 = if_tmp_0_1_out1_20 <<< 8'd1;



  assign R_mant_b_norm_out1_22 = bitsll_R_1_out1_21 + Data_Type_Conversion_out1;



  assign Bit_Slice_out1_22 = R_mant_b_norm_out1_22[25];



  assign Logical_Operator_out1_21 =  ~ Bit_Slice_out1_22;



  assign Bit_Concat_out1_22 = {Bit_Concat_out1_21, Logical_Operator_out1_21};



  assign if_tmp_0_1_out1_21 = (Bit_Slice_out1_22 == 1'b0 ? R_mant_b_norm_out1_22 :
              bitsll_R_1_out1_21);



  assign bitsll_R_1_out1_22 = if_tmp_0_1_out1_21 <<< 8'd1;



  assign R_mant_b_norm_out1_23 = bitsll_R_1_out1_22 + Data_Type_Conversion_out1;



  assign Bit_Slice_out1_23 = R_mant_b_norm_out1_23[25];



  assign Logical_Operator_out1_22 =  ~ Bit_Slice_out1_23;



  assign Bit_Concat_out1_23 = {Bit_Concat_out1_22, Logical_Operator_out1_22};



  assign if_tmp_0_1_out1_22 = (Bit_Slice_out1_23 == 1'b0 ? R_mant_b_norm_out1_23 :
              bitsll_R_1_out1_22);



  assign bitsll_R_1_out1_23 = if_tmp_0_1_out1_22 <<< 8'd1;



  assign R_mant_b_norm_out1_24 = bitsll_R_1_out1_23 + Data_Type_Conversion_out1;



  assign Bit_Slice_out1_24 = R_mant_b_norm_out1_24[25];



  assign Logical_Operator_out1_23 =  ~ Bit_Slice_out1_24;



  assign Bit_Concat_out1_24 = {Bit_Concat_out1_23, Logical_Operator_out1_23};



  assign C_out1_4 = 25'b0000000000000000000000000;



  assign if_shift_length_1_out1 = (shift_length_1_out1_1 == 1'b0 ? Bit_Concat_out1_24 :
              C_out1_4);



  assign bitsrl_Q_1_out1 = Bit_Concat_out1_24 >> 8'd1;



  assign if_shift_length_1_out1_1 = (shift_length_1_out1 == 1'b0 ? if_shift_length_1_out1 :
              bitsrl_Q_1_out1);



  assign BitSlice_out1 = if_shift_length_1_out1_1[23:0];



  assign Bit_Slice10_out1 = if_exp_tmp_2_cfType_ExponentB_1_out1[4];



  assign Bit_Slice9_out1 = if_exp_tmp_2_cfType_ExponentB_1_out1[3];



  assign Bit_Slice7_out1 = if_exp_tmp_2_cfType_ExponentB_1_out1[2];



  assign Bit_Slice8_out1 = if_exp_tmp_2_cfType_ExponentB_1_out1[1];



  assign Bit_Slice11_out1 = if_exp_tmp_2_cfType_ExponentB_1_out1[0];



  assign Bit_Slice_out1_25 = Bit_Concat_out1_24[2:0];



  assign Constant_out1_2 = 1'b0;



  assign Bit_Concat_out1_25 = {Bit_Slice_out1_25, Constant_out1_2};



  assign Bit_Slice_out1_26 = Bit_Concat_out1_25[0];



  assign Bit_Slice1_out1_1 = Bit_Concat_out1_25[1];



  assign Logical_Operator_out1_24 = Bit_Slice1_out1_1 | Bit_Slice_out1_26;



  assign Switch6_out1 = (Bit_Slice11_out1 == 1'b0 ? Bit_Slice_out1_26 :
              Logical_Operator_out1_24);



  assign Bit_Slice2_out1 = Bit_Concat_out1_25[2];



  assign Logical_Operator1_out1 = Bit_Slice2_out1 | Logical_Operator_out1_24;



  assign Bit_Slice3_out1 = Bit_Concat_out1_25[3];



  assign Logical_Operator2_out1 = Bit_Slice3_out1 | Logical_Operator1_out1;



  assign Switch7_out1 = (Bit_Slice11_out1 == 1'b0 ? Logical_Operator1_out1 :
              Logical_Operator2_out1);



  assign Switch3_out1 = (Bit_Slice8_out1 == 1'b0 ? Switch6_out1 :
              Switch7_out1);



  assign Bit_Slice1_out1_2 = Bit_Concat_out1_24[6:3];



  assign Bit_Slice_out1_27 = Bit_Slice1_out1_2[0];



  assign Logical_Operator3_out1 = Bit_Slice_out1_27 | Logical_Operator2_out1;



  assign Bit_Slice1_out1_3 = Bit_Slice1_out1_2[1];



  assign Logical_Operator_out1_25 = Bit_Slice1_out1_3 | Logical_Operator3_out1;



  assign Switch6_out1_1 = (Bit_Slice11_out1 == 1'b0 ? Logical_Operator3_out1 :
              Logical_Operator_out1_25);



  assign Bit_Slice2_out1_1 = Bit_Slice1_out1_2[2];



  assign Logical_Operator1_out1_1 = Bit_Slice2_out1_1 | Logical_Operator_out1_25;



  assign Bit_Slice3_out1_1 = Bit_Slice1_out1_2[3];



  assign Logical_Operator2_out1_1 = Bit_Slice3_out1_1 | Logical_Operator1_out1_1;



  assign Switch7_out1_1 = (Bit_Slice11_out1 == 1'b0 ? Logical_Operator1_out1_1 :
              Logical_Operator2_out1_1);



  assign Switch3_out1_1 = (Bit_Slice8_out1 == 1'b0 ? Switch6_out1_1 :
              Switch7_out1_1);



  assign Switch6_out1_2 = (Bit_Slice7_out1 == 1'b0 ? Switch3_out1 :
              Switch3_out1_1);



  assign Bit_Slice2_out1_2 = Bit_Concat_out1_24[10:7];



  assign Bit_Slice_out1_28 = Bit_Slice2_out1_2[0];



  assign Logical_Operator3_out1_1 = Bit_Slice_out1_28 | Logical_Operator2_out1_1;



  assign Bit_Slice1_out1_4 = Bit_Slice2_out1_2[1];



  assign Logical_Operator_out1_26 = Bit_Slice1_out1_4 | Logical_Operator3_out1_1;



  assign Switch6_out1_3 = (Bit_Slice11_out1 == 1'b0 ? Logical_Operator3_out1_1 :
              Logical_Operator_out1_26);



  assign Bit_Slice2_out1_3 = Bit_Slice2_out1_2[2];



  assign Logical_Operator1_out1_2 = Bit_Slice2_out1_3 | Logical_Operator_out1_26;



  assign Bit_Slice3_out1_2 = Bit_Slice2_out1_2[3];



  assign Logical_Operator2_out1_2 = Bit_Slice3_out1_2 | Logical_Operator1_out1_2;



  assign Switch7_out1_2 = (Bit_Slice11_out1 == 1'b0 ? Logical_Operator1_out1_2 :
              Logical_Operator2_out1_2);



  assign Switch3_out1_2 = (Bit_Slice8_out1 == 1'b0 ? Switch6_out1_3 :
              Switch7_out1_2);



  assign Bit_Slice3_out1_3 = Bit_Concat_out1_24[14:11];



  assign Bit_Slice_out1_29 = Bit_Slice3_out1_3[0];



  assign Logical_Operator3_out1_2 = Bit_Slice_out1_29 | Logical_Operator2_out1_2;



  assign Bit_Slice1_out1_5 = Bit_Slice3_out1_3[1];



  assign Logical_Operator_out1_27 = Bit_Slice1_out1_5 | Logical_Operator3_out1_2;



  assign Switch6_out1_4 = (Bit_Slice11_out1 == 1'b0 ? Logical_Operator3_out1_2 :
              Logical_Operator_out1_27);



  assign Bit_Slice2_out1_4 = Bit_Slice3_out1_3[2];



  assign Logical_Operator1_out1_3 = Bit_Slice2_out1_4 | Logical_Operator_out1_27;



  assign Bit_Slice3_out1_4 = Bit_Slice3_out1_3[3];



  assign Logical_Operator2_out1_3 = Bit_Slice3_out1_4 | Logical_Operator1_out1_3;



  assign Switch7_out1_3 = (Bit_Slice11_out1 == 1'b0 ? Logical_Operator1_out1_3 :
              Logical_Operator2_out1_3);



  assign Switch3_out1_3 = (Bit_Slice8_out1 == 1'b0 ? Switch6_out1_4 :
              Switch7_out1_3);



  assign Switch7_out1_4 = (Bit_Slice7_out1 == 1'b0 ? Switch3_out1_2 :
              Switch3_out1_3);



  assign Switch3_out1_4 = (Bit_Slice9_out1 == 1'b0 ? Switch6_out1_2 :
              Switch7_out1_4);



  assign Bit_Slice4_out1 = Bit_Concat_out1_24[18:15];



  assign Bit_Slice_out1_30 = Bit_Slice4_out1[0];



  assign Logical_Operator3_out1_3 = Bit_Slice_out1_30 | Logical_Operator2_out1_3;



  assign Bit_Slice1_out1_6 = Bit_Slice4_out1[1];



  assign Logical_Operator_out1_28 = Bit_Slice1_out1_6 | Logical_Operator3_out1_3;



  assign Switch6_out1_5 = (Bit_Slice11_out1 == 1'b0 ? Logical_Operator3_out1_3 :
              Logical_Operator_out1_28);



  assign Bit_Slice2_out1_5 = Bit_Slice4_out1[2];



  assign Logical_Operator1_out1_4 = Bit_Slice2_out1_5 | Logical_Operator_out1_28;



  assign Bit_Slice3_out1_5 = Bit_Slice4_out1[3];



  assign Logical_Operator2_out1_4 = Bit_Slice3_out1_5 | Logical_Operator1_out1_4;



  assign Switch7_out1_5 = (Bit_Slice11_out1 == 1'b0 ? Logical_Operator1_out1_4 :
              Logical_Operator2_out1_4);



  assign Switch3_out1_5 = (Bit_Slice8_out1 == 1'b0 ? Switch6_out1_5 :
              Switch7_out1_5);



  assign Bit_Slice5_out1 = Bit_Concat_out1_24[22:19];



  assign Bit_Slice_out1_31 = Bit_Slice5_out1[0];



  assign Logical_Operator3_out1_4 = Bit_Slice_out1_31 | Logical_Operator2_out1_4;



  assign Bit_Slice1_out1_7 = Bit_Slice5_out1[1];



  assign Logical_Operator_out1_29 = Bit_Slice1_out1_7 | Logical_Operator3_out1_4;



  assign Switch6_out1_6 = (Bit_Slice11_out1 == 1'b0 ? Logical_Operator3_out1_4 :
              Logical_Operator_out1_29);



  assign Bit_Slice2_out1_6 = Bit_Slice5_out1[2];



  assign Logical_Operator1_out1_5 = Bit_Slice2_out1_6 | Logical_Operator_out1_29;



  assign Bit_Slice3_out1_6 = Bit_Slice5_out1[3];



  assign Logical_Operator2_out1_5 = Bit_Slice3_out1_6 | Logical_Operator1_out1_5;



  assign Switch7_out1_6 = (Bit_Slice11_out1 == 1'b0 ? Logical_Operator1_out1_5 :
              Logical_Operator2_out1_5);



  assign Switch3_out1_6 = (Bit_Slice8_out1 == 1'b0 ? Switch6_out1_6 :
              Switch7_out1_6);



  assign Switch4_out1 = (Bit_Slice7_out1 == 1'b0 ? Switch3_out1_5 :
              Switch3_out1_6);



  assign Logical_Operator_out1_30 = Bit_Slice7_out1 | (Bit_Slice11_out1 | Bit_Slice8_out1);



  assign Bit_Slice6_out1 = Bit_Concat_out1_24[24:23];



  assign Bit_Slice_out1_32 = Bit_Slice6_out1[0];



  assign Logical_Operator3_out1_5 = Bit_Slice_out1_32 | Logical_Operator2_out1_5;



  assign Bit_Slice1_out1_8 = Bit_Slice6_out1[1];



  assign Logical_Operator_out1_31 = Bit_Slice1_out1_8 | Logical_Operator3_out1_5;



  assign Switch7_out1_7 = (Logical_Operator_out1_30 == 1'b0 ? Logical_Operator3_out1_5 :
              Logical_Operator_out1_31);



  assign BitSlice_out1_1 = BitSlice_out1[0];



  assign BitSlice1_out1 = BitSlice_out1[1];



  assign if_tmp_0_1_out1_23 = (Bit_Slice_out1_24 == 1'b0 ? R_mant_b_norm_out1_24 :
              bitsll_R_1_out1_23);



  assign bitsll_R_1_out1_24 = if_tmp_0_1_out1_23 <<< 8'd1;



  assign R_0_out1 = bitsll_R_1_out1_24 != 26'sb00000000000000000000000000;



  assign Switch1_out1 = (Bit_Slice9_out1 == 1'b0 ? Switch4_out1 :
              Switch7_out1_7);



  assign Switch2_out1 = (Bit_Slice10_out1 == 1'b0 ? Switch3_out1_4 :
              Switch1_out1);



  assign sticky_bitsll_Q_Q_WordLen_out1 = R_0_out1 | Switch2_out1;



  assign alphabitget_Mant_tmp_2_0_out1 = BitSlice1_out1 | sticky_bitsll_Q_Q_WordLen_out1;



  assign alphabitget_Mant_tmp_1_0_out1 = BitSlice_out1_1 & alphabitget_Mant_tmp_2_0_out1;



  assign alpha0_out1_3 = 1'b0;



  assign BitSlice4_out1 = BitSlice_out1[23:1];



  assign Bit_Concat_out1_26 = {alpha0_out1_3, BitSlice4_out1};



  assign alpha2_out1 = 24'b000000000000000000000001;



  assign Mant_tmp_2_out1 = Bit_Concat_out1_26 + alpha2_out1;



  assign if_bitget_Mant_tmp_1_0_out1 = (alphabitget_Mant_tmp_1_0_out1 == 1'b0 ? Bit_Concat_out1_26 :
              Mant_tmp_2_out1);



  assign BitSlice2_out1 = if_bitget_Mant_tmp_1_0_out1[23];



  assign DTC1_out1_1 = exp_a_norm_exp_b_norm_cast_out1[7:0];



  assign C2_out1 = 8'b00000000;



  assign if_exp_tmp_1_out1 = (exp_tmp_1_out1 == 1'b0 ? DTC1_out1_1 :
              C2_out1);



  assign C4_out1 = 8'b11111111;



  assign if_exp_tmp_2_cfType_ExponentB_out1 = (exp_tmp_2_cfType_ExponentBi_out1 == 1'b0 ? if_exp_tmp_1_out1 :
              C4_out1);



  assign alpha1_out1_3 = 8'b00000001;



  assign Exp_1_out1 = if_exp_tmp_2_cfType_ExponentB_out1 + alpha1_out1_3;



  assign if_bitget_Mant_tmp_Mant_tmp_Wor_out1 = (BitSlice2_out1 == 1'b0 ? if_exp_tmp_2_cfType_ExponentB_out1 :
              Exp_1_out1);



  assign C4_out1_1 = 8'b11111111;



  assign if_bExponent_0_bMantissa_out1 = (alphabExponent_0_bMantissa_out1 == 1'b0 ? if_bitget_Mant_tmp_Mant_tmp_Wor_out1 :
              C4_out1_1);



  assign C1_out1_1 = 8'b00000000;



  assign C_out1_5 = 8'b11111111;



  assign if_bExponent_0_bMantissa_out1_1 = (alphabExponent_0_bMantissa_out1 == 1'b0 ? C1_out1_1 :
              C_out1_5);



  assign if_aExponent_0_aMantissa_out1 = (alphaaExponent_0_aMantissa_out1 == 1'b0 ? if_bExponent_0_bMantissa_out1 :
              if_bExponent_0_bMantissa_out1_1);



  assign C1_out1_2 = 8'b00000000;



  assign if_mant_b_0_out1 = (bMantissa_0_out1 == 1'b0 ? bExponent :
              C1_out1_2);



  assign if_exp_a_cfType_Exponent_Inf_out1 = (aExponent_cfType_Exponent_I_out1 == 1'b0 ? if_mant_b_0_out1 :
              aExponent);



  assign if_aExponent_cfType_Exponent_out1 = (alphaaExponent_cfType_Exponent_out1 == 1'b0 ? if_aExponent_0_aMantissa_out1 :
              if_exp_a_cfType_Exponent_Inf_out1);



  assign Compare_To_Zero_out1 = if_exp_tmp_2_cfType_ExponentB_out1 == 8'b00000000;



  assign Logical_Operator_out1_32 = BitSlice2_out1 | Compare_To_Zero_out1;



  assign BitSlice3_out1 = if_bitget_Mant_tmp_1_0_out1[22:0];



  assign C_out1_6 = 23'b00000000000000000000000;



  assign if_bitget_Mant_tmp_Mant_tmp_Wor_1_out1 = (Logical_Operator_out1_32 == 1'b0 ? BitSlice3_out1 :
              C_out1_6);



  assign C5_out1_1 = 23'b00000000000000000000000;



  assign if_bExponent_0_bMantissa_1_out1 = (alphabExponent_0_bMantissa_out1 == 1'b0 ? if_bitget_Mant_tmp_Mant_tmp_Wor_1_out1 :
              C5_out1_1);



  assign C3_out1_1 = 23'b00000000000000000000000;



  assign C2_out1_1 = 23'b10000000000000000000000;



  assign if_bExponent_0_bMantissa_1_out1_1 = (alphabExponent_0_bMantissa_out1 == 1'b0 ? C3_out1_1 :
              C2_out1_1);



  assign if_aExponent_0_aMantissa_1_out1 = (alphaaExponent_0_aMantissa_out1 == 1'b0 ? if_bExponent_0_bMantissa_1_out1 :
              if_bExponent_0_bMantissa_1_out1_1);



  assign C2_out1_2 = 23'b00000000000000000000000;



  assign if_mant_b_0_1_out1 = (bMantissa_0_out1 == 1'b0 ? Switch_out1_1 :
              C2_out1_2);



  assign C_out1_7 = 23'b10000000000000000000000;



  assign if_exp_b_cfType_Exponent_Inf_out1 = (bExponent_cfType_Exponent_I_out1 == 1'b0 ? Switch_out1 :
              C_out1_7);



  assign if_exp_a_cfType_Exponent_Inf_1_out1 = (aExponent_cfType_Exponent_I_out1 == 1'b0 ? if_mant_b_0_1_out1 :
              if_exp_b_cfType_Exponent_Inf_out1);



  assign if_aExponent_cfType_Exponent_1_out1 = (alphaaExponent_cfType_Exponent_out1 == 1'b0 ? if_aExponent_0_aMantissa_1_out1 :
              if_exp_a_cfType_Exponent_Inf_1_out1);



  // Combine FP sign, exponent, mantissa into 32 bit word
  assign nfp_out_pack = {tmp_out1, if_aExponent_cfType_Exponent_out1, if_aExponent_cfType_Exponent_1_out1};



  assign nfp_out = nfp_out_pack;

endmodule  // nfp_div_single

