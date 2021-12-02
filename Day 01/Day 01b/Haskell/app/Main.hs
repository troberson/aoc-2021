module Main where

import Increasing
import Window

main :: IO ()
main = do
  contents <- readFile "input"
  let input = map read $ lines contents
  print $ countIncreasingWindows 3 input

