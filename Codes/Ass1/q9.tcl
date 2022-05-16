#Question 9

#Open the HARDWORK file and store it in open_file variable.
set open_file [open "HARDWORK" r]

#Read the lines in the HARDWORK file from open_file variable and store it in read_content variable.
set read_content [read $open_file]

#Close the file
close $open_file

#Now set the new file to write in MYGRADE as variable open_file.
set open_file [open "MYGRADE" w+]

#We split the contents of HARDWORK file, line by line and store it in content.
set content [split $read_content "\n"]

#For each line in HARDWORK file, we check if the file contains 'A+', if it does we set the variable 'c' to 1.
foreach i $content {
set c [string match "*A+*" $i]
if {$c == 1} {

#If the line contains A+, we move that line in MYGRADE file that is refrred with open_file variable.
puts $open_file $i
}
}

#Close the file.
close $open_file

