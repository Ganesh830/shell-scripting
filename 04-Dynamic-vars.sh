#!/bin/bash 

TODAY_DATE="$(date +%F)"
NO_OF_USERS="$(who | wc -l)"
UP Time="$(uptime)"

echo "Good Morning, Todays date is ${TODAY_DATE}"
echo "Number of sessions opened are : ${NO_OF_USERS}"
echo "up time of the server is: ${UP Time}"