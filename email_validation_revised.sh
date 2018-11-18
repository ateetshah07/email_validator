#!/bin/bash
function isEmailValid() {
      regex="^([A-Za-z]+[A-Za-z0-9]*((\.|\-|\_)?[A-Za-z]+[A-Za-z0-9]*){1,})@(([A-Za-z]+[A-Za-z0-9]*)+((\.|\-|\_)?([A-Za-z]+[A-Za-z0-9]*)+){1,})+\.([A-Za-z]{2,})+"
      [[ "${1}" =~ $regex ]]
}

i = 0 #counter init

while read p #while loop to read contents from text file line by line
do
let i+=1
#echo $i
	if isEmailValid $p ;then
        	echo "VALID OK - " $p  >> VALID.txt  #to print valid emails in text file
		#echo "VALID OK - " $p # to print on screen
	else
		#echo "INVALID DUE TO REGEX - " $i " - " $p   #to print invalid emails on screen
        	echo "INVALID DUE TO REGEX - " $i " - " $p >> INVALID.txt  #to print invalid emails in text file
	fi
done < email_addresses.txt #calling data from text file
#awk '$0!=""{print NR, $0}' INVALID.txt
