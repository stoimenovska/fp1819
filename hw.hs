module Main where
import System.IO

data AnimalsTree = Animal String | Question String AnimalsTree AnimalsTree deriving (Read, Show)

main :: IO ()
main = do root <- "AnimalsGame.txt"
          startGame (read root)
          return ()

startGame :: AnimalsTree -> IO AnimalsTree
startGame root = do putStrLn "Think of an animal, I will try to guess what it is..."
                    finalAnimalTree <- startGame' root
                    writeFile "AnimalsGame.txt" (show finalAnimalTree)
                    return finalAnimalTree

startGame' :: AnimalsTree -> IO AnimalsTree
startGame' animal@(Animal name) = do answer <- askQuestion $ "Are you thinking of " ++ animal ++ "?"
                                     if answer == "Yes"
                                     then do putStrLn "Thank you for playing"
                                              return animal
                                     else generateNewBranch animal
startGame' question@(Question q l r) = do answer <- askQuestion q
                                          if answer == "Yes"
                                           then do y <- startGame' l
                                                   return $ Question q y r
                                           else do n <- startGame' r
                                                   return $ Question q l n
startGame' _ = do putStrLn "Incorrect File structure or incorrect data input!"

askQuestion :: String -> IO Answer
askQuestion question = do putStrLn $ question
                          answer <- getLine
                          return answer

generateNewBranch :: AnimalsTree -> IO AnimalsTree
generateNewBranch oldAnimal = do putStrLn "I give up! What is your animal?"
                                 name <- getLine
                                let newAnimal = Animal name
                                     putStrLn $ "What question differentiates between" ++ newAnimal ++ " and " ++ oldAnimal
                                     newQuestion <- getLine
                                     putStrLn $ "For which of these 2 animals the answer is yes? " ++ newAnimal ++ " or " ++ oldAnimal
                                     yesAnimal <- getLine
                                     if yesAnimal == name
                                       then return $ Question newQuestion newAnimal oldAnimal
                                            else return $ Question newQuestion oldAnimal newAnimal
