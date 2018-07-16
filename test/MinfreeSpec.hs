module MinfreeSpec (spec) where

import           Data.List             (nub)
import           Minfree
import           Test.Hspec
import           Test.Hspec.QuickCheck (prop)
import           Test.QuickCheck

spec :: Spec
spec = do
  describe "minfree" $ do
    it "本に載っている例" $ do
      minfree [8, 23, 9, 0, 12, 11, 1, 10, 13, 7, 41, 4, 14, 21, 5, 17, 3, 19, 2, 6] `shouldBe` 15
  describe "minfree'" $ do
    it "本に載っている例" $ do
      minfree' [8, 23, 9, 0, 12, 11, 1, 10, 13, 7, 41, 4, 14, 21, 5, 17, 3, 19, 2, 6] `shouldBe` 15
  describe "minfree == minfree'" $ do
    prop "minfree == minfree'" prop_Minfree

prop_Minfree :: [Positive Int] -> Property
prop_Minfree xs = preCondition ==> minfree ns == minfree' ns
  where
    ns = map getPositive xs
    preCondition = length (nub xs) == length xs
