import Data.List
import System.CPUTime (getCPUTime)
import System.Directory (doesFileExist, listDirectory)
import Text.XHtml (thead)
import Control.Monad (filterM)


{-
We imported some functions that you'll need to complete the homework.
FilePath is just a synonym for String. Although, make sure to follow the standard path
representation when using them (https://en.wikipedia.org/wiki/Path_(computing).
getCPUTime    :: IO Integer
doesFileExist :: FilePath -> IO Bool
listDirectory :: FilePath -> IO [FilePath]
You can hover over the functions to know what they do.
-}

{-
-- Question 1 --
Define an IO action that counts the number of files in the current directory
and prints it to the terminal inside a string message.
-}

listDirectory ("/workspace/haskell-course/Homework")

dir = "/workspace/haskell-course/Homework/"
a = listDirectory dir
iDir = (return dir:: IO String)

foo :: IO String
foo = do
 let d = "/workspace/haskell-course/Homework/"
 let listDir = "this.file"
 return $ d ++ listDir

countFiles :: IO ()
countFiles = do
  putStrLn "What is your folder path?"
  d <- getLine
  dirList <- listDirectory d
  let
    -- define a helper function `go` to count the files
    go :: [FilePath] -> IO Int
    go (x:xs) = do
      isFile <- doesFileExist (d ++ x) -- check if head is a file
      -- since `doesFileExist` is an IO action, the helper function must return an IO value (note the signature above)
      -- we have to bind the result to a variable ("exists") before we can use it as a regular Bool
      if isFile then (+ 1) <$> go xs -- increment the number of files in the tail
      -- requires `<$>` (a.k.a `fmap`) to "inject" the addition operation into IO context  
      else go xs 
    go [] = return 0 -- base case that terminates the recursion with a zero value (lifted into the IO context)
  fileCount <- go dirList -- since `go` returns an IO value, we need to bind it before we can print it
  putStrLn $ "There are " ++ show fileCount ++ " total files"

countFiles' :: IO () 
countFiles' = do  
 putStrLn "What is your folder path?"
 d <- getLine 
 dirList <- listDirectory d 
 fileCount <- filterM doesFileExist dirList 
 putStrLn $ "There are " ++ show (length fileCount) ++ " total files"


-- listFiles :: IO ()

{-
-- Question 2 --
Write an IO action that asks the user to type something, then writes the message
to a file called msg.txt, and after that, it reads the text from the msg.txt
file and prints it back. Use the writeFile and readFile functions.
-}

writeMessage :: IO ()
writeMessage = do
  putStrLn "Write a message"
  msg <- getLine
  putStrLn "Type a file path"
  filepath <- getLine
  putStrLn "Type a file name"
  filename <- getLine
  writeFile (filepath ++ filename) msg
  
writeNRead :: IO ()
writeNRead = do
    putStrLn "Write a message"
    msg <- getLine
    filepath'  <- (return "/workspace/haskell-course/Homework/Homework11/" :: IO String)
    filename' <- (return "msg.txt" :: IO String)
    let file' = (filepath' ++ filename')
    writeFile file' msg
    readFile  file' >>= putStrLn 
-- createMsg :: IO ()


{-
-- Context for Questions 3 and 4 --
In cryptography, prime numbers (positive integers only divisible by themselves and 1) play a fundamental
role in providing unbreakable mathematical structures. These structures, in turn, are leveraged to
establish secure encryption.
But, generating primes is a computational straining problem, as we will measure in the following exercise.
This is because, to know whether a number is a prime number, you first need to know all the previous primes
and then check that they are not a divisor of this number. So, this problem gets bigger and bigger!
Our lead cryptographer provided us with 3 different algorithms (primes1, primes2, and primes3). All three
correctly produce a list of all the prime numbers until a limit (that we provide as a parameter).
Our job is not to understand these algorithms but to measure which is the fastest and print the largest
prime number below our limit. Do it step by step, starting with question 3.
-}

primes1 :: Integer -> [Integer]
primes1 m = sieve [2 .. m]
 where
  sieve [] = []
  sieve (p : xs) = p : sieve [x | x <- xs, x `mod` p > 0]

primes2 :: Integer -> [Integer]
primes2 m = sieve [2 .. m]
 where
  sieve (x : xs) = x : sieve (xs \\ [x, x + x .. m])
  sieve [] = []

primes3 :: Integer -> [Integer]
primes3 m = turner [2 .. m]
 where
  turner [] = []
  turner (p : xs) = p : turner [x | x <- xs, x < p * p || rem x p /= 0]

{-
-- Question 3 --
Define an IO action that takes an IO action as input and calculates the time it takes to execute.
Use the getCPUTime :: IO Integer function to get the CPU time before and after the IO action.
The CPU time here is given in picoseconds (which is 1/1000000000000th of a second).
-}

timeIO :: IO a -> IO ()
timeIO io = do
  t1 <- getCPUTime
  _ <- io
  t2 <- getCPUTime
  let elapsedTime = fromIntegral (t2 - t1) / 1000000000000
  print $ elapsedTime


-- timeIO :: IO a -> IO ()


{-
-- Question 4 --
Write an action that retrieves a value from the standard input, parses it as an integer,
and compares the time all three algorithms take to produce the largest prime before the
limit. Print the number and time to the standard output.
-}

benchmark :: Integer -> IO ()
benchmark n = do
  t1 <- getCPUTime
  print $ primes1 n
  t2 <- getCPUTime
  putStrLn ""

  t3 <- getCPUTime
  print $ primes2 n
  t4 <- getCPUTime 
  putStrLn ""

  t5 <- getCPUTime
  print $ primes3 n
  t6 <- getCPUTime 
  putStrLn ""

  putStrLn $ "Prime1: " ++ show (fromIntegral (t2 - t1) / 1000000000000)
  putStrLn $ "Prime2: " ++ show (fromIntegral (t4 - t3) / 1000000000000)
  putStrLn $ "Prime3: " ++ show (fromIntegral (t6 - t5) / 1000000000000)

-- benchmark :: IO ()

{-
 -- Question 5 -- EXTRA CREDITS -- (In case the previous ones were too easy)
Write a program that prints the directory tree structure from the current folder.
Below you can see an example output of how such a structure looks like:
.
├── foo1.hs
├── foo2.hs
├── bar1
    ├── bar2
    ├── foo3.hs
    ├── foo4.hs
    └── bar3
        └── foo5.hs
└── bar5
    ├── bar6
    ├── foo6.hs
    └── foo7.hs
HINT: You can use the function doesFileExist, which takes in a FilePath and returns
True if the argument file exists and is not a directory, and False otherwise.
-}
