module Atbash (decode, encode) where

import Data.Char

decode :: String -> String
decode cipherText = map flip_char $ filter (not . isSpace) cipherText

encode :: String -> String
encode plainText = add_space 5 $ map flip_char $ filter isAlphaNum plainText

flip_char :: Char -> Char
flip_char character
    | isAlpha character  = chr $ 219 - retrieve_ord character
    | otherwise          = character

retrieve_ord :: Char -> Int
retrieve_ord character = ord $ toLower character

add_space :: Int -> String -> String
add_space grouping text = internal_add_space grouping text 0 ""

internal_add_space :: Int -> String -> Int -> String -> String
internal_add_space _ "" _ return = reverse return
internal_add_space max_group (x:xs) counter return
    | max_group == counter = internal_add_space max_group (x:xs) 0 (' ':return)
    | otherwise            = internal_add_space max_group xs (counter + 1) (x:return)
