module Main (main) where

import Control.Monad (void)
import Data.ByteString.Lazy.Char8
import System.Directory.Tree
import Prelude hiding (readFile, writeFile)

modifyTree :: DirTree a -> DirTree a
modifyTree = id -- TODO: do something useful

main :: IO ()
main =
  readDirectoryWithL readFile "../content/./" >>= \sourceTree ->
    (void . writeDirectoryWith writeFile) ("../_build" :/ modifyTree (dirTree sourceTree))
