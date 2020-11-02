import operator


class SFP:
    def __init__(self, m, n, val=0):
        """Simulates a Signed Fixed Point number with m integer bits and n decimals."""
        if m < 0:
            raise ArithmeticError("Cannot have {} integer bits: minimum is 0".format('m'))
        if n <= 0:
            raise ArithmeticError("Cannot have {} decimal bits: minimum is 1".format('n'))
        self.m = m
        self.n = n
        self._val = self._convert_val(val)

    @classmethod
    def from_binary(cls, binary_string):
        """Convert a string representing a binary number to a SFP.
        Args:
            binary_string (str): a string containing binary numbers with '.' as decimal separator. For example,
                '101.001010'
        Return:
            SFP: corresponding SFP number with the same amount of digits
        """
        integer_part, decimal_part = binary_string.split('.')
        return cls(len(integer_part), len(decimal_part), int(integer_part + decimal_part, 2))

    def _mask(self, number):
        """Masks a number in order to have it representable with the set amounts of bits"""
        return number & ((1 << (self.m + self.n)) - 1)

    def _convert_val(self, value):
        if isinstance(value, SFP):
            return self._mask(int(value))

        elif isinstance(value, int):
            return self._mask(value)

        elif isinstance(value, float):
            if value >= 0.0:
                return self._convert_val(int(value * (2**self.n)))
            else:
                return self._convert_val(int(value * (2**self.n)))

    def set(self, value):
        self._val = self._convert_val(value)

    def __getitem__(self, bit):
        """Returns requested bit"""
        return (self._val >> (bit + self.n)) & 1

    def __setitem__(self, bit, val):
        """Sets requested bit"""
        if bool(val) is True:
            self._val |= 1 << (bit + self.n)
        else:
            self._val &= (~1 << (bit + self.n))

    def is_positive(self):
        """True if the number is positive or equal to zero"""
        return self[self.m - 1] == 0

    def is_negative(self):
        """True if the number is strictly negative"""
        return self[self.m - 1] == 1

    def __int__(self):
        """Converts to a rescaled and unsigned version of itslef"""
        return self._val

    def __float__(self):
        """Converts to a float"""
        if self.is_positive():
            return self._val / (2**self.n)
        else:
            return -(2**self.m) + (self._val / (2**self.n))

    def __str__(self):
        """Converts to a string"""
        return "{:{m}.{n}f}".format(float(self), m=self.m, n=self.n)

    def bits(self):
        bits = 'b'
        for i in range(self.m - 1, -1, -1):
            bits += str(self[i])
        bits += '.'
        for i in range(-1, -self.n - 1, -1):
            bits += str(self[i])
        return bits

    def to_std_logic(self):
        bits = ''
        for i in range(self.m - 1, -1, -1):
            bits += str(self[i])
        for i in range(-1, -self.n - 1, -1):
            bits += str(self[i])
        return bits

    def _math_op(self, op, *args):
        """Runs a mathematical operation """
        res = op(*[int(arg) for arg in args])
        return SFP(self.m, self.n, self._mask(res))

    def __add__(self, other):
        return self._math_op(operator.add, self, other)

    def __sub__(self, other):
        return self._math_op(operator.sub, self, other)

    def __rsub__(self, other):
        return self._math_op(operator.sub, other, self)

    def __mul__(self, other):
        raise NotImplementedError("Multiplication is not working yet")
        if self > 0 and other > 0:
            op = lambda x, y: x*y // (2 ** (2*self.n))
        else:
            op = lambda x, y: x * y // (2 ** (2 * self.n)) + 2**(self.m + self.n - 1)
        return self._math_op(op, self, other)

    def __truediv__(self, other):
        raise NotImplementedError("Division is not working yet")
        return self._math_op(operator.truediv, self, other)

    def __rtruediv__(self, other):
        raise NotImplementedError("Division is not working yet")
        return self._math_op(operator.truediv, other, self)

    def __eq__(self, other):
        return int(self) == int(other)

    def __lt__(self, other):
        if int(other) == 0:
            return self.is_negative()
        raise NotImplementedError("Can only check against 0")

    def __le__(self, other):
        if int(other) == 0:
            return self.is_negative() or self._val == 0
        raise NotImplementedError("Can only check against 0")

    def __gt__(self, other):
        if int(other) == 0:
            return self.is_positive() and self._val != 0
        raise NotImplementedError("Can only check against 0")

    def __ge__(self, other):
        if int(other) == 0:
            return self.is_positive()
        raise NotImplementedError("Can only check against 0")


class ComplexSFP:
    def __init__(self, m, n, re=0, im=0):
        self.m = m
        self.n = n
        self.re = SFP(m, n, re)
        self.im = SFP(m, n, im)

    def set_re(self, value):
        self.re.set(value)

    def set_im(self, value):
        self.im.set(value)

    def __complex__(self):
        return float(self.re) + 1j*float(self.im)

    def __str__(self):
        return str(complex(self))

    def __add__(self, other):
        return ComplexSFP(self.m, self.n, self.re + other.re, self.im + other.im)

    def __sub__(self, other):
        return ComplexSFP(self.m, self.n, self.re - other.re, self.im - other.im)

    def __mul__(self, other):
        return ComplexSFP(self.m, self.n,
                          self.re*other.re - self.im*other.im,
                          self.re*other.im - self.im*other.re)

    def __truediv__(self, other):
        a, b = self.re, self.im
        c, d = other.re, other.im
        return ComplexSFP(self.m, self.n,
                          (a*c + b*d)/(c*c + d*d),
                          (b*c - a*d)/(c*c + d*d))
