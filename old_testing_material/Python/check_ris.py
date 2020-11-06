import sfp
from numpy import pi, e

def open_file(filename, mode='r'):
    try:
        file = open(filename, mode)
    except IOError:
        print("Errore nell'apertura del file {}\n".format(filename))
        raise IOError
    return file


def check_result(real_file, expected_file):
    """ la funziona confronta i risultati di un file di
        risultati reali con quelli di un file di risultati teorico
        se c'è un errore ritorna 0
    """

    for real, expected in zip(real_file, expected_file):
        a = int(real.replace(".", ""), 2)
        b = int(expected.replace(".", ""), 2)
        res = abs(a - b)
        print("a = {} b = {} res = {}".format(a, b, res))

        if res > 4:
            return 0
    return 1


def delete_point_from_file(filename):
    file = open_file(filename)
    file_no_point = open_file("{}_no_point.txt".format(filename.replace(".txt", "")), 'w')
    for line in file:
        file_no_point.write("{}".format(line.replace(".", "")))
    file.close()
    file_no_point.close()

def fft(data_in, file_out):
    """ data_in è una lista contente dati del tipo ComplexSFP,
        la funzione, esegue la fft e salva il risultato in formato
        binario su un file"""
    data_in_complex_format = []
    for d in data_in:
        data_in_complex_format.append(complex(d))
    data_out = cooley_tukey_fft(data_in_complex_format)
    for el in data_out:
        print(el)
    data_out_sfp_format = []
    for data in data_out:
        data_out_sfp_format.append(sfp.ComplexSFP(1, 23, data.real, data.imag))
    file = open_file(file_out, 'w')
    for element in data_out_sfp_format:
        # stampo sul file parte reale scritta in std_logic
        file.write("{}\n".format(element.re.to_std_logic()))
    for element in data_out_sfp_format:
        # stampo sul file parte immaginaria scirtta in std_logic
        file.write("{}\n".format(element.im.to_std_logic()))
    file.close()


def cooley_tukey_fft(data_in):
    N = len(data_in)
    data_out = []
    for k in range(N):
        a = 0
        b = 0
        for n in range(N//2 - 1):
            a = a + data_in[2*n] * pow(e, -1j*2*pi/(N//2)*n*k)
            b = b + data_in[2*n + 1] * pow(e, -1j*2*pi/(N//2)*n*k)
        data_out.append(a + pow(e, -1j*2*pi/N*k) * b)
    return data_out