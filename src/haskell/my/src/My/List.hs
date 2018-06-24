module My.List where

import Data.List

prune :: Eq α => α -> [α] -> [α]
prune _ [] = []
prune 𝑥 (𝑦:𝑦𝑠) = if 𝑥 == 𝑦 then 𝑦𝑠 else 𝑦 : 𝑦𝑠
