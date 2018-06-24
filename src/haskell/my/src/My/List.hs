module My.List where

import Data.List ( filter, groupBy )

contains :: Eq 𝑎 => [𝑎] -> 𝑎 -> Bool
contains    []  𝑦             = False
contains (𝑥:𝑥𝑠) 𝑦 | 𝑥 == 𝑦    = True
                  | otherwise = 𝑥𝑠 `contains` 𝑦

prune :: Eq α => α -> [α] -> [α]
prune _    []              = []
prune 𝑥 (𝑦:𝑦𝑠) | 𝑥 == 𝑦    = 𝑦𝑠
               | otherwise = 𝑦 : 𝑦𝑠

splitBy :: Eq 𝑎 => 𝑎 -> [𝑎] -> [[𝑎]]
splitBy 𝑐 = filter (/= [𝑐]) . groupBy (\𝑥 𝑦 -> 𝑥 /= 𝑐 && 𝑦 /= 𝑐)
