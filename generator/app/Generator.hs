module Generator (generateSite) where

import qualified Data.ByteString.Lazy.Char8 as BCL
import Data.ByteString.Lazy.UTF8 (fromString)
import Data.Sequence
import System.Directory.Tree

traverseWithPathImpl :: Seq FileName -> (Seq FileName -> a -> b) -> DirTree a -> DirTree b
traverseWithPathImpl pathAcc fn dirTree =
  case dirTree of
    Dir name contents ->
      Dir name $ map (traverseWithPathImpl (pathAcc :|> name) fn) contents
    File name contents ->
      File name $ fn (pathAcc :|> name) contents

traverseWithPath :: (Seq FileName -> a -> b) -> DirTree a -> DirTree b
traverseWithPath = traverseWithPathImpl Empty

--              template sources            contents sources            result sources
generateSite :: [DirTree BCL.ByteString] -> [DirTree BCL.ByteString] -> [DirTree BCL.ByteString]
generateSite templates contents =
  map (traverseWithPath fn) contents
  where
    fn (Empty :|> "articles" :|> "about.html") y = fromString "HAHA"
    fn x y = y
