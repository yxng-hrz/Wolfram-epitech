--
-- EPITECH PROJECT, 2024
-- B-FUN-400-PAR-4-1-wolfram-guillaume.houriez
-- File description:
-- Main
--

import System.Environment
import Config
import Data.List
import Data.String
import System.Exit (exitWith)
import System.Exit (ExitCode(ExitFailure)) 
import System.Exit (ExitCode(ExitSuccess)) 
import Displayargument
import Errormanagement
import Managing ( managing, createoutput, verify, deletation )

createboucle :: Maybe Int -> Reg -> Int
createboucle d abc
    | d == Just 90 = 1
    | otherwise = 0

intboucle :: Maybe Int -> Reg -> Int
intboucle d abc
    | d == Just 90 && defaultval abc == 100 = strings abc + 1
    | otherwise = strings abc

main :: IO ()
main = do
    b <- getArgs
    errormanagement b
    let abc = deletation (optiondisplay defaultReg b)
    verify abc
    let prevString = (createoutput ((fenetre abc) + (deplacement abc))) ++ "*" ++ createoutput ((fenetre abc) - 1)
    let len = intboucle (regle abc) abc
    let lunch = createboucle (regle abc) abc
    if defaultval abc > 0 
        then managing abc prevString len lunch  
        else putStrLn prevString >> managing abc prevString len (defaultval abc + 1)
    exitWith (ExitSuccess)