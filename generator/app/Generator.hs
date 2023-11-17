module Generator (generateSite) where

import Data.ByteString.Lazy.Char8 hiding (map)
import Data.ByteString.Lazy.UTF8 (fromString)
import System.Directory.Tree

--              template sources      contents sources      result directory
generateSite :: DirTree ByteString -> DirTree ByteString -> DirTree ByteString
generateSite templates contents =
  case contents of
    Dir name contents -> Dir name (map (generateSite templates) contents)
    File "about.html" contents -> File "about.html" (fromString "sample content")
    File name contents -> File name contents
