{-# LANGUAGE BlockArguments #-}

import Lib
import Test.Hspec
import Test.Hspec.QuickCheck

main :: IO ()
main = hspec $ do
  describe "Lib" $ do
    describe "createTodo" $ do
      it "should return a Todo record with the correct name" $ do
        actualResponse <- createTodo "testname" []
        todoName actualResponse `shouldBe` "testname"

      it "should return a Todo with isDone set to False" $ do
        actualResponse <- createTodo "testname" []
        todoIsDone actualResponse `shouldBe` False
