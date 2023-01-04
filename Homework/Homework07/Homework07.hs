-- Question 1
-- Investigate the `Bounded` type class. What behaviours it provides?

-- The Bounded class is used to name the upper and lower limits of a type.
-- The minBound function is the minimum size of the data type.
-- The maxBound is the maximum size of the data type.

-- type Bounded :: * -> Constraint -- Bounded constrains any data types that is listed as an instance of Bounded.
-- Bounded types are polymorphic constants.

minBound :: (Bool, Int, Char)


-- Question 2
-- The types Int and Word belong to the same type classes. What is the difference
-- between them? Check maybe the maxBound and minBound parameter for both types.
minBound :: (Word)
maxBound :: (Word)

minBound :: (Int)
maxBound :: (Int)

-- minBound and maxBound for Word and Int each gives the same range of numbers.
-- The difference is that minBound for Word starts at 0 and maxBound is at 18446744073709551615
-- While minBound for Int starts at -9223372036854775808 and maxBound goes to 9223372036854775808
-- So there are definitely negative Int values but no negative Word values.


-- Question 3
-- Investigate the `Enum` type class. What behaviours provides?

-- Enum, short for enumerated, has instances that creates sequentially ordered types that gives their values in list ranges.
-- Instances of Enum include Word, Ordering, Integer, Int, Char, Bool, (), Float, and Double

-- succ() and pred() take an Enum instance and outputs the succeeding value afterwards (succ) or the preceding value before (pred).
-- There are no obvious bounds of succ() and pred() other than what the computer can process. 
-- succ 1 -- 2
-- pred 0 -- -1
-- succ 18446744073709551617 -- 18446744073709551618
-- succ 2.9 -- 3.9
-- pred (-1.8) -- -2.8
-- pred 0.7 -- -0.30000000000000004

  succ :: a -> a
  pred :: a -> a
  toEnum :: Int -> a
  fromEnum :: a -> Int
  enumFrom :: a -> [a]
  enumFromThen :: a -> a -> [a]
  enumFromTo :: a -> a -> [a]
  enumFromThenTo :: a -> a -> a -> [a]


-- Question 4
-- Add type signatures to the functions below and use type variables and type classes.
-- Then uncomment the functions and try to compile.

f1 :: (Show a, Fractional a) => a -> a -> [Char] -> [Char]
f1 x y z = show (x / y) ++ z

f2 :: (Bounded a, Enum a, Eq a) => a -> a
f2 x = if x == maxBound then minBound else succ x

-- Question 5
-- Investigate the numeric type classes to figure out which behaviors they provide to change between numeric types.

-- Num is a type class that includes all type numeric type class be it whole number or decimal. 
-- The Floating type class and Fractional type class includes only Float and Double types for decimal numbers.
-- The Integral type class includes only whole numbers such as Int and Integer type class.
