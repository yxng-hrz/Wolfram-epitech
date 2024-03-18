--
-- EPITECH PROJECT, 2024
-- B-FUN-400-PAR-4-1-wolfram-guillaume.houriez
-- File description:
-- Config
--

module Config where

type Cell = Char
type Rule = Cell -> Cell -> Cell -> Char

myatoi :: String -> Int
myatoi s = read s::Int 

element :: Eq i => i ->[i] -> Bool 
element _ [] = False
element i (x:xs)
    | i == x = True 
    | otherwise = element i xs

ruleMapToFunc :: [((Cell, Cell, Cell), Char)] -> Rule
ruleMapToFunc mapping a b c = case lookup (a, b, c) mapping of
    Just result -> result
    Nothing -> error "No matching pattern found"

out1, out2, out3 :: Rule
out1 = ruleMapToFunc
    [ (('*', ' ', ' '), '*')
    , ((' ', '*', ' '), '*')
    , ((' ', ' ', '*'), '*')
    , ((' ', '*', '*'), '*')
    , (('*', '*', '*'), ' ')
    , (('*', '*', ' '), ' ')
    , ((' ', ' ', ' '), ' ')
    , (('*', ' ', '*'), ' ')
    ]

out2 = ruleMapToFunc
    [ ((' ', ' ', '*'), '*')
    , ((' ', '*', ' '), ' ')
    , (('*', ' ', ' '), '*')
    , (('*', '*', ' '), '*')
    , (('*', '*', '*'), ' ')
    , ((' ', '*', '*'), '*')
    , ((' ', ' ', ' '), ' ')
    , (('*', ' ', '*'), ' ')
    ]

out3 = ruleMapToFunc
    [ (('*', '*', '*'), ' ')
    , (('*', '*', ' '), '*')
    , (('*', ' ', ' '), ' ')
    , ((' ', '*', '*'), '*')
    , ((' ', '*', ' '), '*')
    , ((' ', ' ', '*'), '*')
    , ((' ', ' ', ' '), ' ')
    , (('*', ' ', '*'), '*')
    ]

data Reg = Reg
    { regle :: Maybe Int
    , defaultval    :: Int
    , strings   :: Int
    , fenetre   :: Int
    , deplacement   :: Int
    } deriving (Show)

defaultReg :: Reg
defaultReg = Reg
    { regle = Nothing
    , defaultval    = 0
    , strings   = -1
    , fenetre   = 80
    , deplacement   = 0
    }
