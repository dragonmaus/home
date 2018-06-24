module My.String where

pad :: Int -> Char -> String -> String
pad 𝑙 𝑐 𝑠 = if length 𝑠 < 𝑙
            then 𝑐 : pad (𝑙 - 1) 𝑐 𝑠
            else 𝑠
