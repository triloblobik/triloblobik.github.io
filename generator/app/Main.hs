module Main (main) where

import Data.ByteString.Lazy.Char8
import System.Directory.Tree
import Prelude hiding (readFile, writeFile)

-- TODO: learn a better way
modifyTree :: AnchoredDirTree a -> AnchoredDirTree a
modifyTree (".." :/ Dir "content" contents) = ".." :/ Dir "_build" contents

-- TODO: understand monads
main :: IO ()
main = readDirectoryWithL readFile "../content/" >>= writeDirectoryWith writeFile . modifyTree >> pure ()
