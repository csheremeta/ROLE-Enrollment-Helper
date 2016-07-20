#!/bin/python
import re
myfile = open("/tmp/temp.csv", "r")
data=myfile.read()
data = re.sub(r',(?=[^"]*"(?:[^"]*"[^"]*")*[^"]*$)', "@", data)
new_file = open("/tmp/new_csv.csv", "w")
print(data)
new_file.write(data)
myfile.close()
new_file.close()
