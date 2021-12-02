module Main where

import Increasing

main :: IO ()
main = do
  contents <- readFile "input"
  let input = map read $ lines contents
  print $ countIncreasing input

