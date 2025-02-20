-- Create a higher-order function that takes 3 parameters: A function and the two parameters that that function takes, and
-- flips the order of the parameters.
-- For example this: `(/) 6 2` returns `3`. But this: `flip' (/) 6 2` returns `0.3333333333`
funcFlip :: (a -> b -> c) -> b -> a -> c
funcFlip func x y =  func y x


-- Create the `uncurry'` function that converts a curried function to a function on pairs. So this: `(+) 1 2` that returns `3` can be written as
-- `uncurry' (+) (1,2)` (with the two different arguments inside a pair).
uncurry2 :: (a -> b -> c) -> ((a, b) -> c)
uncurry2 f = \(x,y) -> f x y


-- Create the `curry'` function that converts an uncurried function to a curried function. So this: `fst (1,2)` that returns `1` can be written as
-- `curry' fst 1 2` (with the tuple converted into two different arguments).
curry2 :: ((a,b) -> c) -> (a -> b -> c)
curry2 f x y = f (x,y) 


-- Use higher-order functions, partial application, and point-free style to create a function that checks if a word has an uppercase letter.
-- Start with using just higher-order functions and build from there. 
checkUpper :: [Char] -> Bool
checkUpper = any (`elem` ['A'..'Z'])

votes :: [String]
votes = ["Red", "Blue", "Green", "Blue", "Blue", "Red"]
teamName = ["Red", "Green", "Blue"]

count2 :: String -> Int
count2 team = length $ filter(==team) votes

count2 $ teamName!!0
count2 $ teamName!!1
count2 $ teamName!!2

-- Create a one-line function that filters `cars` by brand and then checks if there are any left.

cars :: [(String,Int)]
cars = [("Toyota",0), ("Nissan",3), ("Ford",1)]

checkAnyCars :: String -> Bool
checkAnyCars carMake = any (\(brand,stock) -> brand == carMake && stock > 0) cars

show ( checkAnyCars "Nissan") ++ "! There are " ++ show(snd $ cars!!1) ++ " cars."
