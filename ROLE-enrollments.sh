#!/bin/bash
# ROLE-Enrolments.sh
#
# Part of the packaged rpm I created to install the program "ROLE Enrollment Helper"
# which can be found at the Fedora COPR page:
# https://copr-be.cloud.fedoraproject.org/results/csheremeta/role-enrollment-helper/epel-7-x86_64/00429170-role-enrollments-helper/role-enrollments-helper-1.0.0-2.el7.centos.noarch.rpm
# (You will need to sudo yum install -y <that_link> in your terminal)
#
# Thanks!   - Candace Sheremeta (candace.aleea@gmail.com)

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
