module Increasing(
  countIncreasing,
  countIncreasingWindows,
) where

import Window

countIncreasing :: [Int] -> Int
countIncreasing l = sum . map fromEnum $ zipWith (<) l (tail l)

countIncreasingWindows :: Int -> [Int] -> Int
countIncreasingWindows size l = countIncreasing . map sum $ genWindows size l
