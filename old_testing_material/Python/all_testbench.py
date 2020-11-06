import input_gen
import check_ris
import os
import subprocess
import time

# Clean folder. Deleting working directories and outputs
#os.system("rm -rf ../testbench_butterfly/work")
#os.system("rm transcript")


# Setting up environement variables
os.environ["PATH"] += os.pathsep + "/software/mentor/modelsim_10.5c/modeltech/linux_x86_64/"
os.environ["LM_LICENSE_FILE"] = "1717@led-x3850-1.polito.it"



def simulate(compile_file):
    # Launch Modelsim simulation
    print("Starting simulation...")
    process = subprocess.call(["vsim", "-c", "-do", compile_file])
    print("Simulation completed")


def simulate_butterfly(cycles):
    A_file = input_gen.create_file("../testbench_butterfly/Files/Input_A.txt")
    input_gen.write_file_input(A_file, cycles)
    A_file.close()
    B_file = input_gen.create_file("../testbench_butterfly/Files/Input_B.txt")
    input_gen.write_file_input(B_file, cycles)
    B_file.close()
    W_file = input_gen.create_file("../testbench_butterfly/Files/Input_W.txt")
    input_gen.write_f_w(W_file, 2)
    W_file.close()
    if input("Vuoi simulare? s/n:") == "n":
        return 0
    simulate("../testbench_butterfly/behavior_test/compile.do")
    simulate("../testbench_butterfly/rtl_test/compile.do")
    # verifica correttezza A
    exp_file_A = check_ris.open_file("../testbench_butterfly/Files/Output_A_exp.txt")
    real_file_A = check_ris.open_file("../testbench_butterfly/Files/Output_A_re.txt")
    if check_ris.check_result(real_file_A, exp_file_A):
        print("Risulutato di A in uscita corretto\n")
    else:
        print("Risulutato di A in uscita sbagliato\n")
    exp_file_A.close()
    real_file_A.close()
    # verifica correttezza B
    exp_file_B = check_ris.open_file("../testbench_butterfly/Files/Output_B_exp.txt")
    real_file_B = check_ris.open_file("../testbench_butterfly/Files/Output_B_re.txt")
    if check_ris.check_result(real_file_B, exp_file_B):
        print("Risulutato di B in uscita corretto\n")
    else:
        print("Risulutato di B in uscita sbagliato\n")
    exp_file_B.close()
    real_file_B.close()

def simulate_fft():
    input_file = input_gen.create_file("../testbench_FFT/Files/Input_data.txt")
    input_vect = input_gen.write_file_input(input_file, 16)
    #generare eventualmente i W
    input_file.close()
    simulate("../testbench_FFT/compile.do")
    check_ris.fft(input_vect, "../testbench_FFT/Files/Output_exp.txt")
    check_ris.delete_point_from_file("../testbench_FFT/Files/Output_real.txt")
    exp_file = check_ris.open_file("../testbench_FFT/Files/Output_exp.txt")
    real_file = check_ris.open_file("../testbench_FFT/Files/Output_real_no_point.txt")
    if check_ris.check_result(real_file, exp_file):
        print("Risultato della FFT in uscita corretto\n")
    else:
        print("Risultato della FFT in uscita sbagliato\n")


simulate_butterfly(1)