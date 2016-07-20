#!/bin/bash
# ROLE-Enrolments.sh
#
# You must save this file in the same folder as the python file "ROLE_helper.py" 
# and the CSV you received from running the report!
#

touch /tmp/rhsenrol.csv
touch /tmp/temp.csv
touch /tmp/new_csv.csv

ORIG="$(zenity --file-selection)"
OUTP="/tmp/rhsenrol.csv"
TEMP="/tmp/temp.csv"
CSV="/tmp/new_csv.csv"
#
 sed -n -e '6p' $ORIG  | \
 awk -F, '{ printf "%s,%s,%s,%s,%s,%s,%s,%s,%s\n",$1,$2,$3,$8,$10,$13,$14,$19,$40  }'\
 > $OUTP

 awk '/[0-9][0-9][rR]\)/' $ORIG > $TEMP
 python /home/candace/Desktop/ROLE_helper.py 
 awk -F, '{ printf "%s,%s,%s,%s,%s,%s,%s,%s,%s,%s\n",$1,$2,$3,$8,$10,$13,$14,$32,$33,$34  }' $CSV \
 | sed -e 's/Online Self-Paced,//' >> $OUTP
 oocalc $OUTP &
