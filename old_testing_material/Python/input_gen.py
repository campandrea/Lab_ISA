import random
import sfp
import numpy



def gen_random_input(guard_bits=2):
    """Questa funzione genera un dato casuale
    """
    re_part = random.uniform(-2**(-guard_bits), 2**(-guard_bits))
    im_part = random.uniform(-2**(-guard_bits), 2**(-guard_bits))
    data = sfp.ComplexSFP(1, 23, re_part, im_part)
    return data


def gen_w(N,m):
    """Questa funzione genera un w considerando N ingressi alla FFT
    """
    re_part = numpy.cos(2*numpy.pi/N*m)
    im_part = - numpy.sin(2*numpy.pi/N*m)
    data = sfp.ComplexSFP(1, 23, re_part, im_part)
    return data


def write_file_input(file, n_series=1):
    """se non si specifica niente genera solo una
        sequenza di dati (A o B) in ingresso alla butterfly
        altrimenti il numero specificato come parametro
    """
    # salvo al contrario per facilitare la scrittura sul file --> ordine di
    # ingresso nella butterfly
    data = []
    for i in range(n_series):
        data.append(gen_random_input())
    for element in data:
        # stampo sul file parte reale scritta in std_logic
        file.write("{}\n".format(element.re.to_std_logic()))
    for element in data:
        # stampo sul file parte immaginaria scirtta in std_logic
        file.write("{}\n".format(element.im.to_std_logic()))
    return data


def write_f_w(file, N):
    """genera il W in ingresso alla butterfly
    """
    for i in range(N//2):
        w = gen_w(N, i)
        file.write("{}\n".format(w.re.to_std_logic()))
        file.write("{}\n".format(w.im.to_std_logic()))


def create_file(filename):
    try:
        file = open(filename, 'w')
    except IOError:
        raise IOError
    return file
