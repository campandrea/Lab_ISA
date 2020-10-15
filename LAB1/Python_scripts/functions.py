import math
import numpy
from sfp import SFP


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
        sum.append((a+b)/2)
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
def generateErrorFile(DUT_filename, ideal_filename, error_filename):
    """ reads the results from the dut and the ideal modfel and generates a file
        with the difference line per line"""

    DUT_file = openFile("prova1.txt",'r')
    ideal_file = openFile("prova2.txt", 'r')
    error_file = openFile("prova3.txt", 'w')
    error_file.write("In this file is computed:\nDUT_result - C_prog_result\n")
    for DUT_line, ideal_line1 in zip(DUT_file, ideal_file):
        DUT_num = from_binary(DUT_line)
        ideal_num = from_binary(ideal_line)
        error_file.write(DUT_num - ideal_num + "\n")
    DUT_file.close()
    ideal_file.close()
    error_file.close()
