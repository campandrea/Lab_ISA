import functions as f
from sys import argv

#main
if len(argv) != 3:
	print("ERROR\nCorrect usage: input_gen.py <filename_input_c> <filename_input_DUT>")
	exit()
sine1=f.genSinewave(500)
sine2=f.genSinewave(4500)
sum=f.genInputSignal(sine1,sine2)
f.writeListOnFile(argv[1], sum)
sum_SFP= f.convertToSFP(sum, 1, 9)
f.writeListOnFile(argv[2],sum_SFP)
