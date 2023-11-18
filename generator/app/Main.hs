module Main (main) where

import qualified Data.ByteString.Lazy.Char8 as BCL
import Generator (generateSite)
import System.Directory.Tree

main :: IO ()
main = do
  templateFiles <- contents . dirTree <$> readDirectoryWithL BCL.readFile "../templates/"
  contentFiles <- contents . dirTree <$> readDirectoryWithL BCL.readFile "../content/"
  -- print $ generateSite templateFiles contentFiles
  writeDirectoryWith BCL.writeFile (".." :/ Dir "_build" (generateSite templateFiles contentFiles))
  pure ()
