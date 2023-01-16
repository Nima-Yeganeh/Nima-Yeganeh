#!/usr/bin/env python
import unittest

from fourbit import FourBit

class FourBitTest(unittest.TestCase):
    def test_max(self):
        with self.assertRaises(AttributeError):
            FourBit(0b10000)

    def _exec_op(self, op, a, b, expected):
        result = eval(f"FourBit({a}) {op} FourBit({b})")
        self.assertEqual(expected, result.num)

    def test_ops(self):
        values = {
            '+':[
                (0, 0, 0),
                (0b100, 0b001, 0b101),
                (0b1111, 0b0001, 0),
            ],
            '-':[
                (0, 0, 0),
                (1, 1, 0),
                (0b11, 0b01, 0b10),
                (0b01, 0b1111, 0),
            ],
            '*':[
                (0, 0, 0),
                (1, 1, 1),
                (0b10, 0b10, 0b100),
                (0b1000, 0b1000, 0),
            ],
            '/':[
                (1, 1, 1),
                (0b10, 0b01, 0b10),
                (0b0111, 0b0010, 0b011),
            ],
            '//':[
                (1, 1, 1),
                (0b10, 0b01, 0b10),
                (0b0111, 0b0010, 0b011),
            ],
            '&':[
                (0, 0, 0),
                (0b101, 0b011, 0b001),
                (0b1111, 0b0110, 0b0110),
            ],
            '|':[
                (0, 0, 0),
                (1, 0, 1),
                (0, 1, 1),
                (0b101, 0b011, 0b111),
            ],
            '^':[
                (0, 0, 0),
                (1, 0, 1),
                (0, 1, 1),
                (1, 1, 0),
                (0b101, 0b011, 0b110),
            ],
        }

        for op, data in values.items():
            for a, b, expected in data:
                print(f"{op} ", end='')
                self._exec_op(op, a, b, expected)

        print()

    def test_neg(self):
        values = [
            (0, 0b1111),
            (0b0001, 0b1110),
            (0b0110, 0b1001),
            (0b1111, 0)
        ]

        for a, expected in values:
            print(f"~ ", end='')
            result = ~FourBit(a)
            self.assertEqual(expected, result.num)


if __name__ == '__main__':
    unittest.main()
