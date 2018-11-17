#!/bin/bash

function isEmailValid() {
      regex="^([A-Za-z]+[A-Za-z0-9]*((\.|\-|\_)?[A-Za-z]+[A-Za-z0-9]*){1,})@(([A-Za-z]+[A-Za-z0-9]*)+((\.|\-|\_)?([A-Za-z]+[A-Za-z0-9]*)+){1,})+\.([A-Za-z]{2,})+"
      [[ "${1}" =~ $regex ]]
}

while read p #while loop to read contents from text file line by line
do

	if isEmailValid $p ;then
        	echo "VALID OK - " $p  >> VALID.txt  #to print valid emails in text file
	else
		echo "INVALID DUE TO REGEX - " $p   #to print invalid emails on screen
        	echo "INVALID DUE TO REGEX - " $p >> INVALID.txt  #to print invalid emails in text file
	fi

done < email_addresses.txt #calling data from text file
