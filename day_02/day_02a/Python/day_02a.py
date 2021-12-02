#!/usr/bin/env python3

import sys
from enum import Enum
from typing import List, Optional

if sys.version_info < (3, 4):
    sys.exit("Python 3.4 or later is required.\n")


class Direction(Enum):
    FORWARD = 1
    DOWN = 2
    UP = 3


class Command:
    direction: Direction
    distance: int = 0

    def __init__(self, direction: Direction, distance: int):
        self.direction = direction
        self.distance = distance


class Position:
    horizontal = 0
    depth = 0

    def __init__(self, horizontal: int = 0, depth: int = 0):
        self.horizontal = horizontal
        self.depth = depth

    def __str__(self) -> str:
        return f"Horizontal: {self.horizontal}, Depth: {self.depth}"

    def move(self, command: Command) -> None:
        if command.direction == Direction.FORWARD:
            self.horizontal += command.distance
        elif command.direction == Direction.DOWN:
            self.depth += command.distance
        elif command.direction == Direction.UP:
            self.depth -= command.distance

    def multiply(self) -> int:
        return self.horizontal * self.depth


def processLine(line: str) -> Optional[Command]:
    parts = line.strip().split()
    if len(parts) != 2:
        return None

    command = parts[0]
    value = int(parts[1])

    if command == 'forward':
        return Command(Direction.FORWARD, value)
    elif command == 'down':
        return Command(Direction.DOWN, value)
    elif command == 'up':
        return Command(Direction.UP, value)
    return None


def processData(lines: List[str]) -> Optional[Position]:
    position = Position()
    for line in lines:
        command = processLine(line)
        if command is None:
            return None
        position.move(command)
    return position


def processFile(filename: str) -> Optional[Position]:
    with open(filename, 'r') as f:
        lines = f.readlines()
    if lines is None:
        return None
    return processData(lines)


if __name__ == '__main__':
    input_file = 'input'
    if len(sys.argv) == 2:
        input_file = sys.argv[1]
    if len(sys.argv) > 2:
        sys.exit('Usage: {} [input_file]'.format(sys.argv[0]))

    position = processFile(input_file)
    print(position)
    print(position.multiply())
