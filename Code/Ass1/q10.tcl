#Question 10

#Assuming zero is neither prime not composite
#Taking 1 as prime, therefore starting our search from 2.

set comp 0

#Not necessary
set i 2
set j 2

#Loop1... i goes for 2 to 100
for {set i 2} {$i < 101} {incr i} {
	#Loop2... j goes from 2 to i
	for {set j 2} {$j < $i} {incr j} {

		#We check if, 'i' is divisible by 'j'. That is if 'i' is divisble by [i-1, i-2, i-3 ...2]
		set comp [expr $i % $j]

		#If it is not then we print the number 'i' on the terminal as it is composite
		if {$comp == 0} {
			puts $i
			break
			#We don't need to further check if 'i' has more factors, so we break loop2.

		}
	
	}

}
