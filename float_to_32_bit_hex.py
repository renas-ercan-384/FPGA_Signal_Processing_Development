# Float to 32 Bit Hex

def float_bin(my_number, places = 3): 
    my_whole, my_dec = str(my_number).split(".")
    my_whole = int(my_whole)
    res = (str(bin(my_whole))+".").replace('0b','')
  
    for x in range(places):
        my_dec = str('0.')+str(my_dec)
        temp = '%1.20f' %(float(my_dec)*2)
        my_whole, my_dec = temp.split(".")
        res += my_whole
    return res
  
  
  
def IEEE754(n) : 
    # identifying whether the number
    # is positive or negative
    sign = 0
    if n < 0 : 
        sign = 1
        n = n * (-1) 
    p = 30
    # convert float to binary
    dec = float_bin (n, places = p)
  
    dotPlace = dec.find('.')
    onePlace = dec.find('1')
    # finding the mantissa
    if onePlace > dotPlace:
        dec = dec.replace(".","")
        onePlace -= 1
        dotPlace -= 1
    elif onePlace < dotPlace:
        dec = dec.replace(".","")
        dotPlace -= 1
    mantissa = dec[onePlace+1:]
  
    # calculating the exponent(E)
    exponent = dotPlace - onePlace
    exponent_bits = exponent + 127
  
    # converting the exponent from
    # decimal to binary
    exponent_bits = bin(exponent_bits).replace("0b",'') 
  
    mantissa = mantissa[0:23]
  
    # the IEEE754 notation in binary     
    final = str(sign) + exponent_bits.zfill(8) + mantissa
  
    # convert the binary to hexadecimal 
    hstr = '0x%0*X' %((len(final) + 3) // 4, int(final, 2)) 
    return (hstr, final)


file_object = open("decimal_input_values.txt") # Open Decimal File

lines = file_object.readlines(); # Read the Decimal File Lines

f = open("single_hex_inputs.txt", "w") # Open the new file that the Hex inputs will be saved into

for line in lines: # Read the input file line by line
  
  final_int = IEEE754(float(line)) # Obtain the float representation of the decimal inputs

  final_file = str(final_int).split("x") # Strip the the x from the hexidecimal values
    
  final_final = final_file[1].split("'")
  
  f.write(final_final[0] + "\n") # Write the hexidecimal values into the new file

  
  #print(final_final[0])

file_object.close # Close the original file
f.flush() # Flush the new hexidecimal values into the new file
f.close # Close the new hexidecimal file