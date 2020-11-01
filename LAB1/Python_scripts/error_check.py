import functions as f
from sys import argv

if len(argv) != 4:
	print("ERROR\nCorrect usage: input_gen.py <DUT_output> <C_output> <error_file>")
	exit()
dutfile = f.eliminateLineFile(argv[1],2)
f.generateErrorFile(dutfile, argv[2], argv[3])
