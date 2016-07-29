#!/bin/python
# Part of the packaged rpm I created to install the program "ROLE Enrollment Helper"
# which can be found at the Fedora COPR page:
# https://copr-be.cloud.fedoraproject.org/results/csheremeta/role-enrollment-helper/epel-7-x86_64/00429170-role-enrollments-helper/role-enrollments-helper-1.0.0-2.el7.centos.noarch.rpm
# (You will need to sudo yum install -y <that_link> in your terminal)
#
# Thanks!   - Candace Sheremeta (candace.aleea@gmail.com)
import re
myfile = open("/tmp/temp.csv", "r")
data=myfile.read()
data = re.sub(r',(?=[^"]*"(?:[^"]*"[^"]*")*[^"]*$)', "@", data)
new_file = open("/tmp/new_csv.csv", "w")
print(data)
new_file.write(data)
myfile.close()
new_file.close()
