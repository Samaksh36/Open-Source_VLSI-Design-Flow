# Quetion 8

#Take Input From stdin
puts "Input String: "
gets stdin input_str

#Find the reverse of the input string
#We use a function from string library (reverse_string)
set output_str [string reverse $input_str]

#Display the reversed string on the terminal
puts "Output: $output_str"
