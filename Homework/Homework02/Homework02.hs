

-- Question 1
-- Add the type signatures for the functions below and then remove the comments and try to compile.
-- (Use the types presented in the lecture.)

f1 :: Double -> Double -> Double -> Double

f1 x y z = x ** (y/z)

f2 :: Double -> Double -> Double -> Double

f2 x y z = sqrt (x/y - z)

f3 :: Bool -> Bool -> [Bool]

f3 x y = [x == True] ++ [y]

f4 :: String -> String -> String -> Bool

f4 x y z = x == (y ++ z)


-- Question 2
-- Why should we define type signatures of functions? How can they help you? How can they help others?
-- It clearly defines the parameters used in the function, makes the code more readable for others, and makes
-- developing code easier.


-- Question 3
-- Why should you define type signatures for variables? How can they help you?
-- Defining types signatures clearly shows what type the variable data is making the code more readable for
-- others and helping you avoid errors in code.


-- Question 4
-- Are there any functions in Haskell that let you transform one type to the other? Try googling for the answer.\
-- Higher order functions let you transform from one type to another.

-- Question 5
-- Can you also define in Haskell list of lists? Did we showed any example of that? How would you access the inner
-- most elements?

-- Strings are a list of chars so a list of strings would be a list of lists of chars. 
-- An integer list of list can be written as:
xs :: [[Int]]
xs = [[1,2],[3,4],[5,6]]
-- You can access the 2nd element of the first list with
x2 :: [[Int]] -> Int
x2 xs = head(xs) !! 1
