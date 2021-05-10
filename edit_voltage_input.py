file_object = open("single_collumn.txt")

lines = file_object.readlines();


f = open("new_values.txt", "w")

for line in lines:
  #print(line)
  split_line_array = line.split("	")
  #print(split_line_array[1])
  raw_num_array = split_line_array[1].split("E")
  raw_num = raw_num_array[0]
  #print(raw_num)
  semi_final = raw_num.split(".")

  final = semi_final[0] + "." + semi_final[1]
  #print(final)
  f.write(final + "\n")

file_object.close
f.flush()
f.close


  
