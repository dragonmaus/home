module My.String where

import Data.List

pad :: Int -> Char -> String -> String
pad 𝑙 𝑐 𝑠 = if length 𝑠 < 𝑙
            then 𝑐 : pad (𝑙 - 1) 𝑐 𝑠
            else 𝑠

splitBy :: Char -> String -> [String]
splitBy 𝑐 = filter (/= [𝑐]) . groupBy (\𝑥 𝑦 -> 𝑥 /= 𝑐 && 𝑦 /= 𝑐)
