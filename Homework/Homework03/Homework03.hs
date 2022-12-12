-- Question 1
-- Write a function that checks if the monthly consumption of an electrical device is bigger, equal, or smaller than the maximum allowed and
-- returns a message accordingly. 
-- The function has to take the hourly consumption of an electrical device, the hours of daily use, and the maximum monthly consumption allowed.
-- (Monthly usage = consumption (kW) * hours of daily use (h) * 30 days).
monthCons :: Double -> Double -> Double
monthCons c d = c*d*30

monthConsTest = monthCons 5 6

maxE :: Double
maxE = 5000

monthConsCheck :: Double -> Double -> String
monthConsCheck monthCons maxE
    | monthCons < maxE = "Less than the maximum allowed electricity usage"
    | monthCons == maxE = "Equals the maximum allowed electricity usage"
    | otherwise = "Greater than the maximum allowed electricity usage"

ans1 = monthConsCheck monthConsTest  maxE

-- Question 2
-- Prelude:
-- We use the function `show :: a -> String` to transform any type into a String.
-- So `show 3` will produce `"3"` and `show (3 > 2)` will produce `"True"`.

-- In the previous function, return the excess/savings of consumption as part of the message.
showCons :: String -> String
showCons ans1
    | ans1 == "Less than the maximum allowed electricity usage" = "Less than the maximum allowed electricity usage. Saved " ++ show(maxE - monthConsTest) ++ " kWh"
    | ans1 == "Equals the maximum allowed electricity usage" = "Equals the maximum allowed electricity usage. Saved " ++ show(maxE - monthConsTest) ++ " kWh"
    | otherwise = "Greater than the maximum allowed electricity usage in excess of " ++ show(maxE - monthConsTest) ++ " kWh"

-- showConsTest = showCons ans1


-- Question 3
-- Write a function that showcases the advantages of using let expressions to split a big expression into smaller ones.
-- Then, share it with other students in Canvas.

drinkFactor = 1/45
eatFactor = 1/100

-- fullBelly - function to check if you have a full belly
-- water - how much water you drank today in pounds (lb)
-- food - how much food you ate today in pounds (lb)
-- weight - How much do you weigh in pounds (lb)

fullBelly :: Double -> Double -> Double -> String
fullBelly water food weight =
    let drink = (water/weight)
        eat   = (food/weight)
    in
        if drink >= (drinkFactor) && eat >= (eatFactor)
            then "I've got a full belly!"
            else "I'm still a bit hungry"

-- Question 4
-- Write a function that takes in two numbers and returns their quotient such that it is not greater than 1.
-- Return the number as a string, and in case the divisor is 0, return a message why the division is not
-- possible. To implement this function using both guards and if-then-else statements.  

divUpTo1 :: Double -> Double -> String
divUpTo1 x y
  | x == 0 && y == 0 = "Can't divide 0/0"
  | x == 0 || y == 0 = "0"
  | otherwise        = if abs (x / y) <= 1 
                       then show (x / y)
                       else show (y / x)

-- Question 5
-- Write a function that takes in two numbers and calculates the sum of squares for the product and quotient
-- of those numbers. Write the function such that you use a where block inside a let expression and a
-- let expression inside a where block. 
sumOfSq :: (Eq a, Show a, Floating a) => a -> a -> String
sumOfSq x y =
    let showxyProd = show (xyProd^2) where xyProd = x * y
    in  "Sum of Squares of Product and Quotient = " ++ (showxyProd) ++ " + " ++ (showxyQuot) ++ " = " ++ show((x*y)^2 + (x/y)^2)
    where
            showxyQuot
               | y /= 0 = let xyQuot = (x / y)^2
                               in show xyQuot
               |otherwise  = "The division is not possible"

