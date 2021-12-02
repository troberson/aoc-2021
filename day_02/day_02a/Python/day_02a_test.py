#!/usr/bin/env python3

import sys
from day_02a import *

if sys.version_info < (3, 4):
    sys.exit("Python 3.4 or later is required.\n")


def test_data():
    test_data = ["forward 5", "down 5", "forward 8", "up 3", "down 8",
                 "forward 2"]

    pos = processData(test_data)
    assert pos.horizontal == 15
    assert pos.depth == 10
    assert pos.multiply() == 150
