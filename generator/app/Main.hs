module Main (main) where

import Data.ByteString.Lazy.Char8
import Generator (generateSite)
import System.Directory.Tree
import Prelude hiding (readFile, writeFile)

main :: IO ()
main = do
  contents <- dirTree <$> readDirectoryWithL readFile "../content/./"
  templates <- dirTree <$> readDirectoryWithL readFile "../templates/./"
  writeDirectoryWith writeFile ("../_build" :/ generateSite templates contents)
  pure ()
