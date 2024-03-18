--
-- EPITECH PROJECT, 2024
-- B-FUN-400-PAR-4-1-wolfram-guillaume.houriez
-- File description:
-- Displayargument
--

module Displayargument where
import Data.Maybe
import Config

numeration :: [Char] -> Bool 
numeration [] = True 
numeration (opt:resopt)
    | element opt ['0'..'9'] = numeration resopt
    | otherwise = False

optiondisplay :: Reg -> [String] -> Maybe Reg
optiondisplay i [] =  Just i
optiondisplay reg (opt:value:resopt) 
    | opt == "--rule" && (value == "30" || value == "90" || value == "110") = optiondisplay reg {regle = Just (myatoi value)} resopt
    | opt == "--start" && numeration value = optiondisplay reg {defaultval = myatoi value} resopt
    | opt == "--lines" && numeration value = optiondisplay reg {strings = myatoi value} resopt
    | opt == "--window" && numeration value = optiondisplay reg {fenetre = myatoi value} resopt
    | opt == "--move" && numeration value = optiondisplay reg {deplacement = myatoi value} resopt
    | otherwise = Nothing
