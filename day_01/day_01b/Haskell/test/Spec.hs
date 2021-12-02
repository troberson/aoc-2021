import Test.Hspec
import Control.Exception (evaluate)

import Increasing
import Window

main :: IO ()
main = hspec $
  describe "Test example" $
    it "the test data is accurate." $
      countIncreasingWindows 3 testData `shouldBe` 5
      where testData = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]

