--
-- EPITECH PROJECT, 2024
-- B-FUN-400-PAR-4-1-wolfram-guillaume.houriez
-- File description:
-- Errormanagement
--

module Errormanagement where

import Data.Char (isDigit)
import System.Exit (exitWith, ExitCode(ExitFailure))

numeration :: String -> Bool  
numeration = all isDigit

errormanagement :: [String] -> IO ()
errormanagement args = case args of
    [] -> exitWithError
    [_] -> exitWithError
    (x1:x2:_) | x2 == "-" || x2 == "--" -> exitWithError
              | otherwise -> checkSecondArgument x2
  where
    exitWithError = exitWith (ExitFailure 84)
    
    checkSecondArgument args
        | numeration args = return ()
        | otherwise = exitWithError
