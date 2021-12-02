module Window
  ( genWindows,
  )
where

import Data.List

genWindows :: Int -> [a] -> [[a]]
genWindows size = transpose' . take size . tails

transpose' :: [[a]] -> [[a]]
transpose' = foldr (zipWith (:)) (repeat [])
