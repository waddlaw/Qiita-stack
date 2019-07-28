module Test.Minfree where

import Minfree

import Test.Tasty
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck
import Test.Tasty.Hspec
import Test.Hspec.QuickCheck (prop)
import Test.Tasty.ExpectedFailure
import Test.Tasty.Golden

import Data.List (nub)

unit_case1 :: IO ()
unit_case1 = minfree [8,23,9,0,12,11,1,10,13,7,41,4,14,21,5,17,3,19,2,6] @?= 15

unit_case2 :: IO ()
unit_case2 = minfree' [8,23,9,0,12,11,1,10,13,7,41,4,14,21,5,17,3,19,2,6] @?= 15

prop_Minfree :: [Positive Int] -> Property
prop_Minfree xs = preCondition ==> minfree ns == minfree' ns
  where
    ns = map getPositive xs
    preCondition = length (nub xs) == length xs

spec_hspec :: Spec
spec_hspec = do
  describe "minfree" $
    it "書籍の実行例" $
      minfree [8,23,9,0,12,11,1,10,13,7,41,4,14,21,5,17,3,19,2,6] `shouldBe` 15

  describe "minfree'" $
    it "書籍の実行例" $
      minfree' [8,23,9,0,12,11,1,10,13,7,41,4,14,21,5,17,3,19,2,6] `shouldBe` 15

  describe "minfree == minfree'" $
    prop "minfree == minfree'" prop_Minfree

test_tasty :: TestTree
test_tasty = testGroup "Unit tests"
  [ testCase "List comparison (different length)" $
      [1, 2, 3] `compare` [1,2] @?= GT
  , testCase "List comparison (same length)" $
      [1, 2, 3] `compare` [1,2,2] @?= GT
  ]

test_failure :: TestTree
test_failure = expectFail $ testGroup "Unit tests"
  [ testCase "different length" $
      length [1, 2, 3] @?= 0
  ]

test_goldenFile :: TestTree
test_goldenFile = expectFail $ goldenVsFile "goldenVsFile" "./test-tasty/golden1" "./test-tasty/output1" $ 
  writeFile "./test-tasty/output1" "aaa"

test_goldenFileDiff :: TestTree
test_goldenFileDiff = expectFail $ goldenVsFileDiff "goldenVsFileDiff" (\ref new -> ["diff", "-u", ref, new]) "./test-tasty/golden1" "./test-tasty/output1" $
  writeFile "./test-tasty/output1" "aaa"