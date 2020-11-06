import functions as f
from sys import argv

if len(argv) != 4:
	print("ERROR\nCorrect usage: error_check.py <DUT_output> <C_output> <error_file>")
	exit()
f.generateErrorFile(argv[1], argv[2], argv[3])
print("Done")
