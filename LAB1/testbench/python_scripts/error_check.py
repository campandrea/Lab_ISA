import functions as f



def generateErrorFile(DUT_filename, ideal_filename, error_filename, m, n):
    """ reads the results from the dut and the ideal modfel and generates a file
        with the difference line per line; m is the integer part and n the decimal
        part"""

    DUT_file = openFile("prova1.txt",'r')
    ideal_file = openFile("prova2.txt", 'r')
    error_file = openFile("prova3.txt", 'w')
    for DUT_line, ideal_line1 in zip(DUT_file, ideal_file):
        a = int(real.replace(".", ""), 2)
        b = int(expected.replace(".", ""), 2)
        a


    
