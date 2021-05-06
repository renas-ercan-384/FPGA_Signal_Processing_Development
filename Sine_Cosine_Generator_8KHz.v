
`timescale 1 us / 1 us


module Sine_Cosine_Generator_8KHz 
       (
           input clk ,
           output reg [31:0] sinus,
	        output reg [31:0] cosinus
       );
		
parameter SIZE = 32;  // Sine and Cosine LUT Size
  
reg signed [31:0] rom_memory_sinus   [SIZE-1:0];
reg signed [31:0] rom_memory_cosinus [SIZE-1:0];

integer i;
integer j;

initial begin
    // Read Sine and Cosine LUT Values from FPGA Memory
    $readmemh("Sine_LUT_Hex.txt", rom_memory_sinus); //File with the signal
	 $readmemh("Cos_LUT_Hex.txt", rom_memory_cosinus); //File with the signal

    i = 0;
	 j = 0;
end    

//At every positive edge of the clock, output a sine wave sample.
always@(posedge clk)
begin

    sinus = rom_memory_sinus[i];     // Read Sine values from memory LUT into sinus variable
	 cosinus = rom_memory_cosinus[j]; // Read Cosine values from memory LUT into cosinus variable
	 
    i = i+ 1;
	 j = j+ 1;
	 
	 // If a full wave cycle of the LUT has been read then reset i and j to repeat the sine and cosine waves
    if(i == SIZE)
        i = 0;
	 if(j == SIZE)
			j = 0;
end
endmodule
