
`timescale 1 us / 1 us 

module FPGA_Testbench;



 // Constants
 parameter clk_high                         = 2;
 parameter clk_low                          = 2;
 parameter clk_period                       = 4;
 parameter clk_hold                         = 2;
 
 // Testbench Signals
 reg                  clk;
 reg                  clk_enable; 
 reg                  reset; 
 reg                  tb_enb; 
 wire                 snkDone; 
 wire                 testFailure; 
 reg                  tbenb_dly; 
 wire                 filter_out_rdenb; 
 reg                  filter_out_done; 
 reg                  check1_Done; 
 reg                 start_dly = 2; 
 
 // Variables To Parse Inputs 
 integer              file_inputs;
 integer              scan_inputs;
 
 // Top Level FPGA Module Inputs and Outputs
 reg          [31:0]  filter_in;
 wire signed  [31:0]  top_level_input;
 wire         [15:0]  top_level_output;

  
 // Open Input File and Check if it exists
 initial
 begin
 
 file_inputs = $fopen("single_hex_inputs.txt", "r");
      if (file_inputs == 0) begin
        $display("data_file handle was NULL");
        $finish;
      end
 
 end

  
 //  always #(start_dly) clk = !clk;
	 
	// Instantiate Top Level FPGA Module 
	FPGA_Top_Level u_top_level_output
         (
			  .clk(clk),
			  .clk_sinus(clk),
           .reset(reset),
           .clk_enable(clk_enable),
           .top_level_input(top_level_input),
           .top_level_output(top_level_output)
			);
			  
	// Convert Parse Single Precision Floating Point Input to Signed Fixed Point
   nfp_convert_single_to_sfix_32_En28 u_single_to_fixed 
         (
			  .nfp_in(filter_in),
           .nfp_out(top_level_input)
         );
 
			  
  // Driving the test bench enable
  always @(reset, snkDone)
  begin
    if (reset == 1'b1)
      tb_enb <= 1'b0;
    else if (snkDone == 1'b0 )
      tb_enb <= 1'b1;
    else begin
    # (clk_period * 2);
      tb_enb <= 1'b0;
    end
  end


  always @(posedge clk or posedge reset)
  begin
    if (reset) begin 
    end 
    else begin 
    //  if (snkDone == 1) begin
    //    if (testFailure == 0)
    //          $display("**************TEST COMPLETED (PASSED)**************");
    //    else
    //          $display("**************TEST COMPLETED (FAILED)**************");
    //  end
    end
  end


  // System Clock and reset generation
  always
  begin
    clk <= 1'b1;
    # clk_high;
    clk <= 1'b0;
    # clk_low;
    if (snkDone == 1) begin
      clk <= 1'b1;
      # clk_high;
      clk <= 1'b0;
      # clk_low;
    end
  end

  initial
  begin
    reset <= 1'b1;
    # (clk_period * 2);
    @ (posedge clk);
    # (clk_hold);
    reset <= 1'b0;
  end

  // Testbench clock enable
  always @ (posedge clk or posedge reset)
    begin: tb_enb_delay
      if (reset == 1'b1) begin
        tbenb_dly <= 1'b0;
      end
      else begin
   //     if (tb_enb == 1'b1) begin
          tbenb_dly <= tb_enb;
   //     end
      end
    end

  
  // Read the data from the file and transmit it to a usable input
  
	always @(posedge clk) 
		begin
		if (!$feof(file_inputs)) 
			begin
			scan_inputs = $fscanf(file_inputs, "%h\n", filter_in);
			end
		else
			begin
			$fclose(file_inputs);
			end
		end


  always @ (posedge clk or posedge reset) // checkDone_1
  begin
    if (reset == 1)
      check1_Done <= 0;
  //  else if ((check1_Done == 0) && (filter_out_done == 1) && (filter_out_rdenb == 1))
  //    check1_Done <= 1;
  end

  // Create done and test failure signal for output data
  assign snkDone = check1_Done;

  // Global clock enable
  always @(snkDone, tbenb_dly)
  begin
    if (snkDone == 0)
      # clk_hold clk_enable <= tbenb_dly;
    else
      # clk_hold clk_enable <= 0;
  end



endmodule // FPGA_Testbench


