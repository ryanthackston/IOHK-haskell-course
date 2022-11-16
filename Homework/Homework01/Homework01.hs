
-- Question 1
-- Write a multiline comment below.
{-
My Multiline
Comment
-}

-- Question 2
-- Define a function that takes a value and multiplies it by 3.
mul3 :: Double -> Double
mul3 x = x*3

-- Question 3
-- Define a function that calculates the area of a circle.
aCir :: Double -> Double
aCir r = pi*r^2

-- Question 4
-- Define a function that calculates the volume of a cylinder by composing the previous function together with the height of the cylinder. 
volCyl :: Double -> Double-> Double
volCyl aCir h = aCir*h

-- Question 5
-- Define a function that takes the height and radius of a cylinder and checks if the volume is greater than or equal to 42.
volCyl42 :: Double -> Double -> Bool
volCyl42 r h = pi*r^2*h >= 42
