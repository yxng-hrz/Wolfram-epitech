--
-- EPITECH PROJECT, 2024
-- B-FUN-400-PAR-4-1-wolfram-guillaume.houriez
-- File description:
-- Managing
--

module Managing where
import Errormanagement
import Data.Char (isDigit)
import System.Exit
    ( exitWith, ExitCode(ExitFailure), ExitCode(ExitSuccess) )
import System.Environment
import Control.Monad
import Data.Maybe
import Config

verify :: Reg -> IO()
verify reg | isNothing (regle  reg) = exitWith (ExitFailure 84)
                 | otherwise = return ()

deletation :: Maybe Reg -> Reg
deletation (Just datareg) = datareg

createoutput :: Int -> String
createoutput a = replicate (div a 2) ' '

buildstr :: Int -> String -> String
buildstr _ [first, second, third] = [first, second]
buildstr 30 (first:second:third:rest) = out1 first second third : buildstr 30 (second:third:rest)
buildstr 90 (first:second:third:rest) = out2 first second third : buildstr 90 (second:third:rest)
buildstr 110 (first:second:third:rest) = out3 first second third : buildstr 110 (second:third:rest)

stringoutput :: Int -> Reg -> [Char] -> [Char]
stringoutput helper reg strs
    | fenetre reg < length strs - 1 = stringoutput helper reg (init (tail strs))
    | fenetre reg < length strs = stringoutput helper reg (init strs)
    | otherwise = strs

useout1 :: Reg -> String -> Int -> Int -> IO()
useout1 reg str len lunch = executePattern 30 reg str len lunch

useout2 :: Reg -> String -> Int -> Int -> IO()
useout2 reg str len lunch = executePattern 90 reg str len lunch

useout3 :: Reg -> String -> Int -> Int -> IO()
useout3 reg str len lunch = executePattern 110 reg str len lunch

executePattern :: Int -> Reg -> String -> Int -> Int -> IO()
executePattern rule reg str len lunch
    | lunch < defaultval reg = managing reg (prependSpace strline) len (lunch + 1)
    | otherwise = putStrLn output >> managing reg (prependSpace strline) (len - 1) lunch
    where
        strline = buildstr rule (" " ++ str ++ " ")
        output = stringoutput 0 reg strline
        prependSpace s = " " ++ s

managing :: Reg -> String -> Int -> Int -> IO ()
managing _ [] _ _ = return ()
managing _ _ 1 _ = return ()
managing reg str len lunch = case regle reg of
    Just 30 -> useout1 reg str len lunch
    Just 90 -> useout2 reg str len lunch
    Just 110 -> useout3 reg str len lunch
    _ -> putStrLn "Unsupported rule" >> return ()
