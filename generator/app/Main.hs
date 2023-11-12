module Main (main) where

import Data.ByteString.Lazy.Char8
import System.Directory.Tree
import Prelude hiding (readFile, writeFile)

-- TODO: learn about a better way
modifyTree :: AnchoredDirTree a -> AnchoredDirTree a
modifyTree (".." :/ Dir "articles" contents) = ".." :/ Dir "_build" contents

-- TODO: understand
main :: IO ()
main = readDirectoryWithL readFile "../articles/" >>= writeDirectoryWith writeFile . modifyTree >> pure ()
