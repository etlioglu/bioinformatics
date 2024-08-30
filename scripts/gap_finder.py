# Finds gaps in a scaffold and reports their coordinates.

import re

file_name = raw_input("Please enter the name of the fasta file: ") #gets the filename from the user

try: #if the file is present
    with open(file_name, "r") as file_object:
        lines = file_object.readlines() #read line by line
        del lines[0] #delete the first line which is the header
        seq = "".join(lines) #convert the list of lines to an uninterrupted sequence
        print ""
        print "gap_start", "gap_end", "gap_length" #header of the output
        match = re.finditer("N*N", seq) #find stretches of Ns in seq variable
        for m in match:
            start = m.start()+1 #Python starts counting from 0
            end = m.end() #Because of the way that Python reports ranges
            print start, end, end-start+1
        print ""
except IOError as e: #the file does not exist OR no read permissions
    print "Unable to open file"