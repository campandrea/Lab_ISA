import math
import numpy
from sfp import SFP
from math import floor


# input generation functions
def openFile(filename, mode):
    try:
        file = open(filename, mode)
    except IOError:
        raise IOError
    return file


def genSinewave(f1, fs=10000, T_max=1/500):
    """ generates a sinewave at f1, with sampling frequency fs and long 10*T """
    i=0
    sig1=[]
    while i<10*T_max:
        sig1.append(numpy.sin(2*math.pi*f1*i))
        i+=1/fs
    return sig1

def genInputSignal(x1, x2):
	""" generates the sum vector """
	sum=[]
	for a,b in zip(x1,x2):
		c = floor((a+b)/2*(2**9))
		if c == 512:
			c = 511
		sum.append(c)
	return sum

def convertToSFP(list_to_convert, m, n):
    """ convert the list in SFP with m integer bits and n decimal bits"""
    sum_SFP=[]
    for x in list_to_convert:
        sfp_num = SFP(m,n,x)
        sum_SFP.append(sfp_num.to_std_logic())
    return sum_SFP

def writeListOnFile(filename, list_to_print):
    fp=openFile(filename,'w')
    for x in list_to_print:
        fp.write("{}\n".format(x))
    fp.close()




#output functions

def eliminateLineFile(filename, n=1):
	"""eliminate the first n line from a file"""
	filep = openFile(filename, 'r')
	lines = filep.readlines()
	filep = openFile(filename, 'w')
	filep.writelines(lines[n:])
	filep.close()
	
	

def generateErrorFile(DUT_filename, ideal_filename, error_filename, line_to_eliminate=1):
	""" reads the results from the dut and the ideal modfel and generates a file
        with the difference line per line"""
	
	eliminateLineFile(ideal_filename,line_to_eliminate)
	ideal_file = openFile(ideal_filename, 'r')
	DUT_file = openFile(DUT_filename,'r')
	error_file = openFile(error_filename, 'w')
	error_file.write("In this file is computed:\nDUT_result - C_prog_result\n")
	
	for DUT_line, ideal_line in zip(DUT_file, ideal_file):
		error = int(DUT_line) - int(ideal_line)
		error_file.write("{} - {} = {}\n".format(int(DUT_line), int(ideal_line), error))
	DUT_file.close()
	ideal_file.close()
	error_file.close()
