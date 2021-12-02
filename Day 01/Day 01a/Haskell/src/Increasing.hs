module Increasing(
  countIncreasing,
) where

countIncreasing :: [Int] -> Int
countIncreasing l = sum . map fromEnum $ zipWith (<) l (tail l)
