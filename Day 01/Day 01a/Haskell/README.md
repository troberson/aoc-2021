# Advent of Code: Day 1A - Haskell Solution

## Requirements

- [Glasgow Haskell Compiler](https://www.haskell.org/ghc/)
- [Haskell Tool Stack](https://www.haskellstack.org)
- [Hspec](https://hspec.github.io/)

## Setup

If you have not used the Haskell Tool Stack before and are on Linux or macOS,
type

`curl -sSL https://get.haskellstack.org/ | sh`  
or  
`wget -qO- https://get.haskellstack.org/ | sh`

This script will ask for administrator (root) access.

If you are on Windows, go to the
[Haskell Tool Stack](https://www.haskellstack.org)
website and download the Windows installer.

Use Stack to download its copy of GHC, which may be different from your
system version:

`stack setup`

## Build

**Testing or Running will also build the library.**

From the `Haskell` directory, type

`stack build`

## Test

**Test the solution against the simple case described in the problem.**

From the `Haskell` directory, type

`stack test`

## Run

**Run the solution against the full data set.**

From the `Haskell` directory, type

`stack exec aoc-01a-exe`

This will print the solution to the terminal screen.

## Explanation

The core of this solution is a single line:

    countIncreasing :: [Int] -> Int
    countIncreasing l = sum . map fromEnum $ zipWith (<) l (tail l)

Reading right-to-left, we use `zipWith` to combine two lists using an
expression `<`. The two lists are really the same list `l`, but the second copy
doesn't have the first item (`tail l`). So the first item is combined with the
second item as `a < b` and so forth down the list.

The result is a list of booleans, such as

    [True, False, False, True, True, False, ...]

But we can't add booleans together (unlike some other languages
in which `True` is `1` and `False` is `0`). `True` and `False`
are members of an enum. So `map fromEnum` applies the `fromEnum` function
to every item in the list. `fromEnum` converts an enum value to its position
in the enum list, which converts `True` to `1` and `False` to `0`.

Then we sum the results to find out how many `1`s we have,
that is, how many times we have increased.
