module Main ( main ) where

import Data.List ( sortBy )
import My.List ( splitBy )

-- impure code --
main :: IO ()
main = interact $ unlines . sortBy comparePath . lines

-- pure code --
comparePath :: String -> String -> Ordering
comparePath 𝑥 𝑦 = (splitPath 𝑥 `compare` splitPath 𝑦) `mappend`
                  (𝑥 `compare` 𝑦)

splitPath :: String -> [String]
splitPath = splitBy '/'
