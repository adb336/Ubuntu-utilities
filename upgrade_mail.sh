#!/bin/bash

NO_UP=0
NO_NON=0
NO_SEC=0
UP_ALL=""
UP_NON=""
UP_SEC=""

UP_ALL=$( /usr/bin/apt list --upgradeable 2>/dev/null | /bin/grep -v "Listing" )

NO_UP=$( echo "${UP_ALL}" | /usr/bin/wc -l )

echo "Total updates: ${NO_UP}"

UP_SEC=$( echo "${UP_ALL}" | /bin/grep "\-security" )
UP_NON=$( echo "${UP_ALL}" | /bin/grep -v "\-security" )

NO_SEC=$( echo "${UP_SEC}" | /usr/bin/wc -l )
(( NO_NON = NO_UP-NO_SEC ))

echo "Normal upgrades: ${NO_NON}"
echo "${UP_NON}"

echo "Security upgrades: ${NO_SEC}"
echo "${UP_SEC}"

exit 0

