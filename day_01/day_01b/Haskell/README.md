# Advent of Code: Day 1B - Haskell Solution

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

`stack exec aoc-01b-exe`

This will print the solution to the terminal screen.

## Explanation

There are four functions that this solution relies upon:

[**Increasing.hs**](src/Increasing.hs)

        countIncreasing :: [Int] -> Int
        countIncreasing l = sum . map fromEnum $ zipWith (<) l (tail l)

        countIncreasingWindows :: Int -> [Int] -> Int
        countIncreasingWindows size l = countIncreasing . map sum $ genWindows size l

[**Window.hs**](src/Window.hs)

        genWindows :: Int -> [a] -> [[a]]
        genWindows size = transpose' . take size . tails

        transpose' :: [[a]] -> [[a]]
        transpose' = foldr (zipWith (:)) (repeat [])

### `genWindows`

We need to generate sliding windows:

        genWindows :: Int -> [a] -> [[a]]
        genWindows size = transpose' . take size . tails

`genWindows` takes the `tails` of a list. The `tails` function (in
`Data.List`) creates a list of lists, successively removing the first
element from each. For example:

        > tails [1..5]
        [[1,2,3,4,5],[2,3,4,5],[3,4,5],[4,5],[5],[]]

We only take the first 3 elements of the tails list to use a 3 element sliding window.

        > take 3 $ tails [1..5]
        [[1,2,3,4,5],[2,3,4,5],[3,4,5]]

We want to transpose this matrix. Unfortunately, this list of
lists isn't really a matrix, the rows have different numbers of
columns. If we just use the `transpose` function, we get this

        > transpose . take 3 $ tails [1..5]
        [[1,2,3],[2,3,4],[3,4,5],[4,5],[5]]

We only want the rows that have three elements. We could do

        > reverse $ drop 2 $ reverse $ transpose . take 3 $ tails [1..5]
        [[1,2,3],[2,3,4],[3,4,5]]

### `transpose'`

But there's a cleaner solution. We define a slightly-different `transpose'`
function:

        transpose' :: [[a]] -> [[a]]
        transpose' = foldr (zipWith (:)) (repeat [])

By zipping the lists, we drop the lists that don't use all
three original lists. This function takes the lists of lists
that we had and applies the `zipWith (:)` function to each
element successively from the right, starting with an infinite
list of empty lists (`repeat []`). The colon (`:`) is the Haskell
_prepend_ function. For example:

        > take 3 $ tails [1..5]
        [[1,2,3,4,5],[2,3,4,5],[3,4,5]]

        > zipWith (:) [3,4,5] [[],[],[]]
        [[3],[4],[5]]

        > zipWith (:) [2,3,4,5] [[3],[4],[5]]
        [[2,3],[3,4],[4,5]]

        > zipWith (:) [1,2,3,4,5] [[2,3],[3,4],[4,5]]
        [[1,2,3],[2,3,4],[3,4,5]]

This is the same as using the `foldr`-based function that we
called `transpose'`:

        > transpose' . take 3 $ tails [1..5]
        [[1,2,3],[2,3,4],[3,4,5]]

### `countIncreasingWindows`

        countIncreasingWindows :: Int -> [Int] -> Int
        countIncreasingWindows size l = countIncreasing . map sum $ genWindows size l

This generates windows of the given size for the list, as detailed above.
Each of the windows is summed and the `countIncreasing` function is used to find
how many increase from the previous.

### `countIncreasing`

The `countIncreasing` function is detailed in the
[README](../../Day%2001a/Haskell/README.md)
for Day 1A.
