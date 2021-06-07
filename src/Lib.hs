module Lib where

import Control.Monad (zipWithM)
import Data.Time (UTCTime, getCurrentTime)

type Tag = String

data Todo = Todo
  { todoDate :: UTCTime,
    todoName :: String,
    todoIsDone :: Bool,
    todoTags :: [Tag]
  }
  deriving (Show)

createTodo :: String -> [Tag] -> IO Todo
createTodo n tags = do
  currentTime <- getCurrentTime
  let todo = Todo {todoDate = currentTime, todoName = n, todoIsDone = False, todoTags = tags}
  return todo

myapp :: IO ()
myapp =
  do
    -- Create a Todo
    let examples = ["eat an apple", "draw a circle", "cook a dish"]

    putStrLn "\ncreating todos\n"
    todos <- mapM (`createTodo` []) examples

    -- List Todos
    print todos
    print (length todos)

    -- Create a Todo with tags
    let tags = [["urgent"], [], ["urgent"]] :: [[Tag]]

    putStrLn "\ncreating todos with tags\n"
    todosWithTags <- zipWithM createTodo examples tags

    -- List Todos by Tag
    let tagFilter = "urgent" :: Tag
    let urgentTodos = filter (\x -> tagFilter `elem` todoTags x) todosWithTags

    print urgentTodos
    print (length urgentTodos)

    return ()
